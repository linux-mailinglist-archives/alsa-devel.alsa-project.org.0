Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0E4CE75B
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 23:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BEB184D;
	Sat,  5 Mar 2022 23:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BEB184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646518043;
	bh=aKb6myEyV4DLDNkLWA65hn2oJkfCbZXNR8uiGKi60cY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=If2qxao4WlAYY+XxJPDkt7FJL1fvrFK6R5n0bUVIlejkRzpUUiys3vJiaYzKg16CE
	 jUcQh3mt9UIVPGnpNkFrTFYSjn8g2sJqvpNuPX3ojjSiWHls/T7HlnLMoo2v+hbIgq
	 967eGGMm1SuOLquq1sFB33EuxB9WwpR2AYM4QfY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12C5DF8025D;
	Sat,  5 Mar 2022 23:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC82CF80237; Sat,  5 Mar 2022 23:06:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10CB8F800DF
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 23:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CB8F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="pXV2k9Wy"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7BB3A3F618
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646517967;
 bh=r8hK9O7GWDOrBuci3LT6A/3z57WQVywUK2jujxtgGEU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=pXV2k9WycoiEsbBXj6aeiHbPfB09M7jhvPBmdzCKqFGFsBGpCYjpUbVsC0Anc/D0o
 J4pc7iRs0itOMmCAuhE6BpB4pdG8twCP5c6PczCqNo9qZaMGHq2+4JDuHxVmn//BZI
 KQI6HgVadLnz4dfTsVXeZgI3gVCscxP5qtfTA1bAtjKVP9pYiKsHW4pkibeRVW0fP5
 2xffyhC9RJY7zbpjuBVMmfUHIKgTAsfNCnoz1jEZ2d0x0WwFmLsPhZKoEaFy5R0I0x
 nqjFtms9kfguK8H+7tjYoK81fStSFQHfFuAzsQ2j3ofdwdpxQQDYIsNWjcVrky7c1c
 TF5UFIUw7tX0g==
Received: by mail-ed1-f69.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so2570218edb.6
 for <alsa-devel@alsa-project.org>; Sat, 05 Mar 2022 14:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r8hK9O7GWDOrBuci3LT6A/3z57WQVywUK2jujxtgGEU=;
 b=IReXM6ArKd9sciVl7bJVMlUYFTFRQtRNW4Y2Dyr0YQDx/Wsdo06/wMTf8CEmp0A9TF
 qDRetNJnEMFQhZq2UHNMHB2EDYb11FHG65Hcm1ovFCHlfCkOCyq8ReccuLpyY+ZDNI3x
 x0H0N9r4tk8hGN6Wi8MAKHT5VUPexEHx2h9qrv5o22pwg9vsTZ2nIQm01/TfHsZ7REAb
 72VxeICli9YA1V1vChW5zW4JYIbxwOsT/Tge95tj4daiaKANhbPNRnj1p/qFThyka2Y2
 iEoAPLz1T1MzwBxwra7RlYPI9wesrCqfeH2bE6townfDgroZvayhPsB7L8s33pxagHrD
 qAcQ==
X-Gm-Message-State: AOAM531mQkGbdIEp06UzGs1vQiKtoqsNWf4gHEcWfL5jVegrE87i8IkP
 PilT9IkyNuzUCej0f7InqefEecT2hncc7RICbnMZyQsNUGu4+FBjzSZo7VVbuD9ue5eid8O0xSu
 k7Z9cipmw6bIcdaFhqWruls+Rfugr4LzpntaRMFB8
X-Received: by 2002:a17:906:c116:b0:6d6:f8b3:cd47 with SMTP id
 do22-20020a170906c11600b006d6f8b3cd47mr4092239ejc.501.1646517967071; 
 Sat, 05 Mar 2022 14:06:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjslF+FUEkcRwcoMmxVUwk3J5/UIuEwE01ZQJAdNyMizt1aMsZPYM/4p28F52HYriTaxmKsw==
X-Received: by 2002:a17:906:c116:b0:6d6:f8b3:cd47 with SMTP id
 do22-20020a170906c11600b006d6f8b3cd47mr4092223ejc.501.1646517966857; 
 Sat, 05 Mar 2022 14:06:06 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm3248038eje.92.2022.03.05.14.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 14:06:06 -0800 (PST)
Message-ID: <14fea5bb-cf9a-b2db-10d1-0015b97ae61b@canonical.com>
Date: Sat, 5 Mar 2022 23:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] ARM: dts: at91: sama7g5: add nodes for PDMC
Content-Language: en-US
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
 <20220304181756.1894561-5-codrin.ciubotariu@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304181756.1894561-5-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 04/03/2022 19:17, Codrin Ciubotariu wrote:
> Microchip's SAMA7G5 embeds two PDMCs. The PDMCs can be used to connect 2x4
> PDM microphones.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  arch/arm/boot/dts/sama7g5.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
> index eddcfbf4d223..85a22c3a8e57 100644
> --- a/arch/arm/boot/dts/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/sama7g5.dtsi
> @@ -275,6 +275,30 @@ pwm: pwm@e1604000 {
>  			status = "disabled";
>  		};
>  
> +		pdmc0: pdmc@e1608000 {

Similarly to bindings - generic node name.

Best regards,
Krzysztof
