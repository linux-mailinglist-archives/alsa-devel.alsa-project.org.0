Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F728C1308
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25EEE7F;
	Thu,  9 May 2024 18:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25EEE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272530;
	bh=ncJGnKIOu5ywsCE8rC5Q/lv0W1aGj7Ux6Y8BGe223Ac=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=G3F+FLs5AO9cL9CdGPwEXJYErZVoIpd+9dslT9kjtOfk9EzpTDpN1su5bc5x9AhIA
	 wtKb20T2X1p0ChgsZmiLpPtz1CZIm26d+cgHdfV9cf9Q4i5tWmz4UwOlH1zxLuADU6
	 6E7H/+DRNmNUveKvqJe8dNjkHgOHlsAnh0S+GNTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625F8F805D2; Thu,  9 May 2024 18:34:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0272FF805B1;
	Thu,  9 May 2024 18:34:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770F5F80571; Thu,  9 May 2024 18:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 365BCF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365BCF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rp7sa6qu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272471; x=1746808471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ncJGnKIOu5ywsCE8rC5Q/lv0W1aGj7Ux6Y8BGe223Ac=;
  b=Rp7sa6quIt82Ajip1omDp33wyCJVWv+8CBR0YWhOa6YgYyLPqqHN4rMZ
   ZsUjKaJ1EF8WVjGC5NhdeEyWYyKnJwVUPSR9vZaC2TUnpoSKAKdWQOTxd
   fZCO2pZRRxk37ZOzq4GbfMB5/Cln1aInkrhaemtM0Ogfy8NroSw5pVaXN
   UuxTWbjfjPdMgdvQYyEH7sha5xQrp4K4CfqT/qTZevTE29BDwt1NX/Xzp
   n+rcrwYhJSz1ktkeb3Jpe9loXIux86ehmsxbDzk3/W7T6vhNntlCaeBdy
   esq4XT3QRPVn5CKTffpvlaDes9vkV7t9vPgesM4x6dNbamXJzIU6IK7wI
   A==;
X-CSE-ConnectionGUID: JwjDoCRCRQ2GpSKmDVU9WA==
X-CSE-MsgGUID: ZbAJFJa4T46TCLI5lp1afA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017503"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:25 -0700
X-CSE-ConnectionGUID: +a3/sZKxSWmNtjuIgJ/Keg==
X-CSE-MsgGUID: bDF2b9gBQ+yX4bam6B5hqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760963"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/18] ASoC: Intel: updates for 6.10 - part7
Date: Thu,  9 May 2024 11:34:00 -0500
Message-Id: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AFSQD3YNF32AKN2ONW6OJAFVO3XTEIP5
X-Message-ID-Hash: AFSQD3YNF32AKN2ONW6OJAFVO3XTEIP5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFSQD3YNF32AKN2ONW6OJAFVO3XTEIP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset should be the last batch for this kernel cycle!

Brent Lu continued his cleanups to refactor and use fewer machine
drivers on Chrmebooks.

Bard Liao updated the sof-sdw machine driver to deal with UCM support
of the RT712 configuration. Note that this sof-sdw driver will be
refactored in the next kernel cycle to allow AMD and others to reuse
common SoundWire parts that are not Intel-specific. Initial changes
are described here: https://github.com/thesofproject/linux/pull/4967

Bard Liao (9):
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca for new codecs
  ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only support
  ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 only support
  ASoC: Intel: sof_sdw_cs_amp: rename Speakers to Speaker
  ASoC: Intel: sof_sdw: use generic name for controls/widgets
  ASoC: Intel: sof_sdw: add controls and dapm widgets in codec_info
  ASoC: Intel: sof_sdw: use .controls/.widgets to add controls/widgets
  ASoC: Intel: sof_sdw: add dai parameter to rtd_init callback
  ASoC: Intel: sof_sdw_rt_amp: use dai parameter

Brent Lu (9):
  ASoC: Intel: sof-rt5682: remove DMI quirk for hatch
  ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
  ASoC: Intel: realtek-common: remove 2-spk rt1015p config
  ASoC: Intel: maxim-common: add max_98373_dai_link function
  ASoC: Intel: sof_da7219: use max_98373_dai_link function
  ASoC: Intel: sof_nau8825: use max_98373_dai_link function
  ASoC: Intel: sof_rt5682: use max_98373_dai_link function
  ASoC: Intel: sof_sdw: add max98373 dapm routes
  ASoC: Intel: maxim-common: change max98373 data to static

 sound/soc/intel/boards/Kconfig                |   1 -
 sound/soc/intel/boards/sof_da7219.c           |   5 +-
 sound/soc/intel/boards/sof_maxim_common.c     |  27 ++--
 sound/soc/intel/boards/sof_maxim_common.h     |   7 +-
 sound/soc/intel/boards/sof_nau8825.c          |   5 +-
 sound/soc/intel/boards/sof_realtek_common.c   |  57 +------
 sound/soc/intel/boards/sof_realtek_common.h   |   1 -
 sound/soc/intel/boards/sof_rt5682.c           |  34 +---
 sound/soc/intel/boards/sof_sdw.c              | 146 +++++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h       |  34 ++--
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  26 +---
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  40 +----
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  15 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  28 +---
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  26 +---
 sound/soc/intel/boards/sof_sdw_rt700.c        |  28 +---
 sound/soc/intel/boards/sof_sdw_rt711.c        |  26 +---
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  24 +--
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |  24 +--
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  42 +----
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  45 +++---
 .../intel/common/soc-acpi-intel-lnl-match.c   |  50 ++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  38 ++---
 24 files changed, 302 insertions(+), 429 deletions(-)

-- 
2.40.1

