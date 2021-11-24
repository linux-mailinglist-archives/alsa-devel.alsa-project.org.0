Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395545CFD4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD59B17DC;
	Wed, 24 Nov 2021 23:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD59B17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791762;
	bh=YdMWroKNp4gtmpv9BTvYCm2Zi5Q+CG8GZ4Ztzlp1794=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hfCmw95VvWefpVjKBHs8Ux6QNPX4r82d3xb9Od9uEhoovsu4/J7Yk/rQ2/N/bDWr6
	 F8EAIiKoqTNjpXlDVgCvrTk3nzttr8TIVM1xpkdY0gDEIxbXlWysb4f+5MGPadbxlk
	 i+MPe/ovzKfl9B2ua5cxrjHw/cmSfnPL/xQZeaco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E04A2F80517;
	Wed, 24 Nov 2021 23:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 199CCF804F3; Wed, 24 Nov 2021 23:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57F28F804AD
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F28F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YRhMLDyY"
Received: by mail-lf1-x135.google.com with SMTP id c32so10998470lfv.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNvT/R4t+rzbZzB5aB94PXkUOPrierROlgYm0m2uVuc=;
 b=YRhMLDyY4rZ43/0hssaw5SpluNtAnn3C+1u1ZitobNEI8ekjIPlNOt0YtPtGYhXi8T
 SWNpQuFh8XLycEFM/l+9ef9bujp+WhboWeYtk5MewdKyPRD9a41pgCmzi6idQqbLn9u6
 mm9lMyJC6Kz6uZ+evHrorQTkAYMxxC826GsyIWRyOzss4Vb/+UrDbLaaWPRCASKSK9DV
 iedD/9N8poWKTI2D2y9posABZzxscfb0O/MbZyVGH5ZySNGcnYJ7qr/TLn+47bSOIg9k
 IMXDCC3mg1jePjbdFMNCHAWvQbbBtDNUk46Yk+x1FYMWpi1CBoJK2gVcIQDP9VCqgyqf
 jjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNvT/R4t+rzbZzB5aB94PXkUOPrierROlgYm0m2uVuc=;
 b=QaxdBVsaJEzoT3ZuxZJQrPlm7bjGxXseQYn2qOZFQ0S1VlsQ2wt+MIkIOh6EXhQGYT
 OholC9nijmkP54ab7nhlTQ271bK5L14nQV+VD+0YSkqZSTbWfpQmz3SB93C0Ly2Hnp9l
 Wcexy/M9mqxzgnJHUmRw4wtKQHNRdBF72cqfBdvjx2n3l78E5Q9ifdXIjG5zW72Cswpu
 gAibJXs6HBXNp9EbGyAo/j6YEzb+57PyJPiqb1pNKItLG9AOSOYvU3THnMPai6oATzTA
 fejom8C3RqF2jbvTE0wZTLofXk0UJ2jrAh97dGQPZPnqT/5tpqiHO2Z0rTEHj8T3e72e
 swCg==
X-Gm-Message-State: AOAM533Vd5uy9Ip3H3LKeowBc7Dpg+vt5ELAcamveRJZy7uz/uQmDw00
 GAbI+8YOGsC9Gf629PWsYeA=
X-Google-Smtp-Source: ABdhPJzOsDeVvxud++jQTrtONEupHnOumkD3Q77alNsX1DaeJIUOusKyNA09/6r6jtJiI3+HAIYHxQ==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr19043798lfq.254.1637791600702; 
 Wed, 24 Nov 2021 14:06:40 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 12/20] ASoC: tegra20: spdif: Filter out unsupported rates
Date: Thu, 25 Nov 2021 01:00:49 +0300
Message-Id: <20211124220057.15763-13-digetx@gmail.com>
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

SPDIF and other SoC components share audio PLL on Tegra, thus only one
component may set the desired base clock rate. This creates problem for
HDMI audio because it uses SPDIF and audio may not work if SPDIF's clock
doesn't exactly match standard audio rate since some receivers may reject
audio in that case. Filter out audio rates which SPDIF output can't
support, assuming that other components won't change rate at runtime.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 89f7fc5c8aad..f3e3c6df232b 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -79,6 +79,7 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 	unsigned int mask = 0, val = 0;
 	int ret, spdifclock;
+	long rate;
 
 	mask |= TEGRA20_SPDIF_CTRL_PACK |
 		TEGRA20_SPDIF_CTRL_BIT_MODE_MASK;
@@ -133,6 +134,12 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	rate = clk_get_rate(spdif->clk_spdif_out);
+	if (rate != spdifclock)
+		dev_warn(dai->dev,
+			 "SPDIF clock rate %d doesn't match requested rate %lu\n",
+			 spdifclock, rate);
+
 	return 0;
 }
 
@@ -172,6 +179,59 @@ static int tegra20_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int tegra20_spdif_filter_rates(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *r = hw_param_interval(params, rule->var);
+	struct snd_soc_dai *dai = rule->private;
+	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
+	struct clk *parent = clk_get_parent(spdif->clk_spdif_out);
+	const unsigned int rates[] = { 32000, 44100, 48000 };
+	long i, parent_rate, valid_rates = 0;
+
+	parent_rate = clk_get_rate(parent);
+	if (parent_rate <= 0) {
+		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
+			parent_rate);
+		return parent_rate ?: -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(rates); i++) {
+		if (parent_rate % (rates[i] * 128) == 0)
+			valid_rates |= BIT(i);
+	}
+
+	/*
+	 * At least one rate must be valid, otherwise the parent clock isn't
+	 * audio PLL. Nothing should be filtered in this case.
+	 */
+	if (!valid_rates)
+		valid_rates = BIT(ARRAY_SIZE(rates)) - 1;
+
+	return snd_interval_list(r, ARRAY_SIZE(rates), rates, valid_rates);
+}
+
+static int tegra20_spdif_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	if (!device_property_read_bool(dai->dev, "nvidia,fixed-parent-rate"))
+		return 0;
+
+	/*
+	 * SPDIF and I2S share audio PLL. HDMI takes audio packets from SPDIF
+	 * and audio may not work on some TVs if clock rate isn't precise.
+	 *
+	 * PLL rate is controlled by I2S side. Filter out audio rates that
+	 * don't match PLL rate at the start of stream to allow both SPDIF
+	 * and I2S work simultaneously, assuming that PLL rate won't be
+	 * changed later on.
+	 */
+	return snd_pcm_hw_rule_add(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   tegra20_spdif_filter_rates, dai,
+				   SNDRV_PCM_HW_PARAM_RATE, -1);
+}
+
 static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
@@ -185,6 +245,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
 	.hw_params = tegra20_spdif_hw_params,
 	.trigger = tegra20_spdif_trigger,
+	.startup = tegra20_spdif_startup,
 };
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
-- 
2.33.1

