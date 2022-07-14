Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A6A5740D5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 03:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B73174E;
	Thu, 14 Jul 2022 03:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B73174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657761119;
	bh=L+WCKv2qelzFb6SQcNhBxVlX9xUhE7ThSQkIyIWZPRM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PceiKgO2Y/CtJ254D6Y1q8WAaLRgCG9a55yKmkio2LU+Sw/UiVLtKt9LR7aLnLCS+
	 e/P4yJ1r3/9NeTn/3EEl/f1d45AYJAnmvuIq1W+9yuPLOAUqc98UOXEzt/1dBxPkFA
	 9/pGwmJdjBB903ClcRhy8Ox9x9RFbFxeccDx4vmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 839ADF80310;
	Thu, 14 Jul 2022 03:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC808F80249; Thu, 14 Jul 2022 03:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_126,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78211F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 03:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78211F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YbnlPPTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657761055; x=1689297055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L+WCKv2qelzFb6SQcNhBxVlX9xUhE7ThSQkIyIWZPRM=;
 b=YbnlPPTgv3vwvY9z8J9Ln8NdcC4KbaZeRBfwvzW8FrQlM5/+vhnXCMzJ
 36HvOkla2GEWTqB68ZxqlMms9SaXNzA1Sqf0vlMLhq2IBd5cg2v6rOG6W
 2AAhznS/nk/NUP6txX02eLgpC0R6Sl3BW0Ca5K+CXNG/L+R8QFKg2Cj17
 O4JmJJgsjcmaF9xMsAyYD4hDO/GnkRCp1l2wSwruC5OqUrXAQj8AwqRn+
 QMdxtIbu9x7TqL9TH5H65KHqAr8rRKt83OsQRnlwaRZhRqVHrkTFdGC+i
 1gjP4T2ZcehrKKxDFDdbAB0aiXZiNliJC6K73h+RIeWsARNzh8VQVhCfu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347066122"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347066122"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593192503"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/4] ASoC/soundwire: log actual PING status on resume issues
Date: Thu, 14 Jul 2022 09:10:39 +0800
Message-Id: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

we've been stuck with problems in the dual-amplifier configurations where
one of the two devices seems to become UNATTACHED and never regains sync,
see https://github.com/thesofproject/linux/issues/3638.

This is a rather infrequent issue that may happen once or twice per month,
but still it remains a concern.

One possibility is that the device does lose sync but somehow our hardware
detection fails to see it resync.

This series just adds a basic read directly from the PING frames to help
confirm if yes/no the device regain sync.

The change is mainly on soundwire. @Mark, Could you ack the ASoC patch
if it looks good to you?

Pierre-Louis Bossart (4):
  soundwire: add read_ping_status helper definition in manager ops
  soundwire: intel/cadence: expose PING status in manager ops
  soundwire: add sdw_show_ping_status() helper
  ASoC: codecs: show PING status on resume failures

 drivers/soundwire/bus.c            | 32 ++++++++++++++++++++++++++++++
 drivers/soundwire/cadence_master.c |  8 ++++++++
 drivers/soundwire/cadence_master.h |  2 ++
 drivers/soundwire/intel.c          |  1 +
 include/linux/soundwire/sdw.h      |  5 +++++
 sound/soc/codecs/max98373-sdw.c    |  2 ++
 sound/soc/codecs/rt1308-sdw.c      |  2 ++
 sound/soc/codecs/rt1316-sdw.c      |  2 ++
 sound/soc/codecs/rt5682-sdw.c      |  2 ++
 sound/soc/codecs/rt700-sdw.c       |  2 ++
 sound/soc/codecs/rt711-sdca-sdw.c  |  2 ++
 sound/soc/codecs/rt715-sdca-sdw.c  |  2 ++
 sound/soc/codecs/rt715-sdw.c       |  2 ++
 13 files changed, 64 insertions(+)

-- 
2.25.1

