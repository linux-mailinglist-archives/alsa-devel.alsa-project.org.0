Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2762000B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 22:00:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB3383D;
	Mon,  7 Nov 2022 21:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB3383D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667854835;
	bh=VcOIl8dfyYQVLRwochNLajHtFj1vKibu7lHYxV04r1g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EPT5bSCQXu4Z73Z2h/1TUrlw1rqhB2MiUCFxIMS6XWsTCC4AWOS7+0II6WFWgQbdP
	 LKnLr1zRTAR5WSfo69Vw4C0hqj6OZS/ZOcNIiuqo4fvg3KGTBeV1up4125DOLRWh51
	 oPySBRF/cDgH2fbASI87Dwvqje8Js8D1CjVbQbtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF04EF8051D;
	Mon,  7 Nov 2022 21:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32559F80116; Mon,  7 Nov 2022 21:59:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E185DF80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 21:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E185DF80116
Received: by mail-oi1-f182.google.com with SMTP id s206so13529951oie.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 12:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSsrB01My6g9QYcmfs7/ZhIGfEUKhxSboHf5LKdUgrg=;
 b=DTpOcqUV2ViBtI7YlM+YMJ0/7DR2mG+KBE3jkJUBKkmyHayejkmYFWZn72DPylbsyl
 C5BJ6Kbdagr7seM5pvxZMS/zrIhyQ4mgG7tYRp6tK+BqoXXJcsWZukvj8cr+2XYCQt7L
 7moLnZ4hf2cltmMb5S0XO9sOFH5jijJyJ5+Ev//dy37wxLfTMHwZCCKTYL25z9646826
 j6XALQlbnbejov5u45NdxYlUK6H9hKi+kKxYBo1fCIh4b3jLJ4F2EsRtyy43V8KNoNlN
 uaJGIGYPf7g4BGJGSMLDxBrs82vVED7CFXD7LJ2KqHrKdis2PVDA3EYnUSG7Yc85n1iW
 d8YA==
X-Gm-Message-State: ACrzQf07LY30ja87ZbhcK9NMOZ+6caTl0qKYWnt0UEgZCoXCnHiUOQ0O
 tJwZPVYqC0FZbWLXEVeDrA==
X-Google-Smtp-Source: AMsMyM7l6/XnPZTppIxfhsHSoIMGr1DNsD1lZS9v+kiX6YEj73zXqqDi/miZIkEEn9QxflIXa/5+wg==
X-Received: by 2002:a05:6808:ec5:b0:35a:640b:8e68 with SMTP id
 q5-20020a0568080ec500b0035a640b8e68mr9998568oiv.138.1667854774140; 
 Mon, 07 Nov 2022 12:59:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d23-20020a056830045700b0066b9a6bf3bcsm3333939otc.12.2022.11.07.12.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 12:59:33 -0800 (PST)
Received: (nullmailer pid 1620012 invoked by uid 1000);
 Mon, 07 Nov 2022 20:59:35 -0000
Date: Mon, 7 Nov 2022 14:59:35 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: fsl-sai: Use minItems 5 for
 i.MX8MN clock and similar
Message-ID: <166785477284.1619920.12812851380647033618.robh@kernel.org>
References: <20221104160315.213836-1-marex@denx.de>
 <20221104160315.213836-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160315.213836-2-marex@denx.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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


On Fri, 04 Nov 2022 17:03:14 +0100, Marek Vasut wrote:
> The i.MX8MN currently uses "bus", "mclk0", "mclk1", "mclk2", "mclk3"
> clock, which adds up to 5 clock total. Use minItems 5 for this setup.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> To: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
