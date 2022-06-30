Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1E565358
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E625F1744;
	Mon,  4 Jul 2022 13:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E625F1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934048;
	bh=XnqbZx4oyHNA9xYpCMYfEYtkafp3k3excI9lAyG52Rc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qcEJDCM1feUUsZrezdHj3teKaaU3ZJHARnpKmN/zgFlBuMRmJR1GTurBjkVnP1ZBO
	 4BUHvY+oUsXvLzuRImtF1M/TaIAHqdhu+/vSQczlczO6eBYKQHKb+SVbbvzlWhIFu8
	 V4GUVUV8eNadSIXM7rj8GMbNmraJHoggQl37ngAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BD1F805A0;
	Mon,  4 Jul 2022 13:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B308CF804D8; Thu, 30 Jun 2022 20:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C5C9F8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 20:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5C9F8014E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBDC61063;
 Thu, 30 Jun 2022 11:22:39 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6993F5A1;
 Thu, 30 Jun 2022 11:22:33 -0700 (PDT)
Date: Thu, 30 Jun 2022 19:21:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220630182122.j7m32mh3xmxwatga@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
 <20220630175318.g2zmu6ek7l5iakve@bogus>
 <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: Niklas.Cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

On Thu, Jun 30, 2022 at 06:01:09PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/06/2022 18:53, Sudeep Holla wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> >> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> >>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> Hey all,
> >>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> >>> based boards. To make keeping it that way a little easier, I changed the
> >>> Canaan devicetree Makefile so that it would build all of the devicetrees
> >>> in the directory if SOC_CANAAN.
> >>>
> >>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> >>> action. Since I sent v1, I tried to buy some since it's cheap - but could
> >>> out of the limited stockists none seemed to want to deliver to Ireland :(
> >>> I based the series on next-20220617.
> >>>
> >>
> >> I first tried to apply your series on top of next-20220630,
> >> but was greeted by a bunch of different warnings on boot,
> >> including endless RCU stall warnings.
> >> However, even when booting next-20220630 without your patches,
> >> I got the same warnings and RCU stall.
> >>
> > 
> > Is it possible to share the boot logs please ?
> > Conor is having issues with my arch_topology/cacheinfo updates in -next.
> > I would like to know if your issue is related to that or not ?
> > 
> >> So I tested your series on top of v5.19-rc4 +
> >> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> >> spi-peripheral-props.yaml") cherry-picked,
> >> (in order to avoid conflicts when applying your series,)
> >> and the board was working as intended, no warnings or RCU stalls.
> >>
> > 
> > If possible can you give this branch[1] a try where my changes are and doesn't
> > have any other changes from -next. Sorry to bother you.
> > 
> > Conor seem to have issue with this commit[2], so if you get issues try to
> > check if [3] works.
> 
> FWIW, my problems with that are not on canaan hw.

I understand that, just helps to eliminate and see what are the possible
issues.

-- 
Regards,
Sudeep
