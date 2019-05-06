Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F241480C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 12:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48C2D1862;
	Mon,  6 May 2019 12:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48C2D1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557136928;
	bh=mkARtMAXAX3fcKbJ/45YUK5oRg6LvepKh6AvIKIF1zE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYNBUe2gMuGwAz1SwufTp/m9uRAgyIF6VXRuI+8+TsfXWB0XcnhV3qxE7lachxCT6
	 iafwCcnwQ54fY6Ump63YiD2J+tFQsQGsDBnVmqrvpfaGQng8iqoGjzjNlMK8d8N2iy
	 E4gnlw1DZqymyHpz1SYMK/85QASwEg645fAc4EP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B50F89731;
	Mon,  6 May 2019 11:58:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9ADF8972A; Mon,  6 May 2019 11:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D37BFF896FD
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D37BFF896FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tkNli+26"
Received: by mail-wr1-x441.google.com with SMTP id r7so16396487wrr.13
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7AcpWA9A83L4FypCc369GCLs1Ntp7uwJwm/XxipXaE=;
 b=tkNli+26My6vrczGDwdluDE7HLnExdDaIwWUJCnpa4VluVUwGnbyIpFbDmCLJjxBM4
 giBX2hEpBS3HS9XssUh6r+omnD+ojlJH+sW9cDeFDBr9R1lMWmT+Ek7g7bXGF/c6+LUh
 PooGogBA4eNNtnk+NuvoYHCGynN1FSgU9zN6/De8aBhVaelHmlKea5y0z2sz4sEJNdKr
 OjO+1w8F9h2cYU8G9NIXEWjb6vmh/b4yNfxCY46j9zJvBKs3QVi74I258ifIBY6rRWaG
 tLaHbEzyk8GBA9xwbWFLMjigRnrLEzB+y19uCtIHiGvz8VqaqYmTg9KQtCqRyrmbc+7X
 S0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7AcpWA9A83L4FypCc369GCLs1Ntp7uwJwm/XxipXaE=;
 b=EbAR87kA2ImaKilDDnwm+tbNkIDmiNUOCTKAiWEF1bJ0+a+UsJo08ECH1K3fAT3277
 9UaXBOP5iSTZoJZfXkL0ofvyrAoNR786hCp830+KmMd8YMqRvIVb4hgFez2YKrlV3WsD
 NjOYnIuGe4xqPDENyDp89Zv0Yh6ru5lUa9Lf9NyG+wYFp2S3F68qADmAT3s/Z1FldPDN
 oIdC33SsF2LczjpJpVX9Hg9Y1Zh6xxWYJ04ZrEe4qmXxvcqJQXaMf3T55RcdJ6l+5YPi
 wXrd0s1OfeoUTYz8vBqgXCPgdWJqn/+Ihve7ogH8ehL06Doccvr2j1CpnmRdRwGOeLh+
 DGxQ==
X-Gm-Message-State: APjAAAX5/36pl8N2rBoLbjXun57Zx4rbcdIZBVmFTMujl91AJ0VoIJ2N
 J2JKAHz7zEAaPvsVXjZWOO+4BA==
X-Google-Smtp-Source: APXvYqwtQmbhEPHAd44Q+EvhhRiBF2PG/mrHhY+2X/gPbS7Vo3zjYdFH/nJTb9sZOSOAoVH9EFtF3A==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr6800608wro.291.1557136705814; 
 Mon, 06 May 2019 02:58:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c10sm23409791wrd.69.2019.05.06.02.58.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:58:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  6 May 2019 11:58:14 +0200
Message-Id: <20190506095815.24578-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506095815.24578-1-jbrunet@baylibre.com>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 3/4] ASoC: hdmi-codec: remove reference to
	the dai drivers in the private data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Keeping the a pointer to the dai drivers is not necessary. It is not used
by the hdmi_codec after the probe.

Even if it was used, the 'struct snd_soc_dai_driver' can accessed through
the 'struct snd_soc_dai' so keeping the pointer in the private data
structure is not useful.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 4d32f93f6be6..9408e6bc4d3e 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -278,7 +278,6 @@ static const struct hdmi_codec_cea_spk_alloc hdmi_codec_channel_alloc[] = {
 
 struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
-	struct snd_soc_dai_driver *daidrv;
 	struct hdmi_codec_daifmt daifmt[2];
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
@@ -715,6 +714,7 @@ static const struct snd_soc_component_driver hdmi_driver = {
 static int hdmi_codec_probe(struct platform_device *pdev)
 {
 	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
+	struct snd_soc_dai_driver *daidrv;
 	struct device *dev = &pdev->dev;
 	struct hdmi_codec_priv *hcp;
 	int dai_count, i = 0;
@@ -737,27 +737,25 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
-	hcp->daidrv = devm_kcalloc(dev, dai_count, sizeof(*hcp->daidrv),
-				   GFP_KERNEL);
-	if (!hcp->daidrv)
+	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
+	if (!daidrv)
 		return -ENOMEM;
 
 	if (hcd->i2s) {
-		hcp->daidrv[i] = hdmi_i2s_dai;
-		hcp->daidrv[i].playback.channels_max =
-			hcd->max_i2s_channels;
+		daidrv[i] = hdmi_i2s_dai;
+		daidrv[i].playback.channels_max = hcd->max_i2s_channels;
 		i++;
 	}
 
 	if (hcd->spdif) {
-		hcp->daidrv[i] = hdmi_spdif_dai;
+		daidrv[i] = hdmi_spdif_dai;
 		hcp->daifmt[DAI_ID_SPDIF].fmt = HDMI_SPDIF;
 	}
 
 	dev_set_drvdata(dev, hcp);
 
-	ret = devm_snd_soc_register_component(dev, &hdmi_driver, hcp->daidrv,
-				     dai_count);
+	ret = devm_snd_soc_register_component(dev, &hdmi_driver, daidrv,
+					      dai_count);
 	if (ret) {
 		dev_err(dev, "%s: snd_soc_register_component() failed (%d)\n",
 			__func__, ret);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
