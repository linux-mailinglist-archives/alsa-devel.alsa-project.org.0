Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A672E522B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 19:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0C9187A;
	Fri, 25 Oct 2019 19:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0C9187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572023985;
	bh=DP0lrCOOAXsqg1mACP+FIL4KSMuMsZ6UfI6nRt+cSMc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSBqlRxlPo7MKy4cUiN6DsRxJF1+w0eCvkfpEimCSpuHVh12F91tDtKGdlMjQhmJQ
	 p8tMAoGw4G0RZ/L299CmGqTIdG4WFHOapMXTku6VA9vi6Xrdk76HNfWnxerdUxbt1f
	 mq/YbM+Ts8zlZ3uEBmpLM6KmZRWluX4jvnKdrIH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34466F803A6;
	Fri, 25 Oct 2019 19:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A7CF8036F; Fri, 25 Oct 2019 19:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 091A1F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 19:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 091A1F80274
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 158DF80CD;
 Fri, 25 Oct 2019 17:18:10 +0000 (UTC)
Date: Fri, 25 Oct 2019 10:17:33 -0700
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20191025171733.GW5607@atomide.com>
References: <20191025130528.3556-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025130528.3556-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, jarkko.nikula@bitmer.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: ti: omap-mcpdm: Add support for
 pdmclk clock handling
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

Hi,

* Peter Ujfalusi <peter.ujfalusi@ti.com> [191025 13:05]:
> McPDM module receives it's functional clock from external source. This
> clock is the pdmclk provided by the twl6040 audio IC. If the clock is not
> available all register accesses to McPDM fails and the module is not
> operational.
> 
> this has been lurking in my next-wip branch for some time...
> It might not needed anymore as I have not heard about issues with McPDM for a
> while.
> 
> It was dropped back then because some core parts were not picked in time and
> this caused some issues, but can not find the exact reason

Yes it's a strange solution to clock the internal mcpdm module
externally :)

AFAIK it's now already handled properly by ti-sysc. We have a common
omap4-mcpdm.dtsi configure mcpdm clock forthe module, then ti-sysc
driver defers probe until the mcpdm clock is available. And for omap5
we have omap5-board-common.dtsi configure it.

So probably the only thing omap-mcpdm.c driver needs to do is to
call PM runtime functions, maybe it's already doing that.

Regards,

Tony
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
