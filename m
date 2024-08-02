Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E646A945DF9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6286933DA;
	Fri,  2 Aug 2024 14:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6286933DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602498;
	bh=WTSJwv/19uap5j9vdOZH9IINjQPo/rKXf2y1UW7I5Ig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eZ8lOV7KNtFma/hoWiZLjx5BiWE9cIHfkAIkKWmd6EVgY2OsxyTkprCuRxI4m+7Tm
	 C+7Q0Hb07XHEyduCZEh8g8pD6VTxzFbFdIu4sygmX5WsTiKcQagNgYOJID3b/jFf2c
	 jOYHgmPDNpGRsUkjINqytNH4OAGUX1hmt3s8rauY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EDF0F802DB; Fri,  2 Aug 2024 14:41:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A93FF805B0;
	Fri,  2 Aug 2024 14:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3BBF800E3; Fri,  2 Aug 2024 14:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E13F4F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13F4F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wke5AfZt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602426; x=1754138426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WTSJwv/19uap5j9vdOZH9IINjQPo/rKXf2y1UW7I5Ig=;
  b=Wke5AfZtuJm0pVg397RDHMwIHTaOWdLwNbfQq2NwSsxM/GJhg00NSxD+
   F+d1KpXMy3Os9Cc74gC8Th/1OPJgP9n7ClKIjXV7JGAY1MFZpa8T2eDvG
   aqKt2o81BAeK63kr299I4X9lkoE7XfaZR7Gf4BHClKN3mIk72f/jwXIS4
   MnbgcD8XjrKE1HTnGAUa2pP5oL6SLkzTVSPLqz0j0/CJiPrDj1McjXRup
   ST2W92Drv3IGSAet7FJijqt/m8olzD7yxV58hVgIrdusz9XDAXLU+8esl
   ZqrGPTcp8/zAnkEr14J3vQrRPPCUWnvAf+6Kw+/nqYukBnW/UnZxHek1k
   Q==;
X-CSE-ConnectionGUID: G+e/PTA7SV2u8EM5VFI3ZQ==
X-CSE-MsgGUID: TyjWCa0PQwO4ZvuJOWUmfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24488163"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24488163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:22 -0700
X-CSE-ConnectionGUID: CWHzzN24SrqeQhVc6ZEudw==
X-CSE-MsgGUID: VBN6K++MS8SZ0DYAT0XFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55024685"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v4 0/5] ASoC/SOF/PCI/Intel: add PantherLake support
Date: Fri,  2 Aug 2024 14:40:06 +0200
Message-ID: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VH52TAAI4BPUELIZ7PAIV3OVYE2LYC4X
X-Message-ID-Hash: VH52TAAI4BPUELIZ7PAIV3OVYE2LYC4X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VH52TAAI4BPUELIZ7PAIV3OVYE2LYC4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add initial support for the PantherLake platform, and initial ACPI
configurations.

All the dependencies required in the initial versions are now
available in ASoc for-next branch.

v4: topology name simplification for rt722

v3: add configuration with rt722 on Link3 

v2: changed order of patches to fix git bisect error reported by Intel
kbuild bot
https://lore.kernel.org/oe-kbuild-all/202406131144.L6gW0I47-lkp@intel.com/

Bard Liao (2):
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support

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

