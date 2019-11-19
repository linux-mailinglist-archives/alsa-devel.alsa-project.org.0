Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10510386F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:16:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C229416DE;
	Wed, 20 Nov 2019 12:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C229416DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248594;
	bh=j3FmKqjCLPOVNAv5klbjXJ8+hJ9vSFFrHvkgCow/azk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9HZFGiGN62Upt3ajnaFPgCl92WiLyhVlLPeYivUOVJgwkWoMCnVKP5V3TjLt4bG3
	 AdKnqVbbRMlVPjti5PLoPXJ3uIl6OJF55UC7dyPSDWP7eEp/BVcZDhhYawBOtXuTEN
	 mM2TSXDtlKSALZcV8ph+ne3amfaaMrkK1FjzZaPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA80AF80291;
	Wed, 20 Nov 2019 12:02:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B4B6F80137; Tue, 19 Nov 2019 13:07:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 458DAF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 458DAF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PabPFLNn"
Received: by mail-wr1-x443.google.com with SMTP id w9so23545455wrr.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 04:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iS9pe3dkEr673iYSaJKKJUNkDW4+uEgv0fqUdbRhkeY=;
 b=PabPFLNnFg+osS4gNu3ve83xkE7uJnUNXpSrSSYdyB+wz75KRN+RYHuREBbIQnguYe
 7McNl8SJlgKrybc85/YwRgc4iU54VnjupxbyrPZSvqhU2N1UwqgPad4GZ49FisE+IXcS
 dkxk6uWwKwLHdOJNJUkVamniu8SPq4uYwijcBi8SUpoN4XkLfkcdFyDbBWF+vRHFTzi0
 ffvAC9a5YNXYE0stOHRlyJ91IzRRqbeuiSypd4TWNO3YzP2jf316TViCT5omueEwu7LK
 XjahRaErn4jd7xpk9dfhwg+rJTjhXuPMhS9eIvKeSpCFSNZiI8XlY7Kq1Mz7K1TBCWVc
 BAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=iS9pe3dkEr673iYSaJKKJUNkDW4+uEgv0fqUdbRhkeY=;
 b=LaAqB9pfeXq3FJjOEg8Oyv5gwwdMNoW3LtVIpPCrMjjtgmV6ra6mgA2q6dtAH7CIlX
 2VjfsHNy4CL+6F9NVXWk9XaWsFc+DgzRzawPLeRASP9Y3QONokHGqHK2FX1euppJgqKI
 Xnw0WrgS7UhE/LJoPVJBtvPIcJ1gPvk86Jn38XP6X7OHJqwmI7reCmi2rpvvROmwL8vB
 GXXH6246PyB/XK7jPKC35uSMCwQLdm0le8nZhD+N/Y4Miba2skFd/BJKNn4fxoeNem24
 ilKAVC1eeDImS3JQkIkL3HtumcNbwEz9iM/HrxIJFc0AAqrWYmdElK40GpSPyMTPtkAy
 FE8w==
X-Gm-Message-State: APjAAAUCb0w3YKLb6VXQpRhwHUv2Z4i+pi9idHRiCvmusGEmpaW9LvWF
 E+rHqt5eh0Z2fcyNBIM6/Js=
X-Google-Smtp-Source: APXvYqy6/EXJc0eQicn3FQeArcMb/Ms9rjozFz8E96Loyy5wHW/D99fzz5dYrgDIkdPwH0r24aSwqA==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr16067898wru.54.1574165219202; 
 Tue, 19 Nov 2019 04:06:59 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id v184sm2965490wme.31.2019.11.19.04.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 04:06:58 -0800 (PST)
Date: Tue, 19 Nov 2019 13:06:55 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191119120655.GA31444@gmail.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119111012.GA109842@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119111012.GA109842@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: [alsa-devel] [PATCH] x86/platform/intel/quark: Explicitly include
 linux/io.h for virt_to_phys()
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


* Ingo Molnar <mingo@kernel.org> wrote:

> I've applied them to tip:WIP.core/headers as a work-in-progress tree, 
> and I'm testing them on randconfigs to make sure there's no broken 
> dependencies. I'll wait for the ACPI acks.

One more fix was needed, for the intel-quark driver that is only built on 
32-bit configs:

==================>
From: Ingo Molnar <mingo@kernel.org>
Date: Tue, 19 Nov 2019 12:51:56 +0100
Subject: [PATCH] x86/platform/intel/quark: Explicitly include linux/io.h for virt_to_phys()

Similarly to the previous patches by Sean Christopherson:

 "Through a labyrinthian sequence of includes, usage of virt_to_phys() is
  dependent on the include of asm/io.h in x86's asm/realmode.h, which is
  included in x86's asm/acpi.h and thus by linux/acpi.h.  Explicitly
  include linux/io.h to break the dependency on realmode.h so that a
  future patch can remove the realmode.h include from acpi.h without
  breaking the build."

Cc: linux-kernel@vger.kernel.org
Cc: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/platform/intel-quark/imr.c          | 2 ++
 arch/x86/platform/intel-quark/imr_selftest.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/platform/intel-quark/imr.c b/arch/x86/platform/intel-quark/imr.c
index 6dd25dc5f027..e9d97d52475e 100644
--- a/arch/x86/platform/intel-quark/imr.c
+++ b/arch/x86/platform/intel-quark/imr.c
@@ -29,6 +29,8 @@
 #include <asm/cpu_device_id.h>
 #include <asm/imr.h>
 #include <asm/iosf_mbi.h>
+#include <asm/io.h>
+
 #include <linux/debugfs.h>
 #include <linux/init.h>
 #include <linux/mm.h>
diff --git a/arch/x86/platform/intel-quark/imr_selftest.c b/arch/x86/platform/intel-quark/imr_selftest.c
index 42f879b75f9b..4307830e1b6f 100644
--- a/arch/x86/platform/intel-quark/imr_selftest.c
+++ b/arch/x86/platform/intel-quark/imr_selftest.c
@@ -14,6 +14,8 @@
 #include <asm-generic/sections.h>
 #include <asm/cpu_device_id.h>
 #include <asm/imr.h>
+#include <asm/io.h>
+
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/types.h>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
