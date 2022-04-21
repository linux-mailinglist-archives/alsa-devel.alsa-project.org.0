Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781A50A9FD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C89C716C1;
	Thu, 21 Apr 2022 22:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C89C716C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573199;
	bh=9gbFp7YqS6U4w5G6NS5b3ACyfZZAiZl46WoFKaQwe2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r8u3Hotgbz4FMg0Bla0yQ3ILZy9kVHSXVcrZ+vTRDyRTfgOj2D1meQIepcoWu9eN3
	 3mpBiFz9uW4Z2cKc9jeFB3WX/8Y7/3f6pnhhlCls2rEx8qpNy1VsYo0OzGeegTENZt
	 9jRYmY8/xR7oIuS+6ID42RjXaiAGyGSi6BE1fpmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52180F8047D;
	Thu, 21 Apr 2022 22:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F4EBF8032D; Thu, 21 Apr 2022 22:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6060EF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6060EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BOy7n4Xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573135; x=1682109135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gbFp7YqS6U4w5G6NS5b3ACyfZZAiZl46WoFKaQwe2s=;
 b=BOy7n4XbcMhciWV3ekHaG7FiYc1R/fUHXA7ms6YaXHlee7s4ydpnvm+e
 mQyI8ZeStER3G3zsA1eUFqkYmDWx0izeEFYEVH2gRu6S635oobaE5Hdxn
 u7TSigVe4j7sgY5MnCzl5SuCDK5ZwvFRYNKZri84Z4RpURC1Hxl0jmLW+
 BTWmTWQdRElmZHs/WNH/lV/PynFs6zPUIj2SPrqTANRGkZ5O5b/e6SPNw
 GR7OEP0uzxMLLp87HXLtRI4TglYG+dT+xxMK7m3N/6+EnhgKjs3NE9+8E
 LUvsz6UCClAki9iwpD4NfMFMF+wBBudD1BiQJZE/Hc6SORMhLczriaOPS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047591"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455745"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/14] ASoC: SOF: Intel: improve HDaudio DAI support
Date: Thu, 21 Apr 2022 15:31:47 -0500
Message-Id: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

The SOF CI and daily tests exposed a number of issues with corner
cases on platforms using the HDaudio DAI, such as UpExtreme boards or
usual HDaudio+DMIC laptops.

This patchset provides improvements for pause_push/pause_release,
suspend-resume, mixing use cases and combinations of all three.

The initial patches provide a cleanup, the last patches improve the
state machine and DMA handling.

Pierre-Louis Bossart (12):
  ASOC: SOF: Intel: hda-dai: consistent naming for HDA DAI and HDA link
    DMA
  ASoC: SOF: Intel: hda-dai: simplify hda_dai_widget_update() prototype
  ASoC: SOF: Intel: hda-dai: use snd_soc_dai_get_widget() helper
  ASoC: SOF: Intel: hda-dai: split link DMA and dai operations
  ASoC: SOF: Intel: hda-dai: regroup dai and link DMA operations
  ASoC: SOF: sof-audio: flag errors on pipeline teardown
  ASOC: SOF: Intel: hda-dai: add hda_dai_hw_free_ipc() helper
  ASoC: SOF: Intel: hda-dai: move code to deal with hda dai/dailink
    suspend
  ASoC: SOF: Intel: hda-dai: improve suspend case
  ASoC: SOF: Intel: hda-dai: reset dma_data and release stream
  ASoC: SOF: Intel: add helper for link DMA cleanups
  ASoC: SOF: Intel: hda-dai: protect hw_params against successive calls

Ranjani Sridharan (2):
  ASoC: SOF: remove incorrect clearing of prepared flag
  ASoC: SOF: Intel: Add IPC-specific dai ops for IPC3

 sound/soc/sof/intel/apl.c     |   3 +
 sound/soc/sof/intel/cnl.c     |   3 +
 sound/soc/sof/intel/hda-dai.c | 434 ++++++++++++++++++++++------------
 sound/soc/sof/intel/hda-dsp.c |  42 +---
 sound/soc/sof/intel/hda.h     |   3 +
 sound/soc/sof/intel/icl.c     |   3 +
 sound/soc/sof/intel/tgl.c     |   3 +
 sound/soc/sof/ipc3-topology.c |  12 +
 sound/soc/sof/pm.c            |   2 +-
 sound/soc/sof/sof-audio.c     |  36 ---
 sound/soc/sof/sof-audio.h     |   1 -
 11 files changed, 312 insertions(+), 230 deletions(-)

-- 
2.30.2

