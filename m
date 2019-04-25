Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8547EB584
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14AB0892;
	Sun, 28 Apr 2019 09:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14AB0892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436887;
	bh=Qc9VIEArzIIcxLLbZztQ1y1xbUB5ujoGPpqALm/r+Ls=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VVNPor+dH3ehE4D68atpgvvRpEScFiNBwq8TqvfZNHcZBoKgu/L3zQex/MjjF9Pb/
	 B9BhXUUyGwbXh18ABqGWgr+gfxEvSIAJWk6ddJH+TJb319KcRoHaZd4bahqVaUB8Mp
	 hNqpkIdmaq3chueOzhIfE7M4Rf1w4WOQ1H2SWpG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86CD6F8972D;
	Sun, 28 Apr 2019 09:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C17F896DB; Thu, 25 Apr 2019 23:58:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5463F8961C;
 Thu, 25 Apr 2019 23:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5463F8961C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Apr 2019 14:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,394,1549958400"; d="scan'208";a="340836657"
Received: from otc-chromeosbuild-2.jf.intel.com ([10.54.30.90])
 by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2019 14:57:51 -0700
From: Patrick Waterlander <patrick.waterlander@intel.com>
To: patch@alsa-project.org
Date: Thu, 25 Apr 2019 14:57:43 -0700
Message-Id: <20190425215743.88673-1-patrick.waterlander@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Cc: alsa-devel@alsa-project.org,
 Patrick Waterlander <patrick.waterlander@intel.com>
Subject: [alsa-devel] [PATCH 1/1] ASoC: Intel: Skylake: change list empty
	check to warning
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

NULL is a valid state for the module list when querying unique ID.
Downgrade the empty condition from error to warning.

Signed-off-by: Patrick Waterlander <patrick.waterlander@intel.com>

diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 5951bbdf1f1a..95e6a23538cd 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -324,7 +324,7 @@ static struct skl_module_table *skl_module_get_from_id(
 	struct skl_module_table *module;
 
 	if (list_empty(&ctx->module_list)) {
-		dev_err(ctx->dev, "Module list is empty\n");
+		dev_warn(ctx->dev, "Module list is empty\n");
 		return NULL;
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
