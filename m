Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4755BD420
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C48285D;
	Mon, 19 Sep 2022 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C48285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609956;
	bh=kR8qyX1wDq4ckI2iLTSjTnUv5thwS03UGveFT81cs5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3ejAW8VsH/qXOAHsiD8hAwrt0gMbcBodEcwHKFCPMR+aJuuMzGCWK/gGQI0Hh+Ix
	 zLfD0igzsWLYpocFv/Y50BZJlNdG7WBDuCw7dkVlVLp+ef/73tjM4Rm6mmq9KiQFF2
	 o9IsEFPxp2p7ZOAwm2dueHHte/S0hRUKkuDxdpD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86955F8054A;
	Mon, 19 Sep 2022 19:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F728F8053C; Mon, 19 Sep 2022 19:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA82AF8023A
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA82AF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hJrktLo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609852; x=1695145852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kR8qyX1wDq4ckI2iLTSjTnUv5thwS03UGveFT81cs5I=;
 b=hJrktLo8zpKuAttPuNpBoKs7EOEpcbNpxofeI/nl0n2sRolAMh+7DGys
 qvLI5YlYeYeA1oN2fV/eZrC+SEflZvO8EhaaUUTm4ufuLN4DvEPOhORo+
 11Lgi5z/V7kaBltud/LRXEYMZhSkFzAI7OP33jKATska3yVJQoZi/TMnr
 zctzztkTQVwHXexiJkBYWD4KToqMsEHhYMvP7Abn4bgvG4rtHk5o6eyyj
 2bXvf40KvxWLidNUOUZwpmW9v0vTouxTdlW+RkPpi2nC++a7gMAqtQQhE
 MnjvhlfzfbHGsCzIgK/QwcSdnUjPt3O55QrvACJsb9E+TuqmGLNf94s+z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498646"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658371"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 01/11] soundwire: intel: fix error handling on dai
 registration issues
Date: Tue, 20 Sep 2022 01:57:11 +0800
Message-Id: <20220919175721.354679-2-yung-chuan.liao@linux.intel.com>
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

The call to intel_register_dai() may fail because of memory allocation
issues or problems reported by the ASoC core. In all cases, when a
error is thrown the component is not registered, it's invalid to
unregister it.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 01be62fa6c83..3bb29bc00d5a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1432,7 +1432,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	ret = intel_register_dai(sdw);
 	if (ret) {
 		dev_err(dev, "DAI registration failed: %d\n", ret);
-		snd_soc_unregister_component(dev);
 		goto err_interrupt;
 	}
 
-- 
2.25.1

