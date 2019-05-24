Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A057D2A01A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 22:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1741715;
	Fri, 24 May 2019 22:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1741715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558730994;
	bh=KjVxmiP8XZT4YpEa5CzA5vcoBnht6QAuFXv70b44oS0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSFYKU2osYCxbYl06CGPPcl7iWD3o5nS2IJWh7e7qXs7NgKRxM1kHKfv3RSRvSAtt
	 VsQPvi9AaTZgC6EcOsEB7K863JdJ7upfWM4P+RzdtdrsBVIBkhouRBaq8yGthWHsxY
	 KhWyA73jLVKMbCVAbDpugKoyx4dg3C+5Wuh/8xiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 589BEF89725;
	Fri, 24 May 2019 22:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE28F89630; Fri, 24 May 2019 22:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC39F8962F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 22:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC39F8962F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZMfBw04K"
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AA2521850
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558729700;
 bh=13Mev8YkM54Ft9qzcl+x5Ege3YgKV8krYwHCuAy8n9s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZMfBw04KE2lgy0GFPFtrPQRhDtq6HIYZW/+lSlMpoK2O6sn79QXl8wMbU3Uy7PPdY
 Vt7QuacZvFDMCb0WFWXOXLPao2gLk/c36Yzir93shYKu/ob+dGWrfC173uC/xV/VfW
 DFMXj8J3ayjsyR4usp2AB7J8FMYT0HpDzgdWXzjw=
Received: by mail-qk1-f174.google.com with SMTP id d10so9411403qko.4
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:28:20 -0700 (PDT)
X-Gm-Message-State: APjAAAXRdLroPqk28CyCAqgg6Jxn6GfYbmusEAfO22WsLPslrrfwKgi2
 YrCI51T/uQDFnEl/jljZrk3T0Rx/EccfdJYSDQ==
X-Google-Smtp-Source: APXvYqwFu0E2ViqG6ck5yEC45obusb6XaWVgj3mDLmugudIWnwPrUeNty9XTMypvF9XYoRSwGbANG2G8NHwGCeYqT6I=
X-Received: by 2002:a0c:8aad:: with SMTP id 42mr84475836qvv.200.1558729699650; 
 Fri, 24 May 2019 13:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 May 2019 15:28:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKX==vmpbW=EERnJHRwL-o4R903p-9p_x0abFHJjWGvMw@mail.gmail.com>
Message-ID: <CAL_JsqKX==vmpbW=EERnJHRwL-o4R903p-9p_x0abFHJjWGvMw@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Convert Allwinner
	I2S binding to YAML
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

On Fri, May 24, 2019 at 7:58 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Allwinner SoCs feature an I2S controller across multiple SoC
> generations.
>
> However, earlier generations were a bit simpler than the subsequent ones,
> and for example would always have RX and TX capabilities, and no reset
> lines.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/sound/sun4i-i2s.txt                |  45 +--------------------------------
>  2 files changed, 100 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-i2s.txt

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
