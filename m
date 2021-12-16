Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD2477132
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE881E09;
	Thu, 16 Dec 2021 12:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE881E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655872;
	bh=SEAz8JSicQKaNx86YhGpnPZFwr5WpgMgh8FM46Lt5FA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iRk0i+MHfQioYiKY4FC2Yg+UiRn8ug6orLTeUj+Yh6cfftz8u5YIhvbVsDSPiomU6
	 RosT+8wwSlqtsWzpbKXXYSegotQo+BOIc0etPVG88fk9ckDA8bHvTNYn3UgOWeKgi2
	 q/qOEwCTEhQLkP6xANCmIdn9QGq0CPkgIDIJp+wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CF0F8030F;
	Thu, 16 Dec 2021 12:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53B10F8016E; Thu, 16 Dec 2021 12:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C1BDF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C1BDF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GiPr1YkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655768; x=1671191768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SEAz8JSicQKaNx86YhGpnPZFwr5WpgMgh8FM46Lt5FA=;
 b=GiPr1YkMj8BrAv12sOgF6izgS/gAg3gGurrwNaQ0WdqlNOSfeGjBfP3G
 DRoJruEwGT2grYii0GkL7Xjbn/hlzJqDuoFSEg130YKsuqvadA4cwlRWy
 vYscN/mvsOICoiuLtLjeHYKwhxyTIaXq2E4RdVcO5MkLnb4GrqGhp+PDw
 vvciI8Sr5Y/7+8Wm+YQz6XXVxjT1ee2jD9oSpkBGnIOHFqOer+3Wfxgc+
 fz6J/Ux8PVzcRsANJzdqVdsazPb9K+JEdLEEjp6BYXK/KOa5b72Fhfx5/
 U80LpXNdyt2lDlu0uL46YUyaKt7oaLQL06+d+74Br4ODyvT41wYNBfHqs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692030"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692030"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248410"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:55:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: Intel: catpt: Dma-transfer fix and couple
Date: Thu, 16 Dec 2021 12:57:38 +0100
Message-Id: <20211216115743.2130622-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
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

Set is made of one fix for dma-transfer so that result of
dmaengine_submit() is tested before moving on, and few cleanups:

- two non-impactful, where catpt_component_open() layout gets improved
  slightly as well as relocation of couple of locals found in
  PCM-functions so that they look more cohesive
- no need to expose catpt-driver board-matching information globally.
  Most fields are not by it and it's the sole user of haswell_machines
  table. By having them locally it is clear what is actually being used

Cezary Rojewski (5):
  ASoC: Intel: catpt: Test dmaengine_submit() result before moving on
  ASoC: Intel: catpt: Reduce size of catpt_component_open()
  ASoC: Intel: catpt: Streamline locals declaration for PCM-functions
  ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH dependency
  ASoC: Intel: Drop legacy HSW/BDW board-match information

 include/sound/soc-acpi-intel-match.h          |  1 -
 sound/soc/intel/Kconfig                       |  2 +-
 sound/soc/intel/catpt/device.c                | 33 +++++++++++++++--
 sound/soc/intel/catpt/dsp.c                   | 14 ++++++-
 sound/soc/intel/catpt/pcm.c                   | 37 +++++++++----------
 .../common/soc-acpi-intel-hsw-bdw-match.c     | 16 --------
 6 files changed, 61 insertions(+), 42 deletions(-)

-- 
2.25.1

