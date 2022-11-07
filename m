Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A34620008
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 22:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BF711E4;
	Mon,  7 Nov 2022 21:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BF711E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667854803;
	bh=XabUvGBIqm3CDhhHutWf49hF4et/MhJA2SajSs8rZJ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uym8G0WdTT56y7NVVQ4Mq4JULZ59lEZGonGZ6lpTAZthrHNBQtGeW32Pb2Yeqi9xX
	 FL0QeNHZu2GZdfRxZlRHcNl3glnzBOgFRfczpYfCMAAUhpG2SL/uTw2EyrTlZwcbo9
	 HZplkxPCIJ9p8I9ysYCOsy6tBt2nZyKDAW2iZXfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C5AF800EC;
	Mon,  7 Nov 2022 21:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEDFEF8025A; Mon,  7 Nov 2022 21:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03919F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 21:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03919F800EC
Received: by mail-oi1-f170.google.com with SMTP id n83so13497126oif.11
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 12:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mVNrung5eCU1qzEWaHk9EuxUpbcR8g5igR2oSV8CxQ=;
 b=sGnwgnZKxwbelcfCi9Z8oH5BH52++RTtxKJ8DqtiHqbDDICmUtGnoftGKL44Sfg7Mg
 R6z+nZHG7lWgoPoNWFj+fmmkUZ3J/JamQCOa0Jt+mzfgJQ1XcqRO8DgQt3+IAnX4065p
 LRTR4+Oj25vuXj4iY5IUBoFFPN5BtMp0FsEnqR8yTU/n/tJr0uOwCDppD67/+bL5KagG
 oYAmqQIk0f1AZRYRpXN2MqetJkeWKD9x9RWog+qOpOSfKAj3u4WAZD4xz2qhY9mClcBf
 YwH2l/5OFy2aOOHyOKAX+yMVDWxxl20s1ZiMuAM5YQzPNXkOHTJmt6usME5RxXu0EYLt
 VGMQ==
X-Gm-Message-State: ACrzQf3SOZI5Uraum2AT5z+zRD8jXxTbbNFtTZ+9PYxelERU9xHD45mF
 soi3UPPfpZWixUNM6TqxGA==
X-Google-Smtp-Source: AMsMyM6C6shHRGICMuvhGQCJXqcxBXca0M5mUt85+eWtDAZr79ZQPVSIYadW/siNSLjiBSuudEhi1g==
X-Received: by 2002:aca:2214:0:b0:35a:2a69:3372 with SMTP id
 b20-20020aca2214000000b0035a2a693372mr566297oic.49.1667854740134; 
 Mon, 07 Nov 2022 12:59:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x66-20020a9d20c8000000b00661a05691fasm3299485ota.79.2022.11.07.12.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 12:58:59 -0800 (PST)
Received: (nullmailer pid 1619291 invoked by uid 1000);
 Mon, 07 Nov 2022 20:59:01 -0000
Date: Mon, 7 Nov 2022 14:59:01 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d
 compatible strings
Message-ID: <166785473882.1619202.3198282596257102094.robh@kernel.org>
References: <20221104160315.213836-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160315.213836-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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


On Fri, 04 Nov 2022 17:03:13 +0100, Marek Vasut wrote:
> Describe existing used combinations of compatible strings on MX6UL
> and MX7D, which are backward compatible with MX6SX. Add the missing
> imx7d-sai compatible string which is used on i.MX7 .
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
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
