Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E462527A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D09C51654;
	Fri, 11 Nov 2022 05:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D09C51654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140768;
	bh=RFpURshL9pTlSR+fmXELrO+573EoTkI2OXbk3OCrDsg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EXiG4wcMvXbg5iVzn2rJTGZpnIU7mJa8KPELB/If/cPZcQHOcYJ/JMtmbl9Twdm+4
	 iNhcLiyeqOJrrfZflvrP5DVRdDTOrzkxayjVf6TdSgx3XyyL9Yfssap6C+VDyukKj2
	 0lQ/xIc5uifLgfNPz6y5E82YotrKDzfmQYD543L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C7FF80519;
	Fri, 11 Nov 2022 05:25:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD99F800CC; Fri, 11 Nov 2022 05:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 585FEF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 585FEF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ErqFqeUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140708; x=1699676708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RFpURshL9pTlSR+fmXELrO+573EoTkI2OXbk3OCrDsg=;
 b=ErqFqeUM3lwqsZBgYZULL7CZavaD9BBrX3Op7yiZDVXwcOru/4vMXHKt
 ek1r7xNTTpNvOVLEIcloOnQCAjQs2/pSGl9kkmxIgdwBILLyOJwZCkbpG
 kccMFQ2WlDgMv8/RCXR42YwR16j9kbApxM/DQhyLMMMbkEU4cAgxmYQe7
 TnQOK6/wmK+kOYbdULayiKhY/Na7mj734NLWbw1zEi5aXHYGKGqf6POfl
 mfcJq3lHg9HCs5Hdop4HM9KWig1qYu05EZqPLe1rw90Yde3qaw8b5d39t
 Ym7CkR0VoOX1sUPqTgTnWwmreL3ZdmvB6a1XJVOAb46YCSDfCc0hAns7d A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923691"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440633"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440633"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:02 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/8] ASoC/soundwire: revisit interrupt and lcount handling
Date: Fri, 11 Nov 2022 12:26:45 +0800
Message-Id: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

The code in drivers/soundwire/intel_init.c is hardware-dependent and the
code does not apply to new generations starting with MeteorLake. Refactor
and clean-up the code to make this intel_init.c hardware-agnostic and
move all hardware-dependencies in the SOF driver using chip descriptors.

The ASoC patches are dependent on some patches that are applied to ASoC
tree recently. So, this series won't apply to SoundWire tree. @Vinod Could
you Ack if it looks good to you, and lets go through ASoC tree?

Pierre-Louis Bossart (8):
  soundwire: intel_init: remove useless interrupt enablement in
    interrupt thread
  ASoC: SOF: Intel: hda: add per-chip enable_sdw_irq() callback
  ASoC: SOF: Intel: mtl: factor interrupt enable/disable interrupt
    functions
  ASoC: SOF: Intel: mtl: move SoundWire interrupt enabling to callback
  ASoC: SOF: Intel: hda: add callback to check SoundWire lcount
    information
  soundwire: intel_init: remove sdw_intel_enable_irq()
  soundwire: intel_init: remove check on number of links
  ASoC: SOF: Intel: hda: read multi-link capabilities earlier

 drivers/soundwire/intel_init.c      |  37 --------
 include/linux/soundwire/sdw_intel.h |   2 -
 sound/soc/sof/intel/cnl.c           |   4 +
 sound/soc/sof/intel/hda.c           |  63 ++++++++++++-
 sound/soc/sof/intel/hda.h           |  12 +++
 sound/soc/sof/intel/icl.c           |   2 +
 sound/soc/sof/intel/mtl.c           | 131 +++++++++++-----------------
 sound/soc/sof/intel/shim.h          |   2 +
 sound/soc/sof/intel/tgl.c           |   8 ++
 9 files changed, 139 insertions(+), 122 deletions(-)

-- 
2.25.1

