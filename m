Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402DE8839C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 22:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EEC1616;
	Fri,  9 Aug 2019 21:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EEC1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565380819;
	bh=+MEHV6XtDuKbLlhEKuuIsZcmVE4I6rVtwUnATClPDew=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6rJe25JQW8W2tm/ISRC6TSBEFvA3cP0TsrFi05C2hAC0KtQelF7C1hFSX8RHMoQQ
	 yAs4JTcXCJs0Bv+8x3PpvdLIwt43h/0sUkuC7VAUz6I/K5uEyvb630IZOwfk1x7PYZ
	 T6p+A19fVYh5iqJeqP+MthIJKOjU4gh6ioiFSAWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B12F804AB;
	Fri,  9 Aug 2019 21:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 970EAF803F3; Fri,  9 Aug 2019 21:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODYSUB_1, RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BACAF801A4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 21:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BACAF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Kw+oLUAx"
Received: by mail-pg1-x543.google.com with SMTP id z14so9120632pga.5
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VCbCImaeM8b+lSq9b5GdAInVj6FUq3y4HZVgqjfUX78=;
 b=Kw+oLUAxF2xxa7RFNdoD7DmGpocjBPvMlHmmMmL5/etDe1Tt38kDjqNzn7BakcQozY
 hxSEPjM5Xm9RuXFZxikLSc712ri71mgNhwqMMCfZECvg5XFueWEjk+QBrjlJqvawY89w
 JVi+SILsovZ742bj7b6ctTI7RqJOMdc4N+qSmLINodL+CqdxPpFQyba7Dg1Veo8nxy89
 5g0lAZJkfGMsJi3MVaA71iAXyKgO2eo2fEe86jSPJzumEk90NqF1r35J3lhndVRigHvI
 1wfTydffNCtLrzfblDWprgfw5q82Y2pJpWtoln7iVuuKmCKAVE/ptSi3kvI9LiUpPOvW
 Ihig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VCbCImaeM8b+lSq9b5GdAInVj6FUq3y4HZVgqjfUX78=;
 b=KWwxktbfu9uhZrgU52ynfjcnmp9PQ2j1EcWbrji5Pf+7ED1OodiRMCKCIadV7flMg/
 DfIX6hbh0W0RAVWx0/wYG1S8ppN3/alWUMw/iJKIq/qLvMQPswddD6RZ9clpvXqbkW9W
 RBCyRt8kkL6koNbyt+FDFDwU2bsV8ZCcSygw3ev+rOIaGbcvPCjUK5sOzt51qNVfleGT
 xnaAfN/PJx5gqhEJdf/8/IXXHqpPynJhtrDQdFCjkA3Ui7117vNa/GP4MYcestQYX1RF
 ll/H6vMmuKsz4ovPf3BfyXfkcFukkzT+VLTokUwiohHwpHCy8WKHT0nhOyH2ULafBZuf
 dJHA==
X-Gm-Message-State: APjAAAX0ujcb+mZN4D7M3qCsT57U1yKlVQOrkhGGBzqk/YbbhSAvCSP6
 AI0Yk7MGjF5yosETMvtVp0s=
X-Google-Smtp-Source: APXvYqwr8vYcmauTzmL6JZ6snH2j18Lcbrgl3NoEzcj7F6farIZmKNhOtBqj2Vm5a48ynNus84SThw==
X-Received: by 2002:a63:60d1:: with SMTP id
 u200mr18948265pgb.439.1565380707327; 
 Fri, 09 Aug 2019 12:58:27 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 f197sm97530357pfa.161.2019.08.09.12.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 12:58:26 -0700 (PDT)
Date: Fri, 9 Aug 2019 12:58:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190809195812.GA8148@Asurada>
References: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
 <1565346467-5769-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565346467-5769-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: fsl_esai: Add new compatible
	string for imx6ull
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

On Fri, Aug 09, 2019 at 06:27:47PM +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx6ull-esai" in the binding document.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  Documentation/devicetree/bindings/sound/fsl,esai.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> index 5b9914367610..0e6e2166f76c 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
> @@ -7,8 +7,11 @@ other DSPs. It has up to six transmitters and four receivers.
>  
>  Required properties:
>  
> -  - compatible		: Compatible list, must contain "fsl,imx35-esai" or
> -			  "fsl,vf610-esai"
> +  - compatible		: Compatible list, should contain one of the following
> +			  compatibles:
> +			  "fsl,imx35-esai",
> +			  "fsl,vf610-esai",
> +			  "fsl,imx6ull-esai",
>  
>    - reg			: Offset and length of the register set for the device.
>  
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
