Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4C69D691
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 23:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F2CEAB;
	Mon, 20 Feb 2023 23:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F2CEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676933830;
	bh=WJuNqd+dhqX9uwfgyqU5mqT9A7/qaoAIM9C2gthWC3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6TJ2nMqTlhbpamQClJpuH2kKvICZL8nwmdm7a0AUrRAY0FUagh97Ny5TBhIXemML
	 nkteRB/lvHFKfCIAa0nN6yLaE5Zjrz2w+15LyqAoX6xULRiG1r25CSTrZAHxPUl9Ox
	 0iQ6iuFPtbcUyNKKECmxuoiV2F363/s2ySAL05g8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21691F8025A;
	Mon, 20 Feb 2023 23:56:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CA57F80266; Mon, 20 Feb 2023 23:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12A1EF800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 23:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A1EF800BA
Received: by mail-oi1-f179.google.com with SMTP id w7so2569677oik.13
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Feb 2023 14:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYGFpd9GU+JENPbJLudnhXGQHElorftzXREixJ5gOhw=;
        b=Neg9Rzz0zFh1d/BPviThCL+wWKx/cQMJcxZ1pDkuSv0hjiyodiUgMZaqGCCAnW+I8b
         B0akmb9ua0mS3dxNU20qLz/jQsUvmI0QwSr68wt5ap7jYYba3nK3cgTsUhVhDN+3Dfqq
         039a8QovfwequgjPcX3CWx2v63TY2DfA5SLFADO+7Xz0jARBUhiI+GY0nLC8ODoO2F8D
         1P/mHD9rycVFIHkLvB20W+iGTnVw8kER4uiqb22s83dWNb409NDgEXrQmTG+8AAPHzkc
         +5nCooQQM5BCxZ97yE+OI1e1SWIysd1fx3vmdjN0TwDlpZP1dn3rFdG9GYZICBv6Zp7w
         wDbw==
X-Gm-Message-State: AO0yUKWSu9nBCyW4zQRBjdMKSD6bgv9J5B4KqAQwg1bmCkYzPy/2fU3F
	3MwhmIz+HgDsWV4jJ8rlIw==
X-Google-Smtp-Source: 
 AK7set9Q1vDIBcq1JTQXLqThjuKC6KcYB16w6rpvFlIrUVN587KknWRoNx9iYitO8c5mHuJfPQqe2Q==
X-Received: by 2002:a05:6808:3c8:b0:378:5987:6dc9 with SMTP id
 o8-20020a05680803c800b0037859876dc9mr5134784oie.9.1676933763064;
        Mon, 20 Feb 2023 14:56:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 p84-20020acad857000000b00378ce4197casm5382660oig.8.2023.02.20.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:56:02 -0800 (PST)
Received: (nullmailer pid 548521 invoked by uid 1000);
	Mon, 20 Feb 2023 22:56:01 -0000
Date: Mon, 20 Feb 2023 16:56:01 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Message-ID: <20230220225601.GA545317-robh@kernel.org>
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
 <20230217124151.236216-3-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217124151.236216-3-claudiu.beznea@microchip.com>
Message-ID-Hash: IHQXLRU372CCTOHSW6LA4R7WK2WQ36KV
X-Message-ID-Hash: IHQXLRU372CCTOHSW6LA4R7WK2WQ36KV
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHQXLRU372CCTOHSW6LA4R7WK2WQ36KV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 17, 2023 at 02:41:50PM +0200, Claudiu Beznea wrote:
> Add microchip,startup-delay-us binding to let PDMC users to specify
> startup delay.

The diff tells me all this. Why does this need to be per platform?

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> index c4cf1e5ab84b..9b40268537cb 100644
> --- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> +++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
> @@ -67,6 +67,12 @@ properties:
>      maxItems: 4
>      uniqueItems: true
>  
> +  microchip,startup-delay-us:
> +    description: |
> +      Specifies the delay in microseconds that needs to be applied after
> +      enabling the PDMC microphones to avoid unwanted noise due to microphones
> +      not being ready.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 
