Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62410AAB6
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 07:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93DA1711;
	Wed, 27 Nov 2019 07:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93DA1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574836948;
	bh=Oyc1j6ZXQsdNIH6+zijMkBmezlrAfs2FMqrvt1uxMLU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAzdGwA4bf+zrcrc962HsY4e1iSn0DJCALLeWBpbt2milu/H+guAkec/XOL7vJRyE
	 aib93oHpiLsG6y0obO1s4PRmxsvkVB9ob0VwM6odXL431EJJ8u9rlVL3s+dL3WILLh
	 Fa+qnuePluhZJIJ8U4H3two3wNbLdnoUaFVwvIYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F14F80216;
	Wed, 27 Nov 2019 07:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE90F800DD; Tue, 26 Nov 2019 12:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23FA4F80149
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 12:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FA4F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvVd5h8y"
Received: by mail-wr1-x441.google.com with SMTP id z3so21947691wru.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 03:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mPsIQyZB05XA1geV+/a9mGk6poY26Jzmyx/vRU1WfpY=;
 b=CvVd5h8yRpWWCZspKyZ2Geub44N8W7U4Jhjye1wj0+gjwAtkOVVmcul2n5Td6FtIOl
 TYG086TBeCaeOdVzPpwKhwlLc4pXmhKLeWtbE6m/dAKdho1uQ2gr6EZUmN0OfCnHu7vA
 CkekA1Jm7ugM9uREG/GBYK687qdaWRWRkE+2whjefu8rgH7tRkaaT/cLei9WaenddzQB
 YDNEo0bfRrPSjq0dSg9yxZszaBpoL3x1/rChO+3ehiBgMCnr9nBa16a76NKGQ4BuO449
 +5/bTc4kSISupGE5hditCGRORIPgm4bURLWXT4/8PYFGt4EyUpjU1VnqY7G7PQD752dr
 4Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mPsIQyZB05XA1geV+/a9mGk6poY26Jzmyx/vRU1WfpY=;
 b=GS1YVIUAT0V0I1zHnSz7NewyTPyUogxeOVAXW9ID5esb/Sr7TgrBkfYFSvM+lNHF1M
 5l17Km79+a6MZgAaZbster68ALUfCq9ubcUhWnEbJ2OhGqxN2WPyKOPaq7beKSENpYqB
 Zd5BEkKTPxjbAq7o25ZIhOl69muc69w+mwQOQQILiede168239k7JnVvYKOZ5w1Xn7jM
 9+kU/Jv7xh0CtLS3EzHLvO95YUXJPjNbxNxua+dLZHSdWH1X9JgnFQVwKdkw0xLb+RZ3
 +jxwAcKxqIN7l5tl/lPSLubsW/43UwZZ7oxguk27j0YlfjsU78BRuXLCJ4tfpVxs/u15
 RjnQ==
X-Gm-Message-State: APjAAAVdgLsxcpyxOylnreJiUfLHEO5IkITcV/qHinBc7EDjOfMJHnrZ
 UeKrS2g+VmtGZxNdLqCGG00=
X-Google-Smtp-Source: APXvYqxSB1tYKQQzsIwE/RCW4zstGtQNypAFngwnyjSt5EMF0PfBQcHF962Sesm4cfpD/IFXIDsxsQ==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr16155700wrp.292.1574766982078; 
 Tue, 26 Nov 2019 03:16:22 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id b14sm2692135wmj.18.2019.11.26.03.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 03:16:21 -0800 (PST)
Date: Tue, 26 Nov 2019 12:16:18 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191126111618.GA28423@gmail.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-12-sean.j.christopherson@intel.com>
 <7338293.UcAxln0NAJ@kreacher>
 <20191125104803.v6goacte2vjakx64@ucw.cz>
 <20191125170034.GB12178@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125170034.GB12178@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 Nov 2019 07:39:10 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH 11/12] ACPI/sleep: Convert
 acpi_wakeup_address into a function
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


* Sean Christopherson <sean.j.christopherson@intel.com> wrote:

> On Mon, Nov 25, 2019 at 11:48:03AM +0100, Pavel Machek wrote:
> > > On Tuesday, November 19, 2019 1:21:20 AM CET Sean Christopherson wrote:
> > > > Convert acpi_wakeup_address from a raw variable into a function so that
> > > > x86 can wrap its dereference of the real mode boot header in a function
> > > > instead of broadcasting it to the world via a #define.  This sets the
> > > > stage for a future patch to move the definition of acpi_wakeup_address()
> > > > out of asm/acpi.h and thus break acpi.h's dependency on asm/realmode.h.
> > > > 
> > > > No functional change intended.
> > > > 
> > > > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > > 
> > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > 
> > > > --- a/drivers/acpi/sleep.c
> > > > +++ b/drivers/acpi/sleep.c
> > > > @@ -63,9 +63,9 @@ static int acpi_sleep_prepare(u32 acpi_state)
> > > >  #ifdef CONFIG_ACPI_SLEEP
> > > >  	/* do we have a wakeup address for S2 and S3? */
> > > >  	if (acpi_state == ACPI_STATE_S3) {
> > > > -		if (!acpi_wakeup_address)
> > > > +		if (!acpi_wakeup_address())
> > > >  			return -EFAULT;
> > > > -		acpi_set_waking_vector(acpi_wakeup_address);
> > > > +		acpi_set_waking_vector(acpi_wakeup_address());
> > > >  
> > 
> > You might want to store result in a variable... especially since you are
> > turning inline function into real one in a next patch.
> > 
> > And maybe function should be called get_acip_wakeup_address or
> > something? This way it is easy to mistake actual wakeup address from
> > function that gets it...
> 
> Agreed on both counts.
> 
> 
> Ingo,
> 
> Would you prefer a v2 of the entire series (with Acks and removal of Fixes),
> or a v2 that includes only the last two patches?

Yep, that would be handy. I have them committed to tip:core/headers, but 
haven't sent it to Linus yet, and can redo that all with these 
improvements.

Thanks,

	Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
