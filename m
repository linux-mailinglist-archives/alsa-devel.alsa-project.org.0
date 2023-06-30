Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBE7440D0
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C48E3E7;
	Fri, 30 Jun 2023 19:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C48E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688144750;
	bh=O9xT6yKPCK99yV+wwXvOl/OQsyRCM8um1PhuyqVjU44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i3BciCpqUx1pTHBhYNXLg2ZgQHSFiQU8t20a6qysqiwAtgxQTxwOjW7jLRMHk5f7U
	 9AZYukqkNV6PYdp7U0jOvaLTXur2CirqxJJ0TgwnWI8Rp1SOu4qYHernMB0eCf8OPP
	 SJ5QrfB2Rug/tdz9vri5RIXDUfeBxS5CG7+uL2eM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A55EF8053B; Fri, 30 Jun 2023 19:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15907F80212;
	Fri, 30 Jun 2023 19:04:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9887AF80246; Fri, 30 Jun 2023 19:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 093A6F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 093A6F80169
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7835bad99fbso88923839f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Jun 2023 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144688; x=1690736688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDSvITIumvxU+9FeXxHNbJLwhZGzlxTTZldXnMbbHIk=;
        b=BTbkbJlvEOI8QfHY30+Cm6FESdY2mXro1pf22i8Q9m5nY+/WnFCK04lKOTl6RKiplv
         VQko7kjTFWaaKqkcb5n7UHQsxc+VoqWoDGbJtM/gGZs09ctPxLih/j/G4ryw5FkSEqiM
         hW2OHyd4dKOj2DSHQNPo3jpsCzVoNzbJSb8Dku1ZnYRU1cDPPZD/TfaTndAhVoAITgvB
         IQkHndYb0P/quSo8TjXw+hT2YuY+sJMjU6xYNt0sctI+HLkxo/cC1lEnK8i2SCK5Edqt
         bC0+HSgMUpBZIu3nWk5yKUXUkdi1mkx8mcw23zPiopQtWBnpfaD+3ETJg7+JMV0BSqXY
         R5Ew==
X-Gm-Message-State: AC+VfDw8f2TFA4u7WCkzPpL+YYFLVbYdm/naA24rVzBhjGIMrk/qS0yY
	xt9p8g3nH490UnsC8SY3aQ==
X-Google-Smtp-Source: 
 ACHHUZ7YVGW6lKVvg7C24o8CcDQqjgMElHyuoGKVnJCWvqYKZlQzdchG5JVGPC50uiHB8TDngxV6bA==
X-Received: by 2002:a05:6602:19d1:b0:783:5209:c01 with SMTP id
 ba17-20020a05660219d100b0078352090c01mr3305594iob.17.1688144687999;
        Fri, 30 Jun 2023 10:04:47 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a02cb45000000b0040bbcee6b57sm2373025jap.133.2023.06.30.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 10:04:47 -0700 (PDT)
Received: (nullmailer pid 1908824 invoked by uid 1000);
	Fri, 30 Jun 2023 17:04:44 -0000
Date: Fri, 30 Jun 2023 11:04:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Dipen Patel <dipenp@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dilip Kota <eswara.kota@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, timestamp@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-phy@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
Message-ID: <168814464489.1908194.10092224539849073775.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: KHPY22KODN7D3JPHBI63KNDQCHMAXJ5D
X-Message-ID-Hash: KHPY22KODN7D3JPHBI63KNDQCHMAXJ5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHPY22KODN7D3JPHBI63KNDQCHMAXJ5D/>
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

Seems watchdog patches aren't getting applied... Applied, thanks!

