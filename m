Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DE729E1C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36FF857;
	Fri,  9 Jun 2023 17:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36FF857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323735;
	bh=ALypGfvG4PuQicxv7fvW+gKd/GiCTkDkL4vYesIMfeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QwINkYQgb3vPocED4ZeCUX3jvDBYFtumPRvlWi1aw7KlPVUjppXROowqmWmogk9ih
	 De7ueSDZ8JTgk0SLbXPTQZNk3ExK8gERyTOVvgyeH28r25TvBsDP8MwIHfKXDVKwmK
	 /dMyytiYXvO+MvNQfKkHFxPstYn8w7ZJ57seioow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF54F80552; Fri,  9 Jun 2023 17:14:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E43C7F80548;
	Fri,  9 Jun 2023 17:14:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C7EBF80549; Fri,  9 Jun 2023 17:14:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27927F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27927F800ED
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33e4e59da95so8194095ab.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323640; x=1688915640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlnLe4pfATl+DHVBwqaw0v4jPbOyjTsxndvN+13DO4U=;
        b=WJQ6q204Ubnn+OCSlCbtbQdOS4c3B9UAeT5imKkRF9DMppZxy8YLfsJJl68OG2Jyt3
         mRbaFy868KZRTfeYMceFGqDjb/9XJqGXCY1Hm7TmJpH5FH7+EhMRa1P5CT2GxCMgyiNL
         U9InrGO9S+u6lhCZGxSE0evLMn5nDh/hJO6nSwQBcjO09LhcnGbzAdh7a7psgqJUOV5R
         j78VSJBxkK5WmvPvktAZ1qcUJDS7Q2j42J5QKCSDgec63H0MHPlpSmzf7yofcTG35zHB
         NwCB2ygwvdI4EHOd1NyuC5IGHNd+FUyoieEeq6WiVFHFYtaYgYWveUHp0a7AJJtOnbr/
         0snw==
X-Gm-Message-State: AC+VfDzDeSjU4cTycUhiRwXl4pgpbVaOW++nlmRlpPkwDZM8tboDlP+2
	HtJBpD+lOlF4IdpGqM0iXw==
X-Google-Smtp-Source: 
 ACHHUZ67MRb0rJmdn4+48gimm54npOx3rXtHVsKxV43QbkTdBE7Slc8n9FZ20Hgxkb+KSwVkDi+hYQ==
X-Received: by 2002:a92:d590:0:b0:33d:72c0:1b4 with SMTP id
 a16-20020a92d590000000b0033d72c001b4mr1757273iln.10.1686323640384;
        Fri, 09 Jun 2023 08:14:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 z3-20020a92bf03000000b0032b72b5c1c3sm1136035ilh.9.2023.06.09.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:13:59 -0700 (PDT)
Received: (nullmailer pid 1011188 invoked by uid 1000);
	Fri, 09 Jun 2023 15:13:57 -0000
Date: Fri, 9 Jun 2023 09:13:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Dilip Kota <eswara.kota@linux.intel.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 timestamp@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-phy@lists.infradead.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, Dipen Patel <dipenp@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/7] dt-bindings: timestamp: restrict node name suffixes
Message-ID: <168632363634.1011122.1495504884843410484.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: IBAOVFQ27I5P2RO25YMYSZ43FZ7OLH22
X-Message-ID-Hash: IBAOVFQ27I5P2RO25YMYSZ43FZ7OLH22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBAOVFQ27I5P2RO25YMYSZ43FZ7OLH22/>
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

Acked-by: Rob Herring <robh@kernel.org>

