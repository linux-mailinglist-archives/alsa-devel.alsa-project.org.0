Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1A501ABD
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11E9188F;
	Thu, 14 Apr 2022 20:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11E9188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649959418;
	bh=/hsA7RgnBle5PTH1TkHfcF0/9/zdmETBphZ8kYzZ6PA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyafBtId8wrsLCFzLCioInnFt6nYpFZhtNO9Yrkc2J5dW/Yu77ezmuuOakwzIU214
	 SrhHgTDYPieT62Vob2ApfChW5EXkt77goe8Tnt4SXDdMpRhERavh/kEChWYBo8iheT
	 Ewl8cPw6Lmfhzoz160UIRI4w/NvdUFeqkehy6Gec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 612D8F801F7;
	Thu, 14 Apr 2022 20:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37B06F80162; Thu, 14 Apr 2022 20:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80955F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80955F80114
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so6020325fac.7
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 11:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9kQY7KYrORAXRdj8BS7CtbvQFtLXKlCapss2LUGGejI=;
 b=qdnVC0S6VYyaaJvmXjGaxzPj9/8/rVvTNvOAFRTqDlghyA/Ik3EEFMEjyU21ehFGm6
 l7cv15XV2P5oAkJTe9HOaktBJAGcrrxQ3xv5dQTvYnObfH3amjcz90vJP3AEC1JSHrR7
 l56yHNPAEhUZHuDVoSTLPAd1klb/kvtTK1SNUV9vryBD9IGYBPDJjLWoAsAqvVmKjegr
 U7mEzW7aMrDaNTjM9pcPGRqlvylhEPvMXEPL+hfq5PFjY2M19oTVJLG+IOC11UQcZetp
 r1VFE+zhoS5hBeitZUR5qRoY12Rt53ebW2CooG058SzVUKb26Krl8rSGgwJp9eUUeNZz
 Jvmg==
X-Gm-Message-State: AOAM533k+tlOp8RyFpVJYYH3DwzYNiVzHCQIFV0L5LJTANFgGs7MB5/p
 IpiGiIsWzoDvvzuU767BwQ==
X-Google-Smtp-Source: ABdhPJxg/IzXLr9/pK68rl/yhXiL0WZz7ZwJQGzyFx0L13S4P88U4n2DfT3AFMuvduEA0czJc4UQrw==
X-Received: by 2002:a05:6870:c892:b0:de:5f75:d8 with SMTP id
 er18-20020a056870c89200b000de5f7500d8mr2133742oab.133.1649959349136; 
 Thu, 14 Apr 2022 11:02:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e22-20020a056870239600b000e2f0c69849sm940449oap.11.2022.04.14.11.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 11:02:28 -0700 (PDT)
Received: (nullmailer pid 2320842 invoked by uid 1000);
 Thu, 14 Apr 2022 18:02:27 -0000
Date: Thu, 14 Apr 2022 13:02:27 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
Message-ID: <Ylhhs2hgbQg8Ugeb@robh.at.kernel.org>
References: <20220413140121.3132837-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-iio@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Agathe Porte <agathe.porte@nokia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, 13 Apr 2022 09:01:21 -0500, Rob Herring wrote:
> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints under
> 'items' moved up a level.
> 
> Cc: Agathe Porte <agathe.porte@nokia.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-hwmon@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml       | 5 ++---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 +---
>  Documentation/devicetree/bindings/media/coda.yaml            | 1 -
>  .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml   | 2 --
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml   | 2 --
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 1 -
>  .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml | 4 +---
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --
>  8 files changed, 4 insertions(+), 17 deletions(-)
> 

Applied, thanks!
