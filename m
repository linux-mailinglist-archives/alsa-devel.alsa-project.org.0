Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A8166F5A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 06:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C1C16B4;
	Fri, 21 Feb 2020 06:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C1C16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582264534;
	bh=yLnesc7iW7xoYk+EUCTEuL3bzhmFGXZqP3zCBa5Y704=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MypIous10oQfOz6r24Sfr0ZkRghRi35fnvudDd9ZEuPtFCba+5mkyRSMWgyRmxlZB
	 866uLPOKb2jyrd71aHKRoijtNh9pCAa6sgj0U34iGYDGCk+z0YyIUnwd3Bp4PF8cWp
	 UNyGaz9EoErrg9xDpTrZjWWcloIq5HsGKf9K97MY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D33AF80114;
	Fri, 21 Feb 2020 06:53:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A67D6F8025F; Fri, 21 Feb 2020 06:53:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6482F80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 06:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6482F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TQp3/1si"
Received: by mail-lj1-x242.google.com with SMTP id r19so940171ljg.3
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h4Lfa2XNuMENwuIsE1cnUCd9hGIA1qUK6OViaKh1/rk=;
 b=TQp3/1siBdgQBsWsC+eKZkO4ai9vac/fr4V2MEITo1lDdTfiK0bbz5Rku0njBz/vCQ
 Gpu7t5AxgazkNTmu9QaD5moD+YD8AeN1fWFJ6p65b7M2lpsTwPE/mCh7kMFBmin+AuRV
 juI8rVy9Ky/ZoqclpPSz7HRB9LTnlNXYq3eBuh9a7Mb5miBzr2yPN552jm9FkvS1Ei04
 nW4DdSDZyDTpF8C7VgY5zmkCsuFle/9nC28v0eJJ6iVMKbHyJWFNDUyrv7/qowaZOQhH
 oKUgperRPGVTTr4mZIPOdwtXLlG1qAhOE6Fc1EXJmdPH5Fa38akydo96BYO5QVS36NgV
 bwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4Lfa2XNuMENwuIsE1cnUCd9hGIA1qUK6OViaKh1/rk=;
 b=dcVXxNixHlBrVfNGm+v2Q3Ci3OtJh6GJB2LMro+ArlRimLPUN0SfBFnSRlIdHq5DLQ
 TI4SqzynYwzobpEERr6wJKVJiLIYen8rGgp7tlkISwW6mohJQjo5DBAy67dSXC6QfQg6
 o4rGPa+nqpC7pJMUoi+3Y3EzGU691dqSP7+sKmie4IFkGrhX0UlSljEmFDwwsgvCCH+5
 Frwjdh9GKiK1RdynkHCmJklZP4wZYcz/XzRaTDDtA3WVuTOQPp/QghYV5vkeYJwaIhtU
 D9NoqC0KBe1DA0dT7q6SWKg0mcLHIMVwcynXn0NT5f7YEmdEKs2Y5QvF4xqcAej2Q5Cq
 2vkw==
X-Gm-Message-State: APjAAAW8wGxTvjn8igVNkVYks7KPNe0bGV+xXRpwXgB89STtBQXrCnCn
 Kgk1HX5Vfv/LGiHqy01v8UM=
X-Google-Smtp-Source: APXvYqzplawmCJ3CkTVkfhHWssF7iwzAh48VuAEmFC/xNi5vJyGYpTFM7GDx7Zl3kqbXCP1zCxe/tw==
X-Received: by 2002:a2e:2e11:: with SMTP id u17mr20449132lju.117.1582264425497; 
 Thu, 20 Feb 2020 21:53:45 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u7sm976142lfn.31.2020.02.20.21.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 21:53:44 -0800 (PST)
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d618182c-14a8-9143-376c-568dd7cf3bb3@gmail.com>
Date: Fri, 21 Feb 2020 08:53:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-4-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

20.02.2020 09:34, Sameer Pujar пишет:
> The Digital MIC (DMIC) Controller is used to interface with Pulse Density
> Modulation (PDM) input devices. The DMIC controller implements a converter
> to convert PDM signals to Pulse Code Modulation (PCM) signals. From signal
> flow perspective, the DMIC can be viewed as a PDM receiver.
> 
> This patch registers DMIC component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes DMIC interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The DMIC devices can be enabled in the DT via
> "nvidia,tegra210-dmic" compatible string. This driver can be used for
> Tegra186 and Tegra194 chips as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---

...

> +static const struct of_device_id tegra210_dmic_of_match[] = {
> +	{ .compatible = "nvidia,tegra210-dmic" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tegra210_dmic_of_match);

I'd move the tegra210_dmic_of_match close to tegra210_dmic_driver's
definition, like most of the other drivers do it.

...

> +static struct platform_driver tegra210_dmic_driver = {
> +	.driver = {
> +		.name = "tegra210-dmic",
> +		.of_match_table = tegra210_dmic_of_match,
> +		.pm = &tegra210_dmic_pm_ops,
> +	},
> +	.probe = tegra210_dmic_probe,
> +	.remove = tegra210_dmic_remove,
> +};
> +module_platform_driver(tegra210_dmic_driver)

Otherwise:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
