Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A4D4720C1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 06:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B524F18E3;
	Mon, 13 Dec 2021 06:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B524F18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639374587;
	bh=QWt3UMPpo8RA+EPW34oOnKOis7vUrihJJQTCMKmv368=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=otwUy/RsqSPcSqE/xu2cAdF/W3aBaZFTJE0bIIQaljMdRjq4nP9rAE2EZR7fzVuHT
	 w07GKuvCgYujM6lomkMCLpVLL55f2RX1z0qS3HySEjAqiL84e3TojWga8AIg35u+cp
	 ifULVc9ygjM2tGhmE60TZRn75bpBz2KzpeGdw2IM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB7EBF802E8;
	Mon, 13 Dec 2021 06:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB350F804CB; Mon, 13 Dec 2021 06:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FE98F80229
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 06:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FE98F80229
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237402018"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="237402018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:46:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="517608131"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:46:44 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/7] ASoC/SoundWire: improve suspend flows and use
 set_stream() instead of set_tdm_slots() for HDAudio 
Date: Mon, 13 Dec 2021 13:46:27 +0800
Message-Id: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

This series contains three topics.
1. SoundWire: Intel: remove pdm support
2. ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
3. ASoC/SOF/SoundWire: fix suspend-resume on pause with dynamic pipelines

The topics are independent but the changes are dependent. So please
allow me to send them in one series.

Pierre-Louis Bossart (6):
  ASOC: SOF: Intel: use snd_soc_dai_get_widget()
  ASoC/soundwire: intel: simplify callbacks for params/hw_free
  ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
  ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for
    HDAudio
  soundwire: intel: remove unnecessary init
  soundwire: intel: remove PDM support

Ranjani Sridharan (1):
  soundwire: intel: improve suspend flows

 drivers/soundwire/cadence_master.c  |  36 +---
 drivers/soundwire/cadence_master.h  |  14 +-
 drivers/soundwire/intel.c           | 253 ++++++++++++++--------------
 drivers/soundwire/qcom.c            |   8 +-
 drivers/soundwire/stream.c          |   4 +-
 include/linux/soundwire/sdw_intel.h |   4 +-
 include/sound/soc-dai.h             |  32 ++--
 sound/soc/codecs/hdac_hda.c         |  22 +--
 sound/soc/codecs/max98373-sdw.c     |   2 +-
 sound/soc/codecs/rt1308-sdw.c       |   2 +-
 sound/soc/codecs/rt1316-sdw.c       |   2 +-
 sound/soc/codecs/rt5682-sdw.c       |   2 +-
 sound/soc/codecs/rt700.c            |   2 +-
 sound/soc/codecs/rt711-sdca.c       |   2 +-
 sound/soc/codecs/rt711.c            |   2 +-
 sound/soc/codecs/rt715-sdca.c       |   2 +-
 sound/soc/codecs/rt715.c            |   2 +-
 sound/soc/codecs/sdw-mockup.c       |   2 +-
 sound/soc/codecs/wcd938x.c          |   2 +-
 sound/soc/codecs/wsa881x.c          |   2 +-
 sound/soc/intel/boards/sof_sdw.c    |   6 +-
 sound/soc/intel/skylake/skl-pcm.c   |   7 +-
 sound/soc/qcom/sdm845.c             |   4 +-
 sound/soc/qcom/sm8250.c             |   4 +-
 sound/soc/sof/intel/hda-dai.c       |   7 +-
 sound/soc/sof/intel/hda.c           |  12 +-
 26 files changed, 190 insertions(+), 247 deletions(-)

-- 
2.17.1

