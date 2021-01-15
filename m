Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB42F72CC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 07:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EECC17C9;
	Fri, 15 Jan 2021 07:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EECC17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610691568;
	bh=OkBy1lc/MYkueswUU/jq4vyloxYC+N6/crhlwYjdukI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q26SooMuNSwpU5SKCQZ932u/bdgP+yqQbIycTgzkvSiXWI7esury/nmzHwVG/53E1
	 vZ5YOYmzIJ9KIZPqSYGjevxOf2rUyBNSDAPOpe76kDwPUFf31nybHU86+revnjoBbt
	 t8KMrOBHhhBOfmPM481A1rL+AShPX2lyCW17yGdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E01DEF80113;
	Fri, 15 Jan 2021 07:17:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65BE1F804C2; Fri, 15 Jan 2021 07:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 321F4F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 321F4F80113
IronPort-SDR: h5qz6mRCKGI4YYngTGtmN8DFc4KEyXSp2qPAFteLD5ZQH0tXMqJWRIdJZb6oo3n87siuImF2oP
 y7GrHSzMl6gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166174461"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="166174461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:55 -0800
IronPort-SDR: EpyIHRxp325nxcKOrFvb0yBL0KutIVSKi2SXM8Sc7BbNi+T1W80XzV3Rh77i9D77feYMtygSbY
 UZV0jnnpmizA==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382551879"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:52 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] soundwire: cadence: reduce timeout on transactions
Date: Fri, 15 Jan 2021 14:16:51 +0800
Message-Id: <20210115061651.9740-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
References: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Currently the timeout for SoundWire individual transactions is 2s.

This is too large in comparison with the enumeration and completion
timeouts used in codec drivers.

A command will typically be handled in less than 100us, so 500ms for
the command completion is more than generous.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 9fa55164354a..f0b0ec173f8b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -188,7 +188,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_PDI_CONFIG_PORT			GENMASK(4, 0)
 
 /* Driver defaults */
-#define CDNS_TX_TIMEOUT				2000
+#define CDNS_TX_TIMEOUT				500
 
 #define CDNS_SCP_RX_FIFOLEVEL			0x2
 
-- 
2.17.1

