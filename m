Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5198B3B54
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD40E9A;
	Fri, 26 Apr 2024 17:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD40E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145173;
	bh=9KdLJGT0Jtt9BZjRlZNGYHFz7tLlvz+tfGdNnA+RmP8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q9FklIzhgckVP1unNJl1LooMyj2CdMrTwvY8JyrXXHOHBwVtlzUgkVL3F9qOqxZ3W
	 /pbihTDHj04tKoCQRkC85KoJBTg/SZxil22/Toyq28y0hgRk3X/RgjvityoasJilcP
	 trLMK5UOkQToRmqz36sH9A2CRx7Pgv8REo7XL8GA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53220F805B6; Fri, 26 Apr 2024 17:25:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1472BF8057F;
	Fri, 26 Apr 2024 17:25:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0814EF8045D; Fri, 26 Apr 2024 17:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63853F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63853F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mO3VrNTA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145142; x=1745681142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9KdLJGT0Jtt9BZjRlZNGYHFz7tLlvz+tfGdNnA+RmP8=;
  b=mO3VrNTAEyysHsN9YvxmFY/bbrBaTLky3YjRvtE0reJ5V8yLw7B5gZ4v
   z/ZjK4Ub94s603C+owG9r0kr+lwc3oAUvFGAjupa1H7B0mGFENOPi8Wd+
   Z8Ucx9ori3glag97o2yTcawvPIK4REyUfjXSZB10yERUWgAiiDtzf9t1H
   y1T8le7VH/pHQGhgYd28AMDdqXH1OyoOgMyymqs8uJvF02vPqxxnj5jLe
   ceM7/13CQu8vNjr1fOqA3OyZkaUpbZB8qLpHynyDZLsPEbDgysVlOOOat
   s1XpfEJyNlABTVpNAP0L1n/Qb5vXFo6jhRgNzODpUFdk0AF+EU9ABBUi1
   Q==;
X-CSE-ConnectionGUID: aPzee87eTz6BT+xM8d0OJg==
X-CSE-MsgGUID: m7r++JmhQpqq9puO6xc1AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291265"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:39 -0700
X-CSE-ConnectionGUID: OgZxMcjGRHq8BmpQmi32+w==
X-CSE-MsgGUID: QMKAmVIgTuOXNl8jeqoJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259528"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/23] ASoC: Intel: updates for 6.10 - part6
Date: Fri, 26 Apr 2024 10:25:06 -0500
Message-Id: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ORMLM2VGDEZFEFBETZKVLFBUCUFIVGCU
X-Message-ID-Hash: ORMLM2VGDEZFEFBETZKVLFBUCUFIVGCU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORMLM2VGDEZFEFBETZKVLFBUCUFIVGCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Last batch of cleanups from Brent Lu, with Chromebooks now supported
with fewer modular machine drivers.

Bard Liao (1):
  ASoC: Intel: sof_rt5682: add missing MAX98357A config

Brent Lu (22):
  ASoC: Intel: nau8825/rt5682: move speaker widget to common modules
  ASoC: Intel: sof_maxim_common: support MAX98390 on cml boards
  ASoC: Intel: sof_da7219: support MAX98390
  ASoC: Intel: sof_da7219: add cml_da7219_def for cml boards
  ASoC: Intel: sof_da7219: support MAX98390 on cml boards
  ASoC: Intel: bxt_da7219_max98357a: remove MAX98390 support
  ASoC: Intel: sof_da7219: support MAX98357A
  ASoC: Intel: sof_da7219: support MAX98357A on cml boards
  ASoC: Intel: bxt_da7219_max98357a: remove cml support
  ASoC: Intel: sof_da7219: add glk_da7219_def for glk boards
  ASoC: Intel: sof_da7219: support MAX98357A on glk boards
  ASoC: Intel: bxt_da7219_max98357a: remove glk support
  ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk boards
  ASoC: Intel: sof_rt5682: support MAX98357A on glk boards
  ASoC: Intel: glk_rt5682_max98357a: delete driver
  ASoC: Intel: sof-rt5682: add mclk_en to sof_rt5682_private
  ASoC: Intel: sof-rt5682: remove SOF_RT5682_MCLK_BYTCHT_EN
  ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl boards
  ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682 board
  ASoC: Intel: sof-rt5682: setup pll_id only when needed
  ASoC: Intel: sof-rt5682: get bclk frequency from topology
  ASoC: Intel: sof-rt5682: support bclk as PLL source on rt5682s

 sound/soc/intel/boards/Kconfig                |  41 +-
 sound/soc/intel/boards/Makefile               |   4 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 179 +----
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 693 ------------------
 sound/soc/intel/boards/sof_board_helpers.h    |   2 +
 sound/soc/intel/boards/sof_da7219.c           | 110 ++-
 sound/soc/intel/boards/sof_maxim_common.c     | 108 ++-
 sound/soc/intel/boards/sof_nau8825.c          |   4 -
 sound/soc/intel/boards/sof_realtek_common.c   |  93 ++-
 sound/soc/intel/boards/sof_rt5682.c           | 233 +++---
 .../intel/common/soc-acpi-intel-cml-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-glk-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-icl-match.c   |   2 +-
 13 files changed, 461 insertions(+), 1016 deletions(-)
 delete mode 100644 sound/soc/intel/boards/glk_rt5682_max98357a.c

-- 
2.40.1

