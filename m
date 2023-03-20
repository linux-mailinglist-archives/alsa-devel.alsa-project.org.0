Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5616C1AB0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 16:59:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFAC91E1;
	Mon, 20 Mar 2023 16:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFAC91E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679327951;
	bh=voqPPQsCdCuFgE81/uBRMkNRxxyuYSo5DQoAxdVimsE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jpc2+s4j0mTuIli2RYcFnCGl13M+CbfVfeCv1UdHTDIimlCjlArOWOTTq2jEuHXht
	 jetEVc/UUTQAStui83isAiViel6oPUxdybQy2FZn5jaNVQHrC1cWZwuyinXGjdjWVP
	 OdhzgoQuP1zl6ba42CsmuzxIbfAtKdXJWG6hJw8c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D569F80254;
	Mon, 20 Mar 2023 16:58:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 560A1F8027B; Mon, 20 Mar 2023 16:58:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC659F80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 16:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC659F80105
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-177ca271cb8so13512142fac.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 08:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8X5XJu7ZSmlXWJv7df3tWmayRZwNJIjgct+jX9CNF4=;
        b=nYZk18rY+JM6jvWVx5Tdimad7CHXQD82476bj3ab28EQqcd++kBHFoFNK236qz6Z5x
         bQUBkF79prht8XOkT13gMnl9397Eco7CI/0jGrCF49uz2/jm28FfoFhuyExPhVZ6RwVB
         5K7e9vpGFgbm1T8hjOiVGsJ+ts8cM1kEC597n5fxV+1ZDmY3P1Z9cTPje4nP0J16tzp6
         XlZepeSfZkJRLMu298r90vGgz45cR3QrobsXrq4sXM0lQ1N/8pVieJ974zAArNLvafyL
         cDZuyloUEVOBFHYs73iR90BLnuiBtX3/76VnntRCX3US2EHg7Xg5nEMQnDZmjJ0O9DJO
         jk5A==
X-Gm-Message-State: AO0yUKUshy15/Awfgse+OZp7ZytDXMagmzrNl04auPzm7H8dvpyjzJDJ
	UztaH+dPfrMU8kwpy+M51Q==
X-Google-Smtp-Source: 
 AK7set+FJqchAKh3aLkpaCyRS9ncCPb0CGLyZPm8rjBj3cImE2bhXeW/GwwFgbDKATBHmsueXL7IhQ==
X-Received: by 2002:a05:6870:7085:b0:17a:d1e6:5a09 with SMTP id
 v5-20020a056870708500b0017ad1e65a09mr5356989oae.59.1679327893498;
        Mon, 20 Mar 2023 08:58:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 vk10-20020a0568710e4a00b00172426ebe58sm3388588oab.27.2023.03.20.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:58:13 -0700 (PDT)
Received: (nullmailer pid 1758791 invoked by uid 1000);
	Mon, 20 Mar 2023 15:58:12 -0000
Date: Mon, 20 Mar 2023 10:58:12 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <20230320155812.GA1755078-robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
Message-ID-Hash: HNKJ5XDL7M2CDAKFMIHSFZEUK24IYSR6
X-Message-ID-Hash: HNKJ5XDL7M2CDAKFMIHSFZEUK24IYSR6
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNKJ5XDL7M2CDAKFMIHSFZEUK24IYSR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 17, 2023 at 12:21:41PM +0200, Cristian Ciocaltea via Alsa-devel wrote:
> Date: Fri, 17 Mar 2023 12:21:41 +0200
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sudeep Holla
>  <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
>  Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
>  <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
>  <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
>  Brown <broonie@kernel.org>, Nicolas Frattaroli
>  <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jaroslav
>  Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley
>  <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
>  <aou@eecs.berkeley.edu>, Daniel Drake <drake@endlessm.com>, Katsuhiro
>  Suzuki <katsuhiro@katsuster.net>
> CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
>  linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
>  alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
>  linux-riscv@lists.infradead.org, kernel@collabora.com
> Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
>  dma-names order constraint
> Message-ID: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>  Thunderbird/102.7.2

There is something strange going on with your mails as there are 2 
copies in the archives with the 2nd one getting the header twice. It's 
coming from the alsa-devel list.

> 
> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
> > On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> > > Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> > > dma-names properties") documented dma-names property to handle Allwiner
> > > D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
> > > the reverse of what a different board expects:
> > > 
> > >    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> > > 
> > > A quick and incomplete check shows the inconsistency is present in many
> > > other DT files:
> > 
> > Why not fixing the DTS? The properties should have fixed order.
> 
> I was initially concerned about the risk of a potential ABI breakage, but I
> think that's not really a problem since dma-names is not directly accessed
> in the driver and DT Kernel API doesn't rely on a particular order.
> 
> If there are no objections, I would switch the order in the binding to
> tx->rx, since that's what most of the DTS use, and fix the remaining ones.
> 
> > Best regards,
> > Krzysztof
> 
> Thanks,
> Cristian
