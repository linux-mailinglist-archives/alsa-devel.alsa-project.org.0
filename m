Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D815700DEB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE92C1D6;
	Fri, 12 May 2023 19:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE92C1D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683912884;
	bh=a1wxKlMmYEANqLmSMQ5+lreFZbtQIKwBCJjiY+1qsUM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O4wgdU40j870zk02D8jPPgJlupFOVojEZiCzjVzOuVTCD41dd4/4YRspCkcF+VEwD
	 oLQMzLGaev9cf3avmAgd1pdzPeHnGAxqZAssGHiyyQR1L21OkHGCgF6WMAa0HNeZme
	 brRA10n7JObIANlVrHMwknxfg2o+CJkrnlVGQf+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99417F80552; Fri, 12 May 2023 19:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB35F80548;
	Fri, 12 May 2023 19:33:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5FCFF80544; Fri, 12 May 2023 19:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F104F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F104F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ik0dlxC+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912821; x=1715448821;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a1wxKlMmYEANqLmSMQ5+lreFZbtQIKwBCJjiY+1qsUM=;
  b=Ik0dlxC+cEwIW/kSA0AI0l7CPRBFPtcwXgYdPDN3VfhgCytaO9ps/Xke
   o+Ga46H6DcRDX5NvpjMsqtE+0XaXbGfABxB4600khZSPCYQyXLvvN2UD0
   9HA9ojggIp44l2CnlhBm0CnDHmUPZfEr9WugolMFvaSCfFaKfhBVXCl5g
   4rbtYZbBom/kGcolLiObr5FMQLNjXJ0D/o7YDIoZ0CmWeeY2dUVMX2d22
   QnpkKLbnwu4Imv0LeRiu/37Ophuo7nw6UN5CfnHRW45nJovMP06cuOZv5
   Xt2IyOHqDCyqP6NQoTZNnoWmoEjzI0VpIXijR8Ep29AJT1Oc7efLD6r8U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340164687"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="340164687"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030160306"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="1030160306"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/8] ASoC: Intel: machine driver updates
Date: Fri, 12 May 2023 12:32:57 -0500
Message-Id: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ITFM6HN4GE3ONZ2XPZ5DYGY7V4KRW7NT
X-Message-ID-Hash: ITFM6HN4GE3ONZ2XPZ5DYGY7V4KRW7NT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITFM6HN4GE3ONZ2XPZ5DYGY7V4KRW7NT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several updates for RPL/MTL/LNL, and one fix for SoundWire TGL device.

Bard Liao (3):
  ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
  ASoC: Intel: sof_sdw: add quirk for MTL RVP
  ASoC: Intel: sof_sdw: start set codec init function with an adr index

Chao Song (1):
  ASoC: Intel: soc-acpi: add support for MTL SDCA boards

Peter Ujfalusi (1):
  ASoC: Intel: sof_sdw: add quirk for LNL RVP

Pierre-Louis Bossart (2):
  ASoC: Intel: sof_sdw: add new mapping for HP Spectre x360
  ASoC: Intel: soc-acpi: add tables for LunarLake

Terry Cheong (1):
  ASoC: Intel: Add rpl_max98373_8825 driver

 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/boards/sof_nau8825.c          | 10 +++
 sound/soc/intel/boards/sof_sdw.c              | 49 +++++++++++--
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-lnl-match.c   | 72 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 57 +++++++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 12 ++++
 7 files changed, 197 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-lnl-match.c

-- 
2.37.2

