Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E57554837DC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 20:59:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B0D1749;
	Mon,  3 Jan 2022 20:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B0D1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641239988;
	bh=8V2LmOrfSbkQzRED6tpkAX4Wjpj2Yr6G2s7zD5Pz1t4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xz+Id6BTuI+5Myb/8bis3L9iDaZwo1jtLjZs//hHw46ZG+AZIcluk+bCN8PVwEGsI
	 zo2sLbTaPgxoIgVXuMZS4inHZAVqJVMzOB/XpW34HpiFfTMmfkJjqI8GgADLNVYI8j
	 9am8a68a9IpzUzlg0aRMPLtph8dqxBEUaBccYn4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2F1F80141;
	Mon,  3 Jan 2022 20:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC794F8013F; Mon,  3 Jan 2022 20:58:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by alsa1.perex.cz (Postfix) with ESMTP id 72481F800E3
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 20:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72481F800E3
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1n4TTQ-0004X1-00; Mon, 03 Jan 2022 20:58:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 3B398C0A4B; Mon,  3 Jan 2022 20:51:33 +0100 (CET)
Date: Mon, 3 Jan 2022 20:51:33 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mips: lantiq: add support for clk_set_parent()
Message-ID: <20220103195133.GA10983@alpha.franken.de>
References: <20211229000345.24199-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229000345.24199-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, John Crispin <john@phrozen.org>,
 linux-mips@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
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

On Tue, Dec 28, 2021 at 04:03:45PM -0800, Randy Dunlap wrote:
> Provide a simple implementation of clk_set_parent() in the lantiq
> subarch so that callers of it will build without errors.
> 
> Fixes these build errors:
> 
> ERROR: modpost: "clk_set_parent" [sound/soc/jz4740/snd-soc-jz4740-i2s.ko] undefined!
> ERROR: modpost: "clk_set_parent" [sound/soc/atmel/snd-soc-atmel-i2s.ko] undefined!
> 
> Fixes: 171bb2f19ed6 ("MIPS: Lantiq: Add initial support for Lantiq SoCs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> --to=linux-mips@vger.kernel.org --cc="John Crispin <john@phrozen.org>" --cc="Jonathan Cameron <jic23@kernel.org>" --cc="Russell King <linux@armlinux.org.uk>" --cc="Andy Shevchenko <andy.shevchenko@gmail.com>" --cc=alsa-devel@alsa-project.org --to="Thomas Bogendoerfer <tsbogend@alpha.franken.de>"
> ---
>  arch/mips/lantiq/clk.c |    6 ++++++
>  1 file changed, 6 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
