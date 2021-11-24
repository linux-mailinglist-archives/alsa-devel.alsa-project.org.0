Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C945CFD7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:10:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2381811;
	Wed, 24 Nov 2021 23:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2381811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791823;
	bh=J9f/dCqvxzNLtC4ITMqx0G40QPSZDaHRk+DovXcnCqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4SLIx9lBjdCL1KioZ2WlwVKzYh95uj/WfdiAqFe+LtQTxtvX01uGzrb3n1txob1m
	 lyzKpDxAsGLik4mcr69EuxFVk+DXT/aQG1T/arzpWemUba8Tvo54L9Q3PoFGDdY2VO
	 R0p7MS2cGF1z3rJYkkfUJoYX0YLZ++wrG+mfQdnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB93F8051F;
	Wed, 24 Nov 2021 23:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CDBF80508; Wed, 24 Nov 2021 23:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B64D0F804F1
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64D0F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N9Baz8q2"
Received: by mail-lj1-x22f.google.com with SMTP id z8so8368503ljz.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhBo+jV3YB73Mp9ZeA7lb5QO9nWQOxbQBa92iKZ/6e0=;
 b=N9Baz8q2DqK27TaB2J4mb/JnUajtBPszltKTVyNhFOKW4qUEHVuQ0aRiaiVxmNyTEo
 L4FxWxCU2pI4kpV/VNf0mSD694Cn1AzeBVA3LOphq1w2C2agzGMEcUTwiPeXdLYjmmig
 QffN2CjSp/YliPk54uaBQU3zUdq7DmSAynmNVxIkc4eq9fPl7MXU7VETJ/kw+MHmNImi
 JuCtuerWMdPfI2mBcsT+rfH93KyVMe6g7pd7mJfZo2UCuM8e7Y04Lgil5r9WaHLTCWPt
 OHIQ+XwxRcslvurW6k0OAR7WiqcVRwl+49fhuD2oUywl3AJhudG1lNID/ckEXC32C+tk
 eAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KhBo+jV3YB73Mp9ZeA7lb5QO9nWQOxbQBa92iKZ/6e0=;
 b=ZFFMri95Kn+a1A2maPbic+ZHglrXU5wuTs+mlZvw2/S3HJwyNqeiUdNx7fHAcm0q2t
 quW9mQXiKgGD8FCmI/wE8XCagFXucoKmt09zDvWhRg+/ScXT/NhYkzhtvZVmF+EvU95R
 qUpUuI/dxZhWcaH1svzwIyQUlUGFnsPdVWxtFeiFypf3b2VEYLsuP1yjunrPZAj6cEkt
 IJATxFZVy4Qd3fhAKdq4Um6AfTzxdqJHv+5HEjZbKZ2fmgeFUU7jb7f89vjBD+OZzp9c
 BTPbKY6qc7oh4BrLToTX6FRC3GaWs0IMmBgHS1GN3BCNlr2ZmcR/n3CljEFDiVQIe1VL
 s2og==
X-Gm-Message-State: AOAM532V5UUmcCdQKQrJT/n6vMIR8ojSFW76L73JmHKMrcyqLKWeyG8r
 Z+j93OYFuuebk2QFKFDJ/lE=
X-Google-Smtp-Source: ABdhPJyCpgiEOJzd9mFn07Zj9pNHsOCa3BIY+8+AFhiTIqkj8hp+qu3U+J6IMuHBPzJV5rd0mGdP2g==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr19413448ljm.2.1637791601451; 
 Wed, 24 Nov 2021 14:06:41 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 13/20] ASoC: tegra20: i2s: Filter out unsupported rates
Date: Thu, 25 Nov 2021 01:00:50 +0300
Message-Id: <20211124220057.15763-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Support new nvidia,fixed-parent-rate device-tree property which instructs
I2S that board wants parent clock rate to stay at a fixed rate. This allows
to play audio over S/PDIF and I2S simultaneously. The root of the problem
is that audio components on Tegra share the same audio PLL, and thus, only
a subset of rates can be supported if we want to play audio simultaneously.
Filter out audio rates that don't match parent clock rate if device-tree
has the nvidia,fixed-parent-rate property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 266d2cab9f49..27365a877e47 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -262,10 +262,59 @@ static int tegra20_i2s_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const unsigned int tegra20_i2s_rates[] = {
+	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000
+};
+
+static int tegra20_i2s_filter_rates(struct snd_pcm_hw_params *params,
+				    struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *r = hw_param_interval(params, rule->var);
+	struct snd_soc_dai *dai = rule->private;
+	struct tegra20_i2s *i2s = dev_get_drvdata(dai->dev);
+	struct clk *parent = clk_get_parent(i2s->clk_i2s);
+	long i, parent_rate, valid_rates = 0;
+
+	parent_rate = clk_get_rate(parent);
+	if (parent_rate <= 0) {
+		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
+			parent_rate);
+		return parent_rate ?: -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra20_i2s_rates); i++) {
+		if (parent_rate % (tegra20_i2s_rates[i] * 128) == 0)
+			valid_rates |= BIT(i);
+	}
+
+	/*
+	 * At least one rate must be valid, otherwise the parent clock isn't
+	 * audio PLL. Nothing should be filtered in this case.
+	 */
+	if (!valid_rates)
+		valid_rates = BIT(ARRAY_SIZE(tegra20_i2s_rates)) - 1;
+
+	return snd_interval_list(r, ARRAY_SIZE(tegra20_i2s_rates),
+				 tegra20_i2s_rates, valid_rates);
+}
+
+static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	if (!device_property_read_bool(dai->dev, "nvidia,fixed-parent-rate"))
+		return 0;
+
+	return snd_pcm_hw_rule_add(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   tegra20_i2s_filter_rates, dai,
+				   SNDRV_PCM_HW_PARAM_RATE, -1);
+}
+
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
+	.startup	= tegra20_i2s_startup,
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
-- 
2.33.1

