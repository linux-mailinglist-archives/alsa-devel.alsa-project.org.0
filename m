Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F28736CA267
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D619A826;
	Mon, 27 Mar 2023 13:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D619A826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916619;
	bh=qzxCaekjo0ssu61AkBccyyWkiruNBhS0QVYe3+9NWVk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qQv92EQPHDMs6rxNMS6hXo90uXLnhdXoomgIFAMsTe0JW79mQf30ehhGX38V9wInD
	 PrSdXFqMKp7DHb4lMULZ2214hyStkk1eYIU2GBelJNMrBI//3sn9R8+JjFwvHw1b9D
	 ifG/JxoOecrv5il/JKNjsh4HGtYEKDwZTQqYdBQQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93FF0F80482;
	Mon, 27 Mar 2023 13:29:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1DDBF80527; Mon, 27 Mar 2023 13:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D493F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D493F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KEY+8WvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916549; x=1711452549;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qzxCaekjo0ssu61AkBccyyWkiruNBhS0QVYe3+9NWVk=;
  b=KEY+8WvUYp81YVYsH06uQE8YiDHbyE4zGIsTrGDgmIeQk6SbihxhNTf9
   1rb8jlzZk4ncBHe/9BBqk+suMRfxr65w4xjJnA1JQM0JPJg/V5VvjmLEu
   nF1sM1kzJ8MeymJDMTmLQuuqfMDtmNGEbB46nOl75BDTkmvLCfzHuilz4
   frHVjrgcJs97mIRdTF3shBsIvkZSsVugLAmvVZYoevqxItzVSussVnuEx
   jIDrpEtPyvMqMtprOgG9VSKpEwne8cuZOIN1ZUjKGaoHupm6glLYCqNso
   CkS+3kO5w8KxxYqc7/17NjrrJn605e4dkVZdwK+s4Jx2/IMFTI/mHWMVK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986857"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620346"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620346"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:28:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 00/18] ASoC: SOF: Intel: hda-mlink: HDaudio multi-link
 extension update
Date: Mon, 27 Mar 2023 14:29:13 +0300
Message-Id: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NXP6LBPYRKK5YVWQIHP7A6LTF2YT7N4D
X-Message-ID-Hash: NXP6LBPYRKK5YVWQIHP7A6LTF2YT7N4D
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXP6LBPYRKK5YVWQIHP7A6LTF2YT7N4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

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
 sound/soc/sof/intel/hda.c                     |   2 +
 sound/soc/sof/intel/hda.h                     |  20 -
 11 files changed, 1331 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/sound/hd-audio/intel-multi-link.rst
 create mode 100644 include/sound/hda-mlink.h

-- 
2.40.0

