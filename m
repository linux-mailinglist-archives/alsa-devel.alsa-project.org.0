Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093C94EA23
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 11:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15DC1903;
	Mon, 12 Aug 2024 11:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15DC1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723455821;
	bh=RArZw0Cl2wd3Zm4nJabLOCL+sTCdFJRSYapD47EjPUk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ik7iT1QqxCcuBZK6pF7Ob1/YdfAcMm6lS268OOm0Q5QzAZlw3BJ4VJ5aMgt80/QQF
	 len8aHq6g3UfkdohlckpYrj8+dcy82ydT7LjBjQbmR3N6djaSuMWOh0sj7HBlNiOaC
	 9TezWItR94FDcrDG5NIJqudwQvRbzxgUhr5W3/3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1000F805B5; Mon, 12 Aug 2024 11:43:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F2EF805BA;
	Mon, 12 Aug 2024 11:43:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E11F80517; Mon, 12 Aug 2024 11:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66C64F80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 11:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C64F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=abFjgeQ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455758; x=1754991758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RArZw0Cl2wd3Zm4nJabLOCL+sTCdFJRSYapD47EjPUk=;
  b=abFjgeQ5nEWEUcpAXIBc+OTo2V0MJgTcsGqVLoFB7DSY7JWNpdg8zb52
   RvJHk4QmesE/bCSrQqYZZtKaj3Tu/eHkTvC7Q+WfDOpr1IlzV/dB9p/Bu
   urHETHYEB9KLNiJyOD0LCsBtrDtCVdkd9hTUoHg7HHgGZwz/fu9YmhQ5F
   C1yPeicOO+aMM4FQ1STs6QskBJyhn2i9tSVTdcpc0s++gbEtwFq875hHH
   OJnvr9/wJujCjLTLanfPSzirbRRcUDdWkmBg+F/XLohqysFmprZRPKxe6
   dapB8svjhQu7JiN1+vlkOIxLBYEZB9MC628WDS70OX/xYSvLlKA3Bzvr0
   w==;
X-CSE-ConnectionGUID: OHMHr7iHQ+G3RzCttUj+XQ==
X-CSE-MsgGUID: 9239RgYmRTiEtQqldyVh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21705337"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="21705337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:42:32 -0700
X-CSE-ConnectionGUID: dwqq3qCWTiqw1ELQZeE9lA==
X-CSE-MsgGUID: S1qeHXdeQmqr9ylLCmvxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="63056789"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:42:29 -0700
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
Subject: [PATCH 00/12] ASoC: Intel: Remove skylake driver
Date: Mon, 12 Aug 2024 11:43:16 +0200
Message-Id: <20240812094328.842661-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4EJSYDHUTC3XM4T3I6FB2VVQXWCAFLV6
X-Message-ID-Hash: 4EJSYDHUTC3XM4T3I6FB2VVQXWCAFLV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EJSYDHUTC3XM4T3I6FB2VVQXWCAFLV6/>
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

[1]: https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240403091629.647267-1-cezary.rojewski@intel.com/


Cezary Rojewski (12):
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
 39 files changed, 9 insertions(+), 22775 deletions(-)
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

