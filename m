Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A601E8802
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 21:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B2217BC;
	Fri, 29 May 2020 21:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B2217BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590781170;
	bh=B2pBpGPI8+0rwg8BVdlnHxFgLlKdJPl82Q1v0rPp1TI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYFZ9ubn1UjxSm1OWfaqqsLMEfzA5/ksjVVYYDIQHHnB628W8PNEU2l+tME4M1mC2
	 AV0CglYFQvIW1re+PX1b2KsVrwsc/DXCA6tsRP35DC8RzjqtUOG4jFcy+msslY4yPZ
	 vthny3ayUXcp+er08yGZzHbZcyG5ZU0/DBACvkgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 563F1F80292;
	Fri, 29 May 2020 21:36:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EDCFF80107; Fri, 29 May 2020 21:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50A98F80149
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 21:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A98F80149
IronPort-SDR: sv/aAkghHubNVuahc8rn4SdJW85s/yzmq1KT+lsMi1hkQAE/6zJhkKkzZ3PBhUaxRPuN9V85ey
 JYWK2Xdn3Fjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 12:35:54 -0700
IronPort-SDR: Kdnq67r54CqwjRr4BBVW232KXlVqFFIBmBpVN3ek1CeZ18XOI0g0yxicMwAurB9PQWuZyc0FSs
 UNmmLaBzx+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="469605875"
Received: from jbrayton-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.97.254])
 by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 12:35:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/3] ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI
 condition
Date: Fri, 29 May 2020 14:35:47 -0500
Message-Id: <20200529193547.6077-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529193547.6077-1-pierre-louis.bossart@linux.intel.com>
References: <20200529193547.6077-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Libin Yang <libin.yang@linux.intel.com>
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

From: Libin Yang <libin.yang@linux.intel.com>

As CONFIG_SND_HDA_CODEC_HDMI is always enabled in sof_pcm512x,
let's remove the test of CONFIG_SND_HDA_CODEC_HDMI in the
sof_pcm512x driver.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index f983c7fbb1d1..9fa8a4911276 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -126,7 +126,6 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
@@ -146,12 +145,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 
 	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
 }
-#else
-static int sof_card_late_probe(struct snd_soc_card *card)
-{
-	return 0;
-}
-#endif
 
 static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Ext Spk"),
@@ -374,14 +367,12 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_pcm512x_quirk = SOF_PCM512X_SSP_CODEC(2);
 	} else {
 		dmic_be_num = 2;
-#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 		if (mach->mach_params.common_hdmi_codec_drv &&
 		    (mach->mach_params.codec_mask & IDISP_CODEC_MASK))
 			ctx->idisp_codec = true;
 
 		/* links are always present in topology */
 		hdmi_num = 3;
-#endif
 	}
 
 	dmi_check_system(sof_pcm512x_quirk_table);
-- 
2.20.1

