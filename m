Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29C49DB9F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 08:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8C4F1B60;
	Thu, 27 Jan 2022 08:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8C4F1B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643268671;
	bh=FMAXt9429PXfhSTDXW7by9HpsTFZ0VmYKKlWbtPvN+E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJ/nmXbw2dQBpkCC3KyB1WXytfCnRMt2reGVJl7qf6KhFT7PD9wFlKGnp4yoHr+b8
	 mkcH3nO491k61/triblhh3nocHF1aa21l4/Ad62CPJQUjD2x65RGxvQWSRaPH+uYvc
	 OTWJD+CA0bXj5gkadrgRIdCxHAtWkvqnxhRN4B64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA7C2F80506;
	Thu, 27 Jan 2022 08:29:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C07E3F8025D; Thu, 27 Jan 2022 08:29:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D286F800C9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 08:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D286F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Y714sbpD"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 277CC40045
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643268538;
 bh=T0Cao9EYbGyGDdTGcr1ndXwb9FVrHnyvN3eX07tx2XQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Y714sbpD24iFULa9Qa+qGGI6rS4lQFEljp7Qrkmg8mIqnJxg51tkN8wfVC+VVTZg0
 y+Zs4fPW2wAHxXaDsEZLp3gFisvzMPTook5z7aLTDlOPRRCkcqTEVDmOXsml85ysm0
 xtwO77/BIGnpNylQRKMotayqcWln+0j9zGuC2Eh54Nne01LNw3GitSCyRnFEGKf4iL
 LcgmFn0ZrNhf8ElvySxmAoUnODIkEM6TA67MQjoh6ePSuc+6C9GrlUMBj9crqaJVzc
 J99sXkojApKJa4lgij3GDpCafu5vVPG3OjOiZda9/tgna7u5yheBZ50jDqOy1D7SwL
 4JMGgGtqgp3iA==
Received: by mail-wm1-f69.google.com with SMTP id
 ay8-20020a05600c1e0800b00350de81da56so363309wmb.9
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 23:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0Cao9EYbGyGDdTGcr1ndXwb9FVrHnyvN3eX07tx2XQ=;
 b=1l7zC8lA1PhihilOWIbQrxGGp1AxD8WCJ0tAPhuT2i110HwpdteOXJcLrpBhpn2Kbu
 CgyJvxj6371LV6tEAEyugzofHMiQFHhC2dc+uT0DjMHt4lGVwP2zGlB6ezgNlk3Xztpq
 7B1JKt1CDBo9g+ROQW89e0OAXbuCXEX4jniSAroENdej/iIIwDwlJlBclAs0Efrx7fKL
 68crTHWRCVIYWZjNOGIPygO09AgPwrvwDcZa5wbFxZQQLqqVuYrKdxQJ6A2okG3c31Wl
 0vCg5iZHLxpyrw9ZZ9+es6CXFz6nP0ToZfN0qn5oKf+W4YwahlqFf/mCYLJO7COs37gF
 qrSw==
X-Gm-Message-State: AOAM533ewiTNaUZf/USz6uqaK9DfOZZqhuMbZRVql5m7azzTqAJeNU8X
 9ksl8MSE/L4kVdLhX6yPjKrzp+kubZM6smP8JIKmP3P0yoJhXrajj+1nZ6MYR7g6Lpy7dkZDMPC
 crR7ARGohHPuADW6dzhOVN19qcyVezmJzVb2SkBx+
X-Received: by 2002:a5d:4709:: with SMTP id y9mr1845683wrq.613.1643268537735; 
 Wed, 26 Jan 2022 23:28:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqClftY3Y8SR9yE9omjRxWnvEsOEI2w7cS7ER6+j2GDHexFol/gUHicZH4VStQR13iFWf6tg==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr1845674wrq.613.1643268537569; 
 Wed, 26 Jan 2022 23:28:57 -0800 (PST)
Received: from [192.168.0.62] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id g5sm1740182wri.108.2022.01.26.23.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:28:57 -0800 (PST)
Message-ID: <f0bd9681-c87b-a6bf-09af-05e45b0b9707@canonical.com>
Date: Thu, 27 Jan 2022 08:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>
References: <20220126231427.1638089-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220126231427.1638089-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 27/01/2022 00:14, Rob Herring wrote:
> 'sound-dai' is a common property, but has duplicate type definitions.
> Create a new common definition to define the type and then update all
> the other occurrences to just define how many entries there are just
> like other phandle+arg properties.
> 
> The constraints on the number of entries is based on the examples and
> could be wrong.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
> phandle-array schemas") in my tree.
> ---
>  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
>  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
>  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
>  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
>  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
>  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
>  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
>  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
>  8 files changed, 42 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
