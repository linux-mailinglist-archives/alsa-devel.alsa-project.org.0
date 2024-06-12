Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DB904C34
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 09:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED3782B;
	Wed, 12 Jun 2024 09:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED3782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175617;
	bh=3kGtXqPNTI6+znpzbrWbnTAox2zm1Vd8WVrUNVVII14=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uo9+x4N9guHHarNoCrlfqGa1hLRMyhlCte3/S8G9esPKpVwyxURKwYHO1tPrKnWPK
	 Di2K23MLd9DD1UGG06AjSJE81HUL0S1rBpI3Zixew2hTPw5rt0dpbQumIWYW6/dHeE
	 dSES6Vi9Z89SRhNNwpC92+L/dlKWH2CPf6JrrfOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8284AF805CB; Wed, 12 Jun 2024 08:59:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 430DFF805AA;
	Wed, 12 Jun 2024 08:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D78BEF805A8; Wed, 12 Jun 2024 08:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5CC3F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CC3F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CyjaaBhQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718175567; x=1749711567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3kGtXqPNTI6+znpzbrWbnTAox2zm1Vd8WVrUNVVII14=;
  b=CyjaaBhQyGwN+75PNnswbzdS3j6Yb+vKUWB6VMpFJhi1le84j9abDYxR
   Z+MoUiE8D2wbltNbm4/3w3xqyX6V+hjsV+oyuoEI0eS7weA+om01YlHW1
   EZWQOc+oqnovBUyD9H4SO+a46lZJI56CC0vjJO5Rscs2R8kSejBxGQvqf
   /Je8uu8eSo34UhIZXRdRJ6/VCmVnMtkyShTlCDYKb/7uNRZJdIAIZ9cJq
   Ky2lPiEDRyNup8ZU3Q3d/nlw7RtBWyXFv7XJDBhHlCMX6PP91GAauVyHA
   rMVX7MZZg3fpbXDUQVQje6txlwGi0kgTC8wHf8Bdi8SE3XFIoXLtA/TiD
   Q==;
X-CSE-ConnectionGUID: XXKTO31ZRlq6QIuFytmFaA==
X-CSE-MsgGUID: qMDzMo65QyKVWBZq7of1Bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15147403"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15147403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:23 -0700
X-CSE-ConnectionGUID: gbtX+fY8QoKCYoPFEyQpIg==
X-CSE-MsgGUID: 9R1l8MqVQFyxY9UcIsXgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="70486822"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/5] ASoC/SOF/PCI/Intel: add PantherLake support
Date: Wed, 12 Jun 2024 08:58:53 +0200
Message-ID: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E5Z7QEKWRMTNRRKDLEUXGAGUKDTR25LY
X-Message-ID-Hash: E5Z7QEKWRMTNRRKDLEUXGAGUKDTR25LY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5Z7QEKWRMTNRRKDLEUXGAGUKDTR25LY/>
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

Bard Liao (2):
  ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca table
  ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support

Fred Oh (1):
  ASoC: SOF: Intel: add PTL specific power control register

Pierre-Louis Bossart (2):
  ASoC: SOF: Intel: add initial support for PTL
  ASoC: Intel: soc-acpi: add PTL match tables

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

