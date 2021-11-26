Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51545F1D7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D941ACC;
	Fri, 26 Nov 2021 17:25:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D941ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943996;
	bh=wkxRzk0gGHhRxdg0s/E7ZJ8SSDX3ZdsAvqG+8g09ymU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TSmKhyIXnYWdJaFITpdM7j3cd7ai9x4pLbHPYxfH28FR2aDN/b6cNcWQqknhgiptK
	 bxXDsIoF0QpBUYWv4uxAxYJHZnLUvfGgVS9Vy3PQQGvbZEOifelraYLTl2haqnCHgV
	 ywBDa37zzFyNkAH/NclviebfcfXv7fFhi8yyZNV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C18F80567;
	Fri, 26 Nov 2021 17:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A4FF80518; Fri, 26 Nov 2021 17:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F85F804FF
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F85F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TJnwJBrv"
Received: by mail-lf1-x134.google.com with SMTP id n12so25550317lfe.1
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C6zkQtDZQENoW1Sivb5bfco/O//qUuyceF3hyVGGf7c=;
 b=TJnwJBrvNJkT1a6gaTqkuKSMg/trzJTt+KT0MRm3CDHp+iTU1GPUYU9T2WekDGOWzr
 1147WeSkCkbe/ztrnLz9JmpByGJW1VVpLeKOgwlFEjMS4+qUTOJrHwS4QDUzlxmpNpJc
 UuFYiMsF00Db2/JLMcoPe3eqvib5N7r9d9zoCGXfIx20gWJ+dG1tmyGYv7WpMqTtfv4q
 XUcFIsJ+Ax0/U30r6hfkAViqXzvCyytLNB8hPCE1Yz2kumH9rKmzHcx/Q+cGokUSKFEO
 bcdV9LxfZVce0X34M/dfLhwU3rzxnN2QOUEFYiNW8gnVzIv6McjfJyW/HkBJuHg0IzqV
 Yi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C6zkQtDZQENoW1Sivb5bfco/O//qUuyceF3hyVGGf7c=;
 b=NNRyAVyFfA+y0tb3mjkYrNIbfHBpzHrdstsXdfmVoEPxB00LFwYwKutczCN3V7jmp1
 wLnGN40EUQ+ZRm/jINOzOK2qguWO3s68OsmT4z4yxL/XFi+Gc+lKAld32EhsqIawKNo8
 zvPamdtqHXDgieDGC+PZFrEUT/Nh1D+mGrxiOmcx26EPjoYbdGHPGuUGCh94Z8gwI79Y
 /47xdC00RB34BQVtFLG4qq41j1QIxwNJDuUHRAhwwgLKZwpkZFwi9r/SV9VdXGpdRH62
 pdKM/ooDDYC6NQ6rGz0acslM0z/zMycaZRLeMO0HQJVf9esPruK0/q6tRC+u51/68y3g
 SnUQ==
X-Gm-Message-State: AOAM530LW3XgMMVdS1gtz+/Rwgf4AbdFAUzEuvV6W5dPhpnHIfM6rQ/h
 90sodDjnNKWnIJFWOuaLxas=
X-Google-Smtp-Source: ABdhPJwT1QIqpn6SrUIqAx9QKx1rgWGepcJAaepjwG8YbY5Cgfk2W3egIqISDds2VGCoj1Ig2/wwFg==
X-Received: by 2002:ac2:58d9:: with SMTP id u25mr32199346lfo.514.1637943591668; 
 Fri, 26 Nov 2021 08:19:51 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 12/20] ASoC: tegra20: spdif: Filter out unsupported rates
Date: Fri, 26 Nov 2021 19:17:59 +0300
Message-Id: <20211126161807.15776-13-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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
index 89f7fc5c8aad..52be59c58126 100644
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
+		dev_warn_once(dai->dev,
+			      "SPDIF clock rate %d doesn't match requested rate %lu\n",
+			      spdifclock, rate);
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

