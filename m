Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5EE673265
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 08:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6508B569A;
	Thu, 19 Jan 2023 08:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6508B569A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674113113;
	bh=FoI5xBiRDitd9OHdi7JRneCz/iRwjpZBUD404jd4Zsg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OhKJiSdD3M6fKPpnACxdXwyuQDTWZMRxlPXM9Dr54ggwMoQ1kisgzwsug9xJLmPlt
	 Bfpuen/IM++/466OXhZb9iaE22y/9us9e5u7/Ogr6+WNZnabYU2RtZDPrW31SbWJh9
	 Arn2mPKQF+dU5uGfZNkCgI90o+NheD10uGecq+q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF30F80083;
	Thu, 19 Jan 2023 08:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519A4F804FE; Thu, 19 Jan 2023 08:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2374DF804DE
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2374DF804DE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ESzZsMZh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674113027; x=1705649027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoI5xBiRDitd9OHdi7JRneCz/iRwjpZBUD404jd4Zsg=;
 b=ESzZsMZhZ5x9GtZExrruTBThgDgGfz9B0G/5IpeI3gblEf1R2OaFylG4
 6Yt3TpsmpdLFNxYML5QnYcMNRcfkhGzRGGFLfpPnWarzog7Sn9eL1wjEP
 H3otQZRUYdL6PlgMmztv82UMQDr51dGAe7eoNf3cMIgnkQ5rPj7j7jhAf
 /IbMF/cdLr/XLDo5lqAYwyqbFfVxkMuAn6pVSja0zhrwH5Ht0WJvO/oX4
 81LrnraY7uCSsfS8Sa/tEWc173fNkp31aLYd6YDhlPovKuMJn+TAZn920
 hx19BFr6j4bbeWjBP9BRXG4Hv1W6x1bqwUJntPd7k0G2jklUx39mnJvD7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322902665"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="322902665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="662028008"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="662028008"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:38 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/4] soundwire: stream: use consistent pattern for freeing
 buffers
Date: Thu, 19 Jan 2023 15:32:08 +0800
Message-Id: <20230119073211.85979-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119073211.85979-1-yung-chuan.liao@linux.intel.com>
References: <20230119073211.85979-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The code should free the message buffer used for data, the message
structure used for control and assign the latter to NULL. The last
part is missing for multi-link cases, and the order is inconsistent
for single-link cases.

Link: https://github.com/thesofproject/linux/issues/4056
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index df3b36670df4..9c13dbd2b26e 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -723,8 +723,8 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	}
 
 	if (!multi_link) {
-		kfree(wr_msg);
 		kfree(wbuf);
+		kfree(wr_msg);
 		bus->defer_msg.msg = NULL;
 		bus->params.curr_bank = !bus->params.curr_bank;
 		bus->params.next_bank = !bus->params.next_bank;
@@ -769,6 +769,7 @@ static int sdw_ml_sync_bank_switch(struct sdw_bus *bus)
 	if (bus->defer_msg.msg) {
 		kfree(bus->defer_msg.msg->buf);
 		kfree(bus->defer_msg.msg);
+		bus->defer_msg.msg = NULL;
 	}
 
 	return 0;
@@ -867,6 +868,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		if (bus->defer_msg.msg) {
 			kfree(bus->defer_msg.msg->buf);
 			kfree(bus->defer_msg.msg);
+			bus->defer_msg.msg = NULL;
 		}
 	}
 
-- 
2.25.1

