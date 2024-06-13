Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F6906436
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CA2DFA;
	Thu, 13 Jun 2024 08:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CA2DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718260717;
	bh=ONxqZUwSB91wyQpYjEvWjtZBUsrSB8OmWi61DcHx7HM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gUqtRDAC9gw85ybD1+RAkkcElPAXmh6WoIFZ5LWSfU5GZzvPEidfIdQ0EmRV27iUL
	 WTvfmL2j4/Mw7ysd3TOeqm99zzMd6aQTpnFdYFSDVPqeqG6v63vy4Lx9WwRGpuyHTV
	 i1324s8O64D4Ucal2RQnZ2l47yr4GWNE0hfsrrXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF8EF805B3; Thu, 13 Jun 2024 08:38:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78997F805BA;
	Thu, 13 Jun 2024 08:38:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC70F80588; Thu, 13 Jun 2024 08:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB449F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB449F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cLRn6uY+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260674; x=1749796674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ONxqZUwSB91wyQpYjEvWjtZBUsrSB8OmWi61DcHx7HM=;
  b=cLRn6uY+cVlhwK5w3AsMc6lQg4LlP/NS0M3H+gNqeabVnd1FuO/6tHKG
   JKRpYQ30CZRtwyEXxrW5XgzmcNfIUk9Uv4i2mBiqPJ9QZspxtr87pd2sP
   2kfFYrAv1XNsWGFkeqUVt3hHVrDSr7vGbiQoUSEOqz7x36C0rqS08rBve
   f3YKNZIpxwjxWz5WKJp7s44mtXkGyqop0Tulkcep/oCrZ07tUIMPwVrFt
   wo1uZGwl+Rek4+l62PQlrQwyNoFeTc6NXRwSbWdh3PBrf12HfmkpZSNvN
   ofnDeiy5sQn5AUfNiQ2x0qJNy/1oKuTy0zfHWj/EGW1lU+3RF03EPkVnN
   A==;
X-CSE-ConnectionGUID: eDjneTcuT/KCx9DK6BgFbg==
X-CSE-MsgGUID: 9tJ13ptGTkOekX4e0rGSWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25736596"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="25736596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:37:45 -0700
X-CSE-ConnectionGUID: M4T4MqXfQKOVirQ5sYmTSg==
X-CSE-MsgGUID: Ql1aBbx/RrOwqmStiHjiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="39960898"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:37:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 0/5] ASoC/SOF/PCI/Intel: add PantherLake support
Date: Thu, 13 Jun 2024 08:37:27 +0200
Message-ID: <20240613063732.241157-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YW4HKDKGLNXAWPVLO7PWKBDQQXQ4MHIS
X-Message-ID-Hash: YW4HKDKGLNXAWPVLO7PWKBDQQXQ4MHIS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW4HKDKGLNXAWPVLO7PWKBDQQXQ4MHIS/>
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
PantherLake audio support"

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
 .../intel/common/soc-acpi-intel-ptl-match.c   | 121 ++++++++++++++++++
 sound/soc/sof/intel/Kconfig                   |  17 +++
 sound/soc/sof/intel/Makefile                  |   2 +
 sound/soc/sof/intel/hda-dsp.c                 |   1 +
 sound/soc/sof/intel/hda.h                     |   1 +
 sound/soc/sof/intel/lnl.c                     |  27 ++++
 sound/soc/sof/intel/mtl.c                     |  16 ++-
 sound/soc/sof/intel/mtl.h                     |   2 +
 sound/soc/sof/intel/pci-ptl.c                 |  77 +++++++++++
 sound/soc/sof/intel/shim.h                    |   1 +
 12 files changed, 266 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ptl-match.c
 create mode 100644 sound/soc/sof/intel/pci-ptl.c

-- 
2.43.0

