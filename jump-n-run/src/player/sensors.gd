extends Node2D

@onready var _head_shape: CollisionShape2D = $Head/CollisionShape2D


func _on_head_body_entered(body: Node2D) -> void:
    if not body is TileMapLayer:
        return
    var left := _head_shape.to_global(_head_shape.shape.get_rect().position).x
    var right := left + _head_shape.shape.get_rect().size.x
    var head_y := _head_shape.to_global(_head_shape.shape.get_rect().position).y
    var layer := body as TileMapLayer
    var coords_left := layer.local_to_map(Vector2(left, head_y))
    var coords_right := layer.local_to_map(Vector2(right, head_y))
    layer.erase_cell(Vector2i(coords_left.x, coords_left.y - 1))
    layer.erase_cell(Vector2i(coords_right.x, coords_right.y - 1))
