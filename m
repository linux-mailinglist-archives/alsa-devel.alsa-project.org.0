Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB634C0765
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 02:50:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349C11924;
	Wed, 23 Feb 2022 02:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349C11924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645581040;
	bh=FInZ8bgEh9fJf3xW469G5TLgkADkj5ZM4Ed11NC9Rqs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTOarn2g6XOymYeh0ae7psQyNenxaNpqy1a+OEhUT5/Eo1fYJWV347bixzKVTcCdE
	 rWTw1iBjGUjUBfbkC0XPi5jVSA6ksF2xR+a6nATtj3mdhMu818PaoQcKbE7DdK/xqd
	 KnoUfal+S2SCxOSJ9ilVWkNu430JO+EFiBhcp8bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78598F804FD;
	Wed, 23 Feb 2022 02:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF915F8012C; Wed, 23 Feb 2022 02:49:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59BECF8012C
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 02:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59BECF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TzhIuZLK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDB86146B;
 Wed, 23 Feb 2022 01:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14746C340E8;
 Wed, 23 Feb 2022 01:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645580935;
 bh=FInZ8bgEh9fJf3xW469G5TLgkADkj5ZM4Ed11NC9Rqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzhIuZLKpIi2RihYxBEEjSWY8aOXd4+b1IqD5jwXsEQLrUWlMWc+v1zQvvczx8TEW
 YaRnPKwKfrm0Jr5k8LChbKPBXtoiEd5rQS0RKNKvR7kehzJt5YUjj67RR7mwFb8waB
 6a/6y5R7AYtRjrFZb5/xVMOgwO8SLPF3dKAZrUp6+s0a0oLTFczgCQEYIYlIv+Za4N
 YA9O5eOnxrLgy6/Hkfn5IWTv0XQiMj9RIPg8LW8hkEnvDOlYYQPxntep2z1x28ICgN
 n/0p+1F1/EsaPLDqVwhBKrjNMGyrgljqWi3zhwRUF7caD62wT1zMf8911getZZrK0D
 wkkNdkxQL5Ubg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: pcm512x: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 01:48:46 +0000
Message-Id: <20220223014846.2765382-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223014846.2765382-1-broonie@kernel.org>
References: <20220223014846.2765382-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; h=from:subject;
 bh=FInZ8bgEh9fJf3xW469G5TLgkADkj5ZM4Ed11NC9Rqs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFZJpualPKo39n0cEG+9UQfSHxVZEcxSXi5nts5v+
 kB1KuS6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWSaQAKCRAk1otyXVSH0IG+B/
 9rmVaIZGNsQX8fBc1jUhtMGBiyMFnhVo4io2951bsbPXWNEPT+QpIJt4mM3r/RnloGC60H9JBHiT1l
 ZpyFC6GibEnBvW+hl8LNzud719RU1/9guIdFDfj8Qq/2oxPqzvcLjvoqqWPRJHbnTo0Sh8yDMonw7J
 CUU29Tz68VnAO86NYub5rDXZCVZSLKl62lOemRHnYcSqEnj5qg+AL8wNYT+mRPjzMrRehapgNKOKcv
 2WM0WsaHxi/ZqrIOEf9+rc1IpRp7Y8UZbEA4IX6lYkx/TueXvnpBR0ftqogv5VQ4lal0ud1K+EjOOi
 p6PHFRxjMv4ZHiqogXeR27XEijEgk4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the pcm512x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm512x.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 60dee41816dc..a3ff4a07aff7 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -652,12 +652,12 @@ static int pcm512x_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	switch (pcm512x->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		return pcm512x_dai_startup_master(substream, dai);
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		return pcm512x_dai_startup_slave(substream, dai);
 
 	default:
@@ -1202,8 +1202,8 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	if ((pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-	    SND_SOC_DAIFMT_CBS_CFS) {
+	if ((pcm512x->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+	    SND_SOC_DAIFMT_CBC_CFC) {
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_ERROR_DETECT,
 					 PCM512x_DCAS, 0);
 		if (ret != 0) {
@@ -1340,21 +1340,21 @@ static int pcm512x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	int afmt;
 	int offset = 0;
 	int clock_output;
-	int master_mode;
+	int provider_mode;
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		clock_output = 0;
-		master_mode = 0;
+		provider_mode = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clock_output = PCM512x_BCKO | PCM512x_LRKO;
-		master_mode = PCM512x_RLRK | PCM512x_RBCK;
+		provider_mode = PCM512x_RLRK | PCM512x_RBCK;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		clock_output = PCM512x_BCKO;
-		master_mode = PCM512x_RBCK;
+		provider_mode = PCM512x_RBCK;
 		break;
 	default:
 		return -EINVAL;
@@ -1370,9 +1370,9 @@ static int pcm512x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	ret = regmap_update_bits(pcm512x->regmap, PCM512x_MASTER_MODE,
 				 PCM512x_RLRK | PCM512x_RBCK,
-				 master_mode);
+				 provider_mode);
 	if (ret != 0) {
-		dev_err(component->dev, "Failed to enable master mode: %d\n", ret);
+		dev_err(component->dev, "Failed to enable provider mode: %d\n", ret);
 		return ret;
 	}
 
-- 
2.30.2

