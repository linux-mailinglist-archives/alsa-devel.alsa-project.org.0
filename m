Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08D38DE25
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 01:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB621699;
	Mon, 24 May 2021 01:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB621699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621813646;
	bh=JrnYCZL0eEryRCaOYHbj17ORxK3gCCBNOm28PhsUG+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rp5h1VdyGqcegd1QMYTpaWhpBADMuEbiUrJCibisIbDdGtFTeFTfgj+aS7fm3mzxZ
	 6NwLfpnD5mu+N7YvAmJOQx7hHwCgdxQLLq9xbQstziphcNFjRH6tpiYtolTsRmlw3t
	 l3UU0que/D3Sk8TfpD6OiedFxypT+od09EQYX0Z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D53F800DF;
	Mon, 24 May 2021 01:45:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A00F80425; Mon, 24 May 2021 01:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACB74F801F5
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 01:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB74F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AogWYbp2"
Received: by mail-lf1-x130.google.com with SMTP id a2so38026352lfc.9
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 16:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/YzaFVHHjWNgRf6nbKhMfyavNiyvMnhUpV/Qwaqx/s=;
 b=AogWYbp2571hXKwtIuF4bCZiBf3P0LLL8n/tk5gItLQkDYA1OMnqjybNK/f/UA/XmM
 V8BPFNu6wC6r545xqZ42lVU+1Ch7Y+AkeOterZrhXk053Xg0hHQzULJO5W5skYhJYGh9
 iEczqLo0ZyyGOw1V5QLoUUeTvNuVLM7h/vcUjbiW7VxAbPkfsfzGuJtAjryX+uYkZ8gS
 wShFf5vu/DzsxLazK2HF3y/hdEVKyh7UW51exsl30jDxghWfLAszc72H7lVxr6Bdolpx
 r2VwGo+mfehQmr01jWrffSV5ush0yDsZIi8V1fAs2ymDllggPFXozNua+VxcxEbCH6tf
 hmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/YzaFVHHjWNgRf6nbKhMfyavNiyvMnhUpV/Qwaqx/s=;
 b=BQtiStQClCMMXF//4WOFzOFL4Qwdx6whihx9deQRKJrekkWUJ1S5ItJXmNZX0+ivVG
 YPz9mFdHgHmP9hce/qsVsoE18PzlwSagsqc1GnnFpIWE+g6fsKI3w7dKd8140ljcu2zE
 c1brCBpUk8pR5ZDabkm26asVVTpxKHoqvEbtgpQOOlMCy1lB9T+EGB8rPKv1J/y9ufD5
 RNobBjRzbUnXqRm5Fbspl6nNzJsIk160hqV2AZssbUcB+Y9Wp2b7J0q+gyXIglBgSjlQ
 lO9mNHEqh6C+IJQeMzVikUL3WqRCfZQmL7ayRhZG5obrsI/jmnXrVchTllw45heq3AQe
 /3RQ==
X-Gm-Message-State: AOAM532Zx6z4Ni8sA9dXb49gWjG10lPnaGcBDZaxSkebPsf1i4EW4MVs
 iwVUMdiX4eCBLrUrA0kIY2o=
X-Google-Smtp-Source: ABdhPJwYX7c2QidUiFvbyA6SfWUONiARQmi6QnR3vrM84BTIdW1DjUk+HWswv9Nf11lrcyqtTGrP6g==
X-Received: by 2002:a05:6512:3f28:: with SMTP id
 y40mr8881209lfa.136.1621813501584; 
 Sun, 23 May 2021 16:45:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:45:01 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 3/4] ASoC: tegra: Specify components string for each card
Date: Mon, 24 May 2021 02:44:36 +0300
Message-Id: <20210523234437.25077-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523234437.25077-1-digetx@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
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

Specify components string for each card of each supported device. It's
a free form string that describes audio hardware configuration. This
information is useful for ALSA UCM rules. It allows to generalize UCM
rules, potentially removing a need to add new UCM rule for each device.

This patch also adds asoc->components hook that allows to specify
components description per device.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 9 +++++++++
 sound/soc/tegra/tegra_asoc_machine.h | 1 +
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 17579decceda..a81f2ebfc00c 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -399,6 +399,8 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
+	if (asoc->components)
+		card->components = asoc->components;
 
 	if (!card->owner)
 		card->owner = THIS_MODULE;
@@ -434,6 +436,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -466,6 +469,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -527,6 +531,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -569,6 +574,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -616,6 +622,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -649,6 +656,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -681,6 +689,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 080c1a26073a..fa325bfb2c8a 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -15,6 +15,7 @@ struct snd_soc_pcm_runtime;
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
 	struct snd_soc_card *card;
+	const char *components;
 	unsigned int mclk_id;
 	bool hp_jack_gpio_active_low;
 	bool add_common_dapm_widgets;
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index a3ec1f50bcb8..3f4f582fb02f 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -108,6 +108,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
+	.components = "codec:wm8903",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
-- 
2.30.2

