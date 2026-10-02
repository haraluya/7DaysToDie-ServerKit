namespace SdtdServerKit.Extensions
{
    /// <summary>
    /// Extension methods for Block.
    /// </summary>
    public static class BlockExtension
    {
        /// <summary>
        /// Determines whether the block is a land claim block (V3.2+: BlockLandClaim was replaced by a composite tile entity with TEFeatureLandClaim).
        /// </summary>
        /// <param name="block">The block.</param>
        /// <returns>True if the block is a land claim block.</returns>
        public static bool IsLandClaim(this Block? block)
        {
            return block is BlockCompositeTileEntity compositeBlock
                && compositeBlock.CompositeData != null
                && compositeBlock.CompositeData.HasFeature<TEFeatureLandClaim>();
        }
    }
}
