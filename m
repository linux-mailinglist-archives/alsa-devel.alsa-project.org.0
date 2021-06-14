Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12A3A6DFF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC9F168A;
	Mon, 14 Jun 2021 20:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC9F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694224;
	bh=Gmb1eBqABuq8cT3TZSLys9/qbt9JGKL05zguZYjiwLY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O70iP0wqLnwe+lyJJWfsyyH5A+GvvOVAx4AFCGPsdOG5W0Lwp0gVCBGpuAJ/eImAk
	 b+l3lrnUTOefquPKteXtON1SnGaj2OlwSlKgibAIQsCWRVc2Y0x4Q5LBMmUzKXoLsj
	 229DNl9enMgONJ1arLaXZ+NcLH6RNoOCG/tNRfBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB37F804C3;
	Mon, 14 Jun 2021 20:08:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D35CEF802E8; Mon, 14 Jun 2021 20:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3255F8028B
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3255F8028B
IronPort-SDR: Y6yc8zrk/bnxGOIfKL1QzLsnVmKgldZsyOYfmPZ9gns/aFxnQiIaBzBw1IL1tApgqIQTr0ypTd
 +atZQlubMRKA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969566"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:41 -0700
IronPort-SDR: EvpQTFRg023oCYWkjYuwIkhaEc6U0dc8KW6wqo7VqH5bSOZHuLxydtE05O0Y0gb4mM9l3guSo+
 vIac9wJzlH/w==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166401"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 0/5] ASoC/SoundWire: fix race condition on system suspend
Date: Mon, 14 Jun 2021 13:08:10 -0500
Message-Id: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

This patchset fixes a race condition when a SoundWire codec signals an
'Alert' status during a system suspend, which can happen when e.g. a
jack detection event is detected and handled in a workqueue scheduled
after the link is suspended.

When this happens in pm_runtime suspend, we already use
pm_runtime_get_resume() to force the link to remain active, or resume
immediately, but during a system suspend we don't have this option: we
can't prevent the entire system from suspending just because of a jack
detection or codec-specific event.

This patch suggests instead disabling the implementation-defined or
class-defined IRQs at the start of the suspend, along with an
additional flag to protect against an interrupt thread/workqueue being
scheduled after the interrupts are disabled.

One could argue that the SoundWire core could have handled this case,
which is a fair objection. I chose to keep the interrupt handling
codec-specific since not all codecs can actually generate interrupts,
and what they do during these interrupts is also quite custom - see
e.g. the difference between the RT711 and RT711-SDCA versions. In the
latter case the class-defined interrupts are cleared by the codec
driver, not by the core.

This patchset implies changes to both ASoC and SoundWire, with a
minimal dependency on a sdw_update() helper and its _no_pm version,
both of which should have been added a long time ago for
read-modify-write operations.

This race condition was present in all previous kernel versions but
was only identified in late May in automated tests. We added Fixes tag
to help linux-stable backports, but there's no real point in
back-porting to earlier than 5.10 due to other missing dependencies in
the upstream code.

Pierre-Louis Bossart (5):
  soundwire: export sdw_update() and sdw_update_no_pm()
  ASoC: rt700-sdw: fix race condition on system suspend
  ASoC: rt711-sdw: fix race condition on system suspend
  ASoC: rt5682-sdw: fix race condition on system suspend
  ASoC: rt711-sdca-sdw: fix race condition on system suspend

 drivers/soundwire/bus.c           | 17 +++++++++++-
 drivers/soundwire/bus.h           | 13 ---------
 include/linux/soundwire/sdw.h     |  3 ++
 sound/soc/codecs/rt5682-sdw.c     | 38 +++++++++++++++++++++++--
 sound/soc/codecs/rt5682.h         |  2 ++
 sound/soc/codecs/rt700-sdw.c      | 34 +++++++++++++++++++++--
 sound/soc/codecs/rt700.c          |  4 +++
 sound/soc/codecs/rt700.h          |  2 ++
 sound/soc/codecs/rt711-sdca-sdw.c | 46 +++++++++++++++++++++++++++++--
 sound/soc/codecs/rt711-sdca.c     |  4 +++
 sound/soc/codecs/rt711-sdca.h     |  2 ++
 sound/soc/codecs/rt711-sdw.c      | 34 +++++++++++++++++++++--
 sound/soc/codecs/rt711.c          |  4 +++
 sound/soc/codecs/rt711.h          |  2 ++
 14 files changed, 183 insertions(+), 22 deletions(-)


base-commit: bf28c803f2f4b14716df168e98f6ede4ba955866
-- 
2.25.1

