Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3562E5804D9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65C5847;
	Mon, 25 Jul 2022 21:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65C5847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778795;
	bh=LjVHMpU8W8wxHyvMSgNduOVXopQvALdhTCPzHbm+U08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN4/VR//KFmFWOIUHUFUWQFnZ9V4rjISIZbSsvP6kH/KLwGvbZWCdydS/qbCXERUF
	 GY9ZdxlyVkVNyJIGY76xxtzP6hkiERxWomwWbJ4GkwgQAYozVj4GWu69ikSjShRg+S
	 KPEnCFDjHKq+pYrsedt8tGNsvwYR1OifokUpLziY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A812F805A0;
	Mon, 25 Jul 2022 21:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97CDDF80570; Mon, 25 Jul 2022 21:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36D7AF804B2
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D7AF804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NNK3XvJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778577; x=1690314577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LjVHMpU8W8wxHyvMSgNduOVXopQvALdhTCPzHbm+U08=;
 b=NNK3XvJKaE9qIU+OrwOZwtzY5/2haj+QhBzlUp+AWMehDhkgwhjRT7am
 8IeV+tz6fc5IRW97U66D505CmJ2HF0kV63TfRlIYPokc/sx1XbebsgThL
 MeruEJOXeHDjWKQ2Q7gEdDl2NpQdRTey652edZGNvaMnRi/FZsIOIM96L
 qY21+WePkchwvPAGxCLWaPcAw7O7hNjrRnzxAklwEMCsO1fqa2ZomAXIS
 gqgCS1O09BGKyiqQn0xikdFsbI+M9AQ1B0oO8eLZTrjAoCBnb+NnwxO6n
 6uaaJF4nYZuAfAEoSNCOWIXN8zxzEENVush1k6g0foPo2PnUcycKbSZYX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553926"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553926"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479477"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: Intel: sof_rt5682: Perform quirk check first in
 card late probe
Date: Mon, 25 Jul 2022 14:49:08 -0500
Message-Id: <20220725194909.145418-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

The check of sof_rt5682_quirk should not be skipped unless the HDMI
handling code exits with error, fix by moving the quirk check to the front.

Fixes: 94d2d0897474 ("ASoC: Intel: Boards: tgl_max98373: add dai_trigger function")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index b79d8a497e1d..045965312245 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -447,6 +447,15 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct sof_hdmi_pcm *pcm;
 	int err;
 
+	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+		/* Disable Left and Right Spk pin after boot */
+		snd_soc_dapm_disable_pin(dapm, "Left Spk");
+		snd_soc_dapm_disable_pin(dapm, "Right Spk");
+		err = snd_soc_dapm_sync(dapm);
+		if (err < 0)
+			return err;
+	}
+
 	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 	if (is_legacy_cpu || !ctx->idisp_codec)
 		return 0;
@@ -477,15 +486,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
-	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
-		/* Disable Left and Right Spk pin after boot */
-		snd_soc_dapm_disable_pin(dapm, "Left Spk");
-		snd_soc_dapm_disable_pin(dapm, "Right Spk");
-		err = snd_soc_dapm_sync(dapm);
-		if (err < 0)
-			return err;
-	}
-
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
-- 
2.34.1

