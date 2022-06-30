Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B4565357
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A414F1716;
	Mon,  4 Jul 2022 13:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A414F1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934033;
	bh=za3XO33u1yQlmTdTvdjOJgu0811DcSf+kMB3vIHPr78=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIPW3R255mXXB62StE2kNcuWdyeA0a9KxyHfmz2WlR3SgtQuQ3wRkrqMWjftnYjiq
	 54TImV4/kjwuWwYchH5SnkFY6LKB51DTL/3My51XAgGJPNliaidXHAfiT/hsVaw9Qr
	 DUs7J4M9t6uqVHoeOWI3D5YnxhI85GctXRHqZ7Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD09F80588;
	Mon,  4 Jul 2022 13:23:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83EEAF804D8; Thu, 30 Jun 2022 19:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A2A43F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 19:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A43F80107
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEB31063;
 Thu, 30 Jun 2022 10:54:35 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713CA3F5A1;
 Thu, 30 Jun 2022 10:54:29 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:53:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220630175318.g2zmu6ek7l5iakve@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
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

On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey all,
> > This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> > based boards. To make keeping it that way a little easier, I changed the
> > Canaan devicetree Makefile so that it would build all of the devicetrees
> > in the directory if SOC_CANAAN.
> > 
> > I *DO NOT* have any Canaan hardware so I have not tested any of this in
> > action. Since I sent v1, I tried to buy some since it's cheap - but could
> > out of the limited stockists none seemed to want to deliver to Ireland :(
> > I based the series on next-20220617.
> > 
> 
> I first tried to apply your series on top of next-20220630,
> but was greeted by a bunch of different warnings on boot,
> including endless RCU stall warnings.
> However, even when booting next-20220630 without your patches,
> I got the same warnings and RCU stall.
>

Is it possible to share the boot logs please ?
Conor is having issues with my arch_topology/cacheinfo updates in -next.
I would like to know if your issue is related to that or not ?

> So I tested your series on top of v5.19-rc4 +
> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> spi-peripheral-props.yaml") cherry-picked,
> (in order to avoid conflicts when applying your series,)
> and the board was working as intended, no warnings or RCU stalls.
>

If possible can you give this branch[1] a try where my changes are and doesn't
have any other changes from -next. Sorry to bother you.

Conor seem to have issue with this commit[2], so if you get issues try to
check if [3] works.

Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
[2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
[3] https://git.kernel.org/sudeep.holla/c/009297d29faa
