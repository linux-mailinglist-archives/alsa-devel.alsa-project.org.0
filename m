Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5312729E1B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B86059F6;
	Fri,  9 Jun 2023 17:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B86059F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323735;
	bh=8fH9U4nt9tYSW3fHxOWWhsCtc7YaBO0pDd/pqqXDjj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T/0Ysu5xppmslz/PDQu61UBA3OKZ+b+HWqdjLRnKljDUMq97TdcbrA8anOZQeFxZN
	 84GNaVUfBaPb7/PrII59UN3wtXvKc+ORDxc9Xy7ug/CKasGEi5g5kh+rdcmBk7Bq8c
	 QY+rpH4S2JqI09Kjw4PyJb6DZ64UUbRabkM7pU94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95716F80568; Fri,  9 Jun 2023 17:14:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64AC5F80544;
	Fri,  9 Jun 2023 17:14:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18530F80553; Fri,  9 Jun 2023 17:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 578F1F8016C
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 578F1F8016C
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-777b4716673so60605039f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323665; x=1688915665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkAejDhVenOljts+lEgATyY0mjLSL4+xG2fSzob05cU=;
        b=BhgxnGSXR6YlV3dhlrSNtBHPzbie2tk4Nc0N550ggH0CyaTSY4ahAGPPCYIvsye33L
         wJL+CZtInmlZLYId8wfthCEOS8v8LZMh3oT7pkFwdyZRevNkxOfKQC4BfpIihRxWJMTj
         hk3eoC6jM+vUekK8FLLcGpqzQbYueMOKHtcNJlSqhPYg7nskyNJ0Pa6i43KefK1xLjBj
         unHAN4kEjLI7HfnGgSUvsK6buvHYaLIXOsJHlhJIDRVzkREj1qLt37spRiMIi8gvupKs
         7A3BNpU3Gi4kIf4qi8khgR2zRVZG/Y/ADw+MeL3Wrqo9c+P59eeKQS7fLhcP1pvEY+v5
         CLAA==
X-Gm-Message-State: AC+VfDyujONaF+wanenfqKE6781VuQjpzd9paaEoStrtqg6yrIINzhIZ
	Z86vbNlI3DzUv1N2oAhrDQ==
X-Google-Smtp-Source: 
 ACHHUZ51hC0FqW26G3ZZ/1x1kW04DJ7QhraHlAzn2ctcSO3HfuegS6P1MdA5ofiYZJ2F6gytcZ0bbw==
X-Received: by 2002:a5d:8b5a:0:b0:774:8d6c:9fe7 with SMTP id
 c26-20020a5d8b5a000000b007748d6c9fe7mr3269252iot.3.1686323664873;
        Fri, 09 Jun 2023 08:14:24 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 eq14-20020a0566384e2e00b0041631393ac9sm1026218jab.18.2023.06.09.08.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:14:24 -0700 (PDT)
Received: (nullmailer pid 1011643 invoked by uid 1000);
	Fri, 09 Jun 2023 15:14:20 -0000
Date: Fri, 9 Jun 2023 09:14:20 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-spi@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Dilip Kota <eswara.kota@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, timestamp@lists.linux.dev,
 Tony Lindgren <tony@atomide.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-phy@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Dipen Patel <dipenp@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
Message-ID: <168632366012.1011592.9711699530759737056.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 4H3RZKS4O5GISIJZSVD7KJH7B5UKJ6SX
X-Message-ID-Hash: 4H3RZKS4O5GISIJZSVD7KJH7B5UKJ6SX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4H3RZKS4O5GISIJZSVD7KJH7B5UKJ6SX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:51 +0200, Krzysztof Kozlowski wrote:
> Make the pattern matching node names a bit stricter to improve DTS
> consistency.  The pattern is restricted to -N suffixes to decimal
> numbers.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

