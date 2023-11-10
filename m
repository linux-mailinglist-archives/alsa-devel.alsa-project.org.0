Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5447E8443
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 21:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C9682A;
	Fri, 10 Nov 2023 21:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C9682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699648974;
	bh=rougps3MFp2nfuLYNApjAZo+o+h5vwqjuQOQIWoWmbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k8WUhQnrOl/vqQW5DOa9BkXyw4+ZCHGTliolBno8A26oqf1JC2V7PjZprFbrq1iwc
	 m8ZfjX2M/W+Uk2WxVWbvojjDMoQI0CxXLpS7qDxVBI/l0Q2uNPuDUrLK1gkP365K2l
	 dT1E+QpWLBsVI1jrHcZZklhy6VIbgV576LYhJE/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70D60F8016D; Fri, 10 Nov 2023 21:42:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D50DEF8016D;
	Fri, 10 Nov 2023 21:42:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBADCF80549; Fri, 10 Nov 2023 21:42:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7817F80166
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 21:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7817F80166
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6ce344fa7e4so1449614a34.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Nov 2023 12:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699648917; x=1700253717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EBl5Xv3aZC1B/CoCuf5eLNa9yKY/Gkw4iwanxopftw=;
        b=noDt2qwGs8nlai/h186U4HNUtdAytheb4xp2Lysw+gmdzxL5o41ngXiiWvBPTZXI9X
         N8SrENdnl6Ge2lUAEYtPH3TeNNsPvs2Zw8P6xhEOaau0i6hILFeRDtWx9SDj0eDT58OZ
         myd0BxOgrsn0he/Zqb5d+xj0gheOAi61Vwdl8+kl912YSqeisq4jnqwwL9ZcaZlWgv3e
         Y1M1RJcNqvJgu3+bPT5n5qOCwQas05A3jHjw45HJL9LaEPcxTiQXsI6KWOMYCRJ5/NuI
         m6g/rWcZzp/0XauK1g9F3XX7+q3TsXwEYmK3hCwft3ggjDZ3l5AK/XvrarVkNSTvTHp+
         Oxww==
X-Gm-Message-State: AOJu0Yzp0a10n6CoEeuwUx3w8aMTz7u87MpzJF04IKKd9iNiOzwfOee6
	MY/VeiV0O7mdg8UEnOqkVn0odQnDlA==
X-Google-Smtp-Source: 
 AGHT+IF1/xoVIE1AxHEqioWJNWInr5h1m1P3hdrpoBOInT7vjcfYXrW2+GFkkUSryqGVJF7HdU+emA==
X-Received: by 2002:a05:6830:1302:b0:6c6:3ea5:cdbe with SMTP id
 p2-20020a056830130200b006c63ea5cdbemr259082otq.18.1699648917500;
        Fri, 10 Nov 2023 12:41:57 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a056830269300b006ce2fce83cbsm52548otu.25.2023.11.10.12.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 12:41:56 -0800 (PST)
Received: (nullmailer pid 396513 invoked by uid 1000);
	Fri, 10 Nov 2023 20:41:54 -0000
Date: Fri, 10 Nov 2023 14:41:54 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-rtc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>,
	linux-serial@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>, Conor Dooley <conor+dt@kernel.org>,
 linux-i2c@vger.kernel.org,
	alsa-devel@alsa-project.org, Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Figa <tomasz.figa@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 09/17] dt-bindings: gpu: arm,mali-midgard: add specific
 compatibles for existing Exynos SoC
Message-ID: <169964891433.396452.11090809203947265672.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: LHB4XCPT63AZUJKZVSMZBQZNA2V2OTHF
X-Message-ID-Hash: LHB4XCPT63AZUJKZVSMZBQZNA2V2OTHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHB4XCPT63AZUJKZVSMZBQZNA2V2OTHF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:35 +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

