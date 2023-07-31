Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180076A2E1
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC916C0;
	Mon, 31 Jul 2023 23:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC916C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839248;
	bh=kuPC8qSJrqRWpQ5mAz16jjjJQ6KDBMkcC8Wd5z2os2g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NPWreTsdasViqRAcj+2sCWug/AlIxvpX91XOh65zThbW7xds9GJja+s9tZd4zQoO5
	 aDgjqkAjCrMEboKz3AcZLujGSHAB6/ZWoJeycL6viRhp3FupzgtQ5UebH5zoUWYIJG
	 BETmQw/3Q7LVic3yVIXf79NtJ8Q7r0WHFoDA4KKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E89C6F80163; Mon, 31 Jul 2023 23:33:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B7E2F80163;
	Mon, 31 Jul 2023 23:33:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8677FF80520; Mon, 31 Jul 2023 23:33:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48205F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48205F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a23fOXd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839184; x=1722375184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kuPC8qSJrqRWpQ5mAz16jjjJQ6KDBMkcC8Wd5z2os2g=;
  b=a23fOXd5CKGjBwkzO56cQtQqlswLSvnqlmp0IMIDC9mQDmUiyPaapOaJ
   a7dRS4qF+1JnggjEaVn7BoakHRltARTxB5pVijIuL7ATixXWEj1xmDJFm
   s3P5GcfE1dQGNrpo3TDoZgLZILZaDUKQ2+Pumr6tFX6BTVrahtmL+2TJf
   60uQzb3jPPxFN9+bqVuiRENpGv5vRf3WHf2aBJz6tfqlwqSew0QfNuNJA
   HgQP+ruVI69XfwDDBmHG0RDs5bHjaL9PXbeRmQi2bOpY0fVir1UAZAfpe
   xTiG6OGZSrictpslxmY3aa9ib7L7N0YGb7/8d1PeHjx9d4CiPnf7JUI3t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435447487"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435447487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731708874"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="731708874"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:32:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/6] ASoC: SOF: misc updates for 6.6
Date: Mon, 31 Jul 2023 16:32:36 -0500
Message-Id: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MPI7E7I63UQTNM42UMHRFKVA75O7K6ML
X-Message-ID-Hash: MPI7E7I63UQTNM42UMHRFKVA75O7K6ML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPI7E7I63UQTNM42UMHRFKVA75O7K6ML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cleanups, move of code to promote reuse and Mediatek minor updates.

Curtis Malainey (1):
  ASoC: SOF: Deprecate invalid enums in IPC3

Pierre-Louis Bossart (3):
  ASoC: SOF: Intel: start simplify the signature of link_slaves_found()
  ASoC: soc-acpi: move link_slaves_found()
  ASoC: soc-acpi: improve log messagesin link_slaves_found()

Trevor Wu (2):
  ASoC: SOF: ipc3: update dai_link_fixup for SOF_DAI_MEDIATEK_AFE
  ASoC: SOF: mediatek: mt8186 modify dram type as non-cache

 include/linux/soundwire/sdw.h          |  5 ++
 include/linux/soundwire/sdw_intel.h    |  7 +--
 include/sound/soc-acpi.h               |  6 ++
 include/sound/sof/topology.h           |  4 +-
 sound/soc/soc-acpi.c                   | 73 +++++++++++++++++++++++
 sound/soc/sof/intel/hda.c              | 81 +-------------------------
 sound/soc/sof/ipc3-pcm.c               | 17 ++++++
 sound/soc/sof/mediatek/mt8186/mt8186.c | 40 +++++++------
 8 files changed, 130 insertions(+), 103 deletions(-)

-- 
2.39.2

