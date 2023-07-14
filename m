Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04420753901
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 12:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0311EA4D;
	Fri, 14 Jul 2023 12:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0311EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689332182;
	bh=cL+iOP33aHs+u6cHLRGi+E0JMjOKGZJJ+7CXN6XHEtk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j3D4jELf/BvW6+tQBgDZCu2bevhp8ZSVRfE/9NpMPPXDybLlwtbf8m5G/WVoK3aHP
	 G1k1M5YzHuHOf77GldQ3sNPZLkptoANrm78a8MQcAjzFi8puMlVVlEt+0nSL8gfrp2
	 nJZxGN9g/xxX3cdxhgDhXh1egsblPGBuj4QiFHwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 262E8F8053B; Fri, 14 Jul 2023 12:55:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF97F8053B;
	Fri, 14 Jul 2023 12:55:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC4E6F8053B; Fri, 14 Jul 2023 12:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C31C2F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 12:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C31C2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NDcOft1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332119; x=1720868119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cL+iOP33aHs+u6cHLRGi+E0JMjOKGZJJ+7CXN6XHEtk=;
  b=NDcOft1BaSjz5P+IzI8cf/tf2/jIZvI5A6okBWI/CjV696l3OBdEADwy
   edkqTBkj5xnKSLbfTyOlqZaRHoTAL/lu/e/nrLZo34sYesaINH1s12Wg+
   to4wkN8cvwYHO/B35jpG1bDdETbtWa1FdSi0E7L5hIbFfsiyYbJd7uU/G
   ZuFMmIL9kH04S3dego5NES7wAX4Rez+jlHsY9zN3mnhnZcngwD7aXPvoV
   M5gtdrLA2tccKx7uR6b/O4xmL2zhjdDllFHmCt0eigsnp0s+kK/ORn9u/
   otYABr8RCqVJY30/uQ4krQOxX3bS3TKgNL46LGkCPH3xLgTOGoSDe6HHG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364321110"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="364321110"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722365344"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="722365344"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 03:54:59 -0700
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
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 00/15] PCI: Define Intel PCI IDs and use them in drivers
Date: Fri, 14 Jul 2023 20:56:00 +0200
Message-Id: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKRSEU43BLINBG2FLQQAYSA7E52QIWND
X-Message-ID-Hash: PKRSEU43BLINBG2FLQQAYSA7E52QIWND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKRSEU43BLINBG2FLQQAYSA7E52QIWND/>
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

Changes from v1:
 - Remove BXT-T PCI ID as it is not released (Andy)
 - Reorder macros to start from pci_match_id() (Andy)
 - Add comment about BXT->APL name change in commit messages (Andy)
 - Use SST as part of macro name for DSP only devices (Andy)
 - Add PCI IDs for all SST combinations (Andy)

Changes from RFC:
 - Sort Intel PCI IDs before adding new ones
 - Fix ordering of new PCI IDs (Andy)
 - Define all used Intel IDs (Andy)
 - Add macros for controller type detection (Andy/Bjorn)
 - Add set of patches changing to use above macro (Andy/Bjorn)
 - Use PCI_DEVICE_DATA for Intel IDs in sound/pci/hda/hda_intel.c (Andy)
 - Commit message wording (Andy)
 - Remove unnecessary tabs (Andy)

Amadeusz Sławiński (15):
  PCI: Sort Intel PCI IDs by number
  PCI: Add Intel Audio DSP devices to pci_ids.h
  ASoC: SOF: Remove unused Broxton PCI ID
  ALSA: Remove unused Broxton PCI ID
  ALSA: hda: Add controller matching macros
  ALSA: hda: Use global PCI match macro
  ALSA: hda/i915:  Use global PCI match macro
  ASoC: Intel: Skylake: Use global PCI match macro
  ALSA: intel-dsp-config: Convert to PCI device IDs defines
  ALSA: hda: Convert to PCI device IDs defines
  ASoC: Intel: avs: Convert to PCI device IDs defines
  ASoC: Intel: avs: Convert to PCI device IDs defines
  ASoC: Intel: Skylake: Convert to PCI device IDs defines
  ASoC: SOF: Intel: Convert to PCI device IDs defines
  ASoC: Intel: sst: Convert to PCI device IDs defines

 include/linux/pci_ids.h                | 105 +++++--
 include/sound/hda_codec.h              |   3 -
 include/sound/hdaudio.h                |  26 ++
 sound/hda/hdac_i915.c                  |   7 +-
 sound/hda/intel-dsp-config.c           | 124 ++++----
 sound/pci/hda/hda_intel.c              | 373 ++++++++++---------------
 sound/soc/intel/atom/sst/sst.c         |   7 +-
 sound/soc/intel/atom/sst/sst.h         |   3 -
 sound/soc/intel/atom/sst/sst_pci.c     |   4 +-
 sound/soc/intel/avs/board_selection.c  |  10 +-
 sound/soc/intel/avs/core.c             |  16 +-
 sound/soc/intel/skylake/skl-messages.c |  16 +-
 sound/soc/intel/skylake/skl-pcm.c      |   3 +-
 sound/soc/intel/skylake/skl.c          |  36 +--
 sound/soc/sof/intel/pci-apl.c          |   8 +-
 sound/soc/sof/intel/pci-cnl.c          |  15 +-
 sound/soc/sof/intel/pci-icl.c          |  12 +-
 sound/soc/sof/intel/pci-mtl.c          |   3 +-
 sound/soc/sof/intel/pci-skl.c          |   6 +-
 sound/soc/sof/intel/pci-tgl.c          |  45 +--
 sound/soc/sof/intel/pci-tng.c          |   3 +-
 21 files changed, 383 insertions(+), 442 deletions(-)

-- 
2.34.1

