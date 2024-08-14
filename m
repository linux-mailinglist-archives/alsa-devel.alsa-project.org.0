Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A639516DD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 10:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FD32353;
	Wed, 14 Aug 2024 10:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FD32353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723625111;
	bh=dSFS4Ni1FULSXvzN+U9h9xBHT2gLjAntPAgAMJftT8s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZH9ni61OPuDaDv4bU09xZx70FkeHPnUKaT0IMOFupI+881d2g6/FsTZ+VaMfmgxmF
	 ys7v3yJoDJ0XwNc2deQ6Ovevu0/NG4gfaTqo0all1dpJc8iQOdlKDJS5x/FvAelx8p
	 R1HRGPlV8YOTegEbtK2dxX2o4HqtnAw0njTrCDWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C055F8058C; Wed, 14 Aug 2024 10:44:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B79F805A8;
	Wed, 14 Aug 2024 10:44:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88CCF80580; Wed, 14 Aug 2024 10:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EE34F800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE34F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ir2/tkeT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624803; x=1755160803;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dSFS4Ni1FULSXvzN+U9h9xBHT2gLjAntPAgAMJftT8s=;
  b=ir2/tkeTUHlllYfSLzgCgy4Dtm+ahqbMb8WEBAxWiXeI3FsOybOL6se+
   ms+k+JWBW7jo5W+lRkL+7uF5uzbG5VwmxUUM55fHFqjteJ5F1aYVYKK0R
   Chqvfi+BBi++khbmKTuqOGAH3OHSfPWi4G6zn0/yRFJ8acrLEOokhSzqx
   GnA2ERpsNlkrQnAcuTXVBz7Fqe5egvDyjoD+RkoeJGSQC+nhuOSEHsCjH
   KLq6kJFWRUcv9KauY5D1xJ4XbtUm2i9Bdh2AdtRcff2KXUOKV5W02Vwvf
   AIWmiSdoAMx91x2zWnAFmjwNahE7CDna6/hrmYezUmSp6mibyKOhT/Oi+
   A==;
X-CSE-ConnectionGUID: 8+TJGLfOQKeD6BGUC5D9iQ==
X-CSE-MsgGUID: L+2rSzTZR9SbZvk6e+Ibxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735098"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:39:57 -0700
X-CSE-ConnectionGUID: fewIiJQIQLeO1SXBkCN8XA==
X-CSE-MsgGUID: agmeZqDyRUKXHRU+IUpUZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63867874"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:39:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Date: Wed, 14 Aug 2024 10:39:15 +0200
Message-Id: <20240814083929.1217319-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IJQPWPZ4WLKJ2CUBAVKFUJGXABNHN2O4
X-Message-ID-Hash: IJQPWPZ4WLKJ2CUBAVKFUJGXABNHN2O4
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJQPWPZ4WLKJ2CUBAVKFUJGXABNHN2O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A spiritual successor to haswell/baytrail removal series [1].

The avs-driver found in sound/soc/intel/avs is a direct replacement to
the existing skylake-driver. It covers all features supported by it and
more and aligns with the recommended flows and requirements based on
Windows driver equivalent.

The skylake-driver related UAPI has been removed with "ASoC: Drop
soc-topology ABI v4 support" [2].

For the official kernel tree the deprecation begun with v6.0. Most
skylake-drivers users moved to avs- or SOF-driver when AudioDSP
capabilities are available on the platform or to snd-hda-intel
(sound/pci/hda) when such capabilities are not.

For the supported trees the deprecation begun with v5.4 with v5.15 being
the first where the skylake-driver is disabled entirely.

All machine board drivers that consume this DSP driver have their
replacements present within sound/soc/intel/avs/boards/ directory.


Changes in v2:
- added two new patches (leading the series)
- the first moves all device entries previously under the skylake-driver
  dependency under the avs-driver
- the second patch drops struct skl_machine_pdata usage to fix
  compilation errors as pointed out by IKP
- no further changes, retained Acked-by tags for these

[1]: https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240403091629.647267-1-cezary.rojewski@intel.com/


Cezary Rojewski (14):
  ALSA: hda: Move SST device entries to AVS
  ASoC: Intel: Drop skl_machine_pdata usage
  ASoC: Intel: Remove bxt_rt298 board driver
  ASoC: Intel: Remove bxt_da7219_max98357a board driver
  ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
  ASoC: Intel: Remove kbl_rt5663_max98927 board driver
  ASoC: Intel: Remove kbl_rt5660 board driver
  ASoC: Intel: Remove kbl_da7219_max98927 board driver
  ASoC: Intel: Remove kbl_da7219_max98357a board driver
  ASoC: Intel: Remove skl_rt286 board driver
  ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
  ASoC: Intel: Remove skl_nau88l25_max98357a board driver
  ASoC: Intel: Remove skylake driver
  ASoC: Intel: avs: Enable by default for all SST configurations

 sound/hda/intel-dsp-config.c                  |  111 +-
 sound/soc/intel/Kconfig                       |  120 -
 sound/soc/intel/Makefile                      |    1 -
 sound/soc/intel/avs/core.c                    |    8 +-
 sound/soc/intel/boards/Kconfig                |  152 +-
 sound/soc/intel/boards/Makefile               |   20 -
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  720 ----
 sound/soc/intel/boards/bxt_rt298.c            |  670 ---
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  688 ----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 1175 ------
 sound/soc/intel/boards/kbl_rt5660.c           |  567 ---
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 1073 -----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  869 ----
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  704 ----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  751 ----
 sound/soc/intel/boards/skl_rt286.c            |  568 ---
 .../intel/common/soc-acpi-intel-cnl-match.c   |    6 -
 .../intel/common/soc-acpi-intel-ehl-match.c   |    1 -
 .../intel/common/soc-acpi-intel-hda-match.c   |    6 -
 .../intel/common/soc-acpi-intel-icl-match.c   |    6 -
 .../intel/common/soc-acpi-intel-kbl-match.c   |   11 -
 .../intel/common/soc-acpi-intel-skl-match.c   |    5 -
 sound/soc/intel/skylake/Makefile              |   15 -
 sound/soc/intel/skylake/bxt-sst.c             |  629 ---
 sound/soc/intel/skylake/cnl-sst-dsp.c         |  266 --
 sound/soc/intel/skylake/cnl-sst-dsp.h         |  103 -
 sound/soc/intel/skylake/cnl-sst.c             |  508 ---
 sound/soc/intel/skylake/skl-debug.c           |  248 --
 sound/soc/intel/skylake/skl-i2s.h             |   87 -
 sound/soc/intel/skylake/skl-messages.c        | 1419 -------
 sound/soc/intel/skylake/skl-nhlt.c            |  269 --
 sound/soc/intel/skylake/skl-pcm.c             | 1507 -------
 sound/soc/intel/skylake/skl-ssp-clk.c         |  428 --
 sound/soc/intel/skylake/skl-ssp-clk.h         |  108 -
 sound/soc/intel/skylake/skl-sst-cldma.c       |  373 --
 sound/soc/intel/skylake/skl-sst-cldma.h       |  243 --
 sound/soc/intel/skylake/skl-sst-dsp.c         |  462 ---
 sound/soc/intel/skylake/skl-sst-dsp.h         |  256 --
 sound/soc/intel/skylake/skl-sst-ipc.c         | 1071 -----
 sound/soc/intel/skylake/skl-sst-ipc.h         |  169 -
 sound/soc/intel/skylake/skl-sst-utils.c       |  425 --
 sound/soc/intel/skylake/skl-sst.c             |  599 ---
 sound/soc/intel/skylake/skl-topology.c        | 3605 -----------------
 sound/soc/intel/skylake/skl-topology.h        |  524 ---
 sound/soc/intel/skylake/skl.c                 | 1177 ------
 sound/soc/intel/skylake/skl.h                 |  207 -
 46 files changed, 59 insertions(+), 22871 deletions(-)
 delete mode 100644 sound/soc/intel/boards/bxt_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/bxt_rt298.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98357a.c
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5660.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_max98927.c
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_max98357a.c
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_ssm4567.c
 delete mode 100644 sound/soc/intel/boards/skl_rt286.c
 delete mode 100644 sound/soc/intel/skylake/Makefile
 delete mode 100644 sound/soc/intel/skylake/bxt-sst.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/cnl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/cnl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-debug.c
 delete mode 100644 sound/soc/intel/skylake/skl-i2s.h
 delete mode 100644 sound/soc/intel/skylake/skl-messages.c
 delete mode 100644 sound/soc/intel/skylake/skl-nhlt.c
 delete mode 100644 sound/soc/intel/skylake/skl-pcm.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.c
 delete mode 100644 sound/soc/intel/skylake/skl-ssp-clk.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-cldma.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-dsp.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst-ipc.h
 delete mode 100644 sound/soc/intel/skylake/skl-sst-utils.c
 delete mode 100644 sound/soc/intel/skylake/skl-sst.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.c
 delete mode 100644 sound/soc/intel/skylake/skl-topology.h
 delete mode 100644 sound/soc/intel/skylake/skl.c
 delete mode 100644 sound/soc/intel/skylake/skl.h

-- 
2.25.1

