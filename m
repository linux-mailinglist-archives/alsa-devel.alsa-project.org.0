Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB555BA2A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7941671;
	Mon, 27 Jun 2022 15:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7941671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656338115;
	bh=hOra6tWIonMVr2SGNZGAGnM9x38Jczr9VTOWZhcix7o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERoAvNAVOswKY7IxmI2KEBNNb//ZLXwae72DqCzk0+pdA1UJCFVjsITnIbYV0W7Dv
	 6TtsHreyQ2v7x3OysnH9tkjHcDkEQSA5Tr5nN4uwcR6M9gla8+cjPOMbjUzo0RMA77
	 F8A5xBGTd9YwKKO5SbOP6MuDX1YCA2D8Ais+SN/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B1AF80128;
	Mon, 27 Jun 2022 15:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A5CF8028B; Mon, 27 Jun 2022 15:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 6DF70F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF70F80128
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 634648106;
 Mon, 27 Jun 2022 13:48:49 +0000 (UTC)
Date: Mon, 27 Jun 2022 16:53:58 +0300
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Pandora audio using machine_is_omap3_pandora() check
Message-ID: <Yrm2dl9EtIb5IYhi@atomide.com>
References: <Yrl92RILZwhQOP+e@atomide.com>
 <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B6EFBA88-2311-4455-82CB-3E5382C92B4E@goldelico.com>
Cc: alsa-devel@alsa-project.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Arnd Bergmann <arnd@arndb.de>, Grond <grond66@riseup.net>,
 Stefan Leichter <sle85276@gmx.de>, Mark Brown <broonie@kernel.org>,
 Grazvydas Ignotas <notasas@gmail.com>, linux-omap <linux-omap@vger.kernel.org>
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

* H. Nikolaus Schaller <hns@goldelico.com> [220627 11:36]:
> Hi Tony,
> 
> > Am 27.06.2022 um 11:52 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > Hi Grazvydas,
> > 
> > Arnd noticed that pandora audio is using machine_is_omap3_pandora() check
> > that never succeeds for devicetree booting machines. Looks like this has
> > been broken at some point many years ago with the devicetree conversion.
> > 
> > Does anybody have an interest in fixing this driver?
> 
> we already have fixes by Stefan Leichter and Grond here (incl. removing any call to machine_is_omap3_pandora):
> 
> 	https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/sound-soc

OK :)

> But I don't know who can volunteer to run this series through the upstreaming discussions
> and do regression tests (AFAIR the Pandora of Grond is broken and he has no replacement).

Probably best that Stefan and Grond do it :) Not sure what the minimal fix
for the mainline kernel might be to get things at least try to probe.

Regards,

Tony
