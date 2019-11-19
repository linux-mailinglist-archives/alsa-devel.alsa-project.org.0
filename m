Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5086103839
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF61B16BE;
	Wed, 20 Nov 2019 12:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF61B16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574247952;
	bh=RWnvSvbFrLfpU6tHSEFHPvNPfUrufEcR14L2ITEPiDI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KT3fW+x9BhtE3FHHE8BwmHNcD5Yjna75Pl/hk4ACLMRiOylSgWNy3IcGPrW11R/ew
	 frlc2Ma5fT7lQ9r61CsB8hLndU8i+HZcjW2ynTPdL9qVKkbeASYE5Q18RC/D9BuSWG
	 Pn7kul9x4A5l81/Y4vgTGYhWOcu2yEB/yaZhO2fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC64CF800C1;
	Wed, 20 Nov 2019 12:02:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C7ABF8013F; Tue, 19 Nov 2019 01:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D7DDF800F6
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 01:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D7DDF800F6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 16:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="215412011"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2019 16:21:36 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 18 Nov 2019 16:21:09 -0800
Message-Id: <20191119002121.4107-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.24.0
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
Subject: [alsa-devel] [PATCH 00/12] treewide: break dependencies on x86's RM
	header
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

x86's asm/realmode.h, which defines low level structures, variables and
helpers used to bring up APs during SMP boot, ends up getting included in
practically every nook and cranny of the kernel because the address used
by ACPI for resuming from S3 also happens to be stored in the real mode
header, and ACPI bleeds the dependency into its widely included headers.

As a result, modifying realmode.h for even the most trivial change to the
boot code triggers a full kernel rebuild, which is frustrating to say the
least as it some of the most difficult code to get exactly right *and* is
also some of the most functionally isolated code in the kernel.

To break the kernel's widespread dependency on realmode.h, add a wrapper
in the aforementioned ACPI S3 code to access the real mode header instead
of derefencing the header directly in asm/acpi.h and thereby exposing it
to the world via linux/acpi.h.

Build tested on x86 with allyesconfig and allmodconfig, so hopefully there
aren't more build issues lurking, but at this point it wouldn't surprise
me in the least if this somehow manages to break the build.

Based on tip/master, commit ceceaf1f12ba ("Merge branch 'WIP.x86/cleanups'").

Patch Synopsis:
  - Patches 01-09 fix a variety of build errors that arise when patch 12
    drops realmode.h from asm/acpi.h.  Most of the errors are quite absurb
    as they have no relation whatsoever to x86's RM boot code, but occur
    because realmode.h happens to include asm/io.h.

  - Patch 10 removes a spurious include of realmode.h from an ACPI header.

  - Patches 11 and 12 implement the wrapper and move it out of acpi.h.


Sean Christopherson (12):
  x86/efi: Explicitly include realmode.h to handle RM trampoline quirk
  x86/boot: Explicitly include realmode.h to handle RM reservations
  x86/ftrace: Explicitly include vmalloc.h for
    set_vm_flush_reset_perms()
  x86/kprobes: Explicitly include vmalloc.h for
    set_vm_flush_reset_perms()
  perf/x86/intel: Explicitly include asm/io.h to use virt_to_phys()
  efi/capsule-loader: Explicitly include linux/io.h for page_to_phys()
  virt: vbox: Explicitly include linux/io.h to pick up various defs
  vmw_balloon: Explicitly include linux/io.h for virt_to_phys()
  ASoC: Intel: Skylake: Explicitly include linux/io.h for virt_to_phys()
  x86/ACPI/sleep: Remove an unnecessary include of asm/realmode.h
  ACPI/sleep: Convert acpi_wakeup_address into a function
  x86/ACPI/sleep: Move acpi_wakeup_address() definition into sleep.c

 arch/ia64/include/asm/acpi.h             |  5 ++++-
 arch/ia64/kernel/acpi.c                  |  2 --
 arch/x86/events/intel/ds.c               |  1 +
 arch/x86/include/asm/acpi.h              |  3 +--
 arch/x86/kernel/acpi/sleep.c             | 11 +++++++++++
 arch/x86/kernel/acpi/sleep.h             |  2 +-
 arch/x86/kernel/ftrace.c                 |  1 +
 arch/x86/kernel/kprobes/core.c           |  1 +
 arch/x86/kernel/setup.c                  |  1 +
 arch/x86/platform/efi/quirks.c           |  1 +
 drivers/acpi/sleep.c                     |  4 ++--
 drivers/firmware/efi/capsule-loader.c    |  1 +
 drivers/misc/vmw_balloon.c               |  1 +
 drivers/virt/vboxguest/vboxguest_core.c  |  1 +
 drivers/virt/vboxguest/vboxguest_utils.c |  1 +
 sound/soc/intel/skylake/skl-sst-cldma.c  |  1 +
 16 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
