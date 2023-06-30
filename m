Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739A074415F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F30083B;
	Fri, 30 Jun 2023 19:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F30083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688146568;
	bh=pipgj+CfH2pBUcaRm4vy8fJc0i5xR75jN0dc5tuwJ4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TE/OP/GVy8S+0iI9fWIhRRfsULw9VBUGuS6FN0TPyqizYhBWNDjDLhQ44qM18azLV
	 re4UqSL1oASRJ/roXGCZBLE36eLbM4kWCoQfqHcu3i3u4z/aGMjrUePTTqonDeqDD3
	 Oh4LXcLWqTxAcaJhlbWXNKTFC+7/U/YmiBO8SaA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E69F80535; Fri, 30 Jun 2023 19:34:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE3BF80169;
	Fri, 30 Jun 2023 19:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD34F80212; Fri, 30 Jun 2023 19:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42450F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42450F80124
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-345a4efb66dso8928595ab.3
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Jun 2023 10:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688146471; x=1690738471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQ94kfdEfq9RrPFyhfJUVdunZkyBAVzDUoOb8tFiC9I=;
        b=RaPFKM9KNv0WYTKNXJtjBPmduuO2s3+dNIp8v5BEwD4fVxeFWbgPbh3u8CBA6tq4x7
         VVjkvzca/IthGP6LZio/rjYZhIFm44quKppXM6ae2f0+A1I4w3ncsbrQVf5VQ0Mfyauy
         urO55oraXuoWNiP9TZ1p3hj+YDkVr4wk7XJEoa+A1vkzKo+y+4oQTTZaBa7weLeT/eyI
         h4UocSHSFXiCqpD+KZspUpm0FVaMt4NN6qtvmSnhSpnQtfTSd1c9Ei8mU4f3a7qe3gPq
         S9gjDX8kom4eqibWCOAZSj3OREkZk0eo5yr5RsO2e+MMM/OFXO4MWSXYyrQj5gi7Ozvr
         BqMA==
X-Gm-Message-State: AC+VfDzYlhVC0EzlFj2uApbO0hww+Gbgb3Ot5MvN3EsJlmk2uTy+aGHn
	p8g8NBQ6ew6FK7PTCnbIzg==
X-Google-Smtp-Source: 
 ACHHUZ4EbUs4PS9q79isRP9O3xuyN3VlPHEnyRoBjVZ32PU31b0maNUtRwGNVSbiOr7AKyybiYfTVQ==
X-Received: by 2002:a6b:a16:0:b0:783:694f:e791 with SMTP id
 z22-20020a6b0a16000000b00783694fe791mr3651652ioi.12.1688146471480;
        Fri, 30 Jun 2023 10:34:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 i17-20020a02ca51000000b0042af069eeefsm1830983jal.50.2023.06.30.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 10:34:30 -0700 (PDT)
Received: (nullmailer pid 2074728 invoked by uid 1000);
	Fri, 30 Jun 2023 17:34:28 -0000
Date: Fri, 30 Jun 2023 11:34:28 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dilip Kota <eswara.kota@linux.intel.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, timestamp@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Dipen Patel <dipenp@nvidia.com>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: timestamp: restrict node name suffixes
Message-ID: <168814645706.2074491.15762386958786625732.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: JC7HCPAOBJ6QA2VEOOE6KRHXNZ5QBVFQ
X-Message-ID-Hash: JC7HCPAOBJ6QA2VEOOE6KRHXNZ5QBVFQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JC7HCPAOBJ6QA2VEOOE6KRHXNZ5QBVFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:50 +0200, Krzysztof Kozlowski wrote:
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
>  .../bindings/timestamp/hardware-timestamps-common.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

