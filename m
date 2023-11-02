Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5A7DF2B5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:48:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFA7823;
	Thu,  2 Nov 2023 13:47:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFA7823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929295;
	bh=tV4zMYZwuhYLY6+OXhuWh69eDrIBWYWnMQ7uZzjdTyo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hqAcLE3y+HFW9jRFNZWQhi1D+SjJrYsvlZ6VtLx1TfG2Vr4/p/p5kwA+9v1tqGA4R
	 9G5s1pg7jV6n/INbAhgOIJg6uYPyLfDFGtl3VwKn05XRkVJ+0k39kUH57CCiOLJ9I9
	 fZ8n9o8kMUKQysn9iN4g2nm1qrNlmLpsl/IqfrJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C72F7F80494; Thu,  2 Nov 2023 13:47:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC43F80425;
	Thu,  2 Nov 2023 13:47:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AED6DF80558; Thu,  2 Nov 2023 13:47:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 587A5F8020D
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 587A5F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y0E49m5H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929228; x=1730465228;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tV4zMYZwuhYLY6+OXhuWh69eDrIBWYWnMQ7uZzjdTyo=;
  b=Y0E49m5HefFvoAMt9PsgdLjvLcDV1ZoYOL+IG2BVpuK2fr+bLkyJDJ8J
   QmdmdEWOBo/feBMoq8PDB5V4VKFr8uxCoi8bI5Vmk83TXkvLzJTimTXu5
   M0StgpvwhXt+xP8IWzRsNo3T1vu0UJHHIj1nD45en3sOu2fDwRg26oKSo
   CP/XfNrnf2YTpxlMRc0zk5cCzYHBYTm81bDRYDlWoNx/dJlC2LbE4zkKt
   vmnR7A/cRUMVuaDb1KFFIIY1e3bN4xa+ATyfap/2vIphUSZokOe0QDXTJ
   lAwqrKph5ApdSD/M2XYjRs1rty2blMh9v/LUWXHToejtl6mA7ab+Lwz1X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343462"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343462"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454717"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454717"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:00 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/17] ASoC: Intel: avs: Properly identify boards
Date: Thu,  2 Nov 2023 13:46:55 +0100
Message-Id: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 24T26CZRRFKHA4APWC5UI3CODKEUYQHA
X-Message-ID-Hash: 24T26CZRRFKHA4APWC5UI3CODKEUYQHA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24T26CZRRFKHA4APWC5UI3CODKEUYQHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using MODULE_ALIAS() to load boards, add proper device id
table and use MODULE_DEVICE_TABLE() macro to create board alias.

Amadeusz Sławiński (17):
  ASoC: Intel: avs: da7219: Add proper id_table
  ASoC: Intel: avs: dmic: Add proper id_table
  ASoC: Intel: avs: es8336: Add proper id_table
  ASoC: Intel: avs: hdaudio: Add proper id_table
  ASoC: Intel: avs: i2s_test: Add proper id_table
  ASoC: Intel: avs: max98357a: Add proper id_table
  ASoC: Intel: avs: max98373: Add proper id_table
  ASoC: Intel: avs: max98927: Add proper id_table
  ASoC: Intel: avs: nau8825: Add proper id_table
  ASoC: Intel: avs: probe: Add proper id_table
  ASoC: Intel: avs: rt274: Add proper id_table
  ASoC: Intel: avs: rt286: Add proper id_table
  ASoC: Intel: avs: rt298: Add proper id_table
  ASoC: Intel: avs: rt5514: Add proper id_table
  ASoC: Intel: avs: rt5663: Add proper id_table
  ASoC: Intel: avs: rt5682: Add proper id_table
  ASoC: Intel: avs: ssm4567: Add proper id_table

 sound/soc/intel/avs/boards/da7219.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/dmic.c      | 10 +++++++++-
 sound/soc/intel/avs/boards/es8336.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/hdaudio.c   | 10 +++++++++-
 sound/soc/intel/avs/boards/i2s_test.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/max98357a.c | 10 +++++++++-
 sound/soc/intel/avs/boards/max98373.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/max98927.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/nau8825.c   | 10 +++++++++-
 sound/soc/intel/avs/boards/probe.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt274.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt286.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt298.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5514.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5663.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5682.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/ssm4567.c   | 10 +++++++++-
 17 files changed, 153 insertions(+), 17 deletions(-)


base-commit: ed2232d49187cebc007ecf4e6374069b11ab3219
-- 
2.34.1

