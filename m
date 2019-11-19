Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A4F10384F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:13:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E3016EC;
	Wed, 20 Nov 2019 12:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E3016EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248400;
	bh=vKEp0w6eLJiE6t4Xvp17Ubu1Rzo8d1w7jkZXPLgcX30=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHRwqH+x8L30/Yvhzv586NsmnIR01XjCwLRXM/TWt9r6dtFUai9Znv1ds1z9PC2Ek
	 ng5Jdgk6/iTOE/XMimLO7rkJD/xSC+xLwDgc2BksxRtOSsYUi3iopwHO4pBADwh8wK
	 mjfyVSJtLueT0SrHBlark2L7EmJrrU0Y2JI2oay8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1463EF80256;
	Wed, 20 Nov 2019 12:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3DF1F800F1; Tue, 19 Nov 2019 01:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 151CCF80146
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 01:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151CCF80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 16:21:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="215412059"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2019 16:21:50 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 18 Nov 2019 16:21:20 -0800
Message-Id: <20191119002121.4107-12-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119002121.4107-1-sean.j.christopherson@intel.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, "VMware, Inc." <pv-drivers@vmware.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: [alsa-devel] [PATCH 11/12] ACPI/sleep: Convert acpi_wakeup_address
	into a function
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
stage for a future patch to move the definition of acpi_wakeup_address()
out of asm/acpi.h and thus break acpi.h's dependency on asm/realmode.h.

No functional change intended.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/ia64/include/asm/acpi.h | 5 ++++-
 arch/ia64/kernel/acpi.c      | 2 --
 arch/x86/include/asm/acpi.h  | 5 ++++-
 drivers/acpi/sleep.c         | 4 ++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/ia64/include/asm/acpi.h b/arch/ia64/include/asm/acpi.h
index f886d4dc9d55..36d7003eee71 100644
--- a/arch/ia64/include/asm/acpi.h
+++ b/arch/ia64/include/asm/acpi.h
@@ -38,7 +38,10 @@ int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
 /* Low-level suspend routine. */
 extern int acpi_suspend_lowlevel(void);
 
-extern unsigned long acpi_wakeup_address;
+static inline unsigned long acpi_wakeup_address(void)
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
index bc9693c9107e..57788ec6fa82 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -62,7 +62,10 @@ static inline void acpi_disable_pci(void)
 extern int (*acpi_suspend_lowlevel)(void);
 
 /* Physical address to resume after wakeup */
-#define acpi_wakeup_address ((unsigned long)(real_mode_header->wakeup_start))
+static inline unsigned long acpi_wakeup_address(void)
+{
+	return ((unsigned long)(real_mode_header->wakeup_start));
+}
 
 /*
  * Check if the CPU can handle C2 and deeper
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index 2af937a8b1c5..9e66c4109556 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -63,9 +63,9 @@ static int acpi_sleep_prepare(u32 acpi_state)
 #ifdef CONFIG_ACPI_SLEEP
 	/* do we have a wakeup address for S2 and S3? */
 	if (acpi_state == ACPI_STATE_S3) {
-		if (!acpi_wakeup_address)
+		if (!acpi_wakeup_address())
 			return -EFAULT;
-		acpi_set_waking_vector(acpi_wakeup_address);
+		acpi_set_waking_vector(acpi_wakeup_address());
 
 	}
 	ACPI_FLUSH_CPU_CACHE();
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
