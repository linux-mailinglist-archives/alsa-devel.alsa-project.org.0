Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE35927269
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 10:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53429105F;
	Thu,  4 Jul 2024 10:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53429105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083569;
	bh=UNRYpd+9f7kr4GRq9tXRcx9f9lwuRwZ87AXzjG7zi9E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sDx88/1zL+8KeHEJ5PDnBs84vosWxtKpd6xYg2qw3+6J4CYEc4f+UUSuSG/DoWuGB
	 VTeGo1xgUP4g4HrwitPAE9kAqAsNW+WWqaz+K82lkPzPVGe5SP72c4/s4p7YzjJLCZ
	 m0Ghzv7tZukuwBfDh7M8M1ehSiEIBADUcfSXZtes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E984FF805B4; Thu,  4 Jul 2024 10:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D85F805AE;
	Thu,  4 Jul 2024 10:58:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99A7EF804FC; Thu,  4 Jul 2024 10:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C33A8F800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 10:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33A8F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AWNlayNi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083229; x=1751619229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UNRYpd+9f7kr4GRq9tXRcx9f9lwuRwZ87AXzjG7zi9E=;
  b=AWNlayNi/lsbU+Rvht1ihUzAlwGcg4sbGwA7GwkraMgTD7zRgqa2gg8+
   lwffMwv4WjwcOTrEXxqjhyHOYKyZAn4tRpo9G5kFtfMtuJd/ijR4xIjll
   pWC/XlZf//li8rcHbClFtsSTppjzhGzuj1hVuKoSunk08Z48uNRl3/4xE
   Jd1qyEYrJQupP7xz1slRzsPx6ztsQOuWh3nfqIpXHQ3kk4oYxdkrmqNRz
   WH6qo52X/HaolxCj/PYoQMLWL/uLPNjS7hNhjkY4vsYRxQEbSQQK0TMGu
   NualIZZqtXhdyrBeGEcIYMVf0mUvWFIrY8JnopKabGWLP+J5271zBd3na
   g==;
X-CSE-ConnectionGUID: IIBufLcRSJei3AO3L/mMlw==
X-CSE-MsgGUID: pQ6j56TLREK82G74n351Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17300575"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="17300575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:53:43 -0700
X-CSE-ConnectionGUID: jqMlLn/0SVS5JDDFoCTFpw==
X-CSE-MsgGUID: 4i8Sin7YSB+U2199esydrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="51708472"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:53:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 0/6] ASoC/SOF/PCI/Intel: add PantherLake support
Date: Thu,  4 Jul 2024 10:53:24 +0200
Message-ID: <20240704085330.371332-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6QBRPNIWKKWFG5V3CGWO34LXEFJWQJDO
X-Message-ID-Hash: 6QBRPNIWKKWFG5V3CGWO34LXEFJWQJDO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QBRPNIWKKWFG5V3CGWO34LXEFJWQJDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add initial support for the PantherLake platform, and initial ACPI
configurations.

This patchset depends on the first patch of "[PATCH 0/3] ALSA/PCI: add
PantherLake audio support". To apply this on the ASoC tree, a merge of
Takashi's for-next branch is required.

v3: add configuration with rt722 on Link3 

v2: changed order of patches to fix git bisect error reported by Intel
kbuild bot
https://lore.kernel.org/oe-kbuild-all/202406131144.L6gW0I47-lkp@intel.com/

Bard Liao (3):
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt722 l3 adr

Fred Oh (1):
  ASoC: SOF: Intel: add PTL specific power control register

Pierre-Louis Bossart (2):
  ASoC: Intel: soc-acpi: add PTL match tables
  ASoC: SOF: Intel: add initial support for PTL

 include/sound/soc-acpi-intel-match.h          |   2 +
 sound/soc/intel/common/Makefile               |   1 +
 .../intel/common/soc-acpi-intel-ptl-match.c   | 145 ++++++++++++++++++
 sound/soc/sof/intel/Kconfig                   |  17 ++
 sound/soc/sof/intel/Makefile                  |   2 +
 sound/soc/sof/intel/hda-dsp.c                 |   1 +
 sound/soc/sof/intel/hda.h                     |   1 +
 sound/soc/sof/intel/lnl.c                     |  27 ++++
 sound/soc/sof/intel/mtl.c                     |  16 +-
 sound/soc/sof/intel/mtl.h                     |   2 +
 sound/soc/sof/intel/pci-ptl.c                 |  77 ++++++++++
 sound/soc/sof/intel/shim.h                    |   1 +
 12 files changed, 290 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ptl-match.c
 create mode 100644 sound/soc/sof/intel/pci-ptl.c

-- 
2.43.0

