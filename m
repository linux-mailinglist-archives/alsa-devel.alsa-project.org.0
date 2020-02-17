Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77770160E5F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F43B83B;
	Mon, 17 Feb 2020 10:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F43B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581931336;
	bh=aJYX1nSryugbM118/zBsBLG5zrZN2YIN5tVapu7g39k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eQtMYW6hDqs1Zw/q8YeYxQXGxeA4HnfpI8j3j88bUq/zwxH9TQbPwgRHXVCo07Mfm
	 xbPnzUlhPKF56WspmlGRjgHsREwWWTddboNuLN+lGt+UFe6v6K/mR8gTj/5tuRQiY/
	 dD+cRMDIZmdnmt4OAdE6f0ZbFDfFH6ZtaL16TaF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C6AF801F4;
	Mon, 17 Feb 2020 10:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044CBF80172; Mon, 17 Feb 2020 10:20:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5637DF800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:20:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5637DF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="jRUI4paO"
Received: by mail-wm1-x341.google.com with SMTP id b17so17568679wmb.0
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUz2G04Bb89tsKE0msFkZ9blTmeu3DgvQbssg5zQwVU=;
 b=jRUI4paOxqTsdkPUlKyQza5/FpjH5wFiT0l/DFu9r7BUgb5pGXIndS5vpdCLOkBORf
 Iw+TAURuUy2azNJ5jTx10V/NAz11y/TrDoYRIxoeYulS/whZYSte8nrQQIQ4M4tljIlR
 pY+9l2bv/3db1tfrEDEwqJTo83NafxBBIqp/n5hD70GxBtSbrgc42/kigzd3koASPoWg
 lo6X9DGrQnQTFf936OV0/inNqQ9bMc9UApXK58C//1tqFBjEmbRBjWcmPxEZGOy8auim
 MwgHdRDNZmNQ1gq8FfvGBfXsZxE7f8Rdswb4B5H9Gl7VpXYwXcQtG/ZjnOPJB/MzlxPW
 CAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUz2G04Bb89tsKE0msFkZ9blTmeu3DgvQbssg5zQwVU=;
 b=Par83MhG1hbK7mPKf0h1ix6zwtGf3599tEx/M61NyQ5R07vHoDb9avcdcqAQl/q5w+
 kxiwvOahdZOT+/hOmZNoQYdaFpApLohMnj5fez0MpKsShqaKq7vWqFsbLefc1dOJihmR
 oz8zXaPFILi09VvMmvz1IE2f5JlrKrhBdXhrgsq9VZ3KAJuBCwceDIi2YC5BQA6CHIFs
 kfMjvoiUNqjhfByPu1noP3qRp5z8vqwUXKsAxjkEKPnJhsN3F8dYS5zsy0Hgt9sR91aY
 rAHrQuQmiOxEfulp+W392RZrU4GfrHCDXGfV3Aq6ge+zLHOAlbrlSVVN3ZRmN+TuAIN4
 eI7w==
X-Gm-Message-State: APjAAAU8Y8QCvgD26yRDn/3Hn64WFiJ3CHQ4/0XNhqhIh5J9cuI6PxA8
 iANFN3AODLd0Gh6ZOMQ3iPZJTA==
X-Google-Smtp-Source: APXvYqzW2Cgw9zR9wxV2rpAUJf7+def0ERox9GI5jHN5hfn2bae9qIgwbWg171C1Ty1FYR9HcduUeQ==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr22297831wmg.13.1581931229174; 
 Mon, 17 Feb 2020 01:20:29 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id v14sm67373wrm.28.2020.02.17.01.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:20:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 17 Feb 2020 10:20:19 +0100
Message-Id: <20200217092019.433402-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: meson: aiu: simplify component addition
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

Now that the component name is unique within ASoC, there is no need to
hack the debugfs prefix to add more than one ASoC component to a linux
device. Remove the unnecessary function and use
snd_soc_register_component() directly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c |  7 +++----
 sound/soc/meson/aiu-codec-ctrl.c  |  7 +++----
 sound/soc/meson/aiu.c             | 20 --------------------
 sound/soc/meson/aiu.h             |  8 --------
 4 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index b8e88b1a4fc8..7078197e0cc5 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -197,8 +197,7 @@ static const struct snd_soc_component_driver aiu_acodec_ctrl_component = {
 
 int aiu_acodec_ctrl_register_component(struct device *dev)
 {
-	return aiu_add_component(dev, &aiu_acodec_ctrl_component,
-				 aiu_acodec_ctrl_dai_drv,
-				 ARRAY_SIZE(aiu_acodec_ctrl_dai_drv),
-				 "acodec");
+	return snd_soc_register_component(dev, &aiu_acodec_ctrl_component,
+					  aiu_acodec_ctrl_dai_drv,
+					  ARRAY_SIZE(aiu_acodec_ctrl_dai_drv));
 }
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 8646a953e3b3..4b773d3e8b07 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -144,9 +144,8 @@ static const struct snd_soc_component_driver aiu_hdmi_ctrl_component = {
 
 int aiu_hdmi_ctrl_register_component(struct device *dev)
 {
-	return aiu_add_component(dev, &aiu_hdmi_ctrl_component,
-				 aiu_hdmi_ctrl_dai_drv,
-				 ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv),
-				 "hdmi");
+	return snd_soc_register_component(dev, &aiu_hdmi_ctrl_component,
+					  aiu_hdmi_ctrl_dai_drv,
+					  ARRAY_SIZE(aiu_hdmi_ctrl_dai_drv));
 }
 
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 34b40b8b8299..d3e2d40e9562 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -71,26 +71,6 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 	return 0;
 }
 
-int aiu_add_component(struct device *dev,
-		      const struct snd_soc_component_driver *component_driver,
-		      struct snd_soc_dai_driver *dai_drv,
-		      int num_dai,
-		      const char *debugfs_prefix)
-{
-	struct snd_soc_component *component;
-
-	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = debugfs_prefix;
-#endif
-
-	return snd_soc_add_component(dev, component, component_driver,
-				     dai_drv, num_dai);
-}
-
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
 				     struct of_phandle_args *args,
 				     const char **dai_name)
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 097c26de7b7c..06a968c55728 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -11,9 +11,7 @@ struct clk;
 struct clk_bulk_data;
 struct device;
 struct of_phandle_args;
-struct snd_soc_component_driver;
 struct snd_soc_dai;
-struct snd_soc_dai_driver;
 struct snd_soc_dai_ops;
 
 enum aiu_clk_ids {
@@ -45,12 +43,6 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 			  const char **dai_name,
 			  unsigned int component_id);
 
-int aiu_add_component(struct device *dev,
-		      const struct snd_soc_component_driver *component_driver,
-		      struct snd_soc_dai_driver *dai_drv,
-		      int num_dai,
-		      const char *debugfs_prefix);
-
 int aiu_hdmi_ctrl_register_component(struct device *dev);
 int aiu_acodec_ctrl_register_component(struct device *dev);
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
