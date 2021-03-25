Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321D34988A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D8D1655;
	Thu, 25 Mar 2021 18:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D8D1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616694389;
	bh=bnXdf3QIE2xl3TBIsOrKgiDy/PLDvXxb8KCSppSl7mY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnZVM7biCv+RBLg5bpfH2gJX9HYmwLHIpq6mqOpXl93BzEit5Q0n9QwW3EBpTg6Cw
	 Mc+oLFm5wvdWNrgps/pNSAasoY6A6hZyjR5UKbZbYUpzW+dkTwVzV9pZRWqztw4+Mc
	 50yWnhcvGLqLSmzinhnYvRkWURVA14AHB14C2HNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B93E7F80290;
	Thu, 25 Mar 2021 18:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3110AF802E3; Thu, 25 Mar 2021 18:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EC73F80257
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC73F80257
IronPort-SDR: 0FpyAlR64KIVOZL/EGbpy7h6K9KWQgD0aMc104QklGhrmX9AVgCa+pmTArG63aYroxvSjpJwZu
 IoKfggyyEGCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178107074"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="178107074"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:44:01 -0700
IronPort-SDR: xX6GKLzvYpsGmh3dONoNrpsXq42pCfaiAqSif/CnjvqUhdJmENcGQYtnTus24pziROL4kQyD7r
 0hHXfbBjWo/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="443481845"
Received: from snappy-s2600wt2r.iind.intel.com ([10.223.163.26])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2021 10:43:59 -0700
From: vamshi.krishna.gopal@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoc: Intel: board: add BE DAI link for WoV
Date: Thu, 25 Mar 2021 23:13:25 +0530
Message-Id: <20210325174325.31802-3-vamshi.krishna.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325174325.31802-1-vamshi.krishna.gopal@intel.com>
References: <20210325174325.31802-1-vamshi.krishna.gopal@intel.com>
Cc: harshapriya.n@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, biernacki@google.com,
 vamshi.krishna.gopal@intel.com, pierre-louis.bossart@intel.com
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

From: Mac Chiang <mac.chiang@intel.com>

create dai link in kbl_da7219_max98357a driver for wake on voice
functionality.

changes picked from broonie's tree
commit 0c7941a63a0f
("ASoC: Intel: Skylake: Use refcap device for mono recording")
commit 2154be362c90
("ASoc: Intel: boards: Add WOV as sink for nau88l25_ssm4567 machine")

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Tested-by: Kaiyen Chang <kaiyen.chang@intel.corp-partner.google.com>
Tested-by: luke yang <luke_yang@compal.corp-partner.google.com>
Tested-by: Grace Kao <grace.kao@intel.com>
Tested-by: Kaiyen Chang <kaiyen.chang@intel.com>
Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 5c371bb01313..534ee111e6b2 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -44,6 +44,7 @@ struct kbl_codec_private {
 enum {
 	KBL_DPCM_AUDIO_PB = 0,
 	KBL_DPCM_AUDIO_CP,
+	KBL_DPCM_AUDIO_REF_CP,
 	KBL_DPCM_AUDIO_DMIC_CP,
 	KBL_DPCM_AUDIO_HDMI1_PB,
 	KBL_DPCM_AUDIO_HDMI2_PB,
@@ -339,12 +340,49 @@ static struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
+static unsigned int rates_16000[] = {
+        16000,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_16000 = {
+        .count = ARRAY_SIZE(rates_16000),
+        .list  = rates_16000,
+};
+
+static const unsigned int ch_mono[] = {
+	1,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_refcap = {
+	.count = ARRAY_SIZE(ch_mono),
+	.list  = ch_mono,
+};
+
+static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
+{
+	substream->runtime->hw.channels_max = 1;
+	snd_pcm_hw_constraint_list(substream->runtime, 0,
+					SNDRV_PCM_HW_PARAM_CHANNELS,
+					&constraints_refcap);
+
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					SNDRV_PCM_HW_PARAM_RATE,
+					&constraints_16000);
+}
+
+static struct snd_soc_ops skylake_refcap_ops = {
+	.startup = kabylake_refcap_startup,
+};
+
 SND_SOC_DAILINK_DEF(dummy,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
 
 SND_SOC_DAILINK_DEF(system,
 	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
 
+SND_SOC_DAILINK_DEF(reference,
+	DAILINK_COMP_ARRAY(COMP_CPU("Reference Pin")));
+
 SND_SOC_DAILINK_DEF(dmic,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
 
@@ -419,6 +457,16 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
+	[KBL_DPCM_AUDIO_REF_CP] = {
+		.name = "Kbl Audio Reference cap",
+		.stream_name = "Wake on Voice",
+		.init = NULL,
+		.dpcm_capture = 1,
+		.nonatomic = 1,
+		.dynamic = 1,
+		.ops = &skylake_refcap_ops,
+		SND_SOC_DAILINK_REG(reference, dummy, platform),
+	},
 	[KBL_DPCM_AUDIO_DMIC_CP] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
-- 
2.17.1

