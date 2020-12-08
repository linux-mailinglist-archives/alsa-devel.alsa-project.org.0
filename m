Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F752D29A6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 12:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C907116F1;
	Tue,  8 Dec 2020 12:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C907116F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607426400;
	bh=rO+QLJRkV22knfjSFglIp6JOvjxIw3VtbD9Lw/2eToQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ArwZajNS0I76z8FgMcc+sIqSkwV36Kjm1BR8Jxz7wVIcrA0R4rWkPF2d+CQMw9wwm
	 RhzkEckBSBsQxidXvncAorlENPPJaVE2w3TD59PRhEmu07yej0waxhCbrK71TJzvEU
	 vPGhnbcxft8FcQb6qIjvokrbW8OZWPBI4QggvDMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9EDF80218;
	Tue,  8 Dec 2020 12:18:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1FE9F8019D; Tue,  8 Dec 2020 12:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99D9F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 12:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99D9F800E1
IronPort-SDR: yqu/OC90wGkLRo5+ysGERg8Goi23cYinMUnn6HcUTq/tqryKEzyg+sVOUzcNi2Bs9/bFyzG+0Z
 2VaLH233iPGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235471855"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="235471855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 03:18:10 -0800
IronPort-SDR: 5y9Jp2lZl86HZjU+DbIzCURa4pNEkx/0dmWZWkPw9AMAUeQAE2bWhO02VWwdlz/HmtxXqLlRng
 dWUXuZ9HE6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="552191409"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 08 Dec 2020 03:18:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 697901C8; Tue,  8 Dec 2020 13:18:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: sprd: Switch to use list_entry_is_head() helper
Date: Tue,  8 Dec 2020 13:18:05 +0200
Message-Id: <20201208111805.6989-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Since we got list_entry_is_head() helper in the generic header,
we may switch driver to use it. This eliminates the need
in additional variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/sprd/sprd-mcdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index f439e5503a3c..34b2ce733b54 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -866,23 +866,23 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_disable);
 struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
 					      enum sprd_mcdt_channel_type type)
 {
-	struct sprd_mcdt_chan *temp, *chan = NULL;
+	struct sprd_mcdt_chan *temp;
 
 	mutex_lock(&sprd_mcdt_list_mutex);
 
 	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
 		if (temp->type == type && temp->id == channel) {
-			chan = temp;
+			list_del_init(&temp->list);
 			break;
 		}
 	}
 
-	if (chan)
-		list_del(&chan->list);
+	if (list_entry_is_head(temp, &sprd_mcdt_chan_list, list))
+		temp = NULL;
 
 	mutex_unlock(&sprd_mcdt_list_mutex);
 
-	return chan;
+	return temp;
 }
 EXPORT_SYMBOL_GPL(sprd_mcdt_request_chan);
 
-- 
2.29.2

