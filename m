Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B4E3D4
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898F5165D;
	Mon, 29 Apr 2019 15:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898F5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544860;
	bh=tEMVobRI9eFC0BMJ6Xh2M2zA+rmq5T2tW4x5Q3L6n5E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BjJ1j2Si42QWA71NbHSQZoTjaMo7yRCgKl8HzYF5d8ljO8m+dkoX5x06sCQkmUsJT
	 tJ53depy5GuhlYca67Iv61C/07BweBhZ7c5DtV0nPMdk/Djfkmy8keSQkX7qFjVMDQ
	 wX+iwwNgGw1x4zjCmZt2X9SNHZxCOeJVHp/K9E0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC86F89733;
	Mon, 29 Apr 2019 15:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99E0F8971A; Mon, 29 Apr 2019 15:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97170F80C0D
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97170F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="meqj0rsJ"
Received: by mail-wm1-x344.google.com with SMTP id h18so15836622wml.1
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2Ly6nFnbTUuYqirG7Hg6dg1zRcYgFT1GAPuXl6J8C8=;
 b=meqj0rsJv5rfBIShZLQunnMvrc8ItTEICy2+kAclCNP4u/MykXbVjfGB2rZlt3+NG8
 0kXXs/AjAOB2zWPpqduLNYKK4WD+nT7H86fGbdVPXEA3IBi/rPUQSOWSWFGHXIpJw3gS
 VpwnuOvEyHRtvq17hw0O0lylYaxZV0eRkY2PknHzpbM8+q2P5biZpCQkFjQWcHzi4zhL
 CC1/4GTBYQwp/l4GSLsrOss2g/4OaEOEYetdNnJa3KWknO88apc6PrwVP0C816M4Gniz
 Qm+xY1TJ17Kqn7M9V0EIOYMQrG6u9ijK54KnoLq+iXPVWBf2904tvI2g/pqxJwkDa1eh
 KYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2Ly6nFnbTUuYqirG7Hg6dg1zRcYgFT1GAPuXl6J8C8=;
 b=tT9lBllOUHqi+pczjHCHWUYb+OmswQC0Iq4GVs+8RZ/63H8DBAxTHE0whvdNgDMl+9
 ZrMGSIN9buHZtcwJCffgPNvSOXIHXVUocT9UdTJYA+CYL9np3/pN14vwmXtaq2JFgW+r
 QDPnRpCySrGyY6v7geRkVhSGSI6mZzsAjF7rn7dKha0YtFsoqT4YFmi5S2UwpeKbJQKZ
 Evyj62izIa9M/q3w36v0QqPDP25zQBpjTQKv1IzpPRwg8h2I/PJTnt/kURlMN4tD+WSl
 a8OlLdods23XbusRCFGjHKtZSuJAKvyrjrGygsEA3dRXpaZFH9n6pQi8PWgBALGf0eTk
 PX8g==
X-Gm-Message-State: APjAAAVb3uKUgvAwTv+p/wvhuJcpO05glKCudDxHij1FUVajcqbMue1o
 qT5sMKtSHFVgZzQVyVab79N5wDLKCss=
X-Google-Smtp-Source: APXvYqyFKnuadadxSREMNcWSC4Shu/wM2PVEDGkr9qobVHvnCB63myFUBW77jIIhHazK18HxgyS2nw==
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr2263305wmg.53.1556544593778; 
 Mon, 29 Apr 2019 06:29:53 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:42 +0200
Message-Id: <20190429132943.16269-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/6] ASoC: hdmi-codec: remove reference to the
	dai drivers in the private data
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
index 717d0949f8b4..bcc2e5c3bf43 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -278,7 +278,6 @@ static const struct hdmi_codec_cea_spk_alloc hdmi_codec_channel_alloc[] = {
 
 struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
-	struct snd_soc_dai_driver *daidrv;
 	struct hdmi_codec_daifmt daifmt[2];
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
@@ -720,6 +719,7 @@ static const struct snd_soc_component_driver hdmi_driver = {
 static int hdmi_codec_probe(struct platform_device *pdev)
 {
 	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
+	struct snd_soc_dai_driver *daidrv;
 	struct device *dev = &pdev->dev;
 	struct hdmi_codec_priv *hcp;
 	int dai_count, i = 0;
@@ -742,25 +742,23 @@ static int hdmi_codec_probe(struct platform_device *pdev)
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
 
 	if (hcd->spdif)
-		hcp->daidrv[i] = hdmi_spdif_dai;
+		daidrv[i] = hdmi_spdif_dai;
 
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
