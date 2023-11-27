Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1F7FA128
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF68682C;
	Mon, 27 Nov 2023 14:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF68682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092203;
	bh=LflKEMjIno/7jo4PfwXSOeNAqzM9VF4HlnWuUWJ3zJM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OvOC8R/J7AblTQKiOKaZSJZ6CWtPxvYHeFz+7SacakN9W7qF3vyo76muSIbiwDiQr
	 Rgi0kp/iVDTrOA2yTSI+ysTX7bqaay/b4BnnUE87yGAAUi2W/w2TCVvuxBj4v2kz3f
	 Q6rNmN2RwpCJH72Lt71+O52mYQcJ72zEtEtBZs20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57412F80568; Mon, 27 Nov 2023 14:36:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3974F8055B;
	Mon, 27 Nov 2023 14:36:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C9BDF8055A; Mon, 27 Nov 2023 14:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F738F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F738F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dh0tHX3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092157; x=1732628157;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LflKEMjIno/7jo4PfwXSOeNAqzM9VF4HlnWuUWJ3zJM=;
  b=dh0tHX3bo3KdYNBR4fv7R2M3Bb2uVae6UvkviSL1SwkPvKXXBG798xC3
   gFQ1pEKZydXhNvLx0eX1xv5L0bCdcXGzA1KqOhUQ70fKOA+w6uK3giEis
   lWWqMXkF3slxkH6Znxq8ssq9B/fvynjW7ysNfhQ2ifOdtBeS7DRbR6UA9
   OsJchBSz0dr2HgIxcOXzpU0fCwZksNfgihCIUsEpWI6P6J4HTwgcEDNSx
   yV0UPAyQHDtsGKnHMwxn5dOgakMfCKfpUYbYbe2a9SmVqT9pnOG9Jl7WS
   5k4O2RbBxisivNEB66FmGSfzQKyIbyW907Q73MH74gq9t+YwGYlQVaAHo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578509"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578509"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743747"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743747"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 0/7] ASoC: Intel: Soundwire related board and match updates
Date: Mon, 27 Nov 2023 15:34:41 +0200
Message-ID: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JIVK5G7ZL6TPKJBYK4YSYSBKCFEPQ7RB
X-Message-ID-Hash: JIVK5G7ZL6TPKJBYK4YSYSBKCFEPQ7RB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIVK5G7ZL6TPKJBYK4YSYSBKCFEPQ7RB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

A small update for SDW machine support:
Small fixes for sof_sdw machine driver
Support for rt722
New TGL/MTL and LNL match for new configurations

Regards,
Peter
---
Bard Liao (1):
  ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and cs56l56 support

Chao Song (4):
  ASoC: Intel: sof_sdw: remove unused function declaration
  ASoC: Intel: sof_sdw: Add rt722 support
  ASoC: Intel: soc-acpi: add Gen4.1 SDCA board support for LNL RVP
  ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support

Mac Chiang (1):
  ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config

Peter Ujfalusi (1):
  ASoC: Intel: sof_sdw: Make use of dev_err_probe()

 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/Makefile               |  3 +-
 sound/soc/intel/boards/sof_sdw.c              | 32 +++++-
 sound/soc/intel/boards/sof_sdw_common.h       | 18 ++--
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   | 97 +++++++++++++++++++
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  8 ++
 .../intel/common/soc-acpi-intel-lnl-match.c   | 71 ++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 74 ++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++
 9 files changed, 374 insertions(+), 8 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt722_sdca.c

-- 
2.43.0

