Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D317853C1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 11:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14117827;
	Wed, 23 Aug 2023 11:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14117827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692782539;
	bh=ArwzVguQhi7ifWacafrK7kCca70/Ba3U09Ze8Rvukk8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ernTtDHpNHiS8LTH6/bTggykxaqDvGJhWHRdXLmz11K7Zfh9qs05mxJizX21Jf7Lh
	 e6PlxxMVLcVi5yCbTytgD2XDWwGGTIa+RjwThp3eiaO2ppCqPS4RC2LkD7mwakuriZ
	 T+w7+Kc751yY9vkrrRE8Ux7v8/bca/otvGBpoz7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7900F80549; Wed, 23 Aug 2023 11:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DEBF800F5;
	Wed, 23 Aug 2023 11:21:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E31F80158; Wed, 23 Aug 2023 11:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCBF1F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 11:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBF1F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Bzzehe6E
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37N5qdOM016078;
	Wed, 23 Aug 2023 04:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=O
	03S53uO3lWnAuNEG4r3nWYIgaw8ScBk/bSksAb1lRU=; b=Bzzehe6Ead+Wf5Od/
	t+Lzfwt0fGVFBff+fZuY5W9UygSOtoA001uYFMHKw8/70HnMvBRob3g0883dmpnT
	7X5xkcEKQvjkqthP/5nyNk5juZaPrrmT1FvGhveHbNy9pTB9Dc3fo2uswz3e3j0o
	H2nEHUpslnugh1BYlKjgd9WupQYz36hZID4dH5VXVIq3Nroo8oCdMhE8SpH9tsCC
	GgvV9lb7CbzcV8e6yu42ww44Hcdiyl7i3CWzfqraaPl5hO5shLMu7atup84WG8CL
	LCF+lk20j7QSpLRAcKmMOwT9YL7zz5rkRlvJi5+AWclsR4GYhn2zJ6XXwqr95kj3
	zbXqg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sn21s0rr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 04:21:15 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 10:21:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 23 Aug 2023 10:21:13 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7EC362A9;
	Wed, 23 Aug 2023 09:21:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Date: Wed, 23 Aug 2023 10:21:13 +0100
Message-ID: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fWUVyBzmlzXQ9nyjZTqjJkTI8hiVzv3t
X-Proofpoint-ORIG-GUID: fWUVyBzmlzXQ9nyjZTqjJkTI8hiVzv3t
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MUIAXFDLLNAEVS5WGZDZ3PEQOMAAPI25
X-Message-ID-Hash: MUIAXFDLLNAEVS5WGZDZ3PEQOMAAPI25
X-MailFrom: prvs=3599de430b=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUIAXFDLLNAEVS5WGZDZ3PEQOMAAPI25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
added an additional local params in __soc_pmc_hw_params, for the
CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
bytes) and keeping two local copies of it makes the stack frame for
__soc_pcm_hw_params really large. As the two copies are only used
sequentially combine these into a single local variable to shrink the
stack frame.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-pcm.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 3aa6b988cb4b4..46917add10560 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -985,6 +985,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	struct snd_pcm_hw_params tmp_params;
 	int i, ret = 0;
 
 	snd_soc_dpcm_mutex_assert_held(rtd);
@@ -998,7 +999,6 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		goto out;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		struct snd_pcm_hw_params codec_params;
 		unsigned int tdm_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
 
 		/*
@@ -1019,23 +1019,22 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 			continue;
 
 		/* copy params for each codec */
-		codec_params = *params;
+		tmp_params = *params;
 
 		/* fixup params based on TDM slot masks */
 		if (tdm_mask)
-			soc_pcm_codec_params_fixup(&codec_params, tdm_mask);
+			soc_pcm_codec_params_fixup(&tmp_params, tdm_mask);
 
 		ret = snd_soc_dai_hw_params(codec_dai, substream,
-					    &codec_params);
+					    &tmp_params);
 		if(ret < 0)
 			goto out;
 
-		soc_pcm_set_dai_params(codec_dai, &codec_params);
-		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
+		soc_pcm_set_dai_params(codec_dai, &tmp_params);
+		snd_soc_dapm_update_dai(substream, &tmp_params, codec_dai);
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		struct snd_pcm_hw_params cpu_params;
 		unsigned int ch_mask = 0;
 		int j;
 
@@ -1047,7 +1046,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 			continue;
 
 		/* copy params for each cpu */
-		cpu_params = *params;
+		tmp_params = *params;
 
 		if (!rtd->dai_link->codec_ch_maps)
 			goto hw_params;
@@ -1062,16 +1061,16 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 		/* fixup cpu channel number */
 		if (ch_mask)
-			soc_pcm_codec_params_fixup(&cpu_params, ch_mask);
+			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
 hw_params:
-		ret = snd_soc_dai_hw_params(cpu_dai, substream, &cpu_params);
+		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
 
 		/* store the parameters for each DAI */
-		soc_pcm_set_dai_params(cpu_dai, &cpu_params);
-		snd_soc_dapm_update_dai(substream, &cpu_params, cpu_dai);
+		soc_pcm_set_dai_params(cpu_dai, &tmp_params);
+		snd_soc_dapm_update_dai(substream, &tmp_params, cpu_dai);
 	}
 
 	ret = snd_soc_pcm_component_hw_params(substream, params);
-- 
2.30.2

