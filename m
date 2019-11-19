Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5535103882
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F71F16CB;
	Wed, 20 Nov 2019 12:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F71F16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248670;
	bh=n6vn2g4a63GPcBlpGUu7Rx4aHMlW6g+u0G6ghdfaB3Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxSiatX4+rzqQGWALNXLEntQmdiZQ1gmyzA6L+Tonu4xyvaJciu5GYGZjfhnT4vVd
	 LVSLsYEi5NbRf1mCkPhCLImqBuPxkBdj8FVxqecFPDDPgjlZUMeH6U7Ta7OnjKXveP
	 M5ZMmZpqjvqQoTnprMbeBaH82JR5+5Oxol5m7MUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26007F802A9;
	Wed, 20 Nov 2019 12:02:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CBD7F80137; Tue, 19 Nov 2019 13:22:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D825CF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D825CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FM53ORQw"
Received: by mail-wm1-x344.google.com with SMTP id u18so2971230wmc.3
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pCZ+boQU06taG0uRqRU5p4OOluIcsIWA0zaH1C287a4=;
 b=FM53ORQwVWjNBirpF/b/+wjx/e/Vkp4KItN0WlU1fYzCw4RAjrqFTtnM1/Uby3dVdK
 FCJ2nKsQJhpo4l/bZk7Mn4z199l/383/1X7afTKdZblq/CJAKCWCvta88xxwyXl3UZci
 FtloJoF1fjzEmTqusleWmxmV53XzWbjgfOHucCsGFLIiuaTkoC1uNxNy5sBv/8lhagE6
 qPoSqMrrhpbvXhW6fyDB0xkiv1z9FaKX0j/tQHxrrf3tAq/TC3/EF3T/oJvmKOTtL1V4
 N712FUpDdceOhaggMDCiLsd2aHyJNLUosvD4PCEhff6lFjUG8qXy5FvJ1ReseK+Bt2hx
 mF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pCZ+boQU06taG0uRqRU5p4OOluIcsIWA0zaH1C287a4=;
 b=ZyL4f8ZOWddmVbOxcxpuNqVKEivqwPksjr9hPQNvDiyCQg05u0odlgKxV2Upsoqz1s
 9NcPK5eP6RMHHCtAXhYPYFfhspDpia8ZP+VC9T85ySPVsxd5famzYoGAWrIGs2N2L7F1
 GQSBQKuRJNmA2Q+HK74BqKjDLvDQiAAIfcHNPKcPEV5uKc/8htlFRpSeyXq/MeehWMuM
 B5Pqrgg7nW5CedSS6Phg/nIMZyDYYFt00MLdhoIYYmbXWr1Xikw7GnhRPIIfb1ph4Qor
 hg54F+iXoE5Hok+rwnEB0jAjmRHWaVBKJ4BKs4caAuyRkUuIiJmLMuPr8GTdSWvP7vz8
 Lguw==
X-Gm-Message-State: APjAAAVWMJZuELGqHW41fWlQSpJ1yHST9vgszqvt9IYamkoHfXqHx99Z
 xknssZH0CKrdAcQm3KVvX6g=
X-Google-Smtp-Source: APXvYqx8J0A9Fq4xFkjwZhw6QIza/BfWFpr6MygFUiV3WR/Xgy1tZfffFAp6e+6ePrvxr9A8W8GhgQ==
X-Received: by 2002:a1c:a556:: with SMTP id o83mr5077222wme.165.1574166141047; 
 Tue, 19 Nov 2019 04:22:21 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id o187sm2916196wmo.20.2019.11.19.04.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 04:22:20 -0800 (PST)
Date: Tue, 19 Nov 2019 13:22:17 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20191119122217.GA24878@gmail.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119111012.GA109842@gmail.com>
 <CAKv+Gu9C132peF9_j2rRwRh4s+aWZBY82rgjqmwaE_X=_6y4Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9C132peF9_j2rRwRh4s+aWZBY82rgjqmwaE_X=_6y4Zw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 linux-efi <linux-efi@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Nadav Amit <namit@vmware.com>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm <linux-pm@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, "VMware, Inc." <pv-drivers@vmware.com>,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH 00/12] treewide: break dependencies on
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


* Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> On Tue, 19 Nov 2019 at 12:10, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Sean Christopherson <sean.j.christopherson@intel.com> wrote:
> >
> > > x86's asm/realmode.h, which defines low level structures, variables and
> > > helpers used to bring up APs during SMP boot, ends up getting included in
> > > practically every nook and cranny of the kernel because the address used
> > > by ACPI for resuming from S3 also happens to be stored in the real mode
> > > header, and ACPI bleeds the dependency into its widely included headers.
> > >
> > > As a result, modifying realmode.h for even the most trivial change to the
> > > boot code triggers a full kernel rebuild, which is frustrating to say the
> > > least as it some of the most difficult code to get exactly right *and* is
> > > also some of the most functionally isolated code in the kernel.
> > >
> > > To break the kernel's widespread dependency on realmode.h, add a wrapper
> > > in the aforementioned ACPI S3 code to access the real mode header instead
> > > of derefencing the header directly in asm/acpi.h and thereby exposing it
> > > to the world via linux/acpi.h.
> > >
> > > Build tested on x86 with allyesconfig and allmodconfig, so hopefully there
> > > aren't more build issues lurking, but at this point it wouldn't surprise
> > > me in the least if this somehow manages to break the build.
> > >
> > > Based on tip/master, commit ceceaf1f12ba ("Merge branch 'WIP.x86/cleanups'").
> > >
> > > Patch Synopsis:
> > >   - Patches 01-09 fix a variety of build errors that arise when patch 12
> > >     drops realmode.h from asm/acpi.h.  Most of the errors are quite absurb
> > >     as they have no relation whatsoever to x86's RM boot code, but occur
> > >     because realmode.h happens to include asm/io.h.
> >
> > Yeah, these kind of parasitic header dependencies are the main driving
> > force behind kernel header spaghetti hell: it's super easy to add a new
> > header, but very hard to remove them...
> >
> > Hence they practically only accumulate.
> >
> > As a result header removal patches get priority, from me at least. :-)
> >
> > >   - Patch 10 removes a spurious include of realmode.h from an ACPI header.
> > >
> > >   - Patches 11 and 12 implement the wrapper and move it out of acpi.h.
> >
> > So if the ACPI maintainers are fine with -tip carrying patches #11 and #12
> > then I'd be glad to route these patches upstream.
> >
> > I've applied them to tip:WIP.core/headers as a work-in-progress tree, and
> > I'm testing them on randconfigs to make sure there's no broken
> > dependencies. I'll wait for the ACPI acks.
> >
> > I edited the title of patch 12 slightly, to:
> >
> >    c8bceb321209: x86/ACPI/sleep: Move acpi_wakeup_address() definition into sleep.c, remove <asm/realmode.h> from <asm/acpi.h>
> >
> > to make sure the big header dependency change is obvious at first sight.
> >
> 
> I'm fine with the patches but can we drop the fixes headers please?
> This doesn't actually fix anything, and touching early boot stuff for
> no good reason should be avoided imo.

Agreed and done.

Thanks,

	Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
