Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F114E327C7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 06:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E215167D;
	Mon,  3 Jun 2019 06:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E215167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559536757;
	bh=dEYlVWDWufCCSXiax8SAKFiSCnYK2S523RLx0Z70Kqs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s59FCBXZN3Kl59pCblBG1pKy0OQyaywvbZbZZ556SjQTudSV3Cwk3mSHutDxklOH6
	 skAsljhuCTbx6mXhqxNQkVOf/VOl1KY5o3t9Sm82BIR3DL1/FWvd7UU8R2hcWp8WC8
	 gkVr9Q8lMbu0jrEHvtgkxNPbCyrb7zUf4DWNetKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E44CF89757;
	Mon,  3 Jun 2019 06:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA267F89756; Mon,  3 Jun 2019 06:34:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E6AF89752
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 06:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E6AF89752
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hfq6ax4j"
Received: by mail-pl1-x642.google.com with SMTP id g69so6465583plb.7
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
 b=Hfq6ax4j9v67eMl3jzhORUV9xlodMxfyEB5jUFylBnMvGjbup0xltWak92wPnYo8jT
 z0URgg2rd1r5wg+Oy3xrddVqdvePsxYBMv74zKntc+d+vjFpS0hNfzpdzd1s9AT5d4X1
 i8E4gAcDkyjhrEy5aOZTU8DXTpX6OpurnFU4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
 b=gcqMGirgqYjhHk+oXpndIA5cFP49RunY88btCtKP3aYhDpL3MyNjS43xgu7NcKBIHS
 MJW6djKCxp/g0xRvnPEZSc9Cn6JC4Bg85YZXr9IfdqPafhDq5QAnJQNcV9nRmxG6k6jV
 XoCFuQ29CUkds36nMUTLUqpySkx4O7A84b1w0vtlTpYfCbYnfn0go9HuacufXMQ3kCvI
 5TsTSCEGK0UOsgBfyi4yLwAcl6tXTEBJtrZOeyhaUEXCQzWmEkRE4nVwaKW5bAmG4jhp
 YypB+Bl5Snfab+nFrTRZQ34GCOiVOVHCH+a80G4R4soD3W2FTPLLuO2T/ri47ZabfJz9
 1uOQ==
X-Gm-Message-State: APjAAAWLZt02hOEpBvqS7nbRWtKOfaI1/kqeFTZ265P8eSykCI2kxDnK
 v6XYwtCXXDEPdNenb9fgSxIWqg==
X-Google-Smtp-Source: APXvYqwtsOJ5Pc96EE50WIzahRr4M7P5Cn839A0uqq7pGgYj7JP4xpqAWFOhLexsz8HaBDU7wChTEA==
X-Received: by 2002:a17:902:9885:: with SMTP id
 s5mr27565604plp.102.1559536444754; 
 Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id r64sm16094840pfr.58.2019.06.02.21.34.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  3 Jun 2019 12:32:50 +0800
Message-Id: <20190603043251.226549-7-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH 6/7] ASoC: rockchip_max98090: Add HDMI jack
	support
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

In machine driver, create a jack and let hdmi-codec report jack status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 2dd247670c7a..17c50d9fbac1 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
@@ -27,6 +28,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/hdmi-codec.h>
 
 #include "rockchip_i2s.h"
 #include "../codecs/ts3a227e.h"
@@ -131,6 +133,26 @@ enum {
 	DAILINK_HDMI,
 };
 
+static struct snd_soc_jack rk_hdmi_jack;
+
+static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct device *hdmi_dev = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/* enable jack detection */
+	ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &rk_hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack, hdmi_dev);
+}
+
 /* max98090 and HDMI codec dai_link */
 static struct snd_soc_dai_link rk_dailinks[] = {
 	[DAILINK_MAX98090] = {
@@ -148,6 +170,7 @@ static struct snd_soc_dai_link rk_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.init = rk_hdmi_init,
 	}
 };
 
@@ -200,6 +223,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *np_cpu;
 	struct of_phandle_args args;
+	struct device_node *np_hdmi;
+	struct platform_device *hdmi_pdev;
 
 	/* register the soc card */
 	card->dev = &pdev->dev;
@@ -248,6 +273,22 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* The hdmi device handles HDMI hotplug detection */
+	np_hdmi = of_parse_phandle(np, "rockchip,hdmi", 0);
+	if (!np_hdmi) {
+		dev_err(&pdev->dev, "Failed to find HDMI node\n");
+		return -EINVAL;
+	}
+
+	hdmi_pdev = of_find_device_by_node(np_hdmi);
+	if (!hdmi_pdev) {
+		dev_err(&pdev->dev, "Waiting for HDMI device %s\n",
+			np_hdmi->full_name);
+		return -EPROBE_DEFER;
+	}
+
+	snd_soc_card_set_drvdata(card, &hdmi_pdev->dev);
+
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
