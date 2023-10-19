Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 400AE7D00B7
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A32D844;
	Thu, 19 Oct 2023 19:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A32D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697736953;
	bh=3fz4Bx3Ad2tXtTrKtmoaz/FCB5mJ1RZyCyrT6ph0tXE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sd5ahiahb62ogcPRZ4TIOd10c/ZaeVzw8iJ9k74UEkfwUKaCIdz+BWbAJGdKlJ7w4
	 WegvwX8BV8IGtGiX/AHw+tAd/e3IQkOwY4LX2CXeC7B711N7zfwn9JxlPeSbrCgRrS
	 hAYBzbQ6WjfxGM+WdAF/fiVfeJJa+W40fCcy8Q6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C040F8025F; Thu, 19 Oct 2023 19:34:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C07F80558;
	Thu, 19 Oct 2023 19:34:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0B2FF80557; Thu, 19 Oct 2023 19:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF208F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF208F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PELkXNo3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736869; x=1729272869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3fz4Bx3Ad2tXtTrKtmoaz/FCB5mJ1RZyCyrT6ph0tXE=;
  b=PELkXNo3E9fhgicFrwRGLctakEGZKFYTNZG39wkzrgkLcSNp5qkK/5nl
   +NQAkV19prkrnBavRz0cr0k1ACET0XNWKuEetqmYlHmhy6+0rUrHr0RRd
   TJP5Gyg4IfGcqTP2EoC1i3B7lTEh661//H7eiRYjaQZWb30QywKk2k3W2
   /lxpG744vdVXhtSJq1pshYWLa8b85NyPHeelOHH+jU1+kNishtHmgW/el
   klKPL4NPz6AhwBgCsvBbHuM6Vy16FeRS7L1ck1ehC0EcH1AE8lorSHM1t
   MHOgHMW+Fc1QdWVaQQ986Y3KLJOQmmaTpxS4Q/6QvN2yPjVzWRf8Kqmzi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884299"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884299"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090598"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090598"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/10] ASoC: Intel: more machine driver updates for 6.7
Date: Thu, 19 Oct 2023 12:34:01 -0500
Message-Id: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2ORRGMZAHG7XAHUP65PBPFARUN4MQ25T
X-Message-ID-Hash: 2ORRGMZAHG7XAHUP65PBPFARUN4MQ25T
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ORRGMZAHG7XAHUP65PBPFARUN4MQ25T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two nice cleanups from Brent Lu and Charles Keepax, and one RaptorLake
update.

Brent Lu (5):
  ASoC: Intel: board_helpers: support dmic link initialization
  ASoC: Intel: sof_cs42l42: use common module for DMIC links
  ASoC: Intel: sof_nau8825: use common module for DMIC links
  ASoC: Intel: sof_rt5682: use common module for DMIC links
  ASoC: Intel: sof_ssp_amp: use common module for DMIC links

Charles Keepax (4):
  ASoC: intel: sof_sdw: Stop processing CODECs when enough are found
  ASoC: intel: sof_sdw_cs42l43: Some trivial formatting clean ups
  ASoC: intel: sof_sdw_cs42l43: Create separate jacks for hp and mic
  ASoC: intel: sof_sdw: Move the builtin microphones to dataport 1

Terry Cheong (1):
  ASoC: Intel: sof_nau8825: add RPL support for MAX98360A amp

 sound/soc/intel/boards/sof_board_helpers.c    |  92 +++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h    |  10 ++
 sound/soc/intel/boards/sof_cs42l42.c          | 121 +++++-------------
 sound/soc/intel/boards/sof_nau8825.c          |  89 ++++---------
 sound/soc/intel/boards/sof_rt5682.c           |  81 +++---------
 sound/soc/intel/boards/sof_sdw.c              |  16 +--
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  31 +++--
 sound/soc/intel/boards/sof_ssp_amp.c          |  65 +++-------
 .../intel/common/soc-acpi-intel-rpl-match.c   |   7 +
 9 files changed, 233 insertions(+), 279 deletions(-)

-- 
2.39.2

