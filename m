Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE8B256051
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 20:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD15C18CB;
	Fri, 28 Aug 2020 20:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD15C18CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598638507;
	bh=jxjeNC0L6dsMcwkB9W9BkkGzbsVq25srNSCFjfPo4ks=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Df6l19NK61Fvn44hpIWzr80ENix1Pi3/f7F6/9thLDEpAB6dIURCDYSzxBu6Gent9
	 n0R02kapPBv5Q28MFuznIbW9fakrZCQXaqu6fuxER/j8lQnRyCTyy0N2xPbMBenSJw
	 Y7oNueHgcUaxmCuX9mz90qNF7INbNAhQpoj7UtIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11817F801D9;
	Fri, 28 Aug 2020 20:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB6EF8016F; Fri, 28 Aug 2020 20:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33F1BF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 20:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F1BF80118
IronPort-SDR: Gd4TLCpgSCzTtb6Bx2km6PyLYkgDgCyslMELR/33nm92O6EcHDsYmMTVaLIlVHl+AyD7Ck6CwY
 fgGUzf0BXGVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="144471822"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
 d="scan'208,223";a="144471822"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 11:13:11 -0700
IronPort-SDR: 8gZh9oTgfl1jVz7HT9mFfM6RJBaLdOau+1SK1bBIpKdyTlyR+hxby8YgxhSa8Gotykk5dr/tA5
 tUgfB9ifPYjg==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
 d="scan'208,223";a="444916958"
Received: from vjmendox-mobl2.amr.corp.intel.com (HELO [10.209.50.200])
 ([10.209.50.200])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 11:13:10 -0700
Subject: Re: [PATCH 6/9] soundwire: cadence: use FIELD_{GET|PREP}
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200828072101.3781956-1-vkoul@kernel.org>
 <20200828072101.3781956-7-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <da03d771-bb5a-8695-80e8-9eef5e9e1003@linux.intel.com>
Date: Fri, 28 Aug 2020 13:13:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828072101.3781956-7-vkoul@kernel.org>
Content-Type: multipart/mixed; boundary="------------44F4D67F7C009627DC90AE30"
Content-Language: en-US
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This is a multi-part message in MIME format.
--------------44F4D67F7C009627DC90AE30
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


> -	val = (r << CDNS_MCP_FRAME_SHAPE_ROW_OFFSET) | c;
> +	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_OFFSET, r) | c;

Confusion between shift and mask here.

Testing a fix now (attached), but may I suggest you use the SOF 
GitHub/Travis CI directly for any updates? You'll get an answer in 30mn 
for the CML RVP w/ SoundWire.

--------------44F4D67F7C009627DC90AE30
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fixup-soundwire-cadence-use-FIELD_-GET-PREP.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-fixup-soundwire-cadence-use-FIELD_-GET-PREP.patch"

From 5d0ca63bee2c6e2456195499908ecdc8a7709238 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 28 Aug 2020 13:04:01 -0500
Subject: [PATCH] fixup! soundwire: cadence: use FIELD_{GET|PREP}

Fix confusion between shift and mask.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index b6796aa19aa8..5dd06483c835 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -58,7 +58,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_MCP_FRAME_SHAPE			0x10
 #define CDNS_MCP_FRAME_SHAPE_INIT		0x14
 #define CDNS_MCP_FRAME_SHAPE_COL_MASK		GENMASK(2, 0)
-#define CDNS_MCP_FRAME_SHAPE_ROW_OFFSET		3
+#define CDNS_MCP_FRAME_SHAPE_ROW_MASK		GENMASK(7, 3)
 
 #define CDNS_MCP_CONFIG_UPDATE			0x18
 #define CDNS_MCP_CONFIG_UPDATE_BIT		BIT(0)
@@ -1165,9 +1165,10 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
 	int r;
 
 	r = sdw_find_row_index(n_rows);
-	c = sdw_find_col_index(n_cols) & CDNS_MCP_FRAME_SHAPE_COL_MASK;
+	c = sdw_find_col_index(n_cols);
 
-	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_OFFSET, r) | c;
+	val = FIELD_PREP(CDNS_MCP_FRAME_SHAPE_ROW_MASK, r) |
+		FIELD_PREP(CDNS_MCP_FRAME_SHAPE_COL_MASK, c);
 
 	return val;
 }
-- 
2.25.1


--------------44F4D67F7C009627DC90AE30--
