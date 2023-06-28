Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C217411AE
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 14:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105996C1;
	Wed, 28 Jun 2023 14:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105996C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687956709;
	bh=FM06hAzUJYRZbdfF74LbkfHXkeBshKd+aj4zJ//1NoE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jx9rVH2ydLtyEbEi3eP8KV20fjg8zWJ8wUSm6/LOS9DKfAyt6In6M6h+KU2Jy9lTn
	 9Z8VWS92X8wciPIkzsJHCiTDeLLncGNAZwtYheb5BcrLxjZ05SGj9kcyNYMh4B57wJ
	 aqBhDbdN/ns56vXjt/WKMYjqQrN1zrh3V59FbSG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F260F80246; Wed, 28 Jun 2023 14:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 201B4F80544;
	Wed, 28 Jun 2023 14:50:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03895F8051E; Wed, 28 Jun 2023 14:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FA1EF80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 14:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA1EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IFxt6a1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956647; x=1719492647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FM06hAzUJYRZbdfF74LbkfHXkeBshKd+aj4zJ//1NoE=;
  b=IFxt6a1dDHM5EQLDJbUnLcGTG9yfyy8iSHjj9dzLIiO2bVa7WDnuQOZF
   u7Ahwl78HpHs0wm53Kf/wjb2DTmTXIufeDO5pCzkYybjFNsGzm1tcHEUX
   YB6RC8vnWIsrr23rn5UwqcfQDI1OHzvAT28qKzzemr8TgzfGK8NbiYKdb
   id93OlAHRBq0C+rBGc6f7K9pVdVVPh8x4RV9a4mJuE0AuOqY7Xc/d57RZ
   CrasRAVvJR6MFAGKzHFKHCw3BWcwRLpFiPP4njPjQ5xIR9jhb4MYdv3Nw
   5+5sWIXhkckmYWcLEVMGWLxFdAMR/tpgBGfst4F2R2YZGKaK5lp+1EIKz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361875553"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361875553"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 05:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891035024"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891035024"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 05:50:15 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 0/8] PCI: Define Intel PCI IDs and use them in drivers
Date: Wed, 28 Jun 2023 22:51:27 +0200
Message-Id: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LMP5G5LDBYTG5NPU3TDNNRIUVOQDW2SE
X-Message-ID-Hash: LMP5G5LDBYTG5NPU3TDNNRIUVOQDW2SE
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMP5G5LDBYTG5NPU3TDNNRIUVOQDW2SE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
various configurations and historical reasons. Currently almost all uses
of HDA PCI IDs have corresponding comment telling which platform it is.
Additionally there are some inconsistencies between drivers about which
ID corresponds to which device.

Simplify things, by adding PCI IDs to global header and make use of them
in drivers. This allows for removal of comments by having IDs themselves
being self explanatory. Additionally it allows for removal of existing
inconsistencies by having one source of truth.

Amadeusz Sławiński (8):
  PCI: Add Intel Audio DSP devices to pci_ids.h
  ALSA: intel-dsp-config: Update PCI ID list
  ALSA: hda: Update PCI ID list
  ALSA: hda/i915: Update PCI IDs
  ASoC: Intel: avs: Update PCI ID list
  ASoC: Intel: avs: Update PCI ID list
  ASoC: Intel: Skylake: Update PCI ID list
  ASoC: SOF: Intel: Update PCI ID list

 include/linux/pci_ids.h                |  44 ++++
 sound/hda/hdac_i915.c                  |   8 +-
 sound/hda/intel-dsp-config.c           | 119 +++++-----
 sound/pci/hda/hda_intel.c              | 292 ++++++++++++-------------
 sound/soc/intel/avs/board_selection.c  |  10 +-
 sound/soc/intel/avs/core.c             |  16 +-
 sound/soc/intel/skylake/skl-messages.c |  16 +-
 sound/soc/intel/skylake/skl.c          |  36 +--
 sound/soc/sof/intel/pci-apl.c          |   9 +-
 sound/soc/sof/intel/pci-cnl.c          |  15 +-
 sound/soc/sof/intel/pci-icl.c          |  12 +-
 sound/soc/sof/intel/pci-mtl.c          |   3 +-
 sound/soc/sof/intel/pci-skl.c          |   6 +-
 sound/soc/sof/intel/pci-tgl.c          |  45 ++--
 sound/soc/sof/intel/pci-tng.c          |   3 +-
 15 files changed, 311 insertions(+), 323 deletions(-)

-- 
2.34.1

