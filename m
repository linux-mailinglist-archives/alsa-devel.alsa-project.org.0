Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ECD47937B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CB528C4;
	Fri, 17 Dec 2021 19:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CB528C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764165;
	bh=iN0xVrOclKYtVrDjpwW4A3Omk5XZhrSNb6LNBJK/658=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvQvkPNA1sGjbuaaAsMtessh7PZuNbNE5HIBptKIh4+OiHHRw+4PRfes4/ARKErfE
	 O89VkbdF8KVXNElkcvbG7fj10rJEeW3kqeo1xHx/tBigq1TKHCHTRAPFfc3LaG1i5b
	 6ny3RGJ5wow+QanmXPtedXNqSwq12AWv2wwvkb6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B7BDF8053C;
	Fri, 17 Dec 2021 18:58:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D47EBF804F2; Fri, 17 Dec 2021 18:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF238F8047C
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF238F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U31Jz7S+"
Received: by mail-lf1-x135.google.com with SMTP id k37so6300362lfv.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIQlcF3gP50Ac2XyP/mWCT3TH1MR8AJE0l0k33C2rI4=;
 b=U31Jz7S+v6lmx5fTO+U88D6SrE37ODp+9q0365LAbGwqPixsRAWvweUHL1knkSgjxc
 dR9mrquyapfnZDQ8ZNd1f2W7h7y/ODKbkHmhIys72E0VX/dM1CUxUlU9QF26Rrk/UOqd
 0WLY4RHukrOaZ02RrMyfR0BrjoLiqbJFsectgqGMP0lpf5VTdIa6zWGG/U7jMQXDE6PK
 3YIKyAah8jH1PVDFwXVjtI+mWyciZ6Id16W7dqP3pkkkC5Wv3xSZ0WCWQcJPuzOXNzAy
 T8N1Q+IwsZK+1oNI0nnPfAEiboZsZT3ol230avvwaJzmPwmKJTWKxVvbHD2LtBxp7o6o
 BkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIQlcF3gP50Ac2XyP/mWCT3TH1MR8AJE0l0k33C2rI4=;
 b=HSzgB5+85c9hW/u45y1iyDJTwAQ5HZUNx3XUDoSo9vyMr36E0JvwkkTRYH/sk/DuKn
 mvApTtKZ+952ChjpsVPJq1Z0mqSAbvep56Paf1Hqm9MPFw/PfsQ9y7kwG63nZPs9fdJU
 j+fh0dJsMzI4TsEvgE0cpALrSajzjWsjKoWpl+W0BIBGu2f2orDdMFMlfPdOYdd/w9ih
 zRixwdTyPz8cSGzFxfAiRvWIc8cJ7of/UiYr8OiNfHN0ubZUJUpny7yjn0otmCcNZBrs
 Hi/Ut0Gqzx/gRgqXQeWN0kOAJAUjVUoEHci81FI0KVCorv5iojrwfoZj4Qf+kjb1k0NF
 tbiA==
X-Gm-Message-State: AOAM532/KCwHHJjCZIT7UegZT5qhXcHnQHd2op541mEImnurWik+Cy20
 SrVCNZ6y1u8kbeI0Ze6PVq4=
X-Google-Smtp-Source: ABdhPJyEg+R6x5sc59XnGJjYnjPKD7SF9ULXc8Ov81sZnNr6zNhkgoNGoFiA05i3KxASVuxbn4LMvw==
X-Received: by 2002:a05:6512:5c8:: with SMTP id
 o8mr2954480lfo.659.1639763891645; 
 Fri, 17 Dec 2021 09:58:11 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:11 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 11/11] ASoC: tegra20: i2s: Filter out unsupported rates
Date: Fri, 17 Dec 2021 20:56:06 +0300
Message-Id: <20211217175606.22645-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Acked-by: Thierry Reding <treding@nvidia.com>
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

