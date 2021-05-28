Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A83946AA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 19:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D7F16D5;
	Fri, 28 May 2021 19:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D7F16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622223868;
	bh=rhWuDiQEJAXq57q+A6NijO2NfSgXin90aN4By0q1Ygk=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAGct7kmzi/ni/iXpjldptZM5U2KxKb7mkr5kM6Pv8LS4KjecwOjzPlyxUGi03lQB
	 MmrpXt7xV268Mp4PBhx0jrgAbCnYKmClmUyKCvOZleOTySbNrewBXRg6UGQVbpuFEi
	 M6AtrQ8wt1PmgTg5gMg/9Hg5ap+CxT0bRygxNdz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 060BBF8013A;
	Fri, 28 May 2021 19:43:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A746F804AC; Fri, 28 May 2021 19:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4D11F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 19:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4D11F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oM14DXMe"
Received: by mail-lf1-x135.google.com with SMTP id b26so6451472lfq.4
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KI4+CLc3LVUdeiCFpZRQ3yReYzhuigspJBb1+pZncVg=;
 b=oM14DXMeSFyqHfnSQZF6/HT5X7Rss3NnScX9QUatfLlN3bd0+VHUM0f/2bC9M1SxEY
 A9dncf9wTPOIjBmPdsyS7C4c25qC2V0gQ7fQ8dNrQATJnvtfOm7k+JnlrujnaxncbJfZ
 w5OV3aLAE1ikyxHCLZ7XLMgsOarJyoFfIsBhH3nn7m3InshlnPZ2tIB+Oycfg1PN5W+w
 77YCy5f2hY/wLwHqTqcwHcnLpUUzaIzRTwAgYd35vsCVlLT20wbH+/r4QCinfQqsxnNc
 IMaQ3cDTydPb6djFkuAuo07dKO4t4QdzbvZdx9X8Ez7XJqgK31aRm0WY4cQqexu41O78
 vtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KI4+CLc3LVUdeiCFpZRQ3yReYzhuigspJBb1+pZncVg=;
 b=aV90L474bSRd0yowLdAgkr4y7mMdNXbrdSqFbE3HccmdPgj+OWODivoAvj78HZoMLV
 +Y26YFsPEL6Ww8LamO3rGgVbdFL0QlpAABhsuEn/BfjM+JC2EcW9+P/a0TSDWsOSAnsC
 ief0WIlw/rEIB515ZDW8LITOT4o0yQTzsvbWAvbNdfwEYqzwrGHfHAjBJDkSy2vT7E3l
 wcR0Fy7/4Vf9Bd0Gd8ougooWc80dgLHY9m/LN4clvmDkIsYLtHVS4vmYfXDIRdCGNDG+
 UQqbK6zjgjlFvO84A1lTz/AXy0tSDh/CrfLPPquVfbsdhe+orHgHiCwrFZURtHu+Ws8k
 v1sw==
X-Gm-Message-State: AOAM533Y497GYAJ3EGFsZFNRcxFQ90kJ+o3qO8yEfFRS2ylLcTbTQJP7
 c3rtrU4frFj1s/yAdwivs7U=
X-Google-Smtp-Source: ABdhPJxiEtzPDrR5ngSZmiruM65mcClPAqHZWszF1m2W/3v0KJZZPai1jBHELrIdAXfJzJrPHipbRg==
X-Received: by 2002:ac2:4255:: with SMTP id m21mr6891577lfl.633.1622223772542; 
 Fri, 28 May 2021 10:42:52 -0700 (PDT)
Received: from [192.168.2.145] (46-138-12-55.dynamic.spd-mgts.ru.
 [46.138.12.55])
 by smtp.googlemail.com with ESMTPSA id n5sm521916lft.139.2021.05.28.10.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 10:42:52 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] ASoC: tegra: Unify ASoC machine drivers
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210528172833.21622-1-digetx@gmail.com>
 <20210528172833.21622-3-digetx@gmail.com>
Message-ID: <722581fd-a89b-7b69-f0c0-414d732a6c5c@gmail.com>
Date: Fri, 28 May 2021 20:42:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528172833.21622-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

28.05.2021 20:28, Dmitry Osipenko пишет:
> -static int tegra_wm9712_driver_probe(struct platform_device *pdev)
> -{
> -	struct device_node *np = pdev->dev.of_node;
> -	struct snd_soc_card *card = &snd_soc_tegra_wm9712;
> -	struct tegra_wm9712 *machine;
> -	int ret;
> -
> -	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
> -			       GFP_KERNEL);
> -	if (!machine)
> -		return -ENOMEM;
> -
> -	card->dev = &pdev->dev;
> -	snd_soc_card_set_drvdata(card, machine);
> -
> -	machine->codec = platform_device_alloc("wm9712-codec", -1);
> -	if (!machine->codec) {
> -		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = platform_device_add(machine->codec);
> -	if (ret)
> -		goto codec_put;
> -
> -	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
> -	if (ret)
> -		goto codec_unregister;
> -
> -	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
> -	if (ret)
> -		goto codec_unregister;
> -
> -	tegra_wm9712_dai.cpus->of_node = of_parse_phandle(np,
> -				       "nvidia,ac97-controller", 0);
> -	if (!tegra_wm9712_dai.cpus->of_node) {
> -		dev_err(&pdev->dev,
> -			"Property 'nvidia,ac97-controller' missing or invalid\n");
> -		ret = -EINVAL;
> -		goto codec_unregister;
> -	}
> -
> -	tegra_wm9712_dai.platforms->of_node = tegra_wm9712_dai.cpus->of_node;
> -
> -	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
> -	if (ret)
> -		goto codec_unregister;
> -
> -	ret = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
> -	if (ret)
> -		goto codec_unregister;

I just noticed that this AC97 clk initialization is gone now for wm9712,
I'll fix it in v6.
