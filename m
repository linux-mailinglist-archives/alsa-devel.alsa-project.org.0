Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9E6D5DBD
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4199A1FC;
	Tue,  4 Apr 2023 12:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4199A1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680604923;
	bh=54A74I3QIpJ8Xep57bcN+hRCS6ooz32UF7WqYA5qQ2E=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a+gmL1Ux0E2p+35zzleD8jydLQ2WMwvnVo4wejr9U9nDVHTlYojiKm9weR3N3jVsZ
	 UZCK0PGv/Z0QpgwGYvIjP3+kVcrU5Yr26wjQAvbqTVnka9trhAkj3/oCZqpM/+bRAV
	 +3Z5UG6zngGCDrePJa4IrqBQvCzIMKl6qsPQG9Yw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E9BF8026D;
	Tue,  4 Apr 2023 12:41:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60601F80423; Tue,  4 Apr 2023 12:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21795F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21795F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TViwJKwK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604860; x=1712140860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=54A74I3QIpJ8Xep57bcN+hRCS6ooz32UF7WqYA5qQ2E=;
  b=TViwJKwKPBiKK6vzy3tzm8KEiUJbypFuiqs/r90Cgk1FVkwAmIW6+0XB
   kitLKNNif1zcAmOm8q5nHZQO/44N3uoMoIN/lrSzGA1DTvGImD0oF3K14
   hkfl4BlP+dGyFhJ2EWPK6djbF4sEFUoYSbiHDY+nmzWSLU0sIh8+GNC13
   zgESlzx97LiodbpN/bEzqSThQaNkIUa4QQYzmUqfq3Abh8jJ9FbgBwTxu
   y5sdIgzq9ElCtOxXvNcZT9QMlWnleTmIJsmJZ+jGFjYUyWMc1/saKeume
   c01PglXn6/18hhrjfAfesSFqX7CI67U19n4BboN2/VkGSPMMMSr9V7I43
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877902"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930105"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930105"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:40:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 00/18] ASoC: SOF: Intel: hda-mlink: HDaudio multi-link
 extension update
Date: Tue,  4 Apr 2023 13:41:09 +0300
Message-Id: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5ZJMNLMWHPM35RKF55QP7JZ46X374JNP
X-Message-ID-Hash: 5ZJMNLMWHPM35RKF55QP7JZ46X374JNP
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZJMNLMWHPM35RKF55QP7JZ46X374JNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes since v1:
- Rename hda_bus_ml_get_capabilities() to hda_bus_ml_init() - patch 06/18
- Rename check_power_active() to check_sublink_power() and the parameter from
  enable to enabled - patch 08/18

Not changed: the poll timeout implementation for now, as Pierre mentioned it can
be done at a later time.

Cover letter:

The following series adds the core support to handle the recently updated
HDaudio multi-link support to hanlde non HDA links, like SoundWire/DMIC/SSP on
Intel platform.

For details, please see the first patch which documents the current mlink
support (introduced at Skylake) and the new extensions, arriving with LNL.

There is no change in functionality for existing HDA support, the extension is
backwards compatible with existing implementations.

Regards,
Peter
---
Pierre-Louis Bossart (18):
  Documentation: sound: add description of Intel HDaudio multi-links
  ALSA: hda: add HDaudio Extended link definitions
  ASoC: SOF: Intel: hda-mlink: improve hda_bus_ml_free() helper
  ASoC: SOF: Intel: hda-mlink: add return value for
    hda_bus_ml_get_capabilities()
  ASoC: SOF: Intel: hda-mlink: move to a dedicated module
  ASoC: SOF: Intel: hda-mlink: add structures to parse ALT links
  ASoC: SOF: Intel: hda-mlink: special-case HDaudio regular links
  ASoC: SOF: Intel: hda-mlink: introduce helpers for 'extended links' PM
  ASoC: SOF: Intel: hda-mlink: add convenience helpers for SoundWire PM
  ASoC: SOF: Intel: hda-mlink: add helper to return sublink count
  ASoC: SOF: Intel: hda-mlink: add helpers to enable/check interrupts
  ASoC: SOF: Intel: hda-mlink: add helpers to set link SYNC frequency
  ASoC: SOF: Intel: hda-mlink: add helpers for sync_arm/sync_go
  ASoC: SOF: Intel: hda-mlink: add helper to check cmdsync
  ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID registers
  ASoC: SOF: Intel: hda-mlink: add helpers to retrieve DMIC/SSP hlink
  ASoC: SOF: Intel: hda-mlink: add helper to offload link ownership
  ASoC: SOF: Intel: hda-mlink: add helper to retrieve eml_lock

 Documentation/sound/hd-audio/index.rst        |   1 +
 .../sound/hd-audio/intel-multi-link.rst       | 312 +++++++
 include/sound/hda-mlink.h                     | 166 ++++
 include/sound/hda_register.h                  |  40 +-
 sound/soc/sof/intel/Kconfig                   |   7 +
 sound/soc/sof/intel/Makefile                  |   5 +-
 sound/soc/sof/intel/hda-ctrl.c                |   1 +
 sound/soc/sof/intel/hda-dsp.c                 |   1 +
 sound/soc/sof/intel/hda-mlink.c               | 822 +++++++++++++++++-
 sound/soc/sof/intel/hda.c                     |   4 +-
 sound/soc/sof/intel/hda.h                     |  20 -
 11 files changed, 1332 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/sound/hd-audio/intel-multi-link.rst
 create mode 100644 include/sound/hda-mlink.h

-- 
2.40.0

