Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D5103886
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 293AC16FD;
	Wed, 20 Nov 2019 12:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 293AC16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248710;
	bh=gG4krdDUzUedDwmD1UD5shNCrIvMOTGLoZjb4DPVeq8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldeI29bNxoDx8dBKZdSeyR6EBVOakH5auHvEoApQN16iIWBmhzwILYOoTwu1EbQEh
	 vU8USZWUWi4vovJ1HCIsKnDqxNjem7Ne+L+wAsO602FdoEvKhQ3Sz9SIS6KommwwA/
	 2CcTFtVIlHhKnxiQlqWjTlpSgQhDWWTWGkVemPDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A32FF802E0;
	Wed, 20 Nov 2019 12:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C04F80137; Tue, 19 Nov 2019 13:33:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61739F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61739F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JfHJ2oYz"
Received: by mail-wr1-x442.google.com with SMTP id l7so23613843wrp.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HngwhcG+KAeo6DGQH+bLMw2e39IjD09GILs4tcsEDqg=;
 b=JfHJ2oYzP/jkKhX5GW5kTZtPmbfxMsuJ44mQ/jjOV7p96tO8MLii2xYgvvecU87jbf
 xDCCdr2WOehZ/M97knEEzzZIB2yWzTBKx3/BANq1IkzomqaCBDwfd8OyFpoFvEHRvHAI
 /Ih7Ji/6Drt+nGgFcgmZyIelBqpjx/nBFB+jcwv8vpurYruXv+eovEAT9Gvibap3vW8p
 D1HHGnn6VxZZe42T+R4tUOpu5RCcZqMyr8kvIKAkwt0v9BjdFCoFP5F2ZcjHKeOAXd9x
 +cBOy+jeecmTLnGU7RL1AEtLZZOvHE7IDnKukkr5C+QGK3yVjWyYDu6FXXjdyP9JsrS5
 u/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HngwhcG+KAeo6DGQH+bLMw2e39IjD09GILs4tcsEDqg=;
 b=nhLKPjYKMDuMJikATle6Q86LT3q1ThwV2MlUxOfH4q5S4rOjX1CSPMxex9IcKtIE1M
 VN9Yu6lIPUGvjL3DnTVEt2Hgy3erwzf8efRrMNHrFW6Em/+PJSgEfPUSOHPJWydPLhPo
 yj0BfbWdpzsK5lKHjE4camSBa6hz7kjjdxJIW0+mwjMFCitJQKy4Ys7x+HmJ49iUx8xR
 TLpqfOiSpJm1UY+YcXYH6wRLK5zpWw+GLijGRjtDIv2CsIOt+iVgdaMh91wGopRMThWy
 vI76/NDlxkCbP2DzhXzF87kZpfmxVGs3/1plcNNu5wdWMD7HkU3+EWukBqdZDveSNCUU
 NLEg==
X-Gm-Message-State: APjAAAV33lhEDBuBojgtwHKdI2MtcFU9KuVO/fLeWuzwa1KsryckTxgI
 3njYKyPDFROP5ZY1ibVRc8gBCU0WDGckuOLpCPn/Vw==
X-Google-Smtp-Source: APXvYqxrn8CEslDFVxIy0Jl0Mrkp/wAIi6Is+3GFHp4aP52W1APv4nRsysG2XV46LuEQeEZpL+dKjixAXooja/JuLNw=
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr545384wra.246.1574166800364; 
 Tue, 19 Nov 2019 04:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119111012.GA109842@gmail.com>
 <CAKv+Gu9C132peF9_j2rRwRh4s+aWZBY82rgjqmwaE_X=_6y4Zw@mail.gmail.com>
 <20191119122217.GA24878@gmail.com>
In-Reply-To: <20191119122217.GA24878@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 19 Nov 2019 13:33:09 +0100
Message-ID: <CAKv+Gu8XY_VCyi0bRqf2E7g_PXyHU83w-e+JvzeCBc+X1Xcrbg@mail.gmail.com>
To: Ingo Molnar <mingo@kernel.org>
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

On Tue, 19 Nov 2019 at 13:22, Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> > On Tue, 19 Nov 2019 at 12:10, Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > >
> > > * Sean Christopherson <sean.j.christopherson@intel.com> wrote:
> > >
> > > > x86's asm/realmode.h, which defines low level structures, variables and
> > > > helpers used to bring up APs during SMP boot, ends up getting included in
> > > > practically every nook and cranny of the kernel because the address used
> > > > by ACPI for resuming from S3 also happens to be stored in the real mode
> > > > header, and ACPI bleeds the dependency into its widely included headers.
> > > >
> > > > As a result, modifying realmode.h for even the most trivial change to the
> > > > boot code triggers a full kernel rebuild, which is frustrating to say the
> > > > least as it some of the most difficult code to get exactly right *and* is
> > > > also some of the most functionally isolated code in the kernel.
> > > >
> > > > To break the kernel's widespread dependency on realmode.h, add a wrapper
> > > > in the aforementioned ACPI S3 code to access the real mode header instead
> > > > of derefencing the header directly in asm/acpi.h and thereby exposing it
> > > > to the world via linux/acpi.h.
> > > >
> > > > Build tested on x86 with allyesconfig and allmodconfig, so hopefully there
> > > > aren't more build issues lurking, but at this point it wouldn't surprise
> > > > me in the least if this somehow manages to break the build.
> > > >
> > > > Based on tip/master, commit ceceaf1f12ba ("Merge branch 'WIP.x86/cleanups'").
> > > >
> > > > Patch Synopsis:
> > > >   - Patches 01-09 fix a variety of build errors that arise when patch 12
> > > >     drops realmode.h from asm/acpi.h.  Most of the errors are quite absurb
> > > >     as they have no relation whatsoever to x86's RM boot code, but occur
> > > >     because realmode.h happens to include asm/io.h.
> > >
> > > Yeah, these kind of parasitic header dependencies are the main driving
> > > force behind kernel header spaghetti hell: it's super easy to add a new
> > > header, but very hard to remove them...
> > >
> > > Hence they practically only accumulate.
> > >
> > > As a result header removal patches get priority, from me at least. :-)
> > >
> > > >   - Patch 10 removes a spurious include of realmode.h from an ACPI header.
> > > >
> > > >   - Patches 11 and 12 implement the wrapper and move it out of acpi.h.
> > >
> > > So if the ACPI maintainers are fine with -tip carrying patches #11 and #12
> > > then I'd be glad to route these patches upstream.
> > >
> > > I've applied them to tip:WIP.core/headers as a work-in-progress tree, and
> > > I'm testing them on randconfigs to make sure there's no broken
> > > dependencies. I'll wait for the ACPI acks.
> > >
> > > I edited the title of patch 12 slightly, to:
> > >
> > >    c8bceb321209: x86/ACPI/sleep: Move acpi_wakeup_address() definition into sleep.c, remove <asm/realmode.h> from <asm/acpi.h>
> > >
> > > to make sure the big header dependency change is obvious at first sight.
> > >
> >
> > I'm fine with the patches but can we drop the fixes headers please?
> > This doesn't actually fix anything, and touching early boot stuff for
> > no good reason should be avoided imo.
>
> Agreed and done.
>

Thanks Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
