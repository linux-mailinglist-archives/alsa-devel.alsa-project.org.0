Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE075BD41E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58F7F100;
	Mon, 19 Sep 2022 19:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58F7F100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609939;
	bh=EviRt9EmxI1oqeLj/2924DDSte2Z0gsI2mryQ9QkDl4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQcdv969ql1vHomhE4H2M/DNM2QN8isEJ1mJOfwGCH825228wkNHDA/btBewfDZek
	 nQgaooC/DZiDJ4pRhCUKNvgqqw/H0q+AruzqeWcWGvCiL88vPatpEsbeEidDA9tyIq
	 oZyNreR+SX8Z9Tbji8VIPjB3+20nj0UWdZTzpeKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E15F80538;
	Mon, 19 Sep 2022 19:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455F3F8053B; Mon, 19 Sep 2022 19:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88BCBF8016D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88BCBF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IhTU19j4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609851; x=1695145851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EviRt9EmxI1oqeLj/2924DDSte2Z0gsI2mryQ9QkDl4=;
 b=IhTU19j4dptk3UK9DLx7lwh0JW/HcyVZqmU5dHjDFcgRJjS5JZ61Jzam
 pIyOW7EUG4U8sJRBsCUYpmoBSJuOWl9K3Fvdr+7Yup5XLKfKcoZUZrbV1
 0sOS5EUL/425e699BzygjKRrYBVpT4BNwZSvd2a6n9CD6SapbT3tae2DN
 Eq0bgtB9LZ4HB/kkhrcpVAH3wCtrzgLsdn2qdreOTZuz913Ydt9NQzHOi
 W+dPVoJniSNp/IM/sRt8XFfBWg/5gGfXOMYLB/N1gHWpof4EbFJdKU//b
 ymQVZHIgDxa6+0nCMMlxwcQ4XCLKyVhCtjr3ykHRwEVTLVvUNnh2Em1h4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498668"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498668"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658384"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 02/11] soundwire: intel: simplify flow and use devm_ for DAI
 registration
Date: Tue, 20 Sep 2022 01:57:12 +0800
Message-Id: <20220919175721.354679-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We already use devm_ for memory allocation but not for component/DAI
registration. The resource management can be based on devm_ in all
cases.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 3bb29bc00d5a..a6fe91f2d964 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1203,8 +1203,8 @@ static int intel_register_dai(struct sdw_intel *sdw)
 	if (ret)
 		return ret;
 
-	return snd_soc_register_component(cdns->dev, &dai_component,
-					  dais, num_dai);
+	return devm_snd_soc_register_component(cdns->dev, &dai_component,
+					       dais, num_dai);
 }
 
 static int sdw_master_read_intel_prop(struct sdw_bus *bus)
@@ -1489,7 +1489,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 
 static void intel_link_remove(struct auxiliary_device *auxdev)
 {
-	struct device *dev = &auxdev->dev;
 	struct sdw_cdns *cdns = auxiliary_get_drvdata(auxdev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
@@ -1502,7 +1501,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(cdns, false);
-		snd_soc_unregister_component(dev);
 	}
 	sdw_bus_master_delete(bus);
 }
-- 
2.25.1

