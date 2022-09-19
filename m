Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5895BCBE8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:37:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E71C43E7;
	Mon, 19 Sep 2022 14:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E71C43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663591064;
	bh=y4XZKMyz2BLPm3acYeIG4Vt/JgXp+5y/GPxRCBxaNIs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T+ekFlxVsRVge81jCIFo9COczEkBNdrsAKH4UYmiLzJvBOhm+IIudCXrA5iGxPYSh
	 xKK5kiKt9InmMsjOvr3bI8ttEGFaecaJsus/0oBofOAIxecnZA+aekJRS0+uFl+p0N
	 TWjYsMDRWSSiagz65wwb34DGY93sRp7JBPlKPcnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB38F8016D;
	Mon, 19 Sep 2022 14:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF3BF8032B; Mon, 19 Sep 2022 14:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 157C6F8016D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 157C6F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B4xzkXKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663591003; x=1695127003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y4XZKMyz2BLPm3acYeIG4Vt/JgXp+5y/GPxRCBxaNIs=;
 b=B4xzkXKTv7b4mpbxTlx3r+ypQz1J0HEyfgZ0VuoGYv8oV8Xst19yHOdA
 Acb7jTtVGDMAfcv30efGkSsqDiHNkkIKtio6s336b5n8/GEGEvLZsKIIo
 ZKqI9nk+0wKkZn/Toy0iDgskAP5ML1YJwMFALXpUlY0KPHzasUw+SacPu
 DbkOswPQygF+/P8YYcyvCRWPPxh6to2gEmGC+utszUHHudVtN89mHqjOi
 WxoPhZVkiGkeY0CJ93Zfis8rbm+pWYIvlEGGYPbeZAye2atordRZELe9O
 q6i6exNd5WCUhBG8cFFR6RpVmjSKV16iLSCxNLxuLvooFvPbzsJiY/wWi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="385676928"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="385676928"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:36:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="707549734"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:36:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: Add SKL/KBL support for IPC4 CI tests
Date: Mon, 19 Sep 2022 14:36:13 +0200
Message-Id: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset was submitted earlier in April 2022 as part of the
"ASoC: SOF: add INTEL_IPC4 plumbing" series. As requested the SKL/KBL
support is moved to a different series.

This updates adds minor style fixes and the ops that were missing at
the time.  SKL and KBL daily tests have been running for several
months and helped identify missing sequences in the SOF driver for
HDaudio links, or platform differences that the driver did not account
for (number of pipelines, etc).

Note that this capability is not recommended for any distribution, it
is ONLY for SOF IPC4 CI tests on HDaudio devices, we will not extend
this SKL/KBL support for I2S devices based on ES8336 or Chromebooks
which are ONLY supported by the AVS driver.

This patchset is dependent on the series " ASoC: SOF: start using
tracing instead of dev_dbg"

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-dsp: expose functions for SKL support
  ASoC: SOF: Intel: add SKL/KBL hardware code loader
  ASoC: SOF: Intel: add initial SKL/KBL hardware support
  ASoC: SOF: Intel: add ops for SKL/KBL

 sound/soc/sof/intel/Kconfig          |  25 ++
 sound/soc/sof/intel/Makefile         |   4 +
 sound/soc/sof/intel/hda-dsp.c        |   4 +-
 sound/soc/sof/intel/hda-ipc.c        |   8 +
 sound/soc/sof/intel/hda-loader-skl.c | 580 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c            |   2 +
 sound/soc/sof/intel/hda.h            |  12 +
 sound/soc/sof/intel/pci-skl.c        |  91 +++++
 sound/soc/sof/intel/skl.c            | 114 ++++++
 9 files changed, 838 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c

-- 
2.34.1

