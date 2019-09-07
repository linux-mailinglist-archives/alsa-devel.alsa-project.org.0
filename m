Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6CAC584
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 11:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC2315F8;
	Sat,  7 Sep 2019 11:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC2315F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567847753;
	bh=8xdtzloPC5i8MrI40szelS7L65pjGBXtrxjjP5r2Row=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxcLUdR2RQc2/yR5jyVvSE/IFHhxIaBagUJiawlcFWc+qTwoO6a6bw4BhndV04Z0f
	 rpbOWh2W4aC6iv6naB5KlasErx6H1uYjJqk2jnYfmbJoHwp2hk2ndja6uNvDbME/k1
	 gBalG4m1ePbEc0vVdP16N0i1AUVsSfSKi0vBwOSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F0FF803D1;
	Sat,  7 Sep 2019 11:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 443A6F80448; Sat,  7 Sep 2019 11:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id C8A61F800C6
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 11:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A61F800C6
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23994248AbfIGJOAdZwOx (ORCPT
 <rfc822;alsa-devel@alsa-project.org>); Sat, 7 Sep 2019 11:14:00 +0200
Date: Sat, 7 Sep 2019 11:13:58 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: Tomas Novotny <tomas@novotny.cz>
Message-ID: <20190907091358.GA7166@lenoch>
References: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: Re: [alsa-devel] omap-mcbsp: TX Buffer Overflow
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

On Fri, Sep 06, 2019 at 04:51:09PM +0200, Tomas Novotny wrote:
> Hi,
> 
> we have AM3703 based board similar to BeagleBoard. I'm hitting this error
> after upgrade to latest LTS 4.19.71 (upgraded from 4.1):
> 
> omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
> 
> This appears during or after playing of short (~2s) ding-dong wav. That error
> exists for longer time, because handling of tx buffer overflow irq was
> introduced in 2016: 4e85e7776eba ("ASoC: omap-mcbsp: Enable TX/RX under and
> overflow interrupts"). I've cherry-picked it to 4.1 and I see the error there also.
> The sound seems clear and ok to me, but we are using low quality speaker.

Just FYI, for stream capture there's
omap-mcbsp 49022000.mcbsp: RX Buffer Underflow!

As far as I remember all stable kernels we have in production - 4.9.x, 4.14.x and
4.19.x - are affected. IGEPv2 with both DM3730 and OMAP3530 are affected
(headless machines, CONFIG_VIDEO_OMAP3=n).

And DT is probably worth updating:
omap_hwmod: mcbsp2_sidetone using broken dt data from mcbsp
omap_hwmod: mcbsp3_sidetone using broken dt data from mcbsp

I never motivated myself to dig deeper as catured stream looks pretty normal.

	l.

> There are two workarounds to get rid of the message:
> 1) Change 'dma_op_mode' sysfs attribute from 'element' to 'threshold'. I
> found that just by coincidence when checking sysfs attributes.
> 2) Compile kernel with CONFIG_VIDEO_OMAP3=y. Found on Logic PD forum [1].
> 
> Does anybody have any idea what's going wrong? Or why these (somehow)
> unrelated workarounds help?
> 
> Thanks,
> 
> Tomas
> 
> [1] https://support.logicpd.com/TDGForum/tabid/124/aft/2277/Default.aspx
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
