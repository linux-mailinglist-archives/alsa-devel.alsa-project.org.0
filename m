Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D794D60553C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 03:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A10293CB;
	Thu, 20 Oct 2022 03:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A10293CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666230848;
	bh=hfWjYaVPC1jR2bOcPd6wO2+FVIEpJFXHmpCSZH0ayOk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sHkK9dvO06IgzofcjomCLcxprsv2s8I9vuuhnffKTirp+bfKrdLTtjBFv27LSut2U
	 rlnYo32Ezt5SJ6nTsIdVsXyxanfUO6VJHSPV7OTBW1e/lDEvpC/rwAxpMLeHxWj4u+
	 fL+eHsPvgJ3vfg5EWVor/G5gOxyZ9pFKiv3hdevA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94CB4F804E5;
	Thu, 20 Oct 2022 03:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34469F804D8; Thu, 20 Oct 2022 03:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE6AF80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 03:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE6AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ahupwzKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666230786; x=1697766786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hfWjYaVPC1jR2bOcPd6wO2+FVIEpJFXHmpCSZH0ayOk=;
 b=ahupwzKnyoQoQ3e9G9G4StATOlHKCp0Hqy7TE5DXZuPcy0evBKpEN2pp
 C7NoszeXwHXEC4/xGk8eL+0Woogwc7lxw//C9qnnZAYY+1jLOvAUucgBh
 2f6ni/qxdne0rEt97qp8XzyRDLBRjJZcyoH7AoLAR3Vi5KEsZaSGq1Cn9
 bK7kx9Bg/gS1ZsCWpH7XRuHbO7i0n948SSp0sr053ptPVKAi6wcm3qo6U
 NO/QprVPEA4P2JWsUyML6+jfFYAbwY6moAe/lZQ1TfrVyd7DfH3p4aKzx
 X37GjXWA0oOTpyGXV1Mthx4O2TYk6lK+yIB0jBBVQO3833C9UXjnwNxcX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306569692"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306569692"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 18:52:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="662755519"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="662755519"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 18:52:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel: Initialize clock stop timeout
Date: Thu, 20 Oct 2022 09:56:24 +0800
Message-Id: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org,
 vinod.koul@linaro.org, bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Sjoerd Simons <sjoerd@collabora.com>

The bus->clk_stop_timeout member is only initialized to a non-zero value
during the codec driver probe. This can lead to corner cases where this
value remains pegged at zero when the bus suspends, which results in an
endless loop in sdw_bus_wait_for_clk_prep_deprep().

Corner cases include configurations with no codecs described in the
firmware, or delays in probing codec drivers.

Initializing the default timeout to the smallest non-zero value avoid this
problem and allows for the existing logic to be preserved: the
bus->clk_stop_timeout is set as the maximum required by all codecs
connected on the bus.

Fixes: 1f2dcf3a154ac ("soundwire: intel: set dev_num_ida_min")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 25ec9c272239..78d35bb4852c 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1311,6 +1311,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 
 	bus->link_id = auxdev->id;
 	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
+	bus->clk_stop_timeout = 1;
 
 	sdw_cdns_probe(cdns);
 
-- 
2.25.1

