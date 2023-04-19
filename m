Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F466E8230
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACB3EE6;
	Wed, 19 Apr 2023 21:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACB3EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934218;
	bh=Mm1wf5tQiBMOvIDmzZmXPhONqXcoirjjhFOU9VV9fVs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UHHlO0IQjELSxeLcDvG5+MRDzhTcE9bWbehdn02pRBFZNubakZLjAtKqo2ZEm7x/s
	 ga6pjvN8geTAeRUoLJF3YCx3GRSRdYr7gpYe1fse7jBfZLAH9tcv1eHxlumjd3TCSA
	 isLdNJ2/uG5FyfGg+okEE3Zr+DxxJRjGpPYmk2EQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2672F80510;
	Wed, 19 Apr 2023 21:56:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F19A7F80053; Wed, 19 Apr 2023 21:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02D31F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D31F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RoRxwjAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934163; x=1713470163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mm1wf5tQiBMOvIDmzZmXPhONqXcoirjjhFOU9VV9fVs=;
  b=RoRxwjAEJa2Dq3nsTRGrHYk6tY/LmFXzJLgzjuIPJfxlpQJ/qPSNI/Jd
   b49gTnRccUyUDvuNotyvQW4oz/zI/7u5GaZXBjrjPoVOwQQVpO1ixL3k8
   h9AtcJF8GEp4V2CRzXA7pY29du0j+HZ57C5kyWuE+h9mdYNHE6KyTW3Ln
   FnPhWsi+jWcgeYxdAhovZQrZ+Tf31KvgvwwBaoWgLMTvcDUJFsHUwwqlx
   pmn1RlERA3Vz6ZjlKX2qh8Usa1I5tEilu0w0QfJJ58SYt1zf7LPqrPbiK
   a74ENmWkRK2W0x9vLGEHQlk2+zghhxrhtlGMHGQ/ewmkbGP1dsRIqVfrf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434377"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434377"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728089"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728089"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:55:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: Intel: boards: updates for 6.4
Date: Wed, 19 Apr 2023 14:55:17 -0500
Message-Id: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K6NQ2AMQIMQIMD7WEMBKMUTNES3C6LK5
X-Message-ID-Hash: K6NQ2AMQIMQIMD7WEMBKMUTNES3C6LK5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6NQ2AMQIMQIMD7WEMBKMUTNES3C6LK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Preparation of ALC712 support with different types of SoundWire
devices per link, new RaptorLake SoundWire device, better error
handling for Cirrus devices and cosmetic changes for Max98373.

Bard Liao (3):
  ASoC: Intel: sof_sdw: set codec_num = 1 if the device is not
    aggregated
  ASoC: Intel: sof_sdw: support different devices on the same sdw link
  ASoC: Intel: sof_sdw: append codec type to dai link name

Curtis Malainey (1):
  ASoC: Intel: sof_cirrus_common: Guard against missing buses

Yong Zhi (2):
  ASoC: Intel: sof_sdw: remove late_probe flag in struct
    sof_sdw_codec_info
  ASoC: Intel: sof_sdw_max98373: change sof_sdw_mx8373_late_probe to
    static call

apoorv (1):
  ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 2 in RPL
    match table

 sound/soc/intel/boards/sof_cirrus_common.c    |   7 +-
 sound/soc/intel/boards/sof_sdw.c              | 181 ++++++++++++------
 sound/soc/intel/boards/sof_sdw_common.h       |   3 -
 sound/soc/intel/boards/sof_sdw_max98373.c     |  22 +--
 .../intel/common/soc-acpi-intel-rpl-match.c   |  17 +-
 5 files changed, 152 insertions(+), 78 deletions(-)

-- 
2.37.2

