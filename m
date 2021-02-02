Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037F30C48B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 011BF1741;
	Tue,  2 Feb 2021 16:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 011BF1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612281353;
	bh=fegbAmw041iB+rO2G69HAwmChrQ28RafrmIBAYGzBdo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glHVCiJc3qnwid6ATODNoY0PBwbK/f9ZbgXy7Glx2yx0kXN2I65QUEZaAzZqGE55f
	 1uYGCXO7pXgta3tipMMXOdKmZnfMQMuAr+JZMjJlThmsr3BaB+dBLA3CkXtNHTHIp3
	 7x3VPrZaJKvwxb1Jayy4OuX7Y90upyGSzsRfUhQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BA2F80109;
	Tue,  2 Feb 2021 16:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 105E6F80171; Tue,  2 Feb 2021 16:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7AC0F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AC0F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iULnQ2RF"
Received: by mail-lj1-x231.google.com with SMTP id f19so24535245ljn.5
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8enBlEOKm9It/cKHLJMBWzbNRlOst59aHzd+yoHUl1g=;
 b=iULnQ2RFjb9qH8isdKYaNhZLY+tfsIUPGJL7ERo/5cHGdhSvGFRrLujvZlcYvaj+Yv
 wYrSQGYxiqDJVGGro4J/DiVfelriL3AzGpQYJn4tQZ1xCFRAO5EAc98/w7XRBaESJDdp
 jSuAkCJCnRsGFQ9cdoBvvN1o86ciiTXcAEehuumro4KFC6C/A9JxbiE20UOqwDGVJwZr
 Ipcn1yYXG3HmdP60XczQ6aDM8f3W6x/zTmjkJGnWBzb3QEvJMC9uEHzqVVfF3hz9BTWz
 A5FxlEOYDdu0CVt7zN9sYfQyToQLo7JQe9AamJoIPD6GVNPnyRUz4LIyJPVYvezOeVf+
 36ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8enBlEOKm9It/cKHLJMBWzbNRlOst59aHzd+yoHUl1g=;
 b=tPqvGf0zeqJIll+Oc9GKENu7Ys8FI3/JxEs83+4X3l4OMVa0IM/BMUSUo2Q5nm3RUa
 XkdI5wdZqY2PpfBDDYGfif4dwmHSXiFKOFFbckvQUySsgKNtiYcSD06NJvpqWZX6M1GG
 eyWPi4FWkv04EZXrTCKtmBr0Jf9aIJ8HiQEgg96z/BOd/xy3IyD5m8Hyc4HGLWrzfRFw
 grBcqRkgIi/MLvTUFWltmuN/bccYwvNgMU6tQ/M/7rtBGTiwMP2gW49g3y5kqsLu0ZeC
 qHtvem++HfQDTSWVx1Beg/Ny8bZepHNnZz7QI7cSGhaBV0Y2bLIH3DjoB33RA1q8fmhq
 ++aw==
X-Gm-Message-State: AOAM53243B1aoScY7qaW64KuqjpgA0FzRhb4pRlVs9j5c65Rtk1cjpdJ
 PfiJ/ZOOws1Vz63/hYHv7Tk=
X-Google-Smtp-Source: ABdhPJyu2R9ua7UAwzHH793ECSpeoTE0qAJCKeo7jAGHit4l626oPtuP30Wcm13/wg7vHyy4b4JvEw==
X-Received: by 2002:a2e:9115:: with SMTP id m21mr13877035ljg.62.1612281246415; 
 Tue, 02 Feb 2021 07:54:06 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id y21sm3347792lfg.282.2021.02.02.07.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:54:05 -0800 (PST)
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To: Ion Agorria <AG0RRIA@yahoo.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ee67a6b-ebe0-8565-5315-bc823ece32f2@gmail.com>
Date: Tue, 2 Feb 2021 18:54:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-3-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

31.01.2021 21:41, Ion Agorria пишет:
> +	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
> +	if (!np_codec) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,audio-codec' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
> +	if (!np_i2s) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,i2s-controller' missing or invalid\n");
> +		return -EINVAL;
> +	}

We missed that the np_codec and np_i2s should be put when driver is released.

https://elixir.bootlin.com/linux/v5.11-rc6/source/drivers/of/base.c#L1429

We could fix it with a devm helper in v2.

diff --git a/sound/soc/tegra/tegra_rt5631.c b/sound/soc/tegra/tegra_rt5631.c
index 9034f48bcb26..84f23915bd95 100644
--- a/sound/soc/tegra/tegra_rt5631.c
+++ b/sound/soc/tegra/tegra_rt5631.c
@@ -172,6 +172,30 @@ static struct snd_soc_card snd_soc_tegra_rt5631 = {
 	.fully_routed = true,
 };
 
+static void tegra_rt5631_node_release(void *of_node)
+{
+	of_node_put(of_node);
+}
+
+static struct device_node *
+tegra_rt5631_parse_phandle(struct device *dev, const char *name)
+{
+	struct device_node *np;
+	int err;
+
+	np = of_parse_phandle(dev->of_node, name, 0);
+	if (!np) {
+		dev_err(dev, "Property '%s' missing or invalid\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	err = devm_add_action_or_reset(dev, tegra_rt5631_node_release, np);
+	if (err)
+		return ERR_PTR(err);
+
+	return np;
+}
+
 static int tegra_rt5631_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &snd_soc_tegra_rt5631;
@@ -209,19 +233,13 @@ static int tegra_rt5631_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
-	if (!np_codec) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
+	np_codec = tegra_rt5631_parse_phandle(&pdev->dev, "nvidia,audio-codec");
+	if (IS_ERR(np_codec))
+		return PTR_ERR(np_codec);
 
-	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
-	if (!np_i2s) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
+	np_i2s = tegra_rt5631_parse_phandle(&pdev->dev, "nvidia,i2s-controller");
+	if (!np_i2s)
+		return PTR_ERR(np_i2s);
 
 	tegra_rt5631_dai.cpus->of_node = np_i2s;
 	tegra_rt5631_dai.codecs->of_node = np_codec;
