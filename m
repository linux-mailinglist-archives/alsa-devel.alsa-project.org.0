Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 509896C1AD0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:02:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D74A1E1;
	Mon, 20 Mar 2023 17:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D74A1E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679328164;
	bh=BbInalM6k8qkTBwTIXYkubqu2WQYR+0SLbrXuMX5wBw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aNNQFVGsImOdQcuwpH/e6cw/MZI4lhXUXkiAU8e15c00f9HppU96Ektoez7Xn8tGR
	 wmq5puoqnEpZaQcCDnCynufkqife/mqXvN3YLUogpEV1sngYnpWsd4mexT98EX/u0F
	 kb1T0yprRUDUlYWrPGafAz760DuLw9SJzzfbMXws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A06F80254;
	Mon, 20 Mar 2023 17:01:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A6BF8027B; Mon, 20 Mar 2023 17:01:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55F24F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F24F80093
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-17997ccf711so13560135fac.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 09:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ycdbh/3im0d0MXCRS+MVRgOfUwsMwW5wd9W+JCKfV/o=;
        b=3ZGrF29mgHSjYJuVrGGPAuoFhDiWlP//wjOIH20ClbWdoHAwj4WJ5sDwNlYsvgHi1B
         nb3L/zcpSF6R3cnx8f2Nn/K2gv8Pi7zPVIJSsqkdBW3qyXUS1gU3On09QV2Bmkl3xGbW
         nC5RCeLIGHtDULu7hfU75CgdcUqoz0+12DTBzRurdazDiG+wKQB6EEXtzh8JU6MEDpWe
         qjlnUQa4hVcpiIc1StCCy3rxVjheIQU4V6uC2zbZwnVyWAfe9EVSmpg5b0JJ1omdHuvh
         nG89ySlv+yRsdDZrFadmLFhCqhv94BjD7wIrMfliJvBGZPYtdBV1WgiqPgv0+g6v9V1H
         a1Mw==
X-Gm-Message-State: AO0yUKUwAQ55aJtgjo64OR6D1VACjC0nWdDar5xv1lfwzqAYSZtkXMoI
	zeNxm6ERgkyxZzrNsTjdcg==
X-Google-Smtp-Source: 
 AK7set+BBHYnuq6OwVL9kjgfa2qix8lcrHAvO1bkzPcA8ohY9QPJdfChG4+hLAEfhyzub/UAI84YdA==
X-Received: by 2002:a05:6870:330a:b0:177:b026:3cda with SMTP id
 x10-20020a056870330a00b00177b0263cdamr5812793oae.37.1679328099533;
        Mon, 20 Mar 2023 09:01:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 tb7-20020a05687186c700b0017630fe87e5sm3404469oab.33.2023.03.20.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:01:39 -0700 (PDT)
Received: (nullmailer pid 1764454 invoked by uid 1000);
	Mon, 20 Mar 2023 16:01:37 -0000
Date: Mon, 20 Mar 2023 11:01:37 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <20230320160137.GB1755078-robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
 <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
 <e81f02f2-e692-e4ef-1510-fdc285dd5964@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e81f02f2-e692-e4ef-1510-fdc285dd5964@collabora.com>
Message-ID-Hash: 2GQUJWG7T64PQTMC565WH2YPFEU225X6
X-Message-ID-Hash: 2GQUJWG7T64PQTMC565WH2YPFEU225X6
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GQUJWG7T64PQTMC565WH2YPFEU225X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 17, 2023 at 07:43:53PM +0200, Cristian Ciocaltea wrote:
> On 3/17/23 18:26, Conor Dooley wrote:
> > On Fri, Mar 17, 2023 at 04:54:47PM +0100, Krzysztof Kozlowski wrote:
> > > On 17/03/2023 11:21, Cristian Ciocaltea wrote:
> > > > On 3/17/23 10:31, Krzysztof Kozlowski wrote:
> > > > > On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> > > > > > Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> > > > > > dma-names properties") documented dma-names property to handle Allwiner
> > > > > > D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
> > > > > > the reverse of what a different board expects:
> > > > > > 
> > > > > >     rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> > > > > > 
> > > > > > A quick and incomplete check shows the inconsistency is present in many
> > > > > > other DT files:
> > > > > 
> > > > > Why not fixing the DTS? The properties should have fixed order.
> > > > 
> > > > I was initially concerned about the risk of a potential ABI breakage,
> > > > but I think that's not really a problem since dma-names is not directly
> > > > accessed in the driver and DT Kernel API doesn't rely on a particular order.
> > > > 
> > > > If there are no objections, I would switch the order in the binding to
> > > > tx->rx, since that's what most of the DTS use, and fix the remaining ones.
> > > 
> > > Since we added the order recently, I rather assume it is the correct or
> > > preferred one.
> > 
> > IIRC I checked around the other serial bindings & there was not a
> > consistent order that all serial bindings used, so I picked the order that
> > was used across the various allwinner boards that do use dma-names.
> 
> Thanks for clarifying this, Conor! Would it be fine to switch to tx->rx
> order as it requires less changes to fix the inconsistencies?
> 
> > Before changing dts files, it's probably a good idea to make sure that
> > the dma-names are not used somewhere outside of Linux.
> 
> Right, that means we cannot exclude the ABI breakage concern. Not sure how
> easy would be to actually verify this. Hence I wonder if there is really no
> chance to allow the flexible order in the binding..

If it changes and someone complains, then yes we'll allow flexible 
order.

Rob
