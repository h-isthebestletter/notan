# Script taken from BevyEngine https://github.com/bevyengine/bevy/blob/main/tools/publish.sh

# if crate A depends on crate B, B must come before A in this list
crates=(
  notan_utils
  notan_math
  notan_macro
  notan_graphics
  notan_app
  notan_log
  notan_glow
  notan_glyph
  notan_egui
  notan_text
  notan_draw
  notan_web
  notan_winit
  notan_backend
)

cd crates
for crate in "${crates[@]}"
do
  echo "Publishing ${crate}"
  (cd "$crate"; cargo publish --no-verify)
  sleep 20
done

cd ..
cargo publish