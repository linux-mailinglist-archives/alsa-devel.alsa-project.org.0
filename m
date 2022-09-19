Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E85BD430
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1AC161F;
	Mon, 19 Sep 2022 19:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1AC161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610063;
	bh=OKogfO4K6IMOMgoifEN6M6CT/AXHoyqz1X/Mml5qstY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ax5810tHDnCXbPBMGNC2yUDu51CRkKYoqUL9X0hMWwBobdyStxxX6LygTsv7Au8Mq
	 qg+IuGp40gzmhVWbt3TzlcmI7N/Klvx5obM8uHxJdWh6e6SnfCW1HUbBcKlvjOGT0R
	 AT+IBfAM6mlh1gLyJqDl/zwXs8gp8t1/qMvTTRfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBECEF8057A;
	Mon, 19 Sep 2022 19:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484A7F8053C; Mon, 19 Sep 2022 19:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A499F8016D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A499F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cVdiTvrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609857; x=1695145857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKogfO4K6IMOMgoifEN6M6CT/AXHoyqz1X/Mml5qstY=;
 b=cVdiTvrdBJX1p4TKhTzohPx6iy5TrWrVfNPJUTsXquekR/h/OgN2BS/t
 /kkDWTJuSvgVVkG1RjAH26B0P2I4QagULSH9cbl2Ll4D2UPANIbGg36V8
 GPvXS7SAVEjVRbd+SyEeIKd4ItcqBxVC5KVRzCJ8/ZpnIEB2VEIpKQ0Kh
 04uKhFbcQhdMptaeLr039kylQ0d+y6oEHCcitHXKm62haefDH5XP+fnzd
 4uHrDqB22hCqfsFf4tXTnpRJAqJU7EzY2BI7Upf0m15bcds5vuEK7KlTd
 Cq4svmes+ZBQ5GbRGm6ZOz4zf5K208X7nOPaG7Aivsu9APeFhszKcEiEe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498781"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498781"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658499"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 08/11] soundwire: intel: simplify read ops assignment
Date: Tue, 20 Sep 2022 01:57:18 +0800
Message-Id: <20220919175721.354679-9-yung-chuan.liao@linux.intel.com>
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

We can assign the right callback directly in the ops structure. No
functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 4eeb2b5c1594..66aab02b9323 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1261,7 +1261,7 @@ static int intel_prop_read(struct sdw_bus *bus)
 }
 
 static struct sdw_master_ops sdw_intel_ops = {
-	.read_prop = sdw_master_read_prop,
+	.read_prop = intel_prop_read,
 	.override_adr = sdw_dmi_override_adr,
 	.xfer_msg = cdns_xfer_msg,
 	.xfer_msg_defer = cdns_xfer_msg_defer,
@@ -1304,8 +1304,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 
 	sdw_cdns_probe(cdns);
 
-	/* Set property read ops */
-	sdw_intel_ops.read_prop = intel_prop_read;
+	/* Set ops */
 	bus->ops = &sdw_intel_ops;
 
 	/* set driver data, accessed by snd_soc_dai_get_drvdata() */
-- 
2.25.1

