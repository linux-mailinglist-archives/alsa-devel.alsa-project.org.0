Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1386870A0A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 20:05:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80960846;
	Mon,  4 Mar 2024 20:05:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80960846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709579110;
	bh=bh6rdlj0Us7k35cmgn1JlS4DKJIoK20HgpvmAhYLz6M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JWdWjN7wnf6RGLabrIYFcKSdaaZ4F2Uq9JM1/4F93geAiDV2H0RlpMMZkppBfRDsK
	 eNKPaGiZ6j0iyRmTMlru4tAcrjK124XeEEeoruOmFOB8hYBUcOVMNtd2r/9JdP8Bis
	 BTnVnFwmZpWy5xt8I7ZeAdD3u3m1ZnSkGQDrIe9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30B21F80093; Mon,  4 Mar 2024 20:04:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AF2FF80563;
	Mon,  4 Mar 2024 20:04:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5BB6F80496; Mon,  4 Mar 2024 20:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A5DBF80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 20:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A5DBF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cpjDI2Ym
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579069; x=1741115069;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bh6rdlj0Us7k35cmgn1JlS4DKJIoK20HgpvmAhYLz6M=;
  b=cpjDI2YmPE+QENLqx6l/pjuLVD59ecZL8xzqNpcvuckPq6si5UaFnvya
   cEsJ1kD40uag8PA0IzGPwo64IzfRce5zDSYrtgfUkpCo4j1i2FZGaIz5K
   0gRJQ2sNhxrwROWfN+LT2lTo2lPctsw7wdjk556kknjcF0ubsI4a0wNuZ
   V5ykV4ioRuCTQ8F2Hc2F7wmGWGcBsfVO8V2LysUXqCW5GmEbIvv+/5RoT
   TGa34qDDyCIxu0Y2TO2pXN6BuLyXUSCYCtmxDmhoHxIj3vtgxcOaSEUGz
   ER/rjwGGssJ/aRCiHUGQcit21Sqv9+TIfJXIFPyr21t2Cjb5B6IFxux7t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257256"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="4257256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13788266"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/5] ASoC: Harden DAPM route checks and Intel fixes
Date: Mon,  4 Mar 2024 20:05:31 +0100
Message-Id: <20240304190536.1783332-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3GS4JARHFHRLFHFFAP5X3FPGZHMEEDAQ
X-Message-ID-Hash: 3GS4JARHFHRLFHFFAP5X3FPGZHMEEDAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GS4JARHFHRLFHFFAP5X3FPGZHMEEDAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set of loosely connected patches. Most impactful change is dropping any
permisiveness when snd_soc_dapm_add_routes() fails in soc-topology.c To
do it safely, disable route checks for all skylake-driver boards.

Relevant background:

Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
failures for Intel boards have been partially addressed by commit
a22ae72b86a4 ("ASoC: soc-core: isable route checks for legacy devices")
and its follow up but only skl_nau88l25_ssm4567.c is patched. The rest
of the boards still need fixing.

After that, removal of copy-pastas found in ssm4567.c and redundant code
in i2s_test.c for avs-boards.

Amadeusz Sławiński (1):
  ASoC: Intel: avs: i2s_test: Remove redundant dapm routes

Cezary Rojewski (4):
  ASoC: Intel: Disable route checks for Skylake boards
  ASoC: topology: Do not ignore route checks when parsing graphs
  ASoC: Intel: avs: ssm4567: Do not ignore route checks
  ASoC: Intel: avs: ssm4567: Board cleanup

 sound/soc/intel/avs/boards/i2s_test.c         | 79 -------------------
 sound/soc/intel/avs/boards/ssm4567.c          |  5 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/bxt_rt298.c            |  1 +
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  4 +
 sound/soc/intel/boards/kbl_rt5660.c           |  1 +
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  2 +
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  1 +
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  1 +
 sound/soc/intel/boards/skl_rt286.c            |  1 +
 sound/soc/soc-topology.c                      |  5 +-
 14 files changed, 19 insertions(+), 85 deletions(-)

-- 
2.25.1

