Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E3FD02A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 22:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD1181616;
	Thu, 14 Nov 2019 22:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD1181616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573766070;
	bh=uhDOirBhUKB5t2g2osuw4ane1ehrEaG6CT/yW8v6jCU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLbxj4X933SUbIrkTMSQx0TigD7WrFnQWqGNTPnuqA7nSMbMJ/LANFCoXBpv86dia
	 Lg/+zLsFM9ZX8EevWjTgTh0XEt+pDj7vN8KBekAk3r+X3A6ugXpX2V3sKAFohki0Vq
	 IrQ4m4kp6gwMhNjuGWOQxEawZXpJoskq8tfEi6f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D151BF800CF;
	Thu, 14 Nov 2019 22:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36CC7F800CF; Thu, 14 Nov 2019 22:12:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EE89F800CC
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 22:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE89F800CC
Received: by mail-ot1-f65.google.com with SMTP id z25so6174872oti.5
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 13:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zvJ3vYdB8JByuq1iptWHcxe6mCz9VbGiKAhz94z7Jjs=;
 b=SKe1s1hBtfS2wCCJk8uOy2XGE4vIJFywk09eMYHXNSIMb2qPZ9Ck2MB/wkVQnlIuhY
 8mreYUbsn1XqD79wtdCxTSt04K4h5qQkyL8gLj2byxm1nH5T3QtRs2IFjWRcSoogrJKk
 1gGZ5PhEQJmOHPLi8o1Fg6SpcGXFKgxWfSVJ55keEP/Ia61GymaE+IVg6oMH4qJmpVED
 hF2iABVGUsuDuAGFJ5c70Gj5ILDVx7r00X1FcGR25dw9UupwpSdppC6QLTC5M0EmgTBs
 ZZZgUmR6RJAX8QTR+zxmXSgP/XuckTRpx8qs/YrOglR7vK3YQ8yDMKCETb1ggHmbKzTt
 TaBw==
X-Gm-Message-State: APjAAAXQbbOoPt5pdIFvNf41nGBIS8sviWm6mEv2p3aCHHg2nF5qtBE2
 QX2FrkoY6X+GD4FMselePQ==
X-Google-Smtp-Source: APXvYqz8E8q2ODWg7w9RAtKtDXpxQsWSKNIjjna819fVptPrU8ODwyU1Lli9pn6nDszkJRnxfqhL5A==
X-Received: by 2002:a9d:7e8a:: with SMTP id m10mr9243800otp.180.1573765959077; 
 Thu, 14 Nov 2019 13:12:39 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm2171825oti.49.2019.11.14.13.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 13:12:38 -0800 (PST)
Date: Thu, 14 Nov 2019 15:12:37 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191114211237.GA25375@bogus>
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V3 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 05:18:22PM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx8qm-asrc" for imx8qm platform.
> 
> There are two asrc modules in imx8qm, the clock mapping is
> different for each other, so add new property "fsl,asrc-clk-map"
> to distinguish them.

What's the clock mapping?


> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> -none
> 
> changes in v3
> -use only one compatible string "fsl,imx8qm-asrc",
> -add new property "fsl,asrc-clk-map".
> 
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index 1d4d9f938689..02edab7cf3e0 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -8,7 +8,8 @@ three substreams within totally 10 channels.
>  
>  Required properties:
>  
> -  - compatible		: Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> +  - compatible		: Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> +			  "fsl,imx8qm-asrc".
>  
>    - reg			: Offset and length of the register set for the device.
>  
> @@ -35,6 +36,13 @@ Required properties:
>  
>     - fsl,asrc-width	: Defines a mutual sample width used by DPCM Back Ends.
>  
> +   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
> +			  by imx8qm/imx8qxp platform
> +			  <0> - select the map for asrc0 in imx8qm
> +			  <1> - select the map for asrc1 in imx8qm
> +			  <2> - select the map for asrc0 in imx8qxp
> +			  <3> - select the map for asrc1 in imx8qxp

Is this 4 modes of the h/w or just selecting 1 of 4 settings defined in 
the driver? How does one decide? This seems strange.

imx8qxp should perhaps be a separate compatible. Then you only need 1 of 
2 modes...

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
