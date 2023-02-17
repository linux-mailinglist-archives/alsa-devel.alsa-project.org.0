Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3169AA00
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:13:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C985EF43;
	Fri, 17 Feb 2023 12:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C985EF43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632413;
	bh=j0T197P1YELVItgZWtEGBCaEB/XtoykOAuZbhiemsIc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mx1p+cGDnSMovLY7AceIqVcLUoFfHn7wEdxHoLJrsIlmNAjA3RF4XUiixPGl8wI7I
	 fIpVNqRW3YVl861sntuP2UDkIOl/Ogkfka63RcHUxjDvGIweKiE+9NNZhdNXeX3noD
	 YVylJYiUF94C3oxiShlaOWHtPmD8SPdokeSfOx6E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCC1F80579;
	Fri, 17 Feb 2023 12:11:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9BBBF804B2; Fri, 17 Feb 2023 12:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED96BF80496
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED96BF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Q3x8mb05
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80BE266021C5;
	Fri, 17 Feb 2023 11:09:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632175;
	bh=j0T197P1YELVItgZWtEGBCaEB/XtoykOAuZbhiemsIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3x8mb05DCpL7U9Co6mIqtV0E1aJzClgwueGgeknBCroY+WPnkHgYxyyUMg6gV2NR
	 ZTYt2Bfe3IHuNQNUpwuzYW+B1ghPxsGNYsRjIxIFLXUdv2AyQ8kNIfzuUghtUUdjyS
	 p/1zRi2HZpyfFKJOR4UbP+PdcrakJRR8iAUam26Vj/FTLM9xT0TDKHe1MqkqdVzJ8S
	 UShTnSWTilgXmtsTIW8gRffZUyEFyp2d/KV/BmpIFrPJ4LMBG8h7FzeornzMbDLDgF
	 IMyKaOSC2fjWZhxWhvMgcbvh7NElDUWoS3qMiYGOV+nuzNRhCdBj+Nbn7RPIu/p2Ka
	 H8oHOO9c5BBPA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 5/9] ASoC: amd: vangogh: use for_each_rtd_components
 instead of for
Date: Fri, 17 Feb 2023 11:08:46 +0000
Message-Id: <20230217110850.1045250-6-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217110850.1045250-1-lucas.tanure@collabora.com>
References: <20230217110850.1045250-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YSZF3IKCOBGVPEYRF6YOSC6NIPI6XCMU
X-Message-ID-Hash: YSZF3IKCOBGVPEYRF6YOSC6NIPI6XCMU
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSZF3IKCOBGVPEYRF6YOSC6NIPI6XCMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To iterate over components use for_each_rtd_components
And compare to component name, so asoc_rtd_to_codec and the dai code can
be removed

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 42 ++++++++++++++++--------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index a1cd52e58574..e7183d8ac3a2 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -153,35 +153,37 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	unsigned int num_codecs = rtd->dai_link->num_codecs;
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *dai;
-	unsigned int bclk_val;
+	unsigned int bclk, rate = params_rate(params);
+	struct snd_soc_component *comp;
 	int ret, i;
 
-	ret = 0;
-	for (i = 0; i < num_codecs; i++) {
-		dai = asoc_rtd_to_codec(rtd, i);
-		if (strcmp(dai->name, "cs35l41-pcm") == 0) {
-			switch (params_rate(params)) {
-			case 48000:
-				bclk_val = 1536000;
-				break;
-			default:
-				dev_err(card->dev, "Invalid Samplerate:0x%x\n",
-					params_rate(params));
+	switch (rate) {
+	case 48000:
+		bclk = 1536000;
+		break;
+	default:
+		bclk = 0;
+		break;
+	}
+
+	for_each_rtd_components(rtd, i, comp) {
+		if (!(strcmp(comp->name, "spi-VLV1776:00")) ||
+		    !(strcmp(comp->name, "spi-VLV1776:01"))) {
+			if (!bclk) {
+				dev_err(comp->dev, "Invalid sample rate: 0x%x\n", rate);
 				return -EINVAL;
 			}
-			ret = snd_soc_component_set_sysclk(dai->component, 0, 0,
-							   bclk_val, SND_SOC_CLOCK_IN);
-			if (ret < 0) {
-				dev_err(card->dev, "failed to set sysclk for CS35l41 dai\n");
+
+			ret = snd_soc_component_set_sysclk(comp, 0, 0, bclk, SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(comp->dev, "failed to set SYSCLK: %d\n", ret);
 				return ret;
 			}
 		}
 	}
 
-	return ret;
+	return 0;
+
 }
 
 static const struct snd_soc_ops acp5x_8821_ops = {
-- 
2.39.2

