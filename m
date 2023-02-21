Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BB69E3B3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 16:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141999F6;
	Tue, 21 Feb 2023 16:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141999F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676994005;
	bh=R9W6HqiVHsrjF1RU+tlpLlA39EKCAaqRtbz3vg87kzE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mO9Hhgpshf7+A1HIGNc2wIshVVI9fwIQI1YttjZ0HHhp6fEcqipZLc0t4kP90f6h2
	 BKjV5Rb6KEqxcbfJ4VPDOFarj6qcs2v0FpErW30R7AE09LBpRoAGalTp5et/AFZo9U
	 TH8zPKtvnMopbzbgaeATcn6PXrN7qGFwRQwpaXsw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7882AF8025A;
	Tue, 21 Feb 2023 16:39:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64ED9F80266; Tue, 21 Feb 2023 16:39:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06BD9F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 16:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06BD9F800B6
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-17211366c6aso5400394fac.13
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 07:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbiwxMfcRltjaWYCCfS3va2vMzxTOwRyWLGnK7Gq26M=;
        b=lOKie4qKHkNSeqB2Ke+IyoD+22iQHBfxca3lqXqWPGjWzE5+LSyc4dcEVX7nmgjCIZ
         Z0TCA2yvZ9Qm6I7yVhUghPGMbq18ZihhqYiiYr/iT7nzeTWDEvR/eMLCHAf88sYs+JDr
         PSlQC/vPStT2WDU888txEiYGt7Z1mH9BCc/RZUzEhSm8In5LSXkvIpqkmcrxtJQwPz1a
         iXAyk++cYDAfYlLWw1MH1kFHXa8tAkN5+LBbmArsBr1BieaEB7IKgnJkWv1hhrhUzifb
         4MsM0OE7f7NNSNI0gdsGAtBiDK1GLeCd38J4nK6m0Q0i5fXWa59IG5pxu1wMAsvp6aK5
         3tlg==
X-Gm-Message-State: AO0yUKVSQ0zfyv3e1Z6quoF8WfUto9+Ycb7yj6WK9mq0OClWFk22N9O4
	VyuGjVfliRAFeuhbOSoHMw==
X-Google-Smtp-Source: 
 AK7set8Ws8xnnT40ibyA8bO3Dnc4X2y8bRJMZ9QvlUgPMFmltBzRXAQCMw82YcywMAJU4nhRgIj4XA==
X-Received: by 2002:a05:6870:5628:b0:16d:fc22:b520 with SMTP id
 m40-20020a056870562800b0016dfc22b520mr8213547oao.54.1676993941109;
        Tue, 21 Feb 2023 07:39:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 s131-20020acadb89000000b0037fcc1fd34bsm4335872oig.13.2023.02.21.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:39:00 -0800 (PST)
Received: (nullmailer pid 2583407 invoked by uid 1000);
	Tue, 21 Feb 2023 15:38:59 -0000
Date: Tue, 21 Feb 2023 09:38:59 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wlf,wm8960: Convert to dtschema
Message-ID: <167699393653.2583308.15571733878236882240.robh@kernel.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 5HBYN3BAE3FN6NJDCOXNDC7DR76432JV
X-Message-ID-Hash: 5HBYN3BAE3FN6NJDCOXNDC7DR76432JV
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Randy Li <ayaka@soulik.info>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 - <patches@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HBYN3BAE3FN6NJDCOXNDC7DR76432JV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 17 Feb 2023 16:06:25 +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM8960 audio codecs bindings to DT schema.
> 
> Changes against original binding:
> 1. Document clocks and clock-names - already present in DTS and used
>    by Linux driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> One DTS warning still remains:
>   uniphier-pxs2-gentil.dtb: wm8960@1a: Unevaluated properties are not allowed ('port@0' was unexpected)
> 
> I am not sure if this is correct usage of endpoints. I would assume the
> codec should be used only as DAI.
> ---
>  .../devicetree/bindings/sound/wlf,wm8960.yaml | 88 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8960.txt      | 42 ---------
>  2 files changed, 88 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8960.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

