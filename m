Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F68A21B4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02FF62BE3;
	Fri, 12 Apr 2024 00:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02FF62BE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874250;
	bh=aYhhNME9fvwSMylxt5ncTLkt/NErQVZsyt2NYVWI+O0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qXErbhaQ97I9QOuKGHmaGYuhEZeg52Q7XoSYSOfBkmxEBJxzlWQTWRlU6TqcgvYE9
	 bI8iLEhxp8nfe8sgvSCUmsL0ts/QnSv0Y1wNgg68EsmYRwIPZqmAQwpEnn7fkHy9Pp
	 MEd48YAHYoqkGWVamCtXoCe/pLDHidtl+B6oSsbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1958FF805D2; Fri, 12 Apr 2024 00:23:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC70F805CA;
	Fri, 12 Apr 2024 00:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAC94F8057C; Fri, 12 Apr 2024 00:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35739F80130
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35739F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=irWtrb4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873060; x=1744409060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aYhhNME9fvwSMylxt5ncTLkt/NErQVZsyt2NYVWI+O0=;
  b=irWtrb4W1aP95/Pb6E/F5eLE97lB7iUEV+I9tfv4lSEjYZj7bohRANqN
   8b+oeKeKvoMvIjCLErLHD3yYXWELr0OBU7jSaLCUog0XEIrlfW722Qc2m
   NqRg+J+ct7RvUwY7FF2h8euhnLxUQZsvJJkWDQ3dW154Yqu9KGiEV0rG2
   zOq1dVgNllDWrIiwNDwcw7c2yy08KStfjkdK7ya144/rboQTrXIZMCLqo
   MZU092nuqRgtpPsPFHezG8fPRzrWNQeYXnnNYFcsjqGQsFfjjjJ9KZNis
   N/JT0xlPJxb5ASSMUZQ8xphz7BtQ95XlPJhVLjMIQLs+oeUIkpQXcxfoP
   g==;
X-CSE-ConnectionGUID: v9fCkhGVRPi/xsyXhIwDcw==
X-CSE-MsgGUID: WVCYVEjUR92jbPkQ1L7QHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708329"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:11 -0700
X-CSE-ConnectionGUID: lZW5ilL3SUCi0hxLax+cXQ==
X-CSE-MsgGUID: +c8Q8HRVQ3akoMZcTc163g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628680"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part4
Date: Thu, 11 Apr 2024 17:03:35 -0500
Message-Id: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJNBM4ZBSIEDOK7D3XAUB4LFVG3JZPKQ
X-Message-ID-Hash: XJNBM4ZBSIEDOK7D3XAUB4LFVG3JZPKQ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJNBM4ZBSIEDOK7D3XAUB4LFVG3JZPKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

More cleanups from Brent, notably the removal of the redundant
cml_rt1011_rt5682 machine driver, fixes for SoundWire platforms and
changes to sof_rt5682 to allow for 96+ sampling rates.

For the rest of this kernel cycle, we are still working on SoundWire
updates for MeteorLake (usual missing ACPI signature required for
topology selection and jack detection information). We'll provide
those patches as soon as they are reviewed/validated.

Bard Liao (2):
  ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init for Realtek
    multi-function codecs
  ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed

Brent Lu (6):
  ASoC: Intel: sof_da7219: mach cleanup for adl boards
  ASoC: Intel: sof_da7219: mach cleanup for rpl boards
  ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl boards
  ASoC: Intel: sof_realtek_common: support 4xALC1011 amplifier
  ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
  ASoC: Intel: cml_rt1011_rt5682: delete driver

Pierre-Louis Bossart (4):
  ASoC: Intel: soc-acpi: add support for HP Omen14 SoundWire
    configuration
  ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
  ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
  ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks

 sound/soc/intel/boards/Kconfig                |  12 +-
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 609 ------------------
 sound/soc/intel/boards/sof_da7219.c           |   8 +
 sound/soc/intel/boards/sof_realtek_common.c   | 178 ++++-
 sound/soc/intel/boards/sof_realtek_common.h   |   4 +-
 sound/soc/intel/boards/sof_rt5682.c           |  37 +-
 sound/soc/intel/boards/sof_sdw.c              |  87 ++-
 sound/soc/intel/boards/sof_sdw_common.h       |   1 +
 .../intel/common/soc-acpi-intel-adl-match.c   |  19 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |   2 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   |  36 ++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  19 +-
 13 files changed, 297 insertions(+), 717 deletions(-)
 delete mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

-- 
2.40.1

