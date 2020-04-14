Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF41A80A0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE5716C5;
	Tue, 14 Apr 2020 17:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE5716C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876525;
	bh=xxyiVMF9lycQ4TsjvrEy8U/B5q58rRmqqi1TQM/G86A=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rkFrKYCecnJZVaO6NeI0VsLPV0eIaV8jYsER5dx+wnSuWTVqKFOj5oBQN8DWLjCSj
	 fTTVi2T/3pzEI4cxae9Xj+2URgn1aQStjfZCBzvMu1X+HStVdsdyLNR3v0FdyiDLrd
	 JmQ2b+xGJ5LoNvajvfl4F533k7jRcIJGlXlhSumU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B24F80372;
	Tue, 14 Apr 2020 16:48:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A48AF80334; Tue, 14 Apr 2020 16:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D319EF8021E
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D319EF8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mLCwhPLa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C64BE2076D;
 Tue, 14 Apr 2020 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875682;
 bh=xxyiVMF9lycQ4TsjvrEy8U/B5q58rRmqqi1TQM/G86A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mLCwhPLaAXG8jo9N/EJbGjk5k8k0yDo/b2Frqlbx62nJqgD1gKVEMlQOX2wri4VyH
 w7YhSU56igyHsVVND3zvU9ysypcKJBThI+39Xb78pJ1W92sObaLjHnGJXttN8LPfqs
 FnalfkTCPmlhFiWgE8ge8vpCyvBaOGM1LCqutY9g=
Date: Tue, 14 Apr 2020 15:47:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Applied "ASoC: intel: sof_sdw: init all aggregated codecs" to the
 asoc tree
In-Reply-To: <20200409185827.16255-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409185827.16255-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

   ASoC: intel: sof_sdw: init all aggregated codecs

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

From 5930d02c2d533aa9cbc2b55ad27b41802858da16 Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Thu, 9 Apr 2020 13:58:20 -0500
Subject: [PATCH] ASoC: intel: sof_sdw: init all aggregated codecs

Init codecs which belong to the same group id on all links.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200409185827.16255-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 41 ++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a64dc563b47e..6a1b51c0546b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -411,25 +411,36 @@ static int create_codec_dai_name(struct device *dev,
 
 static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
 			       struct snd_soc_dai_link *dai_links,
-			       bool playback)
+			       bool playback, int group_id)
 {
 	int i;
 
-	for (i = 0; i < link->num_adr; i++) {
-		unsigned int part_id;
-		int codec_index;
-
-		part_id = SDW_PART_ID(link->adr_d[i].adr);
-		codec_index = find_codec_info_part(part_id);
+	do {
+		/*
+		 * Initialize the codec. If codec is part of an aggregated
+		 * group (group_id>0), initialize all codecs belonging to
+		 * same group.
+		 */
+		for (i = 0; i < link->num_adr; i++) {
+			unsigned int part_id;
+			int codec_index;
 
-		if (codec_index < 0)
-			return codec_index;
+			part_id = SDW_PART_ID(link->adr_d[i].adr);
+			codec_index = find_codec_info_part(part_id);
 
-		if (codec_info_list[codec_index].init)
-			codec_info_list[codec_index].init(link, dai_links,
-						 &codec_info_list[codec_index],
-						 playback);
-	}
+			if (codec_index < 0)
+				return codec_index;
+			/* The group_id is > 0 iff the codec is aggregated */
+			if (link->adr_d[i].endpoints->group_id != group_id)
+				continue;
+			if (codec_info_list[codec_index].init)
+				codec_info_list[codec_index].init(link,
+						dai_links,
+						&codec_info_list[codec_index],
+						playback);
+		}
+		link++;
+	} while (link->mask && group_id);
 
 	return 0;
 }
@@ -623,7 +634,7 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 			      NULL, &sdw_ops);
 
 		ret = set_codec_init_func(link, dai_links + (*be_index)++,
-					  playback);
+					  playback, group_id);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec %d", codec_index);
 			return ret;
-- 
2.20.1

