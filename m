Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985C74EFA3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 14:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42391F1;
	Tue, 11 Jul 2023 14:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42391F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080346;
	bh=Jid2RuYbICnO2j6tUDkfKrrrf977lWFjcHoNG9Lge9A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bHrL4u/Y/vxrpXaunsPldkYZ+fb9GkzDU+U1vwvFkp45WLW7j2uHZ+mOeRTfNWOsg
	 5wKz6TAtxLtC29kS0WXmVoi12K+P1QMtLj+xFkX1awcZyT0adnod+ZbbTtiD45v0+L
	 uOULD36jMABwC0+nq9CHmZYamjeULxSxOgceCLwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C80B2F80535; Tue, 11 Jul 2023 14:57:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B554DF80552;
	Tue, 11 Jul 2023 14:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABB17F8047D; Tue, 11 Jul 2023 14:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22CE2F80249
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CE2F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lRW0ybB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080237; x=1720616237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jid2RuYbICnO2j6tUDkfKrrrf977lWFjcHoNG9Lge9A=;
  b=lRW0ybB8rVR5ft7pV1FLTeCJz/XqlOuNyPy6Q0EWn6fC2dtQAqQ9wjoq
   Nc3wpTtd4SxYrIMfBFck7AccwU9lbGnbdnJiVMchNbMuKljbjtyeNcFyb
   FawLideWNhkzW7agh5FXQgm6J47Y0FsJ7OLeSvaUpJIcHjPXxtDFBdCQm
   MAppMl4xyL+FDEkupKcgFInnEooR4TSpLIsiNU06/hX6IZg8u5F4YEWHs
   6heh/DxcFfQG5H/D3VATGZ7HFcL8leK50KL7oNpaJLJIUpmmCaAa2ufR6
   r6G9avdfJPFFB9ZKYYg9T8b4UOygUR5dCpYsmVOZmiPzqUZqVD/6BOSDI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187323"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187323"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666447"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666447"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:05 -0700
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
Subject: [PATCH 00/13] PCI: Define Intel PCI IDs and use them in drivers
Date: Tue, 11 Jul 2023 14:57:13 +0200
Message-Id: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3E3CSHQG5S5LFRO3XPFWW5VNAKCB7GXM
X-Message-ID-Hash: 3E3CSHQG5S5LFRO3XPFWW5VNAKCB7GXM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3E3CSHQG5S5LFRO3XPFWW5VNAKCB7GXM/>
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

Changes from RFC:
 - Sort Intel PCI IDs before adding new ones
 - Fix ordering of new PCI IDs (Andy)
 - Define all used Intel IDs (Andy)
 - Add macros for controller type detection (Andy/Bjorn)
 - Add set of patches changing to use above macro (Andy/Bjorn)
 - Use PCI_DEVICE_DATA for Intel IDs in sound/pci/hda/hda_intel.c (Andy)
 - Commit message wording (Andy)
 - Remove unnecessary tabs (Andy)

Amadeusz Sławiński (13):
  PCI: Sort Intel PCI IDs by number
  PCI: Add Intel Audio DSP devices to pci_ids.h
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

 include/linux/pci_ids.h                | 104 +++++--
 include/sound/hda_codec.h              |   3 -
 include/sound/hdaudio.h                |  27 ++
 sound/hda/hdac_i915.c                  |   7 +-
 sound/hda/intel-dsp-config.c           | 119 ++++----
 sound/pci/hda/hda_intel.c              | 373 ++++++++++---------------
 sound/soc/intel/atom/sst/sst.c         |   3 +-
 sound/soc/intel/atom/sst/sst.h         |   1 -
 sound/soc/intel/atom/sst/sst_pci.c     |   4 +-
 sound/soc/intel/avs/board_selection.c  |  10 +-
 sound/soc/intel/avs/core.c             |  16 +-
 sound/soc/intel/skylake/skl-messages.c |  16 +-
 sound/soc/intel/skylake/skl-pcm.c      |   3 +-
 sound/soc/intel/skylake/skl.c          |  36 +--
 sound/soc/sof/intel/pci-apl.c          |   9 +-
 sound/soc/sof/intel/pci-cnl.c          |  15 +-
 sound/soc/sof/intel/pci-icl.c          |  12 +-
 sound/soc/sof/intel/pci-mtl.c          |   3 +-
 sound/soc/sof/intel/pci-skl.c          |   6 +-
 sound/soc/sof/intel/pci-tgl.c          |  45 +--
 sound/soc/sof/intel/pci-tng.c          |   3 +-
 21 files changed, 384 insertions(+), 431 deletions(-)

-- 
2.34.1

