Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90C394D09
	for <lists+alsa-devel@lfdr.de>; Sat, 29 May 2021 17:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4459316EE;
	Sat, 29 May 2021 17:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4459316EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622303421;
	bh=1Ao+ei/ct3HyZfi3AGr3yIJ/vrpFkK+E4Qd0w9mlOrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mH+Ei/DgUGhonbYX9Waco+JrIoZIl4us2CnJII1vxahcHfWjmTYzMKPCC8//4pigU
	 QayCXa2Y4c0pQS1ZjkeA9P51FmeCBnr6bMwkW+rt/4C8Torf2EFtkTa6DaJi+AKBf5
	 Q+Q8hCC/hNUlNxL7aD0FoDxEI2ylH2l7RWsVQmUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F2E1F804DA;
	Sat, 29 May 2021 17:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26B0BF804DA; Sat, 29 May 2021 17:48:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF067F8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 17:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF067F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UcO71gX0"
Received: by mail-lf1-x12b.google.com with SMTP id q1so9888774lfo.3
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2iUcTqe2R2Sbv5vYWTS2UijlDb+a9ygeGihNURh4Cg=;
 b=UcO71gX0qrG7TirsQESyzzd4kfv7uI1nIe6d6Hlb6ZPNofFQOQE2ltyr6HJpRXopyF
 AQJSFB368vAxyhBnGzbvLiXdRQbQckG8kZIcJ6V4VZGFX/C4B62Cj5RCPKHYEoGDRBk4
 MQB7NMInoyxVrbQ/QjwIBESNOOZdm1MsH6EES9v6mCYabCepX7aZQGPxe3KlezyMuOU2
 gAUvU0GDZ6cGalDjUNwmq8f97WGx09rK/iI0FaG4fD150NhqLzNS63uUqBux6+wCCqY5
 TbSxOinnxboK+ilSmdHqhs+X9K9/HWvUqluxv3zFlkd4Gtzn48K+Y1CMqbr248o7+Fvb
 /PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2iUcTqe2R2Sbv5vYWTS2UijlDb+a9ygeGihNURh4Cg=;
 b=eMYfYiyv3YA3hXn6pldMLqf6AxkK5OtLhGHabM2Wd/uNzJPnnfNuhArw7doe85qVEW
 FmqY6eIk0JBWwVlSNBbctgjHPQC3WyqWWmIQC/5+PPlO0jKD9D4pG+L2CPJo63KT1iox
 hkrk4eNY22WtM2Yo1NkBOcXFgwbeBGPnJCM1BIKysrQ5PCamFsV1GEJoeMhmC7kM/pDU
 adzT7Wi6e5zGTrlt7aQ1U/czt7tCfNMldImtiWRO/RcFmbl9bHwgT6KLTjm7tQj9ASfZ
 8kBGjYlnRzv+Ja+904if8puLE0D89WOh+ZAek5fjOPp7VI68NIIlFQeOxe9L6VhdC9MI
 d8Ww==
X-Gm-Message-State: AOAM5334/qdihpY8qkcW4N1BmysIQjnBBWH+PKQJuY//CkePEgSNy+Rh
 WD584vMP9eQPjgeZIu3nxKw=
X-Google-Smtp-Source: ABdhPJwBdY5IFjd6EWyKbO9bMfvDkr5gIBgUdSAkD0C8yx+E6VWo3GwlPn2PKw9ocP2f2e4begJXGQ==
X-Received: by 2002:a05:6512:3045:: with SMTP id
 b5mr9038966lfb.273.1622303225746; 
 Sat, 29 May 2021 08:47:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-84-89.dynamic.spd-mgts.ru.
 [46.138.84.89])
 by smtp.gmail.com with ESMTPSA id y24sm764005lfg.232.2021.05.29.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:47:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 3/4] ASoC: tegra: Specify components string for each card
Date: Sat, 29 May 2021 18:46:48 +0300
Message-Id: <20210529154649.25936-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
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
index f052ad2a1f38..31ab7123945b 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -412,6 +412,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -444,6 +445,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -506,6 +508,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -548,6 +551,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -595,6 +599,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -628,6 +633,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -660,6 +666,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
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

