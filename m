Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFF4D2164
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F5A51898;
	Tue,  8 Mar 2022 20:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F5A51898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767673;
	bh=WqiW8cw/+yQFK90Mt4YgXLDxcl3QnC7ZO/INHRIfOsg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jfvwm+27wzdI9sbTsXunSkMXTtyhm6BKjcUWcMiLx4o0dJVqtskRu0AIu3d3fK+iv
	 pPlltOo5Mk+2Q7EWkMeQXcpH3G87sMPgbEq5Cw/8P2k4bKUWPem51ibcpJHI61+KuJ
	 pvMkfXJ36HKgSuiJq3QA02KexZiXL98MAFliWMLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA95F80271;
	Tue,  8 Mar 2022 20:26:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEFA8F800D2; Tue,  8 Mar 2022 20:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B3E2F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B3E2F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cU12XQ/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767602; x=1678303602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WqiW8cw/+yQFK90Mt4YgXLDxcl3QnC7ZO/INHRIfOsg=;
 b=cU12XQ/OKdN6afONyu5XTzUQi30f53jY+YPuljbrIciKE40NIJKVAkAg
 3Xa3TcCXLXY/fK9YeqAiqluK3uSQXr0b9hMVlBMgyIWSkFgCsOiULXiEf
 2IhD/c2yGYPkTtEdVbqazeAfARDI9Uqqwvo/qOaPVDrVt0m8jreuWhZKZ
 mM1LpxFz9LSZYB52tYcaOs1I598ZSi4tBsEexFtzr0BH/EfrdOf9ghrxM
 9gKjE8zH4UBQDsYmeWZcjov+5M22KY228/HdKPNoNzVLo+AOUBPhjpHK7
 3zGbriQsFW92wKaNp5rv/Teu0hyTX/4O2J5S68zftvk30FQ3UWoHV67e9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363670"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573922"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/20] ALSA/ASoC/SOF/Intel: improve support for ES8336-based
 platforms
Date: Tue,  8 Mar 2022 13:25:50 -0600
Message-Id: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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

This patchset adds a number of improvements for ES8336-based Intel
platforms, which are not well supported at all in Linux. Since
Christmas 2021, we've seen dozens of reports of broken audio [1].

The fundamental problem is that those platforms were built for Windows
but using an I2S codec - instead of the HDaudio traditional
solution. As a result, we are missing all the usual information needed
to configure the audio card (which I2S, what configuration, DMICs or
not, etc). The situation is similar to Baytrail with all possible
permutations enabled.

Some of the information can be discovered by checking the contents of
the 'NHLT' ACPI table. This helps discover at run-time which SSP to
use, and the number of microphones present. This NHLT-based solution
helps remove quirks that were added earlier.

Unfortunately, there are still a number of platform properties that
are not described by ACPI, just as GPIOs used for speakers, jack
detection inversion, etc. For some case, quirks are still provided in
the machine drivers.

Additional work will likely be needed, e.g. to detect which MCLK needs
to be used, refine the UCM settings, add the ES8326 codec driver, but
this is a first-step towards an 'out of the box' experience on Intel
platforms.

This patchset touches the sound/hda/intel-nhlt parts but should IMHO
be merged in the ASoC tree.

I would like to acknowledge the help of Nikolai Kostrigin, Mauro
Carvalho Chehab, Huajun Li, David Yang (@yangxiaohua2009) and other
GitHub testers.

[1] https://github.com/thesofproject/linux/issues?q=is%3Aissue+is%3Aopen+label%3A%22codec+ES8336%22

Nikolai Kostrigin (1):
  ASoC: Intel: soc-acpi: add ESSX8336 support on Cannon Lake machines

Pierre-Louis Bossart (19):
  ASoC: soc-acpi: fix kernel-doc descriptor
  ASoC: soc-acpi: add information on I2S/TDM link mask
  ASoC: SOF: Intel: hda: retrieve DMIC number for I2S boards
  ALSA: intel-nhlt: add helper to detect SSP link mask
  ASoC: SOF: Intel: hda: report SSP link mask to machine driver
  ASoC: Intel: soc-acpi: quirk topology filename dynamically
  ALSA: intel-dsp-config: add more ACPI HIDs for ES83x6 devices
  ASoC: Intel: soc-acpi: add more ACPI HIDs for ES83x6 devices
  ALSA: intel-dspconfig: add ES8336 support for CNL
  ASoC: Intel: sof_es8336: make gpio optional
  ASoC: Intel: sof_es8336: get codec device with ACPI instead of bus
    search
  ASoC: Intel: Revert "ASoC: Intel: sof_es8336: add quirk for Huawei D15
    2021"
  ASoC: Intel: sof_es8336: use NHLT information to set dmic and SSP
  ASoC: Intel: sof_es8336: log all quirks
  ASoC: Intel: sof_es8336: move comment to the right place
  ASoC: Intel: sof_es8336: add support for JD inverted quirk
  ASoC: Intel: sof_es8336: extend machine driver to support ES8326 codec
  ASoC: Intel: sof_es8336: add cfg-dmics component for UCM support
  ASoC: Intel: bytcht_es8316: move comment to the right place

 include/sound/intel-nhlt.h                    |  22 ++-
 include/sound/soc-acpi.h                      |  27 +++-
 sound/hda/intel-dsp-config.c                  |  36 +++--
 sound/hda/intel-nhlt.c                        |  22 +++
 sound/soc/intel/boards/Kconfig                |   3 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   2 +-
 sound/soc/intel/boards/sof_es8336.c           | 142 +++++++++++++-----
 .../intel/common/soc-acpi-intel-bxt-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-cnl-match.c   |  14 ++
 .../intel/common/soc-acpi-intel-glk-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  12 +-
 sound/soc/sof/intel/hda.c                     | 120 ++++++++++++---
 14 files changed, 360 insertions(+), 88 deletions(-)


base-commit: 0b7daa6bd0a4cab3b0c6f266a8cb1344ce14ef19
-- 
2.30.2

