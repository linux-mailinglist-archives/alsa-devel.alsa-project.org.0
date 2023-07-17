Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D9B7561DE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7ABA4E;
	Mon, 17 Jul 2023 13:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7ABA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594395;
	bh=2MHPO+iHuYgAyGNlqYAFRPStgolKWt3w3Dm0eTHpGD4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HfoZJPDbDJiQGbC+tSSdw9jlN1YV7zABuHj2eyTVy4y2lQhDosHGjJLURcwFiAqfa
	 opmBaSeJw8w7TMEUR/1PvW9aSa2A25fpOuaFXrkmweiEf5nozbFRqrZRp7bZF6SNxI
	 TpDrfPsWfEYpIAk2PTTD6/BGvwLpguKzzLiDX1Zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28B74F80527; Mon, 17 Jul 2023 13:45:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2598AF80527;
	Mon, 17 Jul 2023 13:45:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64026F80527; Mon, 17 Jul 2023 13:45:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76A08F8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A08F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VhfzcMsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594328; x=1721130328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2MHPO+iHuYgAyGNlqYAFRPStgolKWt3w3Dm0eTHpGD4=;
  b=VhfzcMsEyvBJ72Z9sBEirk5gkuJzWItxNixWcmQo+gXqtu0BhIKL0WUg
   10rvj1lhmlU1fzKECkIYD9HoaGLnkDz2kVN1VlktLg+tp8JRoVnuIXtCa
   73BFGUAG77LVCIcEscJ/KIRsHkUPhUxIKGLgd99kMwMQw8sDR8gKupUCR
   s6nPBYjOgldtZDFwRqeTOIKevi+At4SNRRQQa+qjim9pk/w50MxewVDy6
   XZrq4NWZEPx/pCDuSg6F7Q/Cvp8mzSqV3aDKFDh9CKf7DD9dOFloKSRxV
   x+0QOsL9H+H7NH8BAks4ZmLxpcyqtreUI3uSMJLRscfurB2slS1BD+W2e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363372707"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363372707"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856460"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856460"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:45:18 -0700
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
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v4 00/15] PCI: Define Intel PCI IDs and use them in drivers
Date: Mon, 17 Jul 2023 13:44:56 +0200
Message-Id: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MYIDGFWNHRKLUPTKVZZWGKRILTGOJFYO
X-Message-ID-Hash: MYIDGFWNHRKLUPTKVZZWGKRILTGOJFYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYIDGFWNHRKLUPTKVZZWGKRILTGOJFYO/>
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

Changes from v3:
 - Fix double space in commit message title (Ilpo)
 - Comment ACPI/PCI ID handling in Atom SST driver (Andy)
 - Rebased once again and used --base this time (Andy)

Changes from v2:
 - Change CHV to BSW (Andy)
 - Fix incorrectly rebased patches (Andy)
 - Fix commit message and add suggestions from Andy to SST patch (Andy)
 - Rebased on top of Linus tree commit: 4b810bf037e5

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
  ALSA: hda/i915: Use global PCI match macro
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
 sound/soc/intel/atom/sst/sst.c         |  14 +-
 sound/soc/intel/atom/sst/sst.h         |   7 +-
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
 21 files changed, 391 insertions(+), 445 deletions(-)


base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.34.1

