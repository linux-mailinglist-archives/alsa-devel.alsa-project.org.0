Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B864103874
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1470B16E0;
	Wed, 20 Nov 2019 12:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1470B16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248631;
	bh=F9IZ6QzAfS/OP737Tc4jecq5PqPAicDXSNYhMNnGp1o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJaTnv30mQeJnLf/rpnRCVAs4gMnXG7hQkYDdTyHOxZTGKlYVN73Gq4TncpADr6t8
	 9/btAPAAZfQX30uMnCIl63LdQwewGeFN9Klt+6THL+fqHusresEn7ILpfYho1o+O5T
	 b4r004nxUuRfujNIfboOlwz9z4weFt+/tf0f9FVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E46EF802A7;
	Wed, 20 Nov 2019 12:02:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36548F80137; Tue, 19 Nov 2019 13:09:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F8FFF800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F8FFF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RSaaXLGG"
Received: by mail-wr1-x443.google.com with SMTP id q15so10722012wrw.7
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivBxIQiw/QvtMfmpR5iQrO/2f3Dutvsc0GR6a8pfJQ0=;
 b=RSaaXLGGQlX7yfXlu5Z0jagMZpyaCg6RuPa26b20m/OvaqlU5ocVtDiZCnVIEt8kMu
 ZvwwC3bFBzFqAWIVjrZTaobfuXs5UZnbmdfsiILEmizj50l29O+7U4uYt1ArPz+kNZRh
 hDiWZwZexe9ifx4uU/MBeZAVyBde6hOCmojuRoP08SVjUDBKnsX1uP3WiQ/IvYIIueUg
 UXNL+Q3Nbdjx43nM2xHZl4aj1ft4lWWVIY8rA9tK6fxYdMTA/kSD/z6lHBLjBo3Phl+q
 L89HkBiLMWoxtzjTSRZTZlbePnCR7tHPJRkk8PtkPvIV3udwFbVA0RFT4JGDzmIEZEQa
 fY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivBxIQiw/QvtMfmpR5iQrO/2f3Dutvsc0GR6a8pfJQ0=;
 b=HvnPW/h5tMsIHOb6kPnILJvN2fZTKZd6CXqqM1yccQCgrFd4SPyduu1xdsSU/nF+UR
 eSRJ6VE+jpOG2lANhMZYCbbqhKlsCd5BwT5fUVEC0HvCdQxyqZqTGA392+IjjDxAeivw
 yCScWf1ouyTvmHmLwA8BQLsOxELzUatQBZVWBRaWQavNvJgQA3U9fWarzWSIhX83rK9K
 xHWpLEWe+kWwzmpKkUBy8UBXHuLaVNOiHVn1ZeY4EpSTMI/O0MHyTba6YE44g1RAkwHg
 +a99xzh+zmV8CsUvqwuZyNwkH4Zt7BagsaL5azZbqy0swCjBHLr7hcZyBefavuUF4fq8
 g8VA==
X-Gm-Message-State: APjAAAVBDsVThYj8Ygg/tMDruxv0y0w0nQmy3xtAmya7S3y3+aSILWLN
 2wIKutUIuvk8k62RAjZiU20j091ByX2cn4jy3xaNEQ==
X-Google-Smtp-Source: APXvYqzVh5wmA90P19s7zmbb2x7Na4wJQqfpSJjjGSz8H0l9CWz1oPf8pw9K4u4+qFJI0+MGYo/t6MxvnfJIJ9zAjTc=
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr400801wra.246.1574165351430; 
 Tue, 19 Nov 2019 04:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119111012.GA109842@gmail.com>
In-Reply-To: <20191119111012.GA109842@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 19 Nov 2019 12:09:07 +0000
Message-ID: <CAKv+Gu9C132peF9_j2rRwRh4s+aWZBY82rgjqmwaE_X=_6y4Zw@mail.gmail.com>
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

On Tue, 19 Nov 2019 at 12:10, Ingo Molnar <mingo@kernel.org> wrote:
>
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
> > Build tested on x86 with allyesconfig and allmodconfig, so hopefully there
> > aren't more build issues lurking, but at this point it wouldn't surprise
> > me in the least if this somehow manages to break the build.
> >
> > Based on tip/master, commit ceceaf1f12ba ("Merge branch 'WIP.x86/cleanups'").
> >
> > Patch Synopsis:
> >   - Patches 01-09 fix a variety of build errors that arise when patch 12
> >     drops realmode.h from asm/acpi.h.  Most of the errors are quite absurb
> >     as they have no relation whatsoever to x86's RM boot code, but occur
> >     because realmode.h happens to include asm/io.h.
>
> Yeah, these kind of parasitic header dependencies are the main driving
> force behind kernel header spaghetti hell: it's super easy to add a new
> header, but very hard to remove them...
>
> Hence they practically only accumulate.
>
> As a result header removal patches get priority, from me at least. :-)
>
> >   - Patch 10 removes a spurious include of realmode.h from an ACPI header.
> >
> >   - Patches 11 and 12 implement the wrapper and move it out of acpi.h.
>
> So if the ACPI maintainers are fine with -tip carrying patches #11 and #12
> then I'd be glad to route these patches upstream.
>
> I've applied them to tip:WIP.core/headers as a work-in-progress tree, and
> I'm testing them on randconfigs to make sure there's no broken
> dependencies. I'll wait for the ACPI acks.
>
> I edited the title of patch 12 slightly, to:
>
>    c8bceb321209: x86/ACPI/sleep: Move acpi_wakeup_address() definition into sleep.c, remove <asm/realmode.h> from <asm/acpi.h>
>
> to make sure the big header dependency change is obvious at first sight.
>

I'm fine with the patches but can we drop the fixes headers please?
This doesn't actually fix anything, and touching early boot stuff for
no good reason should be avoided imo.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
