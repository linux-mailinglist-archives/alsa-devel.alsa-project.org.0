Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9A729E15
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE1474C;
	Fri,  9 Jun 2023 17:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE1474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323685;
	bh=VFv2nCZoLiZSTiHR12tqpCX8xw7rIjepmJpyDMwydA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LgK66DgiojyfLWnzkTDbY/URS8KMnyLIibpVo07gT/ksLIwqxUleDjhYHhAJl0PXp
	 poqz3ozKOAlxg6h5fJHwHm9Ah81xWZVr8ehzsoVTnhR2r1nvdwVdJI8OxUZL60Wtn4
	 hsJlpdwpjPXHkHqWX+IshvXe/rnrZzTM5OH3D5ls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D36C9F80254; Fri,  9 Jun 2023 17:13:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C175F8016C;
	Fri,  9 Jun 2023 17:13:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB143F80199; Fri,  9 Jun 2023 17:13:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 99118F800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99118F800C8
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-777a2ef8d45so77748239f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323622; x=1688915622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQR5X+cA13kUaYcqbqMobhb9VGgmIkohulmhqJZKYzY=;
        b=FZt0riJN3LqGk3PH+J911hFdn24uQtqh3zqfSQsvlHYnjiTEsfHH4VGX7nwO4vID5m
         WTyz0zKQvSBKQDxptBiRxLX9Vv8a5PmQcIBCp8YE0+jOqvQVCRQDpoMLwdNzbSrPziFt
         4haOAhL+YQoldIXK2PikK5C45XQQpw+tBc7eTKbydA6Zxw/x1d1+L/LAG91a4IdDiQJv
         6K6hE7zZTu+t2pmTjI+P5WeWtE5UT/Pgs/J7hH8aI8WSM/Pl82CRt3hGAapKOgKXp+HD
         QpXKA6NVLSWw/yimDQnag/L04qFUH1T7NnUH+7bTAAgh1DUSclsEuQpOcNPQx2DG+mgY
         DQ9w==
X-Gm-Message-State: AC+VfDyH7o3RiYONcVPMWhRVLUJJgoRJ8B/hiOwHAtkwGtDq65aF2OgU
	JHpUAsR+Enyl9jSNclMv4A==
X-Google-Smtp-Source: 
 ACHHUZ7pPsrApmh1g6QnAT5gDqfYy+vIK4VH1grPnXE4XcsiJ/FkZ0gxKjKu7YP4yiXH0oDQiYhlxA==
X-Received: by 2002:a05:6602:1851:b0:774:9af9:f45e with SMTP id
 d17-20020a056602185100b007749af9f45emr2002777ioi.11.1686323622392;
        Fri, 09 Jun 2023 08:13:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a02c819000000b0040fc56ad9fasm1000077jao.9.2023.06.09.08.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:13:41 -0700 (PDT)
Received: (nullmailer pid 1010803 invoked by uid 1000);
	Fri, 09 Jun 2023 15:13:39 -0000
Date: Fri, 9 Jun 2023 09:13:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>,
 Dipen Patel <dipenp@nvidia.com>, linux-rtc@vger.kernel.org,
 Dilip Kota <eswara.kota@linux.intel.com>, alsa-devel@alsa-project.org,
 Guenter Roeck <linux@roeck-us.net>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-spi@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Vinod Koul <vkoul@kernel.org>,
 linux-pwm@vger.kernel.org, timestamp@lists.linux.dev,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 4/7] dt-bindings: slimbus: restrict node name suffixes
Message-ID: <168632361891.1010750.17241199360005605438.robh@kernel.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: AHIDN5XZT2SNJ3RSA423VNWKXIEE466V
X-Message-ID-Hash: AHIDN5XZT2SNJ3RSA423VNWKXIEE466V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHIDN5XZT2SNJ3RSA423VNWKXIEE466V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 May 2023 16:48:48 +0200, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/slimbus/slimbus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

