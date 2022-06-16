Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1654D6E2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 03:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8E51AAB;
	Thu, 16 Jun 2022 03:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8E51AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655342367;
	bh=8CRPZ+PI7GsA3Vg8iyD0FuvbPI2TYAjEUNZkKyYokU4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lvsIqmEUDLmWdqCUaQVnijKPDJAyN4LgGjRMgr4pvlcQvKNv37Ntg08XDTL9H2dEg
	 DDQ6mshRUfGewu3d5iMW4jGL8a6fC0AfrVHXbkuITucQbaMM/MUBGs+5WJq2WyaKvb
	 BBc1N5zo5EVLxI5EYJPIqUYh80zpKzlFPB19TQxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F4BF801F7;
	Thu, 16 Jun 2022 03:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2DD9F801F7; Thu, 16 Jun 2022 03:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CC37F800D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 03:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC37F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jXArw7Fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655342301; x=1686878301;
 h=from:to:cc:subject:date:message-id;
 bh=8CRPZ+PI7GsA3Vg8iyD0FuvbPI2TYAjEUNZkKyYokU4=;
 b=jXArw7FgtC9KzWHlh3HSTVBwSMyQqwB9e6sct55tyPokk2hzeIlbLrB2
 e6Tz6tsALe2xR5+4+dvPnPrFKI8F/oj0W8TeK34tVHL/gA7LKqtGU+XSn
 a24ZSkE6MXttfr6xAfReaDPnRNBPFEO0HZ77VVE8QTRtWxOt+okGgvKuf
 ml6sBuRus+Ue8xaOXaX4rJnsiqWHECc44QxNe5G69r2qPBys8uzJfbgGt
 nHo+VMy5gDpY0p6onlf2yNakpWmmROc4+US61dGEAbfLzlhPprvT2dYHb
 F5eeYzmGlPmqDW2DscBGZQ50Pe9yUYGEANcwFDt+53hIhgiJa6aPY2uFG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279195940"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="279195940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="911939275"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/2] ASoC/SoundWire: Intel: add sdw BE dai trigger
Date: Thu, 16 Jun 2022 09:17:56 +0800
Message-Id: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, sanyog.r.kale@intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

For SOF IPC4, we need to set pipeline state in BE DAI trigger.
@Vinod, Could you ack if the soundwire patch looks good to you?
And we can go through the ASoC tree since the change is mainly on ASoC.

v2:
 - Change "#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)" to
   "if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))"

Bard Liao (2):
  soundwire: Intel: add trigger callback
  ASoC: SOF: Intel: add trigger callback into sdw_callback

 drivers/soundwire/intel.c           |  8 ++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 sound/soc/sof/intel/hda-dai.c       | 14 +++++++++++---
 sound/soc/sof/intel/hda.c           |  2 +-
 sound/soc/sof/intel/hda.h           |  1 +
 5 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.17.1

