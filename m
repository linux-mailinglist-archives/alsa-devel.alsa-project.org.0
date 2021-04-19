Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A92363914
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 03:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37DD4167F;
	Mon, 19 Apr 2021 03:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37DD4167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618795577;
	bh=crAOd1tuh4eHWMvSzm3ChPQS6WWLMsavZ5zgnYuoJqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gA0qJNB2jP/MMoj3p4+c2UpO255UB2CpMOVU4Xh4INK1iUTGadp4/V7LOYJoLofVc
	 NGKSB/njNx9EVo060/+d66Bs/7ra8AItNRHYXyZD65XbjRPOiB/FzYXknM9ZMB07lr
	 I+XEownO3zoP0DGypZyHX/BnIcZFtlv3XCSwpsZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DFDF800C5;
	Mon, 19 Apr 2021 03:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24384F80227; Mon, 19 Apr 2021 03:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCD36F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 03:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD36F800C5
IronPort-SDR: cE/h+zioaPOq3ONVS6hyroKsfpLTUzKV6kCkAeEtBNxK5X/umkhWT3uwtwkLcR8Ny9PgEWixtx
 jXdTQpyBQIIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="182747359"
X-IronPort-AV: E=Sophos;i="5.82,232,1613462400"; d="scan'208";a="182747359"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 18:24:28 -0700
IronPort-SDR: zB/Gagp5+vixnmVexCEddJptQ4LNqKi06Wb/CmF74jKQVkFJTk8r4f8SdmVaE3Y4rrQLBmKLEL
 sZ938XkLMQlw==
X-IronPort-AV: E=Sophos;i="5.82,232,1613462400"; d="scan'208";a="426320687"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 18:24:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: dmi-quirks: remove duplicate initialization
Date: Mon, 19 Apr 2021 09:24:17 +0800
Message-Id: <20210419012417.29366-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck warning:

drivers/soundwire/dmi-quirks.c:85:12: style: Redundant initialization
for 'map'. The initialized value is overwritten before it is
read. [redundantInitialization]
  for (map = dmi_id->driver_data; map->adr; map++) {
           ^
drivers/soundwire/dmi-quirks.c:83:25: note: map is initialized
  struct adr_remap *map = dmi_id->driver_data;
                        ^
drivers/soundwire/dmi-quirks.c:85:12: note: map is overwritten
  for (map = dmi_id->driver_data; map->adr; map++) {
           ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 82061c1d9835..5db0a2443a1d 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -80,7 +80,7 @@ u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
 	/* check if any address remap quirk applies */
 	dmi_id = dmi_first_match(adr_remap_quirk_table);
 	if (dmi_id) {
-		struct adr_remap *map = dmi_id->driver_data;
+		struct adr_remap *map;
 
 		for (map = dmi_id->driver_data; map->adr; map++) {
 			if (map->adr == addr) {
-- 
2.17.1

