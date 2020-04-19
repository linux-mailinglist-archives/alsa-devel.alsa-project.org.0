Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D11B01CE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 08:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39037167C;
	Mon, 20 Apr 2020 08:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39037167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587365393;
	bh=Rb6BOj/mE5hE3papW8pmEJeYFfn9NkW7r27ac4OoWbc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nu10/MN7WS45AsiICk+VRl/9c4P+7o7XSsCTvcb20G+T2PBCiwm2XoNP6IA8Tat48
	 gAL/zzTGpXNMn+FhuWTh0B4OXh3TOqk1Ewzg5PLFz1XipERE4egf5KO33u1sz50QXa
	 gbUgdvfT0s1YuNbgOuGKXIQklZIWPbTer7wolDps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57977F800E7;
	Mon, 20 Apr 2020 08:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D66F802A0; Mon, 20 Apr 2020 08:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6DAF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 08:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6DAF800E7
IronPort-SDR: 7UQGC29OkJoryrxvkX57JNOQloUzZ1zC0evXVj0Wzs1svKWNauLdJKC82bl85qEb7O5QF7NVfk
 PzC+BCCI6OHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 23:46:22 -0700
IronPort-SDR: 1hIjqnFsmjxCqW/SsUJrW0agOg7YlfuopBvTXfe1eDrX2yGroLKkHinBhEtTHrie5flPqXPBkK
 WLvX6uCu4wlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="254845081"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2020 23:46:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/4] soundwire: bus: reduce verbosity on enumeration
Date: Mon, 20 Apr 2020 02:51:17 +0800
Message-Id: <20200419185117.4233-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419185117.4233-1-yung-chuan.liao@linux.intel.com>
References: <20200419185117.4233-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

No need to repeat the same info log on all enumerations (essentially
each power-up), keep it as debug information.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 488c3c9e4947..f9a078ce76bc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -563,9 +563,9 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	}
 
 	if (!new_device)
-		dev_info(slave->bus->dev,
-			 "Slave already registered, reusing dev_num:%d\n",
-			 slave->dev_num);
+		dev_dbg(slave->bus->dev,
+			"Slave already registered, reusing dev_num:%d\n",
+			slave->dev_num);
 
 	/* Clear the slave->dev_num to transfer message on device 0 */
 	dev_num = slave->dev_num;
-- 
2.17.1

