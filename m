Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E4B39467E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 19:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB5016F1;
	Fri, 28 May 2021 19:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB5016F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622223130;
	bh=hLo9q4imkSnJB1p2Lz97cku/y12aBVj/f8qqfmv8lpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjPAacu2ddSacFdCu/cnukjUIy1z1MYSjxzVDuoQwXCZAXrnQOiJ51AfxgZuxLgYD
	 rGL87MheyuLrP3Svop29D8oz4zmqmrfqrO4Xs+bp9BQT2H/13Vovb3dM+kb58Hj+39
	 HbcMYUlZvDPAuPmYwrjsVyC1oExtYh988fdl65GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60821F804CF;
	Fri, 28 May 2021 19:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A2F9F804CC; Fri, 28 May 2021 19:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DEB9F804AB
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 19:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DEB9F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kKvUfGUy"
Received: by mail-lf1-x12d.google.com with SMTP id b18so2299647lfv.11
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PTBqF9bUZ29TAyNJcHkJi9b+wJ01dNiOO2rZosrHKI=;
 b=kKvUfGUyQj0Y4a45HhX/bwTlRBscj+LDu+wz1Fmq0n3JPyzgqSEEURNXBi9KJcgdO/
 9b+fg7cgjIbxjBeTGwiKUZc7yyAQ0Pyffi8asb7iL865qCnQZPJdDX2j3s0RzluaPSn8
 ovUTVxZzYxQaV+ZHp3rkuIEEhvfH6Lve2sNw3aP91TywP4yjYAKpiaENY8lS742/gFXG
 s0xpWsZH7v30/VJbNuRRJ1D/KxJGZNGVHK6a3Su1k8aW871P/XWWzy6JQYJkmiexY54t
 ygBfEBn00KBQSRQTQCSgNK2RS+7ORRz0ceYmnM61Q2Tq11Vj/0vP9ylXcAFB67kDJaTU
 K1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PTBqF9bUZ29TAyNJcHkJi9b+wJ01dNiOO2rZosrHKI=;
 b=UMZQeqCc6pCtRzwIrYha652Ef8pwUWpgFXkGoDICAe8w4bMAcXVzEHS/bung1JM2OM
 Zm55qu6IdZ1Vppj6dMZenRNfypHzMSTKt1E8YRAKZ8YOEu+SuuZIgjuasBMesDgmvC37
 /R3YWcEcOzQcHlbe1lc9kXy+avkjtv3HyVF3G5uSSbQjJ7v9/swvBR1NXj+53pymcg+T
 nYd6Z2Ii8GRD8tsLp5uIQDPvgC/4hjhvd/Nvr+bB3u44rGOecSauXi3eyohlaImZj4bz
 EpYtTlGieZloq59MaHdFGuZg9hr//KBnIlEMQGbHscvRgLYYmU4YQf4f17hAr2/onGWT
 oLLg==
X-Gm-Message-State: AOAM531vtzmRRlgnBY4A8iB51zZ5kaL26FJwUcXvlK732Pc9ijN3qbOR
 1xezCbryrfnyC5CX+LCR/bo=
X-Google-Smtp-Source: ABdhPJxAxDmXB0O4YfFV8hLXuAN1wCO7q1ZbyRUb+4zd9T2gUi96a9lMRwkqBDY6/ITi6id59rXuJA==
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr4392360lfr.619.1622222966034; 
 Fri, 28 May 2021 10:29:26 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru.
 [46.138.12.55])
 by smtp.gmail.com with ESMTPSA id x207sm518282lff.234.2021.05.28.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:29:25 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 3/3] ASoC: tegra: Specify components string for each card
Date: Fri, 28 May 2021 20:28:33 +0300
Message-Id: <20210528172833.21622-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528172833.21622-1-digetx@gmail.com>
References: <20210528172833.21622-1-digetx@gmail.com>
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

Acked-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 7 +++++++
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index b1fdd33cab17..33b5bb785da5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -406,6 +406,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -438,6 +439,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -499,6 +501,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -541,6 +544,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -588,6 +592,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -621,6 +626,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -653,6 +659,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 74101d2c7785..5751fb398c1a 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -129,6 +129,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
+	.components = "codec:wm8903",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
-- 
2.30.2

