Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41446729DF1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5566D3E8;
	Fri,  9 Jun 2023 17:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5566D3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323560;
	bh=3Q/ksA1i/xOgGzfmaY9W1qnMBPtO7g2a9jJ7zzegiFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nTdaRMoCkLlEY2hqgRLtGIP4G9cY6MG1cSjMuiWAKxzhdDTs5zpIcFaw1hEd9Dd5x
	 5ZFlh5S+oQXB0FnVDR2YafCkRoaZdSH4Qz/FBQK/Iqk2nnWr6BG+f+Y8+aZwgHbvyx
	 I6kk2lo1K3xFuqCSrlN8coSMRnuoK9sHmQq+s5p4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB762F80544; Fri,  9 Jun 2023 17:11:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 859AFF80254;
	Fri,  9 Jun 2023 17:11:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36D79F80254; Fri,  9 Jun 2023 17:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE422F80199
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE422F80199
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-33b921e4e8fso7583225ab.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323497; x=1688915497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9Rb1e/uOkSXDB72S3Pmwrp86GlxpbraRGVRQBYFa9A=;
        b=GIN9VRdid6vfZXXxErY1wzqxn2BnmV+qTdGrJSjAcu70R9vD3ke/GAdpxDti61yRjB
         waT41rqRg1sedA8Sx5VrnKM72Rny2egID7klUWJjZfNF97nQnadmIXZkv6DmdtZhVRvT
         xBrCimGP7QNjZitBaVe8bjZsrnERgiOKxNBlGKsplDX9DcZWW9yWBleYyEx5D1XYhoPc
         W2VCEaxAiRzd1sCM9XGBxWW2Sx4FN/qbFZaeNuuRHxMnJyNTbueEiGbCKup6UMgx4dlo
         MtJG0RRn/etR7Z8+KbA7+HNKDqu/HEEgTbgmI0k0y6vAweJn/dHbv3dM3KTwIjvX+7ej
         h3Hg==
X-Gm-Message-State: AC+VfDwNyzwuYSJqBcZeKJQNwEEWTkyKQKjip0NKLorV7wYXjmd/61nT
	rr9ndVDx9NU5mATfmj7m6g==
X-Google-Smtp-Source: 
 ACHHUZ601MkzpccdrAQ864iVAYxlzaAgWUES/WkMk0l539+cvMHRtzNzn5Ol1LJOZoG08+96U43ndg==
X-Received: by 2002:a92:c98d:0:b0:33e:7269:bb7b with SMTP id
 y13-20020a92c98d000000b0033e7269bb7bmr1650478iln.3.1686323496915;
        Fri, 09 Jun 2023 08:11:36 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a92c750000000b0033e62b47a49sm1124240ilp.41.2023.06.09.08.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:11:36 -0700 (PDT)
Received: (nullmailer pid 999255 invoked by uid 1000);
	Fri, 09 Jun 2023 15:11:33 -0000
Date: Fri, 9 Jun 2023 09:11:33 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-phy@lists.infradead.org,
 Dipen Patel <dipenp@nvidia.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 timestamp@lists.linux.dev, Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH 2/7] dt-bindings: pwm: restrict node name suffixes
Message-ID: <168632349292.998946.17372740217811972226.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: YOB3YBUARY4CIS5QYMSIRGLNSI2Y34FN
X-Message-ID-Hash: YOB3YBUARY4CIS5QYMSIRGLNSI2Y34FN
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOB3YBUARY4CIS5QYMSIRGLNSI2Y34FN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:46 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to:
> 1. Only one unit address or one -N suffix,
> 2. -N suffixes to decimal numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

