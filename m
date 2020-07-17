Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3C223BF5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 549401614;
	Fri, 17 Jul 2020 15:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 549401614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594991367;
	bh=O+k2YaU8/mVBg2IiDfHFTu7RarTP1cDo7qnJs+ZEmac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcDqOpUixtg0wf0qGq7EwmKmq9cECvA7zDfvPE6XkEBXmi592vH2QAo1sdbQY3rzl
	 pGM49tq1LaDR+ku2nshjTiDMbzilYlPn6S2e04sd9XMMnpDPSjcspfmoXI5kkmxtEk
	 zlid7X/27C5YBUitrLD5bcydI5flmsBLngrQQAoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CAEEF800E4;
	Fri, 17 Jul 2020 15:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11563F80217; Fri, 17 Jul 2020 15:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1B99F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B99F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com
 header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ZcpCVdZK"
Received: by mail-lj1-x242.google.com with SMTP id e8so12579498ljb.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=a1qhOLKVmgbDxWR7DsBGPKppiVIcs98dPPN7Z4vRK7U=;
 b=ZcpCVdZKMBTqfoayJtQADEX4zVTHWV2yxNakXh3yLSNrzebl3aH9tjryPIXyI3pz6I
 E2E3jnn6/nLLS3nE0S8SBL5EhIZybuDyrLJ8SHFAg3d1SuO6BRbnY4H8ODY14ZMIU6aa
 bmcXjLAzlncoRVHBH7XYqCt9t74/Qwj97l1fL/lhjkcXd/1k+4HwapoaSSbtq8rreAwQ
 WqOP7vcgpQxfnV7i318A74jitSFLb1wO1WK01FmDR/P5sCd/VDuBBd+k8ePw7372X/j7
 NIMH0Ym89cWouqdU8y2johbuaT26g3FYSTo0/3PXJ0Rfvj5tHrIEK1PSDeOM+hO3S/s6
 CNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a1qhOLKVmgbDxWR7DsBGPKppiVIcs98dPPN7Z4vRK7U=;
 b=qghtZhsUchM79FRfOCq9KHOansQsWQAgJcZQlwQVb2Cp260stqCVShPntCP0UTr3Qo
 WwqhNLcTeE9r6l91WZGbhryrsErc5922LdE8RgDNol0Pxy5DqozKta1yXBb/xPC/Ij6f
 A7w2ymYEtPEx8B7XhMTjkK4kLpG/uBi8Ir/8k9CBtxtA3Vz1C5L0TvBPuPBjj72HKDAj
 WW8UOZ3khn2dnn4m1lPyxf03zw1/cvZwb/q5ZNNSInxvvMxfrEY67pHc3zWKGeoxD/zZ
 Dzix6aNHciInYsNm9TAtFAI5rWhztix1wp4D3rL2QBYhD/IZJO79S9C9sOY8kYnaL7hn
 UYPg==
X-Gm-Message-State: AOAM532l48L6LE3TTE3x+F26CEguvMdIlPZmYd0+66qVArnyEtEmiE1F
 wCHfvAeg+y2LbbtgNDjeq9cw+w==
X-Google-Smtp-Source: ABdhPJzV0BbOtpw7WhJztEZ51jWAX1HJ1JFIJz6hmBPOoJG/oR+b2KfjYZfEVEra0G7K6n1rrFZL3Q==
X-Received: by 2002:a2e:8047:: with SMTP id p7mr4660529ljg.414.1594991252832; 
 Fri, 17 Jul 2020 06:07:32 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id k25sm1651300ljk.87.2020.07.17.06.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:07:31 -0700 (PDT)
Date: Fri, 17 Jul 2020 15:07:30 +0200
From: Niklas <niklas.soderlund@ragnatech.se>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 17/20] dt-bindings: media: renesas,vin: Add R8A774E1
 support
Message-ID: <20200717130730.GA3976796@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-18-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org
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

Hi Lad,

Thanks for your work.

On 2020-07-16 18:18:32 +0100, Lad Prabhakar wrote:
> Document support for the VIN module in the Renesas RZ/G2H (R8A774E1) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 53c0a7238bac..4e0de280c1e5 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -40,6 +40,7 @@ properties:
>                - renesas,vin-r8a774a1 # RZ/G2M
>                - renesas,vin-r8a774b1 # RZ/G2N
>                - renesas,vin-r8a774c0 # RZ/G2E
> +              - renesas,vin-r8a774e1 # RZ/G2H
>                - renesas,vin-r8a7778  # R-Car M1
>                - renesas,vin-r8a7779  # R-Car H1
>                - renesas,vin-r8a7795  # R-Car H3
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
