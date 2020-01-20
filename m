Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A3142F59
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:11:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5919166D;
	Mon, 20 Jan 2020 17:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5919166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536705;
	bh=ZhxQ0IKUngvVDBZuAVtLc4WMJ/yhdx7sONLhKgXhRHE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ocva+96oo4uU5x9OeeutUgMcjO2baz3NNxjKx8jMQNa8VcUKO3OHfn9yigh5q/TCR
	 0ThQgE533d7KiBJNVnHF9T4A9RzE3jPm8dmmcSHGXXanOo7QL7+s4pCEZp9crhkXqd
	 eZ1ITsBqfIKRxXZm2uVQEVNrOJva8KqrbLYQbWX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34197F80272;
	Mon, 20 Jan 2020 17:08:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4E60F80274; Mon, 20 Jan 2020 17:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 980F4F80249
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 980F4F80249
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 08:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="374357098"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 20 Jan 2020 08:08:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CC470107; Mon, 20 Jan 2020 18:08:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2020 18:07:52 +0200
Message-Id: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/9] x86: Easy way of detecting MS Surface 3
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

While working on RTC regression, I noticed that we are using the same DMI check
over and over in the drivers for MS Surface 3 platform. This series dedicated
for making it easier in the same way how it's done for Apple machines.

Changelog v2:
- removed RTC patches for now
- added couple more clean ups to arch/x86/kernel/quirks.c
- redone DMI quirk to use driver_data instead of callback
- simplified check in soc-acpi-intel-cht-match.c to be oneliner
- added a new patch to cover rt5645 codec driver

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org

Andy Shevchenko (9):
  x86/platform: Rename x86/apple.h -> x86/machine.h
  x86/quirks: Add missed include to satisfy static checker
  x86/quirks: Introduce hpet_dev_print_force_hpet_address() helper
  x86/quirks: Join string literals back
  x86/quirks: Convert DMI matching to use a table
  x86/quirks: Add a DMI quirk for Microsoft Surface 3
  platform/x86: surface3_wmi: Switch DMI table match to a test of
    variable
  ASoC: rt5645: Switch DMI table match to a test of variable
  ASoC: Intel: Switch DMI table match to a test of variable

 arch/x86/kernel/quirks.c                      | 91 +++++++++++++------
 drivers/platform/x86/surface3-wmi.c           | 16 +---
 include/linux/platform_data/x86/apple.h       | 14 +--
 include/linux/platform_data/x86/machine.h     | 20 ++++
 sound/soc/codecs/rt5645.c                     | 14 ++-
 .../intel/common/soc-acpi-intel-cht-match.c   | 33 +------
 6 files changed, 93 insertions(+), 95 deletions(-)
 create mode 100644 include/linux/platform_data/x86/machine.h

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
