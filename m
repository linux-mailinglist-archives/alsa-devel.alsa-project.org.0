Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE684851D9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:33:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C57D17F7;
	Wed,  5 Jan 2022 12:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C57D17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382406;
	bh=z75K2ROEWkJpCFBmg7i8tiB35JhYCYjBS6LdyE/uWn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MIlYeDO/vcSF0XZrtPCyuzTUW9nyRQ7RRMm6mz8PqJVpXZK2AtyMVGe+/X1ElHYyB
	 4/ij2Wkrk+DyOg/OQsyBOYrKGEWAB4YV0zcpHsvFou4jyaw4EfZKLy2v1u0XFNJ5Ad
	 ZrBOLaJdFSVhFrf7firbJ7gL90vdXxgsexOgW8pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FFCBF8051D;
	Wed,  5 Jan 2022 12:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7AB2F801D8; Wed,  5 Jan 2022 12:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD53F802DF
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD53F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OJ97HHHJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059IfsB015775;
 Wed, 5 Jan 2022 05:30:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=gj9fyC9CaWEFB4rwdSsxHAtsHuTVF6TLZMqDOpkHQSY=;
 b=OJ97HHHJBsQ60vi+VObKbrZjCnxJvfYUYi1dpFxhv35PsfkqrqLoph2Jb1Ju7y0r1a2p
 E4GttqbX02KU8fD+7OSgQzE6rjWi64CApxdFXHC78Xy+45bO+/hTTx7aOHwEes8JoszN
 9x3rY26ODkfKXZOyNdMZyA35HSxPWVhSLxs9Kztn1GTh3iWM0udxxtamGKA84Jingbm9
 owF2D7wRAwgJ7gTw0qNN84yIpLSUh6imJmer///mu1ZjEGMhRQUoDBEDk6VKF2gtp1dP
 Bhs6MSfu2fhRow9AtgXAQoSLKJOAN/nZKdqGnM09mrw5PBNTNBr++rarPW5Auq/wJnID /A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy839d-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:30 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0AD9D11D8;
 Wed,  5 Jan 2022 11:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/8] ASoC: cs35l41: Correct DSP power down
Date: Wed, 5 Jan 2022 11:30:21 +0000
Message-ID: <20220105113026.18955-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: p3D8YZZ4NbB_x561y0LM-Iz4XvJ2vpFi
X-Proofpoint-ORIG-GUID: p3D8YZZ4NbB_x561y0LM-Iz4XvJ2vpFi
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

The wm_adsp_event should be called before the early_event on power
down, event stops the core running and early_event then powers down
the core. Additionally, the core should only be stopped if it was
actually running in the first place.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 980294c1bcdba..05839fabf97bc 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -181,17 +181,21 @@ static SOC_ENUM_SINGLE_DECL(pcm_sft_ramp,
 static int cs35l41_dsp_preload_ev(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *kcontrol, int event)
 {
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		return wm_adsp_early_event(w, kcontrol, event);
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = wm_adsp_early_event(w, kcontrol, event);
-		if (ret)
-			return ret;
+		if (cs35l41->dsp.cs_dsp.running) {
+			ret = wm_adsp_event(w, kcontrol, event);
+			if (ret)
+				return ret;
+		}
 
-		return wm_adsp_event(w, kcontrol, event);
+		return wm_adsp_early_event(w, kcontrol, event);
 	default:
 		return 0;
 	}
-- 
2.11.0

