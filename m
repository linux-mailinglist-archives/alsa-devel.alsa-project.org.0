Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CE1AAAF7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:58:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96787167C;
	Wed, 15 Apr 2020 16:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96787167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962713;
	bh=YxvXKPwbhJgSIuXDacCPEiTGHk+eMnSQOUeDQ9aTG38=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uFagUYsy13yWuL2j2nD8iBhzqQH35Q/qTam1YeaziXW4+zypZzC99OUZ+a7qEHcMI
	 TbKDBYdcLm0MbgL+cdZZWySe2BHyrvxUsC70c4O1slczvVSpdjLhqzj3dZDgPUdXvH
	 afTUWD+/8FcA56OLQqKMegXaxwnwiosBlGJ93zzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED07F8028C;
	Wed, 15 Apr 2020 16:56:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D01BEF8028F; Wed, 15 Apr 2020 16:55:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E7A3F8028A
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7A3F8028A
IronPort-SDR: pEf0jz2ycqSs1xoN67BM2TIjYf2EaF3fZPiDjuvh7aj3QDFeeSLSqqsinmA6VfCVwI51qnxtJ+
 MtYC1693AusQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:55:51 -0700
IronPort-SDR: qemmsPKp5lpipocUHcSQ020vk3nd6na8Xz4igA6gIdQiLHy3Pd8I57Vs1JpUmMyU+xWKdW/NVi
 ffVwYtMfD7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="244121203"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 07:55:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0F60319C; Wed, 15 Apr 2020 17:55:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] x86: Easy way of detecting MS Surface 3
Date: Wed, 15 Apr 2020 17:55:15 +0300
Message-Id: <20200415145524.31745-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While working on RTC regression, I noticed that we are using the same DMI check
over and over in the drivers for MS Surface 3 platform. This series dedicated
for making it easier in the same way how it's done for Apple machines.

Changelog v4:
- rebase on top of v5.7-rc1

Changelog v3:
- fixed typo in patch 5 (Jonathan)
- returned back to if {} else {} condition in ASoC driver (Mark)
- added Mark's Ack tag

Changelog v2:
- removed RTC patches for now (the fix will be independent to this series)
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
 .../intel/common/soc-acpi-intel-cht-match.c   | 28 +-----
 6 files changed, 93 insertions(+), 90 deletions(-)
 create mode 100644 include/linux/platform_data/x86/machine.h

-- 
2.25.1

