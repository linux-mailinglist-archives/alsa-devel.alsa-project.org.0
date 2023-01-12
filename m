Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46966670F5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA7178B68;
	Thu, 12 Jan 2023 12:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA7178B68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673523066;
	bh=mTlCGYhSJLhEo6MLNDgqqw8mFX9HYOQ2vC7ZnQjQzqg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ylu4caeqC5BlPzrlmRdTa9KNZxUaXzrtpjjMKV2xIEjMwzlo05BTIEqxQfFbFVgsM
	 1B3vUDKRFb4SZ19bFKTtyf5ILrIRRbzoUqUmsQWL3iN+nWf4BHW+nf3eNcVNSdWPpE
	 Tc/mefdCqGQZ2eOS1Z/tqVdlQyFv7p/4g0mrlvjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC9AFF8055B;
	Thu, 12 Jan 2023 12:28:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD09F80557; Thu, 12 Jan 2023 12:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54860F80542
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54860F80542
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WoyS81+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673522922; x=1705058922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTlCGYhSJLhEo6MLNDgqqw8mFX9HYOQ2vC7ZnQjQzqg=;
 b=WoyS81+FyWqZgL+3hXJrojRimHOrkNnH8yIduCDvo6C9sejo8ofAf7SX
 3q8msJlzwcDOt/tDR3DVq7Vw0OSj42bQflNF/BSsK8km6/W3FR7M1K73i
 9Dd2Pe3LnmA272gyo2sUN8NtOKSPNEyVdpSI1Ah4CisfeeC8y3+JQ+eCE
 /9N7nJDQK0a8SxmEjYqr1RI8E8JaXBXR2q85bXB3uuuJVVFGZ/bRkioyS
 RoXVvgG/pD0VPBrMnhjbSkaHkJPeQSW+81m9/RBjNzmlqr/e4sE/3BAGT
 qejEsTz7ROf5sDZqtOqrRBkbUey0+UiQTh2VXAAB6M62v+Lwc581TMkNO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385994960"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="385994960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 03:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986519416"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="986519416"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2023 03:28:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 622F0130; Thu, 12 Jan 2023 13:28:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ASoC: Intel: Balance ACPI device refcount
Date: Thu, 12 Jan 2023 13:28:47 +0200
Message-Id: <20230112112852.67714-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While looking for the open coded put_device(&adev->dev) cases, where
adev stands for ACPI device, I noticed that in a few ASoC Intel driver,
among others, the refcount is not balanced properly in some cases.

This series fixes that issue and converts to use acpi_dev_put().

Changelog v2:
- split Intel drivers out from others (Pierre)
- sent with cover letter (Mark)

Andy Shevchenko (5):
  ASoC: Intel: bytcht_es8316: Drop reference count of ACPI device after
    use
  ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after
    use
  ASoC: Intel: bytcr_rt5640: Drop reference count of ACPI device after
    use
  ASoC: Intel: bytcr_wm5102: Drop reference count of ACPI device after
    use
  ASoC: Intel: sof_es8336: Drop reference count of ACPI device after use

 sound/soc/intel/boards/bytcht_es8316.c | 20 ++++++++++++--------
 sound/soc/intel/boards/bytcr_rt5640.c  | 12 ++++++------
 sound/soc/intel/boards/bytcr_rt5651.c  |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c  |  2 +-
 sound/soc/intel/boards/sof_es8336.c    | 14 ++++++++------
 5 files changed, 28 insertions(+), 22 deletions(-)

-- 
2.39.0

