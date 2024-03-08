Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17520876092
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 10:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FEF3820;
	Fri,  8 Mar 2024 10:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FEF3820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709888656;
	bh=60Mwhx3nnlEAz6uV5d5w6IxQadSN0bJCde0NZHBkIZ0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PsoW/j+U+sdYnkA/hhclkJmCe3RjA0Zd9xbchs9DQ0S404Yx5AxrWVBqiwbfbDCP5
	 lfFx/wSGep1TH471Jr2D8DsO82RVQT3qh4h+AoFXVfDoKwU1/ShbvdcEJ/n64TcT3m
	 92l+uYoAbDDSpi8GyZBSVr5F9DAISR4D5s30+VcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F419FF801F5; Fri,  8 Mar 2024 10:03:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F61BF805AE;
	Fri,  8 Mar 2024 10:03:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72AFDF804B0; Fri,  8 Mar 2024 10:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEEB8F80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 10:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEEB8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HqC74FY9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888609; x=1741424609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=60Mwhx3nnlEAz6uV5d5w6IxQadSN0bJCde0NZHBkIZ0=;
  b=HqC74FY9KfWigq3AldnEZJgWK7uzLzXQzhe9Pfgg1rsqRsvNpewJyZH/
   3oOoNXq85li/3A7zG2atrEdcPtzAE6PP6WYD9HVo61zU83dTGC3OUtd2s
   Y33KvGyTyn1Pd5MmxYlQ6l4ZG/B+iMgHYFC8qXB68jSKJ5wTUA3W1OkRD
   7l1ALZubu+kVr/CgunM/bfbAvW1ZLEFeoocOah0UrTT15kzUenJvoYuxU
   Z03o9CihTpdzs/DqH2/sB5pIruUMPF4Sfh9PZrp+ld0o/kplCyhW6MViW
   tAf/MT6fjm2GVYadsO0vaayh8jGdf6iDjBB9Ys9Ncbv53vOMMiohM1X5A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15246986"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="15246986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 01:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000";
   d="scan'208";a="10419237"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:21 -0800
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
Subject: [PATCH v2 0/5] ASoC: Harden DAPM route checks and Intel fixes
Date: Fri,  8 Mar 2024 10:04:57 +0100
Message-Id: <20240308090502.2136760-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B5QFXXBGEGNOOUJVKC7B6REZ32OPJVT7
X-Message-ID-Hash: B5QFXXBGEGNOOUJVKC7B6REZ32OPJVT7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5QFXXBGEGNOOUJVKC7B6REZ32OPJVT7/>
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

Changes in v2:
- glk_rt5682_max98357a.c and skl_hda_dsp_generic.c now disable route
  checks only for the skylake-drvier
- asoc now logs failures of snd_soc_dapm_add_routes() in soc-topology.c

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
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  2 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  1 +
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  4 +
 sound/soc/intel/boards/kbl_rt5660.c           |  1 +
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  2 +
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  2 +
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  1 +
 sound/soc/intel/boards/skl_rt286.c            |  1 +
 sound/soc/soc-topology.c                      | 11 ++-
 14 files changed, 27 insertions(+), 85 deletions(-)

-- 
2.25.1

