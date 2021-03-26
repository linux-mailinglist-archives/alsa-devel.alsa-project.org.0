Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944834A418
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:18:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA602167F;
	Fri, 26 Mar 2021 10:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA602167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750319;
	bh=8NeefyPLvJozkbcel+qIiELQLvF+DNBknPvBc8JuRwg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tfSqu2XcrMHVWtCZWCJ6RUqc+MteimnOL6FCjJ6R2uCiT2yhNQvj8c5m93fIk5LXo
	 oiyjrS+yQcOXpK/1x5udZOToZZ17+8zHe0YALUum3YzdZy2Gx7DGLtqNs96jsqkjR/
	 60LUQZ0vkY/6qX++tgo3GDENGtjVp4aq3/ZeD3G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD54F804A9;
	Fri, 26 Mar 2021 10:15:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D335F80425; Fri, 26 Mar 2021 10:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1C24F800D0
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C24F800D0
IronPort-SDR: yPYNbcno4gj8/g+WV2rqnmaWv6bHXzLi220Xe8mV9msNZB9CDtQOyqj88SPYYlpVOeIPQWclS6
 Eyb3caBgA46Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249447"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:45 -0700
IronPort-SDR: BM7P2qVsTK3k8rjkY3hLNWP257rLEXow3+M+Vzg/KYblPgGvxbwaWxmgVMZUGV55g2Yp192Sv7
 R3OeeSGs1Dqw==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463192"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 06/11] soundwire: bus: remove useless initialization
Date: Fri, 26 Mar 2021 17:15:09 +0800
Message-Id: <20210326091514.20751-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Cppcheck complains about a possible null pointer dereference, but it's
more like there is an unnecessary initialization before walking
through a list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a38b017f7a54..1a9e307e6a4c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -593,7 +593,7 @@ EXPORT_SYMBOL(sdw_write);
 /* called with bus_lock held */
 static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 {
-	struct sdw_slave *slave = NULL;
+	struct sdw_slave *slave;
 
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (slave->dev_num == i)
-- 
2.17.1

