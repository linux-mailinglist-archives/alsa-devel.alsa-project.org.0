Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA35525DD6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 11:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B580D823;
	Fri, 13 May 2022 11:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B580D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652432804;
	bh=5mA2q4jU7mOmTLqJJHgUX50CsuPQPdMJu+xw1pDiJi0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RpcMgJMITMQiX4zItWKcBiBi/Ap7/uFw1I2MBxaXbw4mdQzQhaTcTPlTF09onLjOg
	 Zw4Sz8INUUedXB4B6oVJ2S/xEomKddUp8yYoM31OpawxCFiglW3UVjvQrXSfNGxsys
	 qF3oHJg2mcBB6KHXYxZjfvhdqyhVzA146Fp3xxi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D44F800E9;
	Fri, 13 May 2022 11:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 187F1F80236; Fri, 13 May 2022 11:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF470F800E9
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 11:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF470F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dOlwMY6N"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D4rtBE001348;
 Fri, 13 May 2022 04:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RiMIVc2ewtJS4aq3sSmwjQ8n+IhMPQkFEiSytfsIKN4=;
 b=dOlwMY6Nbmu91SMYAwKniF78szKZouJNmpD5e2JyIonBH2IBYKSpbQmVybgA6AX0q1Dw
 QGgr+DrrxsaJxrZKnRnT3xHDMaPWuRQtfp4z+ZYOWOpQUWNOzjogq25zQZn7SjPPKqJf
 fps8sGuM2Hp+9R5hgWhLtsVepIm7V6v3bu2J9YiJ+OY95w9nZCUNGb9WIxxwhKJJ9S4U
 NftOItVdxYECAzD4VLE7JgjYlUzwxGWjOJsqtMg9IGWJIj35WEpqwjGUTYnK4Wn7upqZ
 ycYQiPKBS9ry6z0TVbDbcpr63cgXCbsjKRfVbkNd9cEmKoKFTrXA+EP10cNMvp0J8ylV AA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6p0m79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 May 2022 04:05:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 10:05:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 13 May 2022 10:05:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C2CCBB10;
 Fri, 13 May 2022 09:05:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: core: Correct spelling fliped -> flipped
Date: Fri, 13 May 2022 10:05:30 +0100
Message-ID: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: A38AH6_mrgb8YKjdyCG0uoI5CqhKkOOC
X-Proofpoint-GUID: A38AH6_mrgb8YKjdyCG0uoI5CqhKkOOC
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
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

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h                   | 2 +-
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/soc-core.c                  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f906e5a708308..f20f5f890794a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1259,7 +1259,7 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 				   const char *propname);
 int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname);
 
-unsigned int snd_soc_daifmt_clock_provider_fliped(unsigned int dai_fmt);
+unsigned int snd_soc_daifmt_clock_provider_flipped(unsigned int dai_fmt);
 unsigned int snd_soc_daifmt_clock_provider_from_bitmap(unsigned int bit_frame);
 
 unsigned int snd_soc_daifmt_parse_format(struct device_node *np, const char *prefix);
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 2b5d20f02f8f8..77ac4051b8276 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -711,7 +711,7 @@ static void graph_link_init(struct asoc_simple_priv *priv,
 	 */
 	daiclk = snd_soc_daifmt_clock_provider_from_bitmap(bit_frame);
 	if (is_cpu_node)
-		daiclk = snd_soc_daifmt_clock_provider_fliped(daiclk);
+		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
 
 	dai_link->dai_fmt	= daifmt | daiclk;
 	dai_link->init		= asoc_simple_dai_init;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d68e64b73eea7..32267a38130b3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1230,7 +1230,7 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	/*
 	 * Flip the polarity for the "CPU" end of a CODEC<->CODEC link
 	 */
-	inv_dai_fmt = snd_soc_daifmt_clock_provider_fliped(dai_fmt);
+	inv_dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int fmt = dai_fmt;
@@ -3035,7 +3035,7 @@ int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname)
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_aux_devs);
 
-unsigned int snd_soc_daifmt_clock_provider_fliped(unsigned int dai_fmt)
+unsigned int snd_soc_daifmt_clock_provider_flipped(unsigned int dai_fmt)
 {
 	unsigned int inv_dai_fmt = dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 
@@ -3056,7 +3056,7 @@ unsigned int snd_soc_daifmt_clock_provider_fliped(unsigned int dai_fmt)
 
 	return inv_dai_fmt;
 }
-EXPORT_SYMBOL_GPL(snd_soc_daifmt_clock_provider_fliped);
+EXPORT_SYMBOL_GPL(snd_soc_daifmt_clock_provider_flipped);
 
 unsigned int snd_soc_daifmt_clock_provider_from_bitmap(unsigned int bit_frame)
 {
-- 
2.30.2

