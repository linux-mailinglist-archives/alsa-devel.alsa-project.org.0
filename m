Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4E23F5C9
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Aug 2020 03:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CC11616;
	Sat,  8 Aug 2020 03:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CC11616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596849894;
	bh=1BouKN+Fz9CEGHwfJwgC1mgIm+BmlGCR/Cdx1SUU550=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hYf4ZAuCbCBU4/Fr2h9amNxsyi8Bx9DW4ApFIoKdu040FB4WA4iHKOBEtgaSwA/Rw
	 XeJK9ANo0gO3jTL4emvgaFGUd4qFuN4Pl/gdLdl8pPA5FYZwOzjmsWOgUIIjiVY7PE
	 iegoc8ykMAGV4JWY9HRV+d5BbhfSrrPAuqx+dZF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB55F802C2;
	Sat,  8 Aug 2020 03:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81A99F802DC; Sat,  8 Aug 2020 03:22:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14DE5F802D2
 for <alsa-devel@alsa-project.org>; Sat,  8 Aug 2020 03:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14DE5F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="YChznlMy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2Eey4zyvvBAtzwJbwbbfgGW0KZPfiiNUMcUuzDm1GX8=; b=YChznlMyJ0OeIA4y4fS8d7uUiY
 J+z7MmNjodYepNgfc7rxeBcXX4Nv2YvpOTcRQ0KC2lnb6ONsm8w6zm1SYiCAvr335FGHBYapfPGfB
 hlLZBnEUsXHaFSwQ5D/ELsLvOuVxDJIYR3R5+eXygs80s+5y8DFqaxdf1Djh9sa2xCDSju1xdW7TJ
 JzTlEOc3gVrIA5qdeF8t4gaanPY42EY204Q/drVsMGMLEluUzFAIvi22lsXKMaPil9CZXjPjlzkc9
 e+knS5lJL/cFipC1V9ST6urokfJmyJFE9c9CKLD3gXsq6TXPTM7R/+YmvD1ohelHCgfxo451b5T8C
 VkPy6NrA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4DYr-0001IK-I4; Sat, 08 Aug 2020 01:22:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: various vendors: delete repeated words in comments
Date: Fri,  7 Aug 2020 18:22:09 -0700
Message-Id: <20200808012209.10880-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
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

Drop the repeated words {related, we, is, the} in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/fsl/fsl_dma.c             |    2 +-
 sound/soc/intel/skylake/skl-sst.c   |    2 +-
 sound/soc/meson/axg-tdm-formatter.c |    2 +-
 sound/soc/sprd/sprd-pcm-compress.c  |    2 +-
 sound/soc/sunxi/sun4i-codec.c       |    2 +-
 sound/soc/ti/davinci-mcasp.c        |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20200807.orig/sound/soc/fsl/fsl_dma.c
+++ linux-next-20200807/sound/soc/fsl/fsl_dma.c
@@ -154,7 +154,7 @@ static void fsl_dma_abort_stream(struct
 /**
  * fsl_dma_update_pointers - update LD pointers to point to the next period
  *
- * As each period is completed, this function changes the the link
+ * As each period is completed, this function changes the link
  * descriptor pointers for that period to point to the next period.
  */
 static void fsl_dma_update_pointers(struct fsl_dma_private *dma_private)
--- linux-next-20200807.orig/sound/soc/intel/skylake/skl-sst.c
+++ linux-next-20200807/sound/soc/intel/skylake/skl-sst.c
@@ -354,7 +354,7 @@ static int skl_transfer_module(struct ss
 	/*
 	 * if bytes_left > 0 then wait for BDL complete interrupt and
 	 * copy the next chunk till bytes_left is 0. if bytes_left is
-	 * is zero, then wait for load module IPC reply
+	 * zero, then wait for load module IPC reply
 	 */
 	while (bytes_left > 0) {
 		curr_pos = size - bytes_left;
--- linux-next-20200807.orig/sound/soc/meson/axg-tdm-formatter.c
+++ linux-next-20200807/sound/soc/meson/axg-tdm-formatter.c
@@ -398,7 +398,7 @@ void axg_tdm_stream_free(struct axg_tdm_
 	/*
 	 * If the list is not empty, it would mean that one of the formatter
 	 * widget is still powered and attached to the interface while we
-	 * we are removing the TDM DAI. It should not be possible
+	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
 	mutex_destroy(&ts->lock);
--- linux-next-20200807.orig/sound/soc/sprd/sprd-pcm-compress.c
+++ linux-next-20200807/sound/soc/sprd/sprd-pcm-compress.c
@@ -559,7 +559,7 @@ static int sprd_platform_compr_copy(stru
 		} else {
 			/*
 			 * If the data count is larger than the available spaces
-			 * of the the stage 0 IRAM buffer, we should copy one
+			 * of the stage 0 IRAM buffer, we should copy one
 			 * partial data to the stage 0 IRAM buffer, and copy
 			 * the left to the stage 1 DDR buffer.
 			 */
--- linux-next-20200807.orig/sound/soc/sunxi/sun4i-codec.c
+++ linux-next-20200807/sound/soc/sunxi/sun4i-codec.c
@@ -335,7 +335,7 @@ static int sun4i_codec_prepare_capture(s
 
 	/*
 	 * FIXME: Undocumented in the datasheet, but
-	 *        Allwinner's code mentions that it is related
+	 *        Allwinner's code mentions that it is
 	 *        related to microphone gain
 	 */
 	if (of_device_is_compatible(scodec->dev->of_node,
--- linux-next-20200807.orig/sound/soc/ti/davinci-mcasp.c
+++ linux-next-20200807/sound/soc/ti/davinci-mcasp.c
@@ -633,7 +633,7 @@ static int __davinci_mcasp_set_clkdiv(st
 		 * right channels), so it has to be divided by number
 		 * of tdm-slots (for I2S - divided by 2).
 		 * Instead of storing this ratio, we calculate a new
-		 * tdm_slot width by dividing the the ratio by the
+		 * tdm_slot width by dividing the ratio by the
 		 * number of configured tdm slots.
 		 */
 		mcasp->slot_width = div / mcasp->tdm_slots;
