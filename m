Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02E17E5D89
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 19:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93567F8;
	Wed,  8 Nov 2023 19:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93567F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699469859;
	bh=umW3qB/KQzvdw4kASooGmfcu5RPiZa137z8cejRfa1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UwrMN3nxswHFh5setZVs9TVVUUhcArXhh1vaDkMfD2vhMkvBBTxnMrEgwulBTxw9y
	 zKesSknGZ0Q2NCYPNGa+IKhSNtqUcpMsHqUt0HDi3Cv4sG6xed2WpHlFnsRzfTG+wi
	 zP18KAL5VGp5IasTxuFVqSBQKsK/j8e8s4kqjYXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E44ABF80557; Wed,  8 Nov 2023 19:56:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE324F80169;
	Wed,  8 Nov 2023 19:56:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A0ECF8016D; Wed,  8 Nov 2023 19:56:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D421F80100
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 19:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D421F80100
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1e9c42fc0c9so3121070fac.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 10:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699469792; x=1700074592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0s3leUhfdCXtqd2GQERP13Q2t1M8oOeLUmcRLyKV8Y=;
        b=ltqvP37jvKl10GDtvYouAsrTSsDW8BKDyFxIsU+3l+XjbCb425oq/kJN/Tws4lAhMC
         YBkhtaq/SyATWiynPWm0A345FskK/9Y/iF8GIAEzKq+1jdFYXf3OUG/CuHdL8FZb7JXj
         8jCTsU7EW2LCcALJLrGYAhQ5/EBHqOhAd1MOP5ZvoG6IkKFoZtdSGlME6e+NluT3tlD/
         tClWHy8lOsv4D49Ls3raJ3FEP/cGVP7ybF94e+HQJrjKHgekPJOyGvExDmaZjoru/0K1
         wPhHO1Xq+I+AE2+CsVcHdqOrCV9dpeChUQqHbHWZX2JmoN3J0YtNWAcCMAeXdMtU4Dds
         NHqQ==
X-Gm-Message-State: AOJu0YyuYrnL8Ok67CFRe8svQDji1hiskt+dPfvzbnl9/RDxcp5n02lX
	XhpB8HPGzaDB1F2VZzMjmw==
X-Google-Smtp-Source: 
 AGHT+IE0mbiHvR9GjYeolkzHi9SUwOP9v8XsmJuVs9xWh9Zkn8dD1A7MBvs46KqOAxR54Xhtj5FP+A==
X-Received: by 2002:a05:6870:fe91:b0:1e9:af81:54c2 with SMTP id
 qm17-20020a056870fe9100b001e9af8154c2mr2838245oab.45.1699469792539;
        Wed, 08 Nov 2023 10:56:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 ef4-20020a0568701a8400b001efb3910402sm408267oab.0.2023.11.08.10.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:56:31 -0800 (PST)
Received: (nullmailer pid 2748787 invoked by uid 1000);
	Wed, 08 Nov 2023 18:56:30 -0000
Date: Wed, 8 Nov 2023 12:56:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-serial@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>, Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>, linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-iio@vger.kernel.org,
	Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org,
	linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-sound@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add
 specific compatibles for existing SoC
Message-ID: <169946978921.2748598.1967407376619995212.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: HIGHSE2LRZ6OYNVKEEVM3KWIOAABB5XI
X-Message-ID-Hash: HIGHSE2LRZ6OYNVKEEVM3KWIOAABB5XI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIGHSE2LRZ6OYNVKEEVM3KWIOAABB5XI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Nov 2023 11:43:27 +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/hwinfo/samsung,exynos-chipid.yaml  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

