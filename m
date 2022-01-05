Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37844851D4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FE517F7;
	Wed,  5 Jan 2022 12:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FE517F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382342;
	bh=U13SATnSRmmK56298hEtcUCW/mEZ99vYta9sTtm6GgU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYQ+huTuMgblojWyunivePPcyETxQXQZ1hfOObrax93bEeN3iX5nLiSSVhe9qznpg
	 lj1whnM6Qkvo1RgRtHgP0+o3zDDfTlz+WUtpgWVBEsp1srctr/nON80Whj/sWuMkSY
	 JjuPBpiWdpfJhZxXsiVRSmWxpK0+q11z+z3uxx6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B80DBF80089;
	Wed,  5 Jan 2022 12:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D736F804FB; Wed,  5 Jan 2022 12:30:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B3C0F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3C0F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j4bGok17"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2058aLPC003317;
 Wed, 5 Jan 2022 05:30:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=hq3l5OUPTZQoUS2BT1rUt3VCQYoBu9Y5zhQevRfdakE=;
 b=j4bGok170dkwTGOcplJiREWdUdSk6cg3ncbFafqYTlG1VF5ugbgSfXwYPTSTvYNHk6tJ
 D5qS/Mwp16c9saaT1WpInZiFnpvXWkpJoTosRu/SxdO38zrX2OPNOcuepv/yFiqkKFK+
 3xUJh/GYYHu+aS03BTZ454b2e/6/SSMNOI1f+6D1lNXfS+0i6dc78sjuldzVKinqpEKC
 rXJnGum83C0aR9GTHg10482C3JiCNaKM5GGBkuiT7sFGz6T0zA7ZARe9dhGgAWQfUhej
 oGMaD6pDTGQdP/18UTUjoGrdFyHnzB9DNBuh2FfqCKPspSDzmJrEsSx/8D3mnv0P0zaK hg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g4bt-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:30 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3679EB0E;
 Wed,  5 Jan 2022 11:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 6/8] ASoC: wm_adsp: Add support for "toggle" preloaders
Date: Wed, 5 Jan 2022 11:30:24 +0000
Message-ID: <20220105113026.18955-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: AYTUQBziXWD64o5ZdLfXguYNpWCB0PtA
X-Proofpoint-ORIG-GUID: AYTUQBziXWD64o5ZdLfXguYNpWCB0PtA
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

In the case a device can support retaining the firmware memory across
low power states it is useful for the preloader widget to only power up
whilst actually loading/unloading the core, as opposed to the normal
operation where the widget is powered for the entire time a firmware is
preloaded onto the core. Add support for this mode and a flag to enable
it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 14 +++++++++++---
 sound/soc/codecs/wm_adsp.h |  8 ++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index c3112bf238666..f3672e3d1703e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -896,11 +896,12 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 	struct wm_adsp *dsp = &dsps[mc->shift - 1];
 	char preload[32];
 
-	snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
+	if (dsp->preloaded == ucontrol->value.integer.value[0])
+		return 0;
 
-	dsp->preloaded = ucontrol->value.integer.value[0];
+	snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
 
-	if (ucontrol->value.integer.value[0])
+	if (ucontrol->value.integer.value[0] || dsp->toggle_preload)
 		snd_soc_component_force_enable_pin(component, preload);
 	else
 		snd_soc_component_disable_pin(component, preload);
@@ -909,6 +910,13 @@ int wm_adsp2_preloader_put(struct snd_kcontrol *kcontrol,
 
 	flush_work(&dsp->boot_work);
 
+	dsp->preloaded = ucontrol->value.integer.value[0];
+
+	if (dsp->toggle_preload) {
+		snd_soc_component_disable_pin(component, preload);
+		snd_soc_dapm_sync(dapm);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_preloader_put);
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 0e2f113bd3422..7f4fabbc6ad3a 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -41,6 +41,14 @@ struct wm_adsp {
 
 	struct list_head compr_list;
 	struct list_head buffer_list;
+
+	/*
+	 * Flag indicating the preloader widget only needs power toggled
+	 * on state change rather than held on for the duration of the
+	 * preload, useful for devices that can retain firmware memory
+	 * across power down.
+	 */
+	bool toggle_preload;
 };
 
 #define WM_ADSP1(wname, num) \
-- 
2.11.0

