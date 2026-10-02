namespace SdtdServerKit.Extensions
{
    /// <summary>
    /// Extension methods for BlockChangeInfo (V3.2+: position is stored in blockValueRef).
    /// </summary>
    public static class BlockChangeInfoExtension
    {
        /// <summary>
        /// Gets the world position of a block change. Returns false for prop changes, which have no block position.
        /// </summary>
        /// <param name="info">The block change.</param>
        /// <param name="pos">The block position.</param>
        /// <returns>True if the change targets a block.</returns>
        public static bool TryGetBlockPos(this BlockChangeInfo info, out Vector3i pos)
        {
            return info.blockValueRef.TryGetBlockPos(out pos);
        }
    }
}
