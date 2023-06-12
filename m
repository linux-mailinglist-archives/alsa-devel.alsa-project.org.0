Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFD72B5E7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 05:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99246C0;
	Mon, 12 Jun 2023 05:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99246C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686539790;
	bh=8gPCuDqBxy3w2rRnM7UsFSCqZxJx21nsM66FiPsiHcs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sf7TvK9T5gi1Aavl4IE69BtcIHl1TphwLddILz0k1oLF8dA+yekuEZdjJv9y8EHO/
	 RkCUfrYgRUIVDq0pV7mD3j7XyAOaIctNXbW8K0p0T3OUA/9lamrAjRUL7aIh1wS4Bi
	 sqGx2Psm0zgjYJYq2qiUybckoHWGpcv8r6xO3Bf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EBEEF80552; Mon, 12 Jun 2023 05:15:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E010F80132;
	Mon, 12 Jun 2023 05:15:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C8CFF80548; Mon, 12 Jun 2023 05:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93151F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 05:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93151F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RQA8BMTT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686539690; x=1718075690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8gPCuDqBxy3w2rRnM7UsFSCqZxJx21nsM66FiPsiHcs=;
  b=RQA8BMTTahqyRarQ/2fz9UqEj768LAAtvYRrOFKlPLwwFBdZDPQOzqmD
   CtnbN1ZJztFHEIdxlIP2WSM8fJhKMVbbf7gJLgwNiUotlp5GkHMblFyNz
   +A9w/LqzqGZE9xZUBYjK59R2iFxecLq8mUvf5AWgdpt+oyT2CC4U39sm/
   fw1X5V7I07i4Vn8dxSGoY6fOADOV3t6m5AcblcYmTRXIycdoYjiAUlFGs
   A/PUv4YDJBcEkfpm1wbE+ORsWxAtY4EaHOZPMMEoi9X5jMj4sNZzhIg82
   leHYKS4VpjTg8F1KDJHHT2yzLhUOxb63ikY/D+kkxBpzD01XgBfFW6u7W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347578870"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="347578870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 20:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776191865"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="776191865"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 20:14:41 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/12] ASoC: Intel: avs: remove redundant dapm routes
Date: Mon, 12 Jun 2023 19:09:46 +0800
Message-Id: <20230612110958.592674-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MR7CNM3H3WQTPFKVDPQM4OTVRRUMC7BR
X-Message-ID-Hash: MR7CNM3H3WQTPFKVDPQM4OTVRRUMC7BR
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MR7CNM3H3WQTPFKVDPQM4OTVRRUMC7BR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series remove redundant dapm routes declared in multiple machine
drivers. These routes will be created by snd_soc_dapm_connect_dai_link_widgets()
during soundcard initialization. Following is the kernel log from a KBL
chromebook nocturne.

dmic:
[   13.773455] avs_dmic avs_dmic: connected DAI link dmic-codec:Capture -> dmic-platform:DMIC Rx
[   13.773460] avs_dmic avs_dmic: connected DAI link dmic-codec:Capture -> dmic-platform:DMIC WoV Rx

max98373:
[   14.079536] avs_max98373 avs_max98373.1: connected DAI link avs_max98373.1-platform:ssp0 Tx -> i2c-MX98373:00:Right HiFi Playback
[   14.079545] avs_max98373 avs_max98373.1: connected DAI link i2c-MX98373:00:Right HiFi Capture -> avs_max98373.1-platform:ssp0 Rx
[   14.079550] avs_max98373 avs_max98373.1: connected DAI link avs_max98373.1-platform:ssp0 Tx -> i2c-MX98373:01:Left HiFi Playback
[   14.079554] avs_max98373 avs_max98373.1: connected DAI link i2c-MX98373:01:Left HiFi Capture -> avs_max98373.1-platform:ssp0 Rx

hdaudio:
[   14.094818] avs_hdaudio avs_hdaudio.2: connected DAI link hdaudioB0D2-platform:hdaudioB0D2-cpu0 Tx -> hdaudioB0D2:HDMI 0 Playback
[   14.094824] avs_hdaudio avs_hdaudio.2: connected DAI link hdaudioB0D2-platform:hdaudioB0D2-cpu1 Tx -> hdaudioB0D2:HDMI 1 Playback
[   14.094828] avs_hdaudio avs_hdaudio.2: connected DAI link hdaudioB0D2-platform:hdaudioB0D2-cpu2 Tx -> hdaudioB0D2:HDMI 2 Playback


Brent Lu (12):
  ASoC: Intel: avs-da7219: remove redundant dapm routes
  ASoC: Intel: avs-dmic: remove redundant dapm routes
  ASoC: Intel: avs-hdaudio: remove redundant dapm routes
  ASoC: Intel: avs-max98357a: remove redundant dapm routes
  ASoC: Intel: avs-max98373: remove redundant dapm routes
  ASoC: Intel: avs-max98927: remove redundant dapm routes
  ASoC: Intel: avs-nau8825: remove redundant dapm routes
  ASoC: Intel: avs-rt274: remove redundant dapm routes
  ASoC: Intel: avs-rt286: remove redundant dapm routes
  ASoC: Intel: avs-rt298: remove redundant dapm routes
  ASoC: Intel: avs-rt5682: remove redundant dapm routes
  ASoC: Intel: avs-ssm4567: remove redundant dapm routes

 sound/soc/intel/avs/boards/da7219.c    | 45 ++----------------
 sound/soc/intel/avs/boards/dmic.c      |  2 -
 sound/soc/intel/avs/boards/hdaudio.c   | 65 +-------------------------
 sound/soc/intel/avs/boards/max98357a.c | 39 ++--------------
 sound/soc/intel/avs/boards/max98373.c  | 45 ++----------------
 sound/soc/intel/avs/boards/max98927.c  | 45 ++----------------
 sound/soc/intel/avs/boards/nau8825.c   | 45 ++----------------
 sound/soc/intel/avs/boards/rt274.c     | 45 ++----------------
 sound/soc/intel/avs/boards/rt286.c     | 45 ++----------------
 sound/soc/intel/avs/boards/rt298.c     | 45 ++----------------
 sound/soc/intel/avs/boards/rt5682.c    | 45 ++----------------
 sound/soc/intel/avs/boards/ssm4567.c   | 57 ++--------------------
 12 files changed, 31 insertions(+), 492 deletions(-)

-- 
2.34.1

