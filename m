Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350F4C9506
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14E01AA1;
	Tue,  1 Mar 2022 20:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14E01AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164230;
	bh=G08lCwdBqONp+Pzf01oACQBb4TV3iW30kWFxOxZ9uAU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PSDxYW9Ug7W6Uc+LrmD75xmLHh80ssppTnPm0+uSyq3RFsRBfgH9tXU3pnhwVHwaA
	 2uEadMQZn6B9pN3J8i8/BNTtksp4Y5saurnMwQWr4wxHUT16fgJUJd92AgWU3NwQHO
	 I8oSYUp+TfO2rd9KoLc69f34X+/iKh7Vl/uQ7B2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 565E0F80475;
	Tue,  1 Mar 2022 20:49:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8184BF802DB; Tue,  1 Mar 2022 20:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28A5F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28A5F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Tt4W4jor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164157; x=1677700157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G08lCwdBqONp+Pzf01oACQBb4TV3iW30kWFxOxZ9uAU=;
 b=Tt4W4jormcIcReJb6OIM1oJGE7+gycnaymlCv3HncXG6yShLrqTnaDGW
 sTAl7UHMFc+jEW2qLAUEq5NUjAEngHIeEtVTaOXRB1IjAgcNMIdsPBL9+
 85nHENb0mHd00Tui1XKqc6uEchivd/gVfcwnXZvq3lhjfLaP0gHLPuXUD
 VHpwty81XTgyTJcYWk2a588rV9UVTMHGizx6zJC92+tAHUqRg+9aBXVSf
 sZ4q2ZEjU9TrLi3G8Y64+3MUPFwK9YIE7ARR5zxjKw/kPi3Z/+I+ID7LT
 g6gouWoZkL4yjiuBMb3Pyx8z8vmmvvSGT4TSsL2eswVNwAY9JP30yfSLL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841058"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131843"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: Intel: machine driver updates for 5.18
Date: Tue,  1 Mar 2022 13:48:55 -0600
Message-Id: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Two cleanups to remove an unused filename and typos, and one addition
of an ACPI matching table for a Dell SoundWire SKU without local
microphones.

The main change is the addition of a common 'sof-ssp-amp' machine
driver for devices with amplifiers only (no headset codec) and
different connections using I2S links (Bluetooth offload, HDMI
receiver). It's likely that the amplifier will be swapped out by OEMs,
this machine driver provides a relatively generic solution to avoid
copy-paste of similar solutions.

Brent Lu (4):
  ASoC: Intel: boards: create sof-realtek-common module
  ASoC: Intel: sof_rt1308: move rt1308 code to common module
  ASoC: Intel: cirrus-common: support cs35l41 amplifier
  ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier

Libin Yang (1):
  ASoC: Intel: soc-acpi: add entries in ADL match table

Pierre-Louis Bossart (2):
  ASoC: soc-acpi: remove sof_fw_filename
  ASoC: Intel: boards: fix spelling in comments

balamurugan.c (1):
  ASoC: Intel: add RT1308 I2S machine driver and HDMI-in capture via I2S
    support.

 include/sound/soc-acpi.h                      |   2 -
 sound/soc/intel/boards/Kconfig                |  24 +
 sound/soc/intel/boards/Makefile               |  12 +-
 sound/soc/intel/boards/bdw-rt5650.c           |   2 +-
 sound/soc/intel/boards/bdw-rt5677.c           |   2 +-
 sound/soc/intel/boards/broadwell.c            |   2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   2 +-
 sound/soc/intel/boards/bxt_rt298.c            |   2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |   2 +-
 sound/soc/intel/boards/bytcht_da7213.c        |   2 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   2 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |   2 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   4 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   4 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |   2 +-
 sound/soc/intel/boards/haswell.c              |   2 +-
 sound/soc/intel/boards/sof_cirrus_common.c    | 163 ++++++
 sound/soc/intel/boards/sof_cirrus_common.h    |  25 +
 sound/soc/intel/boards/sof_realtek_common.c   | 107 ++++
 sound/soc/intel/boards/sof_realtek_common.h   |   4 +
 sound/soc/intel/boards/sof_rt5682.c           |   1 +
 sound/soc/intel/boards/sof_ssp_amp.c          | 483 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  44 +-
 .../intel/common/soc-acpi-intel-bxt-match.c   |   6 -
 .../intel/common/soc-acpi-intel-byt-match.c   |  11 -
 .../intel/common/soc-acpi-intel-cht-match.c   |  12 -
 .../intel/common/soc-acpi-intel-cml-match.c   |  11 -
 .../intel/common/soc-acpi-intel-cnl-match.c   |   4 -
 .../intel/common/soc-acpi-intel-ehl-match.c   |   1 -
 .../intel/common/soc-acpi-intel-glk-match.c   |   6 -
 .../intel/common/soc-acpi-intel-hda-match.c   |   2 -
 .../common/soc-acpi-intel-hsw-bdw-match.c     |   5 -
 .../intel/common/soc-acpi-intel-icl-match.c   |   5 -
 .../intel/common/soc-acpi-intel-jsl-match.c   |   7 -
 .../intel/common/soc-acpi-intel-tgl-match.c   |  19 +-
 sound/soc/sof/intel/hda.c                     |   5 +-
 sound/soc/sof/intel/pci-tng.c                 |   1 -
 40 files changed, 879 insertions(+), 117 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.c
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.h
 create mode 100644 sound/soc/intel/boards/sof_ssp_amp.c

-- 
2.25.1

