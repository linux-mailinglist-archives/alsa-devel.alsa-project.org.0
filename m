Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4B18F660
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:54:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30878839;
	Mon, 23 Mar 2020 14:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30878839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971662;
	bh=Hd3zAvAezuFSVlozOz44ullhVT1eSajSxemMLbZxlBE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3wrQK50gdoebZSgoLuckX1gTIr0G5/q2sqBpfjOTaN/hG6npqafzB1vGxDtN4Qbz
	 ucl1eQnxsbC6OaiK5B/zmK2biyNn6yjvdiItKeAYVm3FbSBnP3NGPX7gGqLjpurZJ3
	 VOHbwBDPBAQNfRqMnm9DH5ws/FCe5BGmJjjeXuhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC37CF802E1;
	Mon, 23 Mar 2020 14:47:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 570CCF8015B; Fri, 20 Mar 2020 15:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3E0FF800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3E0FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ff33wKiw"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99F7A2072D;
 Fri, 20 Mar 2020 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584716354;
 bh=Hd3zAvAezuFSVlozOz44ullhVT1eSajSxemMLbZxlBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ff33wKiw1HbXy93zCGoh1lWvVOk00lgxJdeoknvNzKnVdJSPvefa0ML3LysbJ4nTO
 6rAp6ASm4qt4uUIq2mtTpgvdRMDHrrSeBb59UaWhHjcJKEKHYeRpe3xmrMj7LtAtPD
 nmjVJ+xUohzhMq/MhLV3uoj+bRi4FVjkP6UigI8o=
Date: Fri, 20 Mar 2020 15:59:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 00/22] x86/treewide: Consolidate CPU match macro maze and
 get rid of C89 (sic!) initializers
Message-ID: <20200320145906.GA762057@kroah.com>
References: <20200320131345.635023594@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320131345.635023594@linutronix.de>
X-Mailman-Approved-At: Mon, 23 Mar 2020 14:47:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-acpi@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Iwai <tiwai@suse.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
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

On Fri, Mar 20, 2020 at 02:13:45PM +0100, Thomas Gleixner wrote:
> The x86 CPU matching based on struct x86_cpu_id:
> 
>   - is using an inconsistent macro mess with pointlessly duplicated and
>     slightly different local macros. Finding the places is an art as there
>     is no consistent name space at all.
> 
>   - is still mostly based on C89 struct initializers which rely on the
>     ordering of the struct members. That's proliferated forever as every
>     new driver just copies the mess from some exising one.
> 
> A recent offlist conversation about adding more match criteria to the CPU
> matching logic instead of creating yet another set of horrors, reminded me
> of a pile of scripts and patches which I hacked on a few years ago when I
> tried to add something to struct x86_cpu_id.
> 
> That stuff was finally not needed and ended up in my ever growing todo list
> and collected dust and cobwebs, but (un)surprisingly enough most of it
> still worked out of the box. The copy & paste machinery still works as it
> did years ago.
> 
> There are a few places which needed extra care due to new creative macros,
> new check combinations etc. and surprisingly ONE open coded proper C99
> initializer.
> 
> It was reasonably simple to make it at least compile and pass a quick
> binary equivalence check.
> 
> The result is a X86_MATCH prefix based set of macros which are reflecting
> the needs of the usage sites and shorten the base macro which takes all
> possible parameters (vendor, family, model, feature, data) and uses proper
> C99 initializers.
> 
> So extensions of the match logic are trivial after that.
> 
> The patch set is against Linus tree and has trivial conflicts against
> linux-next.
> 
> The diffstat is:
>  71 files changed, 525 insertions(+), 472 deletions(-)
> 
> but the extra lines are pretty much kernel-doc documentation which I added
> to each of the new macros. The usage sites diffstat is:
> 
>  70 files changed, 393 insertions(+), 471 deletions(-)
> 
> Thoughts?

Much nicer looking, thanks for cleaning up this mess:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
