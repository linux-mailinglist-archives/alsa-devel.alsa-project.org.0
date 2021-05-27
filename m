Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E03935BC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 20:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05C41700;
	Thu, 27 May 2021 20:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05C41700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622141874;
	bh=cl/SJBth1ic3frTbJj7erHJkTi9JMOGwdRw9Ix6Cy+o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zd+qjLo11B1qozCoRoBYAfOHEXmZskBVjijlIUJJEHWgFtsEwQYymCDyu8GGNd16A
	 azySyC3knrHWWbtd6yiK+fyPyWr2IDX2yMTuq8NCs3ZIihKC3QHTz9++0BGH7sT/2n
	 /aDyK/6QcJoNC+96Wul8/BPZtvgyuB/Vj8c09cv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 861E0F804AD;
	Thu, 27 May 2021 20:55:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D7EFF804AC; Thu, 27 May 2021 20:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26463F8025C
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 20:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26463F8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="u0JaQadS"
Received: by mail-lj1-x235.google.com with SMTP id p20so2166393ljj.8
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5c4GgBUi169adG89RpxfCaKSFuH1lGlp/e1vdo4dVbQ=;
 b=u0JaQadS2KD5i6ubeKLAsCOGL83jVab5h8Wentq/DU5SSnd/DCToBNeKxO2TZ+ENW2
 ZCbMezKpZ0j57pq+asjqtBELvUA1Jfxcu7mcJLggq21uYBe7RI0jf1+uUagzkfL+Zld1
 WZwWx2NwkP3QVoeQTKyLWjoCycspYbyPGdFtAcWS34eyDp50T+8CwMjCvPb7VX2MxGSk
 kZORXX002No7/tCBU0Gug585UHLc5Fj0tVgV5LHvcqFfO7oYA4CZUpB/wBP5amgNF5yY
 LEylcnWm4PeELy3maZR9Qb4A9tbBiWVX/1KCi/qof3BlH/P4EpLWGU6/ZeKa76xKlbSY
 gruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5c4GgBUi169adG89RpxfCaKSFuH1lGlp/e1vdo4dVbQ=;
 b=jkaou6c86O8lkr0dsXbTddwUgY4r2cy/xK6EVTAJ+/DY6l0EZEN0xUAiy+VNpCip8F
 Get3wmFwQ6OkK9LA1APG/sMRFkcmwpo9jSmYnUWV6hcop/r9oX/OqzvdHwQYVF+ouGdh
 Q4j33APXRxqT4iPYbii6YW5Bk97aU1XuCT89lf9hU4XoTkkY7URQN84Z4zCP+bpG0FOK
 uQudMan/NcpemPV/U6lhE+PpOtwvL8+LF33bI437fwD+uw/Or00QKdaaHxmCxFq0Yqm0
 E3c+yQ/3utd1QVs5Ai/R7Jd3RI4stgTnNDrFmucMgysi4TBN5PYfX8R3XqvYnU2RvKmD
 77iA==
X-Gm-Message-State: AOAM530+iTw6AQ6M4GBRjZnmQEAoO7HvQogfBINalaIIYlMRUjAZc8cp
 G56QiiK1hGdwufvuZmpsQk4=
X-Google-Smtp-Source: ABdhPJwqx1V1zw3mAosyyfQCWAC76ShrYIYJ55r8O8XoxOe2e0RtwuHu+njMQhip7guhaLP6z4YBHg==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr3611730ljk.107.1622141732103; 
 Thu, 27 May 2021 11:55:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru.
 [46.138.12.55])
 by smtp.gmail.com with ESMTPSA id p16sm265217lfc.113.2021.05.27.11.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 11:55:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 3/3] ASoC: tegra: Specify components string for each card
Date: Thu, 27 May 2021 21:51:25 +0300
Message-Id: <20210527185125.18720-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527185125.18720-1-digetx@gmail.com>
References: <20210527185125.18720-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra_asoc_machine.c | 9 +++++++++
 sound/soc/tegra/tegra_asoc_machine.h | 1 +
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a28ee0d60992..1af70b0873ad 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -371,6 +371,8 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
+	if (asoc->components)
+		card->components = asoc->components;
 
 	if (!card->owner)
 		card->owner = THIS_MODULE;
@@ -406,6 +408,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -438,6 +441,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -499,6 +503,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -541,6 +546,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -588,6 +594,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -621,6 +628,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -653,6 +661,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index c60ac6c393a3..3b337baf132d 100644
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

