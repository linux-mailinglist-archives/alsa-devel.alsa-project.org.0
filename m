Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6930B85B45F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FAEE85;
	Tue, 20 Feb 2024 09:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FAEE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416232;
	bh=TQodChaPOHWcum/RNtaWMKL6Ir23w3h16d8jHIJEYQ8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cAJzZazHPRYJUi1/x71jFswIoy9T3f1ZFHjJn6E/h+KWkLIgdQiI4VwYOq5Ie/0nn
	 ykX1zacaIEh3xbrGFHKFSf3UOcODYhFfXa5j9Xrr/b5XaW2qQtUMN2arLqLe6gSPgg
	 xDbm0Tef7vUPAKZ+H+o67+cno3khpJHi8Q2lfEDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C48F80640; Tue, 20 Feb 2024 09:02:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 783D9F8068A;
	Tue, 20 Feb 2024 09:02:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35C99F80496; Mon, 19 Feb 2024 07:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71A5EF8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 07:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A5EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Iwp8Xvpm
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d22d0f8ad1so14302081fa.2
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Feb 2024 22:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708323912; x=1708928712;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=Iwp8XvpmYTmHKUGRcPcdaRoWh5NH1mu6wQdrFE1QwfhdiucHT4Ess1gLd/d9bcni7k
         7nTXwqRMndy09FVLeQAhBb66KMI2Mz719zR+cL57BUDw05lXdBx6beQpobngaL+HVEIV
         hUII27Nd9Os86kybd43dZh2hxtv/Asgt41UlUWrxD14ADqF0+lxa17q2PrCN63+3xgQ4
         z8nzI1Gv8bFg/r8edJEhodLsZtlRR4kg1wY+5SxLR7/JK97Jro1hj7ZPwYKceUEsX0Kn
         QPyXXjEXoQyVWg1FMO21/jDUin55p3ilj+WzqJuSc2HSeimShJcuGp71Bl+CANOf+7jm
         lHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708323912; x=1708928712;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=i2sg5a1p7uuvOldn/6amqXMvwOfE1SGwlUtMDkIxd50TiAFfOKwRbXER9DQ2GwMqeZ
         CgMUzVgrVzAk514AAWdHQML74o/ldTJiUDjc0a3R77RZYDt5PmBzahtIqnNfEup1g7+i
         Zzyfi0r61vf6UbsFQWzRvkk617h10iWxDzsrVfrhxTPpSpYvMxC9heuYhkjwjiriHlC/
         13GOd0RHI8dVD4/iXd6x4FuMLQt10AyHIjm77pltPM4v85++4GCLdWd0YITbnZkHkWzS
         UcVQNs3KwSI5uWcBWT34ETuHwE1DNz6zkAnLRGSatk2+aMxvgyk+Ee6nmueOyDL2rh2t
         zQUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgBAIAkkTXm0H00GuIMIpHxVJ6AUehARg2LU1SiJ2LsvZOGzZo+Fg6z673kECilcFJZXddUz7gXzO0Fn+qq+Bsey8MI7i3aQin4G4=
X-Gm-Message-State: AOJu0YyCnSUia42sTftHR+Q1YOLBWLHMeDssZ3bDkYghSFOqHncVaaUk
	1/Yq7PwoKFmaxX6UdiKMeX8RZ+/FYgnNAFvLd+WSuaPXyHPP+9OunnmNwBCn3Qg=
X-Google-Smtp-Source: 
 AGHT+IGP6skyrpQ+LHssyeFVL9x4R2C5PmtB+z/bDgXXtY+zd/lWWTMfb39ns1BsA6xd3vrJYLpPRQ==
X-Received: by 2002:a2e:99c3:0:b0:2d2:3b20:72ba with SMTP id
 l3-20020a2e99c3000000b002d23b2072bamr755168ljj.50.1708323911958;
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b004122fbf9253sm10177702wmb.39.2024.02.18.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Message-ID: <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
Date: Mon, 19 Feb 2024 08:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FVZQUV5IFMDND73AMRC45MRRBCESVLJH
X-Message-ID-Hash: FVZQUV5IFMDND73AMRC45MRRBCESVLJH
X-Mailman-Approved-At: Tue, 20 Feb 2024 08:00:42 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVZQUV5IFMDND73AMRC45MRRBCESVLJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/at91/pmc.c                        |  3 +-
>  drivers/clk/at91/pmc.h                        |  3 +-

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
