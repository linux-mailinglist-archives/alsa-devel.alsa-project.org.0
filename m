Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10910388D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608A01706;
	Wed, 20 Nov 2019 12:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608A01706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248749;
	bh=2a+D240NfLlipgW1Iky5JpKxIj5jdMis8ZQeJrsSLJ8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFUfMXjy3MD7JYiRj1f2LohHYC+sPhN05ePsc9LJ7eKdsC5L/n6UuWHkN7GcVXm8D
	 7n52fFion5vnOq6mBjzfeENNtSHx5Foe5sbfwf+wQl0Bf2YyHKzuaebojKGd7hnYvp
	 PyQIAVRTSjv15YcwohD/SqNrtr3aNFNA/E1biVsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA11F802E8;
	Wed, 20 Nov 2019 12:02:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6DF0F80137; Tue, 19 Nov 2019 13:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F7AF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F7AF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ltSecJN5"
Received: by mail-pl1-x644.google.com with SMTP id l4so11697790plt.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qpwNQdLDEKp3mHj6bhdJa/Rq4oFAWkNqox9VT/5kxaE=;
 b=ltSecJN5dv6Eibo6pRLuD+iAe9yVQaHC4TL5a/T/Hp7KM4+GTbSEzMBUlRBFPT3Lpa
 6HYEE3iYly2QjLrr/CEW/l0f+qZaxMuhIRvTMR6xK28UW2aWNnS0Bp1Drdj1WMQR5t5T
 OKMkdRURBZ1z4kOSxCPt8gkW2qo0vnUbLQzLNq8rRdnTgYbprZkfUOOOnm2p2A7EF6wE
 sHfG/BAOBc1uz9plhJm+pw3/GvLUKfu4zB4N6QB5+TmJKbRicc4psQtOVStnO7KxXFAt
 nHQUFoj3buSHslm/eRzFaHvhxZVMyZVwFhBhO0tfGl449RToViaFGi1gGPr0v20curZJ
 yTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpwNQdLDEKp3mHj6bhdJa/Rq4oFAWkNqox9VT/5kxaE=;
 b=Q7ZMfqpBhoXyRGMHjaVOOLCWE4Ot2/XePlGEgpnLAlTrHlj8aoNQhvVS5CJRSmBRdN
 hJZjL7pGVHZLV0bx1dTCylCF1AFV8RI84HqHIaVd/BTbBRQ/OyB6SNT3zx4fF1aKh/dH
 O2ny/vNo2HLpm21MYU0qNXDhwgBnq6g7fXltP8hukL72d+OQTxPqGPkxLa7KTQ9b8f9t
 UYZiq8bfPUU4o4KrnVdyJlM5PHClyCJjhjtofBmpqZCQj8vyGVIfmX40JN6aoB7y/GIS
 pU4IJWkU3FBfTCtzkc05QNQfJgC0BIwrX7uEP2d3cvzOq/4j3Mkjh/Eo56FZKwCTQd/u
 OrCA==
X-Gm-Message-State: APjAAAUQBf/fUEA3R48G+ZfI8jDtmS1tHET6jS2NxR5DTU9/Cd/Cg2MR
 UgTSIVBp1f56kvL/i8FtyROC9Zh398KpNz6EYDE=
X-Google-Smtp-Source: APXvYqwbCUL/eximB8mpj2VKlrZgFfSMeoldq7a7WGfu5alkQzf/cM2q5535Tqgna1MJCwUak2duJRDsdSgol0JrIKM=
X-Received: by 2002:a17:90a:c68f:: with SMTP id
 n15mr6302731pjt.20.1574167142073; 
 Tue, 19 Nov 2019 04:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119111012.GA109842@gmail.com> <20191119120655.GA31444@gmail.com>
In-Reply-To: <20191119120655.GA31444@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Nov 2019 14:38:51 +0200
Message-ID: <CAHp75VeYXonBT9eYhqvS9qyOogdaCu8ERv0XMg12hrVBYt6hnw@mail.gmail.com>
To: Ingo Molnar <mingo@kernel.org>
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 linux-efi <linux-efi@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Nadav Amit <namit@vmware.com>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Len Brown <len.brown@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Platform Driver <platform-driver-x86@vger.kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH] x86/platform/intel/quark: Explicitly
 include linux/io.h for virt_to_phys()
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

On Tue, Nov 19, 2019 at 2:07 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ingo Molnar <mingo@kernel.org> wrote:
>
> > I've applied them to tip:WIP.core/headers as a work-in-progress tree,
> > and I'm testing them on randconfigs to make sure there's no broken
> > dependencies. I'll wait for the ACPI acks.
>
> One more fix was needed, for the intel-quark driver that is only built on
> 32-bit configs:
>
> ==================>
> From: Ingo Molnar <mingo@kernel.org>
> Date: Tue, 19 Nov 2019 12:51:56 +0100
> Subject: [PATCH] x86/platform/intel/quark: Explicitly include linux/io.h for virt_to_phys()
>
> Similarly to the previous patches by Sean Christopherson:
>
>  "Through a labyrinthian sequence of includes, usage of virt_to_phys() is
>   dependent on the include of asm/io.h in x86's asm/realmode.h, which is
>   included in x86's asm/acpi.h and thus by linux/acpi.h.  Explicitly
>   include linux/io.h to break the dependency on realmode.h so that a
>   future patch can remove the realmode.h include from acpi.h without
>   breaking the build."
>

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: linux-kernel@vger.kernel.org
> Cc: Sean Christopherson <sean.j.christopherson@intel.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>  arch/x86/platform/intel-quark/imr.c          | 2 ++
>  arch/x86/platform/intel-quark/imr_selftest.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/x86/platform/intel-quark/imr.c b/arch/x86/platform/intel-quark/imr.c
> index 6dd25dc5f027..e9d97d52475e 100644
> --- a/arch/x86/platform/intel-quark/imr.c
> +++ b/arch/x86/platform/intel-quark/imr.c
> @@ -29,6 +29,8 @@
>  #include <asm/cpu_device_id.h>
>  #include <asm/imr.h>
>  #include <asm/iosf_mbi.h>
> +#include <asm/io.h>

A nit: perhaps put it after imr.h.

> +
>  #include <linux/debugfs.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
> diff --git a/arch/x86/platform/intel-quark/imr_selftest.c b/arch/x86/platform/intel-quark/imr_selftest.c
> index 42f879b75f9b..4307830e1b6f 100644
> --- a/arch/x86/platform/intel-quark/imr_selftest.c
> +++ b/arch/x86/platform/intel-quark/imr_selftest.c
> @@ -14,6 +14,8 @@
>  #include <asm-generic/sections.h>
>  #include <asm/cpu_device_id.h>
>  #include <asm/imr.h>
> +#include <asm/io.h>
> +
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/types.h>
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
