Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E340D10B1B4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 15:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E871738;
	Wed, 27 Nov 2019 15:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E871738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574866670;
	bh=DsaHxUEYpmfxF3jsGH6LhjFesCcSlInVcHGWVOA/S+E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbN9YBsNq+WWtdwVZsJp2oFHGSbTlLyEFAGcS9JgO3K0a8kKrQutz/Ss5FRqBXjgm
	 ldhCbn8NVPODJJKC6u9+a6EbUCAr6xVCW/XcLNbJoa6d90p/ZupAhdq+M1Cqq+Jjqm
	 E/B4hyOFob7Pf67lon4WiTF3uc/Ie/wPR0N+bV/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FD2F80218;
	Wed, 27 Nov 2019 15:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D2CF8014D; Wed, 27 Nov 2019 15:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4BECF800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 15:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4BECF800E9
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 06:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="203094641"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga008.jf.intel.com with ESMTP; 27 Nov 2019 06:47:03 -0800
Date: Wed, 27 Nov 2019 06:47:03 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Message-ID: <20191127144703.GA18530@linux.intel.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
 <20191127072057.GB94748@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127072057.GB94748@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 27 Nov 2019 15:54:17 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Nadav Amit <nadav.amit@gmail.com>, linux-acpi@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 00/12] treewide: break dependencies on
	x86's RM header
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

On Wed, Nov 27, 2019 at 08:20:57AM +0100, Ingo Molnar wrote:
> 
> * Sean Christopherson <sean.j.christopherson@intel.com> wrote:
> 
> > x86's asm/realmode.h, which defines low level structures, variables and
> > helpers used to bring up APs during SMP boot, ends up getting included in
> > practically every nook and cranny of the kernel because the address used
> > by ACPI for resuming from S3 also happens to be stored in the real mode
> > header, and ACPI bleeds the dependency into its widely included headers.
> > 
> > As a result, modifying realmode.h for even the most trivial change to the
> > boot code triggers a full kernel rebuild, which is frustrating to say the
> > least as it some of the most difficult code to get exactly right *and* is
> > also some of the most functionally isolated code in the kernel.
> > 
> > To break the kernel's widespread dependency on realmode.h, add a wrapper
> > in the aforementioned ACPI S3 code to access the real mode header instead
> > of derefencing the header directly in asm/acpi.h and thereby exposing it
> > to the world via linux/acpi.h.
> > 
> > v2:
> >   - Rebased on tip/x86/cleanups, commit b74374fef924 ("x86/setup: Enhance
> >     the comments").
> >   - Use acpi_get_wakeup_address() as new function name. [Boris and Pavel]
> >   - Capture acpi_get_wakeup_address() in a local address. [Pavel]
> >   - Collect acks.  I didn't add Rafael's acks on patches 11 and 12 due to
> >     the above changes.
> >   - Explicitly call out the removal of <asm/realmode.h> from <asm/acpi.h>
> >     in patch 12. [Ingo]
> >   - Remove superfluous Fixes: tags. [Ard]
> 
> You didn't include every patch from v1 though, such us my fix to Quark:
> 
>   [PATCH] x86/platform/intel/quark: Explicitly include linux/io.h for virt_to_phys()
> 
> I've applied that one too and your updated patches, and it's now all 
> pushed out into tip:WIP.core/headers.

Sorry, it wasn't clear to me whether or not to include that one.  Next
time I'll ask.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
