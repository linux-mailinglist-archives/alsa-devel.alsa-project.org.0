Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978957FD72A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:53:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42303BC0;
	Wed, 29 Nov 2023 13:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42303BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262420;
	bh=4o5AIX3Twokl6RYeB9uWoR89mwtqIoon/yV/+kRQe3w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g5Mb/jk0GRGDsVUYQyjJIqnyJvIdMChwFlsX9NRGmWGH+/jyoJbZoQrFj+dtIBF42
	 0innYIP1jEoI+MZ6gfmN4eELPIhPJRkjvRiBSKpGaqBZNqUi3S502SUVNkExRZZG8+
	 fM2e6BbHcrF/unSSxr4ijEZAAkXVXq3oRrVStFwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99B2CF80246; Wed, 29 Nov 2023 13:53:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A018F80236;
	Wed, 29 Nov 2023 13:53:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6893EF80246; Wed, 29 Nov 2023 13:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67659F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67659F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LShhvGPA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262377; x=1732798377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4o5AIX3Twokl6RYeB9uWoR89mwtqIoon/yV/+kRQe3w=;
  b=LShhvGPAiVglUAkuYj4cNn2EfFgCm9j0eJDlWN8vdrLtwxUckJm1PXBr
   n4Q6sF1WESMkJoETnHpQSXMVicBasIz4emRU/uhKg1tH+NaGNiARZZvsK
   DacJ1vhYWzfHFtvON4Nn6iptKl4Wlydj3iWQQ2enHVMpiT5B+BBk9YBMs
   a4He7UnLv6wn2YwkoOTpL3bq+VGqnlgF06VoLFEytCn48lU0qnfO/Pzwi
   3ZZK0r29pwaFV2u+RNZCnDnDehSLwOelEHYHzkfP1s53N1RKaiHoSPIUy
   9hHYa+OIx5RUPaoHPkgnJK2AEH+rdy1t8+T/cu4Z4hrwd8+DQmMVttNdc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022856"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174584"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 00/13] ASoC: SOF: IPC path handling and fallback support
Date: Wed, 29 Nov 2023 14:53:14 +0200
Message-ID: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQN2TD4M2SI4THQHXYJ4TIWKRQZTXDGK
X-Message-ID-Hash: IQN2TD4M2SI4THQHXYJ4TIWKRQZTXDGK
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQN2TD4M2SI4THQHXYJ4TIWKRQZTXDGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The main aim of the series is to provide a mechanism to fallback to 'older' IPC
versions in case the desired one is missing either a firmware or topology file.
It is going to make the life of users and distributions if we are going to
start transition existing IPC3 platforms to IPC4 (CAVS2.5) and we might have
missed some topology file to convert for example.
In that case the kernel will fallback to IPC3 without audio regression.

To be able to support this we needed to change the probe sequence to know the
topology filename earlier and check if it is present in the filesystem.

No functional changes for now, the default IPC versions have not been changed.

Regards,
Peter
---
Peter Ujfalusi (13):
  ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from
    sof-audio.c
  ASoC: SOF: Move sof_machine_* functions from sof-audio.c to core.c
  ASoC: SOF: Add placeholder for platform IPC type and path overrides
  ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
  ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
  ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
  ASoC: SOF: core: Implement firmware, topology path setup in core
  ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
  ASoC: SOF: sof-of-dev: Rely on core to create the file paths
  ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
  ASoC: SOF: core: Add helper for initialization of paths, ops
  ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
  ASoC: SOF: core: Implement IPC version fallback if firmware files are
    missing

 include/sound/sof.h             |  15 ++
 sound/soc/sof/Kconfig           |  11 ++
 sound/soc/sof/Makefile          |   3 +-
 sound/soc/sof/core.c            | 289 +++++++++++++++++++++++-----
 sound/soc/sof/fw-file-profile.c | 322 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/apl.c       |   2 +-
 sound/soc/sof/intel/cnl.c       |   2 +-
 sound/soc/sof/intel/hda-dai.c   |   3 +
 sound/soc/sof/intel/icl.c       |   2 +-
 sound/soc/sof/intel/lnl.c       |   2 +-
 sound/soc/sof/intel/mtl.c       |   2 +-
 sound/soc/sof/intel/skl.c       |   2 +-
 sound/soc/sof/intel/tgl.c       |   2 +-
 sound/soc/sof/sof-acpi-dev.c    |  16 +-
 sound/soc/sof/sof-audio.c       | 120 ------------
 sound/soc/sof/sof-of-dev.c      |  36 +++-
 sound/soc/sof/sof-of-dev.h      |   9 +
 sound/soc/sof/sof-pci-dev.c     | 102 ++--------
 sound/soc/sof/sof-priv.h        |   9 +-
 19 files changed, 671 insertions(+), 278 deletions(-)
 create mode 100644 sound/soc/sof/fw-file-profile.c

-- 
2.43.0

