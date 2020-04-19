Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E0C1B0195
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 08:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31042166F;
	Mon, 20 Apr 2020 08:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31042166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587364326;
	bh=oR1psWkKj74UF42CLepyCrLj2IqgjpZgbxxcmtTBzQA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fvGIUCMZWYapakAJ9tf1Dme/8c/JFz0oQMeVwXT8hF+n2q3CNCSQMrYG93xPfYpr+
	 br2yEBnnGyh4TA3KadV1A9KGjFUlI03v9sWT07Fq62ASniLSJ6Lrc4HdbRVpoNrScc
	 Mo4stH0TzCtxW/wgJkyfgBouWLEnJzm1Iw8cizoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5824FF801D9;
	Mon, 20 Apr 2020 08:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F99FF801D9; Mon, 20 Apr 2020 08:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B860F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 08:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B860F800E7
IronPort-SDR: lTq3nE0/Tse9A7Vd5ETquhVM+bVUEM9pNIfuSte2kXIvREzi6adwkmT0UTfh7Aqd5YbIMYb4nm
 FX32Yyua80Ug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 23:30:02 -0700
IronPort-SDR: fDiQbUJWQM3bnIaVkcdsLT4PwaA5IQioHQ2Wh0UQKqSpML23RWCAO1iZ+1wvBoYcsbTHhEML5R
 Y7kcYDEQJ6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="429008169"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2020 23:29:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: Intel: sof_sdw: add amp number in components string for
 ucm
Date: Mon, 20 Apr 2020 02:35:09 +0800
Message-Id: <20200419183509.4134-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

From: randerwang <rander.wang@linux.intel.com>

The number of speaker amplifiers may vary between platforms. UCM
needs to check amp number to include different configuration files.
This patch keeps track of the number of speaker amplifiers and
stores it in components string of the card.

Tested on Comet Lake platforms.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: randerwang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a64dc563b47e..c94e71563891 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -898,6 +898,7 @@ static int mc_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &card_sof_sdw;
 	struct snd_soc_acpi_mach *mach;
 	struct mc_private *ctx;
+	int amp_num = 0, i;
 	int ret;
 
 	dev_dbg(&pdev->dev, "Entry %s\n", __func__);
@@ -924,9 +925,18 @@ static int mc_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, ctx);
 
+	/*
+	 * the default amp_num is zero for each codec and
+	 * amp_num will only be increased for active amp
+	 * codecs on used platform
+	 */
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		amp_num += codec_info_list[i].amp_num;
+
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "cfg-spk:%d",
-					  (sof_sdw_quirk & SOF_SDW_FOUR_SPK) ? 4 : 2);
+					  "cfg-spk:%d, cfg-amp:%d",
+					  (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
+					  ? 4 : 2, amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
-- 
2.17.1

