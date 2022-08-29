Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEC5A51E5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 18:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED39C1635;
	Mon, 29 Aug 2022 18:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED39C1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661790928;
	bh=EHNP4RzQnuQOX+7RxLEAqc1syZDl49UGa8ehhKTXRQg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UU89Fo3/pn74rIlHOMNRSHbtrJqu44uuYmfNtqoDsnmp3NJcpEcb0Z3YxH2HCtimF
	 /D2QhrrT3qjMRovom/YanVq2WSYcm2fWtBh12x4nKUumNs0pUZLVeNn972kxS6icfG
	 3tCuhHPtcsKmAGNhZ9I11lV33ftXqeEqSHDkthLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B7C9F8016C;
	Mon, 29 Aug 2022 18:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06047F801F7; Mon, 29 Aug 2022 18:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2659F800AA
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 18:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2659F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDp7X8gB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B31EB81160;
 Mon, 29 Aug 2022 16:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BADC433C1;
 Mon, 29 Aug 2022 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661790853;
 bh=EHNP4RzQnuQOX+7RxLEAqc1syZDl49UGa8ehhKTXRQg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cDp7X8gBmpAOAKJ8Rlu6UmYCh/TwfAd+Jwhm1G1Jt0ADl/0+xpDQqwt1xfPELrpMx
 ldgBmtZYVf7Ppsyy3Pytt6xBmXCK6ejuba3d7PxD8NolqsJPBsZepd0w9dBLtnRFfV
 ONSDgqTK/PV84hBTcRtABTBs1RaIeKNRoOpAa3CJOPACNNqoRQ8KCvkDNT7jCAuU0S
 kb2ekjtAWyRQD1WjoPZRpVw+FP+Oe+/QVHD6QAmMR/6FyMdCw2MqByS5BbA8lB9y4G
 04a3AvVZ9ZNMS6LkZqYUQinoBzbvgdpDDaze8B1XDISXxfQSH8AviJsLmWtCdeHzfX
 fOJH30FPzz/NQ==
Date: Mon, 29 Aug 2022 16:59:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
Message-ID: <20220829165950.268433ca@jic23-huawei>
In-Reply-To: <20220829141029.GA1470207-robh@kernel.org>
References: <20220823145649.3118479-2-robh@kernel.org>
 <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
 <20220828180050.51c3e857@jic23-huawei>
 <20220829141029.GA1470207-robh@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
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

On Mon, 29 Aug 2022 09:10:29 -0500
Rob Herring <robh@kernel.org> wrote:

> On Sun, Aug 28, 2022 at 06:01:41PM +0100, Jonathan Cameron wrote:
> > On Thu, 25 Aug 2022 15:04:33 +0300
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >   
> > > On 23/08/2022 17:56, Rob Herring wrote:  
> > > > In order to ensure only documented properties are present, node schemas
> > > > must have unevaluatedProperties or additionalProperties set to false
> > > > (typically).
> > > >     
> > > 
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
> > 
> > Applied to the togreg branch of iio.git and pushed out as testing for 0-day
> > to poke at it before I push out as togreg for linux-next to pick up.  
> 
> Thanks.
> 
> > Side note. Some odd entries in your cc list...  alsa-devel?  
> 
> Blame MAINTAINERS:
> 
> STM32 AUDIO (ASoC) DRIVERS
> M:      Olivier Moysan <olivier.moysan@foss.st.com>
> M:      Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> L:      alsa-devel@alsa-project.org (moderated for non-subscribers)
> S:      Maintained
> F:      Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> F:      Documentation/devicetree/bindings/sound/st,stm32-*.yaml
> F:      sound/soc/stm/

There is some logic to that entry I suppose.

Thanks for explanation!

Jonathan
