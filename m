Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 198ED54ED13
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7CC1B01;
	Fri, 17 Jun 2022 00:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7CC1B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417144;
	bh=jSu0U26sSG6nWop45i0uQKXfaoPMS85HF4VOcrHTDds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TegjqBxNICaMMb9e6lCa9wBsMU5Zzh2LvISZx59yZZ0oVWjfM8wN4fd58/3CXQYc0
	 DaN5N8lE7/rgORRekbXAnxZyM+3IAR/Vpb7OGf9QqlGPxSWCxEL9noS1oXnN1j3Ima
	 7wug3Ik4tFr1JE8BTnLBhR0mC32/zswuWWbIvS8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF13F804D0;
	Fri, 17 Jun 2022 00:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A67DCF800F0; Fri, 17 Jun 2022 00:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF00F800F0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF00F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PZWTqvzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417081; x=1686953081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jSu0U26sSG6nWop45i0uQKXfaoPMS85HF4VOcrHTDds=;
 b=PZWTqvzta9vbXpmcmICFCYWcd2LSjCxDl62bKg5ouWidJGM9ZvOdCL7T
 DBORTCWr/FS7fnaX/VGIFQmphzACWWNStMCELWTnUjMLLgeQiXwp8okRc
 h77E2VEVFc+p6xpC+dF6AzgsoaVJrv3j9Qv+IixlDWvxyjoSa3hcKwobH
 JrgM1oGRwiuuUJHLL1Ucf2NCn/DeXDSFo+4IPurw+6l7KVFiBqvJIZLjy
 PXIr2keBhBL7XL3g01sadGNq9t8em+iMXy/f7z5BQ4uLkKwVfy7nSrGbo
 yRVVVJOKyYH8i7c687LaIPVrryiIObEZTpNMIMg9ljT9WXZkLmMGExIGF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304810878"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304810878"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728084918"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] ASoC: use pm_runtime_resume_and_get() when possible
Date: Thu, 16 Jun 2022 17:04:16 -0500
Message-Id: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

After a set of SOF-specific changes, this patchset correct problematic
uses of pm_runtime_get_sync() in ASoC, or simplifies the flow with no
functional changes. Two patches for Intel platforms also add a test on
resume success.

Additional changes were initially suggested to completely remove the
use of pm_runtime_get_sync(). These changes were dropped since they
are way too invasive, specifically in cases where the return values
were not tested, which would lead to duplicate pm_runtime_put(). The
remaining uses of pm_runtime_get_sync() cannot really be blindly
modified without context and knowledge of each driver.

Pierre-Louis Bossart (11):
  ASoC: Intel: catpt: use pm_runtime_resume_and_get()
  ASoC: Intel: skylake: skl-pcm: use pm_runtime_resume_and_get()
  ASoC: soc-component: use pm_runtime_resume_and_get()
  ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()
  ASoC: wsa881x: use pm_runtime_resume_and_get()
  ASoC: rockchip: i2s_tdm: use pm_runtime_resume_and_get()
  ASoC: fsl: fsl_sai: use pm_runtime_resume_and_get()
  ASoC: img: img-i2s-out: use pm_runtime_resume_and_get()
  ASoC: rockchip: pdm: use pm_runtime_resume_and_get()
  ASoC: tas2552: use pm_runtime_resume_and_get()
  ASoC: ti: davinci-mcasp: use pm_runtime_resume_and_get()

 sound/soc/codecs/tas2552.c            |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.c        | 10 ++++------
 sound/soc/codecs/wsa881x.c            |  6 ++----
 sound/soc/fsl/fsl_sai.c               |  6 ++----
 sound/soc/img/img-i2s-out.c           | 12 ++++--------
 sound/soc/intel/catpt/pcm.c           | 26 ++++++++++++++++++++------
 sound/soc/intel/catpt/sysfs.c         |  4 +++-
 sound/soc/intel/skylake/skl-pcm.c     |  5 ++++-
 sound/soc/rockchip/rockchip_i2s_tdm.c |  6 ++----
 sound/soc/rockchip/rockchip_pdm.c     |  6 ++----
 sound/soc/soc-component.c             |  8 ++++----
 sound/soc/ti/davinci-mcasp.c          |  3 +--
 12 files changed, 49 insertions(+), 45 deletions(-)

-- 
2.34.1

