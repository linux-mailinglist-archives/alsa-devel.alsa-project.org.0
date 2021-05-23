Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1338DE2A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 01:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB5C416A9;
	Mon, 24 May 2021 01:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB5C416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621813697;
	bh=yQKHwEJzaLz0gmkUlvWUy4i9UmuBoOzkMP8NDDj12zI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INf4qviMsL2MNHtnOeJWuZ4jtKsU0+PNcgHaHw/zgGesMwhubby5MNOYh53smldvh
	 4gVXcBqATYdb8X7rmutZqKDGL45Yp9a39FUTx975J0P7h9WRMWxwCHy1FlLS70kCO9
	 X+d7CPq3bAq+Gpvu93rePxHlnXxyhdPJv98SW7dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56573F804BD;
	Mon, 24 May 2021 01:46:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D90F804BD; Mon, 24 May 2021 01:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 357B4F8016D
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 01:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357B4F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IJA0RuH/"
Received: by mail-lj1-x22a.google.com with SMTP id f12so31212688ljp.2
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lnkbAwGfOTfE0faI+z2uEvnE5UMJQap5u4jnvd3/0c=;
 b=IJA0RuH/sxS2Z+PU8lnm6gg+AWa/osTuuDRLJBja5ZoFA/Rc0S+ZwBtUg3qXdDpVBr
 5p+HtqqpAvYYWbfD6yEZ2HkFsXyGeAFoM3Wl9wiEFPDWsU6bTX6rmRy/swrN9QMYao+W
 C8BpL+mkpawvSfh9Phg6zRVSs7ksdmWh7fXp1dpgfKGbWU14aXvvxbkVBMCmgqj2gafh
 RMzK0def2t0xL+uiy1NFRU5l3USxqw60mG8iasWkM6z4nwwKuUfoynXDTec6T9vh6gun
 gLMPVmOgMmio00vgbLkh3Nx0ku2iEjnkmi88G7KwNyp/kGhkUQw+WSljXtD7ZJMhu75u
 U0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lnkbAwGfOTfE0faI+z2uEvnE5UMJQap5u4jnvd3/0c=;
 b=L6ZDTqwp5z6R+iOVFHDeEFXixj6SVxApTfRI5RKU5aTOIX7BVsFs/BZkoaQlJB3Yep
 UATiwHSeCmG5qIxiDGm5MnI4PpXcqZWeO+xFoVUCEyNf/Q4S/UHk+k0GmwcEZa6E8mH4
 F3zCDZ/IELTVj7CyV2Cgfz4IevkOlVq04G2jCgZwVj6OUGZobEiJjnwjEOqUbmRQKgjd
 x5lyctOinVpvd5U7mvpd/Seji8pk5eKHVl5KXtY/BSj+RE+6Ao/Oc4NXPsRyu1Cik14u
 OC6C+GHFAGLKNnRpMpjigV6SaeSb/pqpuVM4JDOzcyTk7lUxjVVJBmdyd/SrzqToMmW7
 EFTA==
X-Gm-Message-State: AOAM533QRB1aYPV9Fwaos7JRI0IcJTIhg3CRNzYDlV8sx3JBN2tocu6/
 3jogBwVc9rVdNXacGcRFs1k=
X-Google-Smtp-Source: ABdhPJzkNA0BZJDWAFB/SC7LMu5UUqSITysCieeLViToB3wz26EiSa2n/a1EqfTgwH9wnsir3JLQbw==
X-Received: by 2002:a2e:9cc:: with SMTP id 195mr14750317ljj.291.1621813502210; 
 Sun, 23 May 2021 16:45:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:45:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
Date: Mon, 24 May 2021 02:44:37 +0300
Message-Id: <20210523234437.25077-5-digetx@gmail.com>
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

Specify components string for Nexus 7 using the Intel BayTrail components
format. This may allow us to create a more generic UCM for RT5640 codec.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a81f2ebfc00c..87e0a47040a5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
 	.add_hp_jack = true,
 };
 
+/*
+ * Speaker: Connected to SPO L/R P/N pins, stereo.
+ * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
+ * Headphones: Connected to HPOL/R pins.
+ * Headset Microphone: Unconnected.
+ *
+ * IF2_DAC/ADC are unpopulated.
+ */
+static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
+	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5640,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_hp_jack = true,
+};
+
 /* RT5632 machine */
 
 SND_SOC_DAILINK_DEFS(rt5632_hifi,
@@ -712,6 +730,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
 	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
 	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
+	{ .compatible = "nvidia,tegra-audio-rt5640-grouper", .data = &tegra_rt5640_grouper_data },
 	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
 	{},
 };
-- 
2.30.2

