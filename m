Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46026108F37
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 14:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BFA17F2;
	Mon, 25 Nov 2019 14:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BFA17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574689835;
	bh=wQqQizxhDA50HjknBkEVOhtyNuLWTJm8E6Mke5cw+YM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXrSTZhaySnQvWcC7PQFQXiV0FjfLV/RQvaUnWjsRSpZPXtHmhMatbanUTyP635Lw
	 +MoWS/sLHFAe5gYauTrzHRIGWGMC5pOdK3rXO/ycepM0oaXZUYE3gf6Ga4XnFG2G7K
	 NSqOXFzIBHEdHofYGgl+k2ERwQnS24ar3P/JNq4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBF2F8014D;
	Mon, 25 Nov 2019 14:48:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF2CFF8016F; Mon, 25 Nov 2019 11:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A5A2F800DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 11:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A5A2F800DF
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 141771C1FD1; Mon, 25 Nov 2019 11:48:03 +0100 (CET)
Date: Mon, 25 Nov 2019 11:48:03 +0100
From: Pavel Machek <pavel@ucw.cz>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20191125104803.v6goacte2vjakx64@ucw.cz>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-12-sean.j.christopherson@intel.com>
 <7338293.UcAxln0NAJ@kreacher>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7338293.UcAxln0NAJ@kreacher>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 25 Nov 2019 14:48:50 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-acpi@vger.kernel.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
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

> On Tuesday, November 19, 2019 1:21:20 AM CET Sean Christopherson wrote:
> > Convert acpi_wakeup_address from a raw variable into a function so that
> > x86 can wrap its dereference of the real mode boot header in a function
> > instead of broadcasting it to the world via a #define.  This sets the
> > stage for a future patch to move the definition of acpi_wakeup_address()
> > out of asm/acpi.h and thus break acpi.h's dependency on asm/realmode.h.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> > --- a/drivers/acpi/sleep.c
> > +++ b/drivers/acpi/sleep.c
> > @@ -63,9 +63,9 @@ static int acpi_sleep_prepare(u32 acpi_state)
> >  #ifdef CONFIG_ACPI_SLEEP
> >  	/* do we have a wakeup address for S2 and S3? */
> >  	if (acpi_state == ACPI_STATE_S3) {
> > -		if (!acpi_wakeup_address)
> > +		if (!acpi_wakeup_address())
> >  			return -EFAULT;
> > -		acpi_set_waking_vector(acpi_wakeup_address);
> > +		acpi_set_waking_vector(acpi_wakeup_address());
> >  

You might want to store result in a variable... especially since you are
turning inline function into real one in a next patch.

And maybe function should be called get_acip_wakeup_address or
something? This way it is easy to mistake actual wakeup address from
function that gets it...

Best regards,
									Pavel
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
