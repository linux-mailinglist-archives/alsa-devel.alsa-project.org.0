Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCA103897
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4979B1718;
	Wed, 20 Nov 2019 12:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4979B1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248867;
	bh=x/XLG2Rg73O0870BIrHuyrI2hP4PT/bm7SXAbRyRnVw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1HPiz9v16MjNpUEY7K+F/+K9CLzfKM3xg5JrfiQWCAhC5guX7REBEAsDkqwdQKyM
	 GBJcB84qGt6dOLlLOdo0OYqXkqo/M4aQRukz5JLB2GfGG/dwb0jGx516M/kE/h4ewW
	 yjf3YIQOlp5QV2mfttIB9oI3PfCwXbf6xXEVo+FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54FEAF80307;
	Wed, 20 Nov 2019 12:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89B40F8013D; Wed, 20 Nov 2019 12:00:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A27F800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 12:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A27F800FF
Received: from 79.184.253.244.ipv4.supernova.orange.pl (79.184.253.244) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id a3504edb7f1d7620; Wed, 20 Nov 2019 12:00:49 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Date: Wed, 20 Nov 2019 12:00:48 +0100
Message-ID: <1707133.c5szpGgj5A@kreacher>
In-Reply-To: <20191119002121.4107-13-sean.j.christopherson@intel.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-13-sean.j.christopherson@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH 12/12] x86/ACPI/sleep: Move
	acpi_wakeup_address() definition into sleep.c
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

On Tuesday, November 19, 2019 1:21:21 AM CET Sean Christopherson wrote:
> Move the definition of acpi_wakeup_address() into sleep.c to break
> linux/acpi.h's dependency (by way of asm/acpi.h) on asm/realmode.h.
> Everyone and their mother includes linux/acpi.h, i.e. modifying
> realmode.h results in a full kernel rebuild, which makes the already
> inscrutable real mode boot code even more difficult to understand and is
> positively rage inducing when trying to make changes to x86's boot flow.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/include/asm/acpi.h  |  6 +-----
>  arch/x86/kernel/acpi/sleep.c | 11 +++++++++++
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> index 57788ec6fa82..0cae3f773d44 100644
> --- a/arch/x86/include/asm/acpi.h
> +++ b/arch/x86/include/asm/acpi.h
> @@ -13,7 +13,6 @@
>  #include <asm/processor.h>
>  #include <asm/mmu.h>
>  #include <asm/mpspec.h>
> -#include <asm/realmode.h>
>  #include <asm/x86_init.h>
>  
>  #ifdef CONFIG_ACPI_APEI
> @@ -62,10 +61,7 @@ static inline void acpi_disable_pci(void)
>  extern int (*acpi_suspend_lowlevel)(void);
>  
>  /* Physical address to resume after wakeup */
> -static inline unsigned long acpi_wakeup_address(void)
> -{
> -	return ((unsigned long)(real_mode_header->wakeup_start));
> -}
> +unsigned long acpi_wakeup_address(void);
>  
>  /*
>   * Check if the CPU can handle C2 and deeper
> diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
> index ca13851f0570..44d3fb1a1de3 100644
> --- a/arch/x86/kernel/acpi/sleep.c
> +++ b/arch/x86/kernel/acpi/sleep.c
> @@ -26,6 +26,17 @@ unsigned long acpi_realmode_flags;
>  static char temp_stack[4096];
>  #endif
>  
> +/**
> + * acpi_wakeup_address - provide physical address for S3 wakeup
> + *
> + * Returns the physical address where the kernel should be resumed after the
> + * system awakes from S3, e.g. for programming into the firmware waking vector.
> + */
> +unsigned long acpi_wakeup_address(void)
> +{
> +	return ((unsigned long)(real_mode_header->wakeup_start));
> +}
> +
>  /**
>   * x86_acpi_enter_sleep_state - enter sleep state
>   * @state: Sleep state to enter.
> 




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
