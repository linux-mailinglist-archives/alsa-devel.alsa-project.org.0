Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C857B10AACC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 07:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62535173F;
	Wed, 27 Nov 2019 07:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62535173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574837483;
	bh=6kRN2DTZxCyN/kZA49Nu6QwTgQjxe6YlHN8PvZcBRAI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4BNhoX62SdQIeF7OCNmiQZZEfQqKYcQ6WvWWGB5hJFnDE+KGwaJPUZPJRgYr9g/r
	 UXz9OTWoDJYGvG2TWAe3ilqAXqEPFI0id/mi6iEoU+lBWLNwcIqkHgvQjfiPud6hRV
	 RhrQvrKz4tcAT6/50+KOi3tnSSyF+yREi9M7WTkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C43F802A1;
	Wed, 27 Nov 2019 07:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE41F801F4; Tue, 26 Nov 2019 17:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 262F6F801F5
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 17:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 262F6F801F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 08:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="217197251"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2019 08:54:54 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Tue, 26 Nov 2019 08:54:16 -0800
Message-Id: <20191126165417.22423-12-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126165417.22423-1-sean.j.christopherson@intel.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 07:39:10 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, "VMware, Inc." <pv-drivers@vmware.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Nadav Amit <nadav.amit@gmail.com>,
 linux-acpi@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: [alsa-devel] [PATCH v2 11/12] ACPI/sleep: Convert
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

Convert acpi_wakeup_address from a raw variable into a function so that
x86 can wrap its dereference of the real mode boot header in a function
instead of broadcasting it to the world via a #define.  This sets the
stage for a future patch to move x86's definition of the new function,
acpi_get_wakeup_address(), out of asm/acpi.h and thus break acpi.h's
dependency on asm/realmode.h.

No functional change intended.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/ia64/include/asm/acpi.h | 5 ++++-
 arch/ia64/kernel/acpi.c      | 2 --
 arch/x86/include/asm/acpi.h  | 5 ++++-
 drivers/acpi/sleep.c         | 3 +++
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/ia64/include/asm/acpi.h b/arch/ia64/include/asm/acpi.h
index f886d4dc9d55..b66ba907019c 100644
--- a/arch/ia64/include/asm/acpi.h
+++ b/arch/ia64/include/asm/acpi.h
@@ -38,7 +38,10 @@ int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 /* Low-level suspend routine. */
 extern int acpi_suspend_lowlevel(void);
 
-extern unsigned long acpi_wakeup_address;
+static inline unsigned long acpi_get_wakeup_address(void)
+{
+	return 0;
+}
 
 /*
  * Record the cpei override flag and current logical cpu. This is
diff --git a/arch/ia64/kernel/acpi.c b/arch/ia64/kernel/acpi.c
index 70d1587ddcd4..a5636524af76 100644
--- a/arch/ia64/kernel/acpi.c
+++ b/arch/ia64/kernel/acpi.c
@@ -42,8 +42,6 @@ int acpi_lapic;
 unsigned int acpi_cpei_override;
 unsigned int acpi_cpei_phys_cpuid;
 
-unsigned long acpi_wakeup_address = 0;
-
 #define ACPI_MAX_PLATFORM_INTERRUPTS	256
 
 /* Array to record platform interrupt vectors for generic interrupt routing. */
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index bc9693c9107e..23ffafd927a1 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -62,7 +62,10 @@ static inline void acpi_disable_pci(void)
 extern int (*acpi_suspend_lowlevel)(void);
 
 /* Physical address to resume after wakeup */
-#define acpi_wakeup_address ((unsigned long)(real_mode_header->wakeup_start))
+static inline unsigned long acpi_get_wakeup_address(void)
+{
+	return ((unsigned long)(real_mode_header->wakeup_start));
+}
 
 /*
  * Check if the CPU can handle C2 and deeper
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index 9fa77d72ef27..2e87ccf17ff6 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -61,8 +61,11 @@ static struct notifier_block tts_notifier = {
 static int acpi_sleep_prepare(u32 acpi_state)
 {
 #ifdef CONFIG_ACPI_SLEEP
+	unsigned long acpi_wakeup_address;
+
 	/* do we have a wakeup address for S2 and S3? */
 	if (acpi_state == ACPI_STATE_S3) {
+		acpi_wakeup_address = acpi_get_wakeup_address();
 		if (!acpi_wakeup_address)
 			return -EFAULT;
 		acpi_set_waking_vector(acpi_wakeup_address);
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
