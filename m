Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D09AB98CF1E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 10:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C2D846;
	Wed,  2 Oct 2024 10:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C2D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727858636;
	bh=VeqJiGZPeoJt/vn3E557Zb7LdzLEwvG5p+tBIW9OoC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DWy0DMUn0pnQmfA1a7KSBMOL72nw2BaJotHzLuZ2UGTAWyQmK8jEuGf9v08aSL9W7
	 0G79IRZDw6g+mnwelEHgmatOrVdtbNb9wpeRBhNyrrbQL4AfyQFoYlnyGAARFhmbWZ
	 O9LuhG5Wp8tA1rqAQihJtF86Uq/lAj7CuNf5jPjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 328EDF805B4; Wed,  2 Oct 2024 10:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5884EF8001E;
	Wed,  2 Oct 2024 10:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B24EF80517; Wed,  2 Oct 2024 10:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7894F80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 10:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7894F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OSu7pHtu
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5399675e14cso3710084e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Oct 2024 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727858597; x=1728463397;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nXaZCtHNq7BKKF3CmtoESBg4ulxhWJtDtjqd9cV8Hs=;
        b=OSu7pHtuBAKfaXUevB0nFFq0JD497Gnx0UEyocrDy3cZbuapS4fx9/kzJZ3D6UBH4X
         Bpa6lROOPKx31CfwLbiKRlqjgiOglXu94OTZRgbCQ+sPksrAUWdOEBFLZnmObL31w5Pa
         s9agBmVnHtPqebSI7VNVd2l/xTu0VEEYeS3hkspiaHYEWndCZlPQR4bsTBgePzBV1ucW
         ASX5DuCPJJn+XSKwJ7NCR/Lab7RcUwRmIe3Buv8PpCbbEyJ21bqbX1Gz9QUU0GUc/CpB
         SmeCGPgDCvuH9KDGn+1wM0B/bP2PisFh72+ARommsdOtt207IFw3SXyVvlBFakc7u5TL
         WsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858597; x=1728463397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nXaZCtHNq7BKKF3CmtoESBg4ulxhWJtDtjqd9cV8Hs=;
        b=P9idYX30l9UqBKcX+nkJS5dofbw7QFQsig5jtRnl3DxKMArH70xzO+VyZAaCsJ1pSQ
         WMUOXrJb4g1mTtjWaaf2KQ/3tfYBmARNF28Xdn1s/hBT38q4CP1v+nAOcj8XhChC2WmJ
         qVE1oLZooWkc/tlsYzFbSYgxnlhIddSRff7Bf6HJCJVrE0kbllI3iflK2ryl3bDNIA/l
         Hh99waupOw6DDgQoDV1nUwpXSwZX4SfIZaqX0fED0CsFxBh0xW261w2MCr4DOHS0H91Q
         ZPDWevtU4EMUzn750D9tBg2qqaQKsJo7U7a6Qmeg/rHixLuv7GgkOLPjISPeF0GBCuAi
         KiZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpUHNDgtjclx8I+y75IKy/4J3Bksghyi9chbhnCagvVd4qvU9yAc6esm2az4LlD+A2Xi5xfmkgCmG7@alsa-project.org
X-Gm-Message-State: AOJu0YwrUrRNeIgHHxzeP2s2lNsvVCDHjUTka4SixHswRwz4k49YgpVo
	q0Tg6qCx3rycCvqLkHLPjL93kfBd7/FJxsFSD/y8jqYekISWO0Uc
X-Google-Smtp-Source: 
 AGHT+IGixNj4W4W7revkITaUB2HOY3ocF0+RwQ4hilUEhSgxQLDa+RAmgwv2ziLfVvWZf0H5TVg3HQ==
X-Received: by 2002:a05:6512:31ca:b0:52e:9e70:d068 with SMTP id
 2adb3069b0e04-539a065c507mr1202032e87.4.1727858596239;
        Wed, 02 Oct 2024 01:43:16 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd54746sm1868550e87.29.2024.10.02.01.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 01:43:12 -0700 (PDT)
Message-ID: <a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
Date: Wed, 2 Oct 2024 11:43:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E5744HKJYUGZJYDR66EQV3KHF6RMMQCS
X-Message-ID-Hash: E5744HKJYUGZJYDR66EQV3KHF6RMMQCS
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5744HKJYUGZJYDR66EQV3KHF6RMMQCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 01/10/2024 23:47, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.

For interrupt these are the valid onesÉ
- Common only
- TX and RX
- TX only
- RX only

The driver cuts this through by trying to request all and leaves it for
DT to specify the correct irqs.

Note: in case of common only, we still have RX+TX, TX only, RX only
operation, but that is just a side note.

> 
> Looking at the interrupt-names definition (which uses oneOf instead of
> anyOf), it makes indeed little sense to use anyOf in the interrupts
> definition. I believe this is just a mistake, hence let's fix it.
> 
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> ---
>  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> index 7735e08d35ba..ab3206ffa4af 100644
> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -102,7 +102,7 @@ properties:
>      default: 2
>  
>    interrupts:
> -    anyOf:
> +    oneOf:
>        - minItems: 1
>          items:
>            - description: TX interrupt

-- 
Péter

