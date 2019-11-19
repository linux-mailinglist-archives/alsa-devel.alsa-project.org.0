Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE110384B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A091216C0;
	Wed, 20 Nov 2019 12:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A091216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248276;
	bh=cp6RFTrI+ULoqNX9qFwAcDLNSAxcyWGnXY5JtXeC/0A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZBoCwAF65ayvlWMtz5jjDeACUQBVieL0et/+dOb3miRy7l9h5DcSwOHCKTx5ss5D
	 Jr5NDXTCm/svGhHiG/tsRI7rxbCBZn3tev/pEhtNOE2p4NPRJEGlfac2LOdYwNiz9P
	 dj3Yo9LJjj0i3QIW1tUx0Lt4g5e2vMyfSWjfZMjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76363F80240;
	Wed, 20 Nov 2019 12:02:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C046F8013F; Tue, 19 Nov 2019 01:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F32F80100
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 01:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F32F80100
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 16:21:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="215412049"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.41])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2019 16:21:47 -0800
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>
Date: Mon, 18 Nov 2019 16:21:18 -0800
Message-Id: <20191119002121.4107-10-sean.j.christopherson@intel.com>
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
Subject: [alsa-devel] [PATCH 09/12] ASoC: Intel: Skylake: Explicitly include
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

Through a labyrinthian sequence of includes, usage of virt_to_phys() is
dependent on the include of asm/io.h in x86's asm/realmode.h, which is
included in x86's asm/acpi.h and thus by linux/acpi.h.  Explicitly
include linux/io.h to break the dependency on realmode.h so that a
future patch can remove the realmode.h include from acpi.h without
breaking the build.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 sound/soc/intel/skylake/skl-sst-cldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/skl-sst-cldma.c b/sound/soc/intel/skylake/skl-sst-cldma.c
index 5a2c35f58fda..36f697c61074 100644
--- a/sound/soc/intel/skylake/skl-sst-cldma.c
+++ b/sound/soc/intel/skylake/skl-sst-cldma.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include "../common/sst-dsp.h"
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
