Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A45BD41C
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B9084D;
	Mon, 19 Sep 2022 19:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B9084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609911;
	bh=vD1pc/2OxnyeJnj8kQs4yhBwTv67WRUcJ1Mpirr7VTE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GBLlQuGsn8X0w/q1XIuG5XF8lcWGrrX2ZGvp+/8i0uXFFlYtB1Fk3hzY6dKXS8Vtl
	 uI7FThbRPHHThde9vLmebTITMFq3YMGhYAkhvdHu6AdEAmp7fvSWMrSrbknwEqPpdU
	 lm4WW5fgVnMoh61X0v7A2/snMCfcLZxa+qMMZy38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E391EF804FF;
	Mon, 19 Sep 2022 19:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93C3BF80134; Mon, 19 Sep 2022 19:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C4A7F800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C4A7F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iS+OvKO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609849; x=1695145849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vD1pc/2OxnyeJnj8kQs4yhBwTv67WRUcJ1Mpirr7VTE=;
 b=iS+OvKO1rajia1Vj/xXwtxeFnWnvIygCRhTvbN6M7S+GhvhxcAgwZbXD
 5eYT/ARJ995jjswtjsN++1Bi48vAU053pRjgQPz32ODPpZpznNcEiRauK
 lsDzUU+RlKdowJ8enP7ISbNBggT7qpIlMXyukzIOyX5F9VtGsR/yXjI13
 iBbqco2DW8dTSRUtrUADjkrSGvMRvSHvJ8B51qVHJObSgm0/2hJMJ5CIh
 EDUskmJi41brJyJZIwcTsmwk1euwES/ieOMut9AC6xgd81Yjz84+MqBen
 wclibfPSHKduZsqLp3bvu1P9XUVgheeZRgtrhsYd3E3PhCd1edGXq9X5G w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498621"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498621"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658357"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/11] soundwire: intel: cleanups/fixes before code
 reorganization
Date: Tue, 20 Sep 2022 01:57:10 +0800
Message-Id: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

This is a really big cleanup to introduce well defined helpers, prior to
a larger code reorganization.

Pierre-Louis Bossart (11):
  soundwire: intel: fix error handling on dai registration issues
  soundwire: intel: simplify flow and use devm_ for DAI registration
  soundwire: intel: move DAI registration and debugfs init earlier
  soundwire: intel: move all PDI initialization under
    intel_register_dai()
  soundwire: intel: remove clock_stop parameter in intel_shim_init()
  soundwire: intel: move shim initialization before power up/down
  soundwire: intel: remove intel_init() wrapper
  soundwire: intel: simplify read ops assignment
  soundwire: intel: introduce intel_shim_check_wake() helper
  soundwire: intel: introduce helpers to start bus
  soundwire: intel: add helper to stop bus

 drivers/soundwire/intel.c | 775 +++++++++++++++++++-------------------
 1 file changed, 380 insertions(+), 395 deletions(-)

-- 
2.25.1

