Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74339E97A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DB51699;
	Tue,  8 Jun 2021 00:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DB51699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104685;
	bh=AxTUPvaKwld9cy4hwu0+BuV2TZ+ozW4sU96IfMzP6BE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=njK11CGBCXsVwCLW2UjrhXbrO95KGFQ0yRi5HQXTTpKiIZF166b52/VzfIxNXlWVa
	 v/TLZGv/yTHr5E9/o4BRJDW9H9paalWy/Erp6PLwuVr8kPQyaHWQk2Z8s40Z1TQka4
	 4STF3TJlONBL8f4CNbJwnmaewuM55Ia30j56yuUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52674F804C1;
	Tue,  8 Jun 2021 00:23:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E78FF800DF; Tue,  8 Jun 2021 00:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D95FF800DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D95FF800DF
IronPort-SDR: LV3zqBFygX2MOR0+hD/PxgqPNpVGonSUhgCK9KyCKS4aCv4wFGfbItp5HOGWyWSnC2lePnPeDL
 x1QBs8IfXpeQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202867350"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="202867350"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:01 -0700
IronPort-SDR: YXPBqT+531tLr4DxcCarfTUtNUMFTpFAGjZM7eoPUxkhpOXEByyyvDVrziXUJMwyOaHpu0uzE4
 Cg129BiUH8AQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449270940"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/15] ASoC: fixes for SoundWire codec drivers
Date: Mon,  7 Jun 2021 17:22:24 -0500
Message-Id: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

The SOF CI exposed a set of issues with suspend/resume, error
handling, register access and mixer values.

These fixes were indentified with a tag so that they can be applied by
linux-stable and distributions. Thanks to the Realtek and Maxim teams
for their help.

Bard Liao (3):
  ASoC: rt5682-sdw: set regcache_cache_only false before reading
    RT5682_DEVICE_ID
  ASoC: rt711-sdca-sdw: add readable for SDW_SDCA_CTL() registers
  ASoC: rt711-sdca: handle mbq_regmap in rt711_sdca_io_init

Jack Yu (1):
  ASoC: rt715-sdca: fix clock stop prepare timeout issue

Oder Chiou (1):
  ASoC: rt5682: Fix a problem with error handling in the io init
    function of the soundwire

Pierre-Louis Bossart (10):
  ASoC: max98373-sdw: add missing memory allocation check
  ASoC: max98373-sdw: use first_hw_init flag on resume
  ASoC: rt1308-sdw: use first_hw_init flag on resume
  ASoC: rt1316-sdw: use first_hw_init flag on resume
  ASoC: rt5682-sdw: use first_hw_init flag on resume
  ASoC: rt700-sdw: use first_hw_init flag on resume
  ASoC: rt711-sdca-sdw: use first_hw_init flag on resume
  ASoC: rt711-sdw: use first_hw_init flag on resume
  ASoC: rt715-sdca-sdw: use first_hw_init flag on resume
  ASoC: rt715-sdw: use first_hw_init flag on resume

 sound/soc/codecs/max98373-sdw.c   | 14 ++++++++------
 sound/soc/codecs/max98373.h       |  2 +-
 sound/soc/codecs/rt1308-sdw.c     |  2 +-
 sound/soc/codecs/rt1316-sdw.c     |  2 +-
 sound/soc/codecs/rt5682-sdw.c     | 19 +++++++++++--------
 sound/soc/codecs/rt700-sdw.c      |  2 +-
 sound/soc/codecs/rt711-sdca-sdw.c | 12 +++++++++++-
 sound/soc/codecs/rt711-sdca.c     |  4 ++++
 sound/soc/codecs/rt711-sdw.c      |  2 +-
 sound/soc/codecs/rt715-sdca-sdw.c |  3 ++-
 sound/soc/codecs/rt715-sdca-sdw.h |  1 +
 sound/soc/codecs/rt715-sdca.c     |  9 ++++++---
 sound/soc/codecs/rt715-sdca.h     |  3 ++-
 sound/soc/codecs/rt715-sdw.c      |  2 +-
 14 files changed, 51 insertions(+), 26 deletions(-)

-- 
2.25.1

