Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D67A1EE6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF95C84C;
	Fri, 15 Sep 2023 14:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF95C84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781675;
	bh=MzeShrIvSqG9AFXhmhSIDhg+tspxYnTBXB8X3TOyRsE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VxxG+ZaZPGFaaw3HdylmyTpPid/Ffv/CduEVN5o73o7YxvKlt9f90p7U16dFDL4g7
	 jf6nPElnBeocvagHP+pyDt1hHmVEStr82FpepvH0rb0Ac/OjbC/7NHv1q4qEhTIQ1D
	 KBRGp5cdsfjKnd8+7Cut2YbTJXs4Xq763piHZOTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E867F80552; Fri, 15 Sep 2023 14:40:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CFFF80551;
	Fri, 15 Sep 2023 14:40:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B986F80549; Fri, 15 Sep 2023 14:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96110F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96110F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fFLigSxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781615; x=1726317615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MzeShrIvSqG9AFXhmhSIDhg+tspxYnTBXB8X3TOyRsE=;
  b=fFLigSxn+lSrSXp93sp3m/sKUi9/u7eknSnbI+b0azViY4kt8lMKvarw
   YpirHTngcF7sBjWHYGg+kh4RYzNi1xLYX/tKszRWb7wAjysRQM4exstmn
   XHfp/qKhZI4Ey/P4bO2i1yRjgLFqHnTAhzK9VG8PHFk+YhvTdmWEd3kVl
   z5K5TI9r6GJZ6jz0cyzlE/f8kmH746+BLqyqeho4EnbCJn79sm5fSFojA
   1Qj4KXwSW9YtDUtKsuyCM4GTiFtGbQirzuDbAqtFKO/KPAtdPqVxQ9X/1
   NQ0VbaCyWww3N0P0cSAdAj+txnsMqd+Xj7NXyL45lIPgrsFI+AaWF4W5F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653100"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653100"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304514"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304514"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 00/19] ASoC: Intel: machine driver update
Date: Fri, 15 Sep 2023 20:48:33 +0800
Message-Id: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TVZULG3GAIKD6M3CUV6QOCBPEJA7JT7F
X-Message-ID-Hash: TVZULG3GAIKD6M3CUV6QOCBPEJA7JT7F
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVZULG3GAIKD6M3CUV6QOCBPEJA7JT7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some cleanups from Brent Lu for I2S platforms. And minor additions for
RVPs and Chromebooks.

Balamurugan C (1):
  ASoC: Intel: sof_rt5682: add HDMI_In capture feature support for RPL.

Brent Lu (16):
  ASoC: Intel: sof_rt5682: cleanup unnecessary quirk flag
  ASoC: Intel: ssp-common: support codec detection
  ASoC: Intel: use ACPI HID definition in ssp-common
  ASoC: Intel: sof_rt5682: use ssp-common module to detect codec
  ASoC: Intel: sof_cs42l42: use ssp-common module to detect codec
  ASoC: Intel: sof_ssp_amp: use ssp-common module to detect codec
  ASoC: Intel: sof_nau8825: use ssp-common module to detect codec
  ASoC: Intel: sof_rt5682: add adl_rt5650 board config
  ASoC: Intel: sof_ssp_amp: do not create amp link for nocodec board
  ASoC: Intel: nuvoton-common: support nau8318 amplifier
  ASoC: Intel: sof_nau8825: use nuvoton-common module
  ASoC: Intel: sof_nau8825: use realtek-common module
  ASoC: Intel: sof_da7219: rename driver file and kernel option
  ASoC: Intel: sof_da7219: use maxim-common module
  ASoC: Intel: sof_da7219: add adl_mx98360_da7219 board config
  ASoC: Intel: sof_da7219: use ssp-common module to detect codec

Uday M Bhat (2):
  ASoC: Intel: sof_rt5682: Add support for Rex with discrete BT offload.
  ASoC: Intel: sof_rt5682: Modify number of HDMI to 3 for MTL/Rex
    devices

 sound/soc/intel/boards/Kconfig                |  24 +-
 sound/soc/intel/boards/Makefile               |  10 +-
 sound/soc/intel/boards/sof_cirrus_common.h    |   9 +-
 sound/soc/intel/boards/sof_cs42l42.c          |  55 +-
 .../{sof_da7219_max98373.c => sof_da7219.c}   | 361 ++++++++-----
 sound/soc/intel/boards/sof_maxim_common.h     |  13 +-
 sound/soc/intel/boards/sof_nau8825.c          | 168 +++----
 sound/soc/intel/boards/sof_nuvoton_common.c   |  73 +++
 sound/soc/intel/boards/sof_nuvoton_common.h   |  22 +
 sound/soc/intel/boards/sof_realtek_common.h   |  37 +-
 sound/soc/intel/boards/sof_rt5682.c           | 473 ++++++++++--------
 sound/soc/intel/boards/sof_ssp_amp.c          | 114 +++--
 sound/soc/intel/boards/sof_ssp_common.c       | 101 ++++
 sound/soc/intel/boards/sof_ssp_common.h       |  71 +++
 .../intel/common/soc-acpi-intel-adl-match.c   |  19 +
 .../intel/common/soc-acpi-intel-jsl-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   |   7 +
 17 files changed, 1008 insertions(+), 561 deletions(-)
 rename sound/soc/intel/boards/{sof_da7219_max98373.c => sof_da7219.c} (56%)
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.c
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.h
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.c
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.h

-- 
2.25.1

