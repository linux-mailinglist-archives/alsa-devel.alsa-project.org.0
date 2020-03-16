Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D213B1871FD
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 19:12:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBA318C5;
	Mon, 16 Mar 2020 19:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBA318C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584382331;
	bh=3JIH9kJ8+OJAOJXkcIr7yf3bK4LqSqspyJ/pDMpsvjA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dx9KzXfjF2Y06lBQs8Uf03twQyk3730siuQToSJObKGoVMqLDyb/ox2vrHxtC1Zmm
	 SOGnQRhvM7aUxwkB34/y0xq0OKqXTjwuv5eeqOsSRk5tfnMwoFI9vRYNcHTgo+lckQ
	 PuCaYOJPRRwY+hhvtYHwumtte57eH6qSjMuL5eUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0447CF802A8;
	Mon, 16 Mar 2020 19:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2411F802A7; Mon, 16 Mar 2020 19:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 24788F802A1
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 19:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24788F802A1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2F4D1FB;
 Mon, 16 Mar 2020 11:08:11 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45DBF3F67D;
 Mon, 16 Mar 2020 11:08:11 -0700 (PDT)
Date: Mon, 16 Mar 2020 18:08:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Applied "ALSA: compress: add alac & ape decoder params" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ALSA: compress: add alac & ape decoder params

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0f546d6f0292fb624b4cf0cc70096ddb9ea070e6 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:18 +0530
Subject: [PATCH] ALSA: compress: add alac & ape decoder params

Add ALAC (Apple Lossless Audio Codec) and APE (Monkey's Lossless Audio
Codec) defines and parameters required to configure these.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-7-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/compress_params.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index bf6f7155e775..79b14389ae41 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -75,7 +75,9 @@
 #define SND_AUDIOCODEC_G723_1                ((__u32) 0x0000000C)
 #define SND_AUDIOCODEC_G729                  ((__u32) 0x0000000D)
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_BESPOKE
+#define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
+#define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
@@ -336,6 +338,26 @@ struct snd_dec_wma {
 	__u32 reserved;
 } __attribute__((packed, aligned(4)));
 
+struct snd_dec_alac {
+	__u32 frame_length;
+	__u8 compatible_version;
+	__u8 pb;
+	__u8 mb;
+	__u8 kb;
+	__u32 max_run;
+	__u32 max_frame_bytes;
+} __attribute__((packed, aligned(4)));
+
+struct snd_dec_ape {
+	__u16 compatible_version;
+	__u16 compression_level;
+	__u32 format_flags;
+	__u32 blocks_per_frame;
+	__u32 final_frame_blocks;
+	__u32 total_frames;
+	__u32 seek_table_present;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -344,6 +366,8 @@ union snd_codec_options {
 	struct snd_enc_generic generic;
 	struct snd_dec_flac flac_d;
 	struct snd_dec_wma wma_d;
+	struct snd_dec_alac alac_d;
+	struct snd_dec_ape ape_d;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
-- 
2.20.1

