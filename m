Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9447EA83
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 03:12:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3861888;
	Fri, 24 Dec 2021 03:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3861888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640311936;
	bh=YcGTT1NiJdneR6cPRXjoyXeQB5bPeHDfRr7+OIjpQJ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BYJ1aavbOv+WYRu7KvE91piK0NpNyU85cIS0JKgj3MHZvsDtbHx3S2Icx2QAAYU8m
	 gjAl7rYpmEPczkX9i99jVBhuMzdeWXMtPmz1FkJv9gAjq+6IudaMIONlkHElNUKYRH
	 27+iJKfK7MpZLAnDcydnO4YexuxRuU7/WzI+DLjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC6CF80115;
	Fri, 24 Dec 2021 03:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E98E7F80105; Fri, 24 Dec 2021 03:11:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C632F800AF
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 03:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C632F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CmIEkFEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640311868; x=1671847868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YcGTT1NiJdneR6cPRXjoyXeQB5bPeHDfRr7+OIjpQJ8=;
 b=CmIEkFEsnm1caGUPLa5Jw09lJ4u/bTgFtitLavNg0AUhoQJ9zxtF9/vi
 rzMUhL7ZjZ6sgPa5NPb00T2JtruM2eSnn7/WPYRtBJtV2pJxwCGdqKwmE
 jbuUslm+R58ARUylzz0aEYCH9wk+dzmk4yQRIs3zh0fHgX8sM24XVuBTY
 vx58PDmqKtstuQBhb5soTEZQcqdDN1muL49/+CITTnq+AAFoPCNNVtFn0
 6/Y+WeHKuA/p1qM6zG4r0Jip9fvY8l11PNRUsAz+pCouwVcVbvmCYWzu3
 cKu1KNiATBxbl0GJ9dpyjtyADugpkviShxv7C3RQcfUbCVcvIUtOneI+3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="304284589"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="304284589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:10:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="467156187"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:10:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/7] ASoC/SoundWire: improve suspend flows and use
 set_stream() instead of set_tdm_slots() for HDAudio
Date: Fri, 24 Dec 2021 10:10:27 +0800
Message-Id: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
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

The code is basically not changed, so I still take Vinod Koul's Ack.

v2:
- ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire: rename
  .set_sdw_stream to .set_stream and .get_sdw_stream to .get_stream
  in intel_pdm_dai_ops.

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

