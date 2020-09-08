Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7F262490
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B266916F9;
	Wed,  9 Sep 2020 03:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B266916F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615663;
	bh=miRTPMFCUHkz0oFe6rWqBJ1hQ304vUpA5ZKJWG9tHdU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qKy5fD7iqRHAnuQjxeq+q6ZN5DzE87/r5p+clVw+lKRuy4yPEwlT84+zXcB1udE2j
	 P+aDqn4kwiIADDDATxEtZ08zOva5rA8XztLYWqjIOWJT8tFXw7f8qm58Evjos91gCQ
	 P8BzTGEJIg/BWxOci7wsym430JJ7m3aM2gR2nzjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0467F80274;
	Wed,  9 Sep 2020 03:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13C1F80256; Wed,  9 Sep 2020 03:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E60DAF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60DAF800FD
IronPort-SDR: xj/wncGRehwcGBqYMpF5yQs6ULSXLb/6mjd7j9P2ovm9f7s8OQBFFT9bqhxXmAn1f2uSN9PeKL
 lOCatTRPISpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458448"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458448"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:05 -0700
IronPort-SDR: fzCmra/vckW9qethiegEd1+Mr9kpTpU4a9eY9jld6IgqwdkseVuRaE69ErhOmkdKXSH4PSUwmy
 tzJUHUh8xVkQ==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018077"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/7] ASoC/soundwire: filter out invalid PARITY errors
Date: Tue,  8 Sep 2020 21:45:14 +0800
Message-Id: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Some codecs may report fake PARITY errors in the initial state. This
series will filter them out.

Pierre-Louis Bossart (7):
  ASoC/soundwire: bus: use property to set interrupt masks
  soundwire: bus: filter-out unwanted interrupt reports
  soundwire: slave: add first_interrupt_done status
  soundwire: bus: use quirk to filter out invalid parity errors
  ASoC: codecs: realtek-soundwire: ignore initial PARITY errors
  soundwire: bus: export broadcast read/write capability for tests
  soundwire: cadence: add parity error injection through debugfs

 drivers/soundwire/bus.c            | 93 ++++++++++++++++++++++++------
 drivers/soundwire/bus.h            |  4 ++
 drivers/soundwire/cadence_master.c | 86 +++++++++++++++++++++++++++
 drivers/soundwire/slave.c          |  1 +
 include/linux/soundwire/sdw.h      |  9 +++
 sound/soc/codecs/max98373-sdw.c    |  3 +
 sound/soc/codecs/rt1308-sdw.c      |  3 +
 sound/soc/codecs/rt5682-sdw.c      |  5 ++
 sound/soc/codecs/rt700-sdw.c       |  5 ++
 sound/soc/codecs/rt711-sdw.c       |  5 ++
 sound/soc/codecs/rt715-sdw.c       |  5 ++
 sound/soc/codecs/wsa881x.c         |  1 +
 12 files changed, 202 insertions(+), 18 deletions(-)

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
2.17.1

