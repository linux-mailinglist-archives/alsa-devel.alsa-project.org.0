Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A873438BA3
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 21:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E196A166B;
	Sun, 24 Oct 2021 21:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E196A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635103887;
	bh=b4xL0fAZ7re1f6p4MOs3gQ/SpyfAG14POALtZXQ49uY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j5PPtCc5+wsIWA+hc6JjJtrXAl8s3M6X0JZXFlJzDSUtOmo/FchLpxyvQSQtbHvtx
	 GiSrSQD5dc4svgvAaRc121vrosSz1cNFrisS1Ea33X1z4FIFDkFIMjx9kR/E0Ich/j
	 vFEzdPrxqkaQ/rfDQQAMA7gcq+dq4jEuFenwrbIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FA1F8013D;
	Sun, 24 Oct 2021 21:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF85EF80300; Sun, 24 Oct 2021 21:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74236F80166
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 21:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74236F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DV+dcYL3"
Received: by mail-lf1-x12b.google.com with SMTP id u21so8609941lff.8
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuWfVJmwiYFrjBYD5I8hPFxxzsgnJfeoN2PJ/5VwVFo=;
 b=DV+dcYL3tCQ7pZQBBoGyJIzfKEiIOS4K/M2JDQH0hHHWhOXQmpoLKrkVY0d7carPZH
 4b5yIMH5NmePlmnJnMpuXGXOHD6Q+Q15j5rFgci0sL7loM/ti27NnufY2rNcGIRNKXIx
 XBclvZ6LjxuTxSM2vphWK6g6HSzHv6WwFmvU7PdxlQGEtN6georbm/6cNAuQxF3Vnnwc
 /iasdD1mJ1fjrHhHdGfzmzAffccAEGksHgAt2EfEg/ckwiFtAjEAHCeIK3pedSk4LRBz
 HRCsdIF6Vif0uRf1Oyo4GANHGlrKDknOgD5xctbM+eW0XFQyQGj8c58GkpyOP881qNVU
 7+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuWfVJmwiYFrjBYD5I8hPFxxzsgnJfeoN2PJ/5VwVFo=;
 b=GuTacE7Fq3dHyQ6ZBcGjfnfYbGnkJrrOoexCTgisLD4H9WMxEQp4wZ4qu/RSKalj7w
 CbuAeBRCbmVRdMjkjbIEAMWQ54H5iZAaJT4OMwxw1OE7DrzsID+wfa419olFuwRyGxKu
 E7U6C/3d1ESf6z3FXzV5sXC/PlOAxnGoi598LQkHVsC3PZZ98tldXjoRUsDmx/KX7nEy
 meDBontJqI3K333uHoh2N6k8wtPY9bstGL3qaUaJOrrcTsfZL0gcf8+vSEM7mW1Vp39Q
 6BR69CcfgNlNyaXLcyCSrLrr0j6wegjC1WZFlL64V4PwyDrTed/buPeR5/7Tsahb47nD
 w/jg==
X-Gm-Message-State: AOAM5313tcC20LXLhfUB3//JXGacPkQhjoZUQoB8lHlMlTSMXRBr0y87
 GAAQlJt6iMFhKoR2p3ofwRA=
X-Google-Smtp-Source: ABdhPJywrkYKDO2m53ZlDClFzmqKQW/4vr28mkI+ML3NJZ3QDwXCAqQ2Z9CEZuZSTgVzihSr7GrzyQ==
X-Received: by 2002:ac2:561c:: with SMTP id v28mr2325912lfd.604.1635103794358; 
 Sun, 24 Oct 2021 12:29:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-50-159.dynamic.spd-mgts.ru.
 [46.138.50.159])
 by smtp.gmail.com with ESMTPSA id t20sm1616902lft.240.2021.10.24.12.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 12:29:53 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/2] ASoC: tegra: Restore AC97 support
Date: Sun, 24 Oct 2021 22:28:52 +0300
Message-Id: <20211024192853.21957-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The device-tree of AC97 codecs need to be parsed differently from I2S
codecs, plus codec device may need to be created. This was missed by the
patch that unified machine drivers into a single driver, fix it. It should
restore audio on Toradex Colibri board.

Cc: <stable@vger.kernel.org>
Fixes: cc8f70f56039 ("ASoC: tegra: Unify ASoC machine drivers")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 59 +++++++++++++++++++++++-----
 sound/soc/tegra/tegra_asoc_machine.h |  1 +
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 3cbe6ef1cf9f..d92fabff08bc 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -341,9 +341,34 @@ tegra_machine_parse_phandle(struct device *dev, const char *name)
 	return np;
 }
 
+static void tegra_machine_unregister_codec(void *pdev)
+{
+	platform_device_unregister(pdev);
+}
+
+static int tegra_machine_register_codec(struct device *dev, const char *name)
+{
+	struct platform_device *pdev;
+	int err;
+
+	if (!name)
+		return 0;
+
+	pdev = platform_device_register_simple(name, -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	err = devm_add_action_or_reset(dev, tegra_machine_unregister_codec,
+				       pdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int tegra_asoc_machine_probe(struct platform_device *pdev)
 {
-	struct device_node *np_codec, *np_i2s;
+	struct device_node *np_codec, *np_i2s, *np_ac97;
 	const struct tegra_asoc_data *asoc;
 	struct device *dev = &pdev->dev;
 	struct tegra_machine *machine;
@@ -404,17 +429,30 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	np_codec = tegra_machine_parse_phandle(dev, "nvidia,audio-codec");
-	if (IS_ERR(np_codec))
-		return PTR_ERR(np_codec);
+	if (asoc->set_ac97) {
+		err = tegra_machine_register_codec(dev, asoc->codec_dev_name);
+		if (err)
+			return err;
+
+		np_ac97 = tegra_machine_parse_phandle(dev, "nvidia,ac97-controller");
+		if (IS_ERR(np_ac97))
+			return PTR_ERR(np_ac97);
 
-	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
-	if (IS_ERR(np_i2s))
-		return PTR_ERR(np_i2s);
+		card->dai_link->cpus->of_node = np_ac97;
+		card->dai_link->platforms->of_node = np_ac97;
+	} else {
+		np_codec = tegra_machine_parse_phandle(dev, "nvidia,audio-codec");
+		if (IS_ERR(np_codec))
+			return PTR_ERR(np_codec);
 
-	card->dai_link->cpus->of_node = np_i2s;
-	card->dai_link->codecs->of_node = np_codec;
-	card->dai_link->platforms->of_node = np_i2s;
+		np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
+		if (IS_ERR(np_i2s))
+			return PTR_ERR(np_i2s);
+
+		card->dai_link->cpus->of_node = np_i2s;
+		card->dai_link->codecs->of_node = np_codec;
+		card->dai_link->platforms->of_node = np_i2s;
+	}
 
 	if (asoc->add_common_controls) {
 		card->controls = tegra_machine_controls;
@@ -589,6 +627,7 @@ static struct snd_soc_card snd_soc_tegra_wm9712 = {
 static const struct tegra_asoc_data tegra_wm9712_data = {
 	.card = &snd_soc_tegra_wm9712,
 	.add_common_dapm_widgets = true,
+	.codec_dev_name = "wm9712-codec",
 	.set_ac97 = true,
 };
 
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 8ee0ec814f67..d6a8d1320551 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -13,6 +13,7 @@ struct snd_soc_pcm_runtime;
 
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
+	const char *codec_dev_name;
 	struct snd_soc_card *card;
 	unsigned int mclk_id;
 	bool hp_jack_gpio_active_low;
-- 
2.33.1

