Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8B5BCBB9
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B162165D;
	Mon, 19 Sep 2022 14:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B162165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590210;
	bh=WZbYeP78bwhMAnEH8GsOG9lUbxsY7+rX+7e0921aZFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GP0zRJakUgah+SdgB/9PiesrHvkZE7KIaublWQKQFzcDXTQZ80TI6gf1sJ7SJSL+n
	 jKsST/Ho6r6Rmq6QhdoNGYe/gCPbBQ2Gbtnl3sPc1k/O1UyDwrch/XTwk92uhQAD2m
	 7SgaT9QNKpHD6R3o5Z4fKzW/UAKWEpI+r8ZfxO2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D725CF8053C;
	Mon, 19 Sep 2022 14:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F05BF80543; Mon, 19 Sep 2022 14:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0EDFF804FF
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EDFF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BBP2VMHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590116; x=1695126116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZbYeP78bwhMAnEH8GsOG9lUbxsY7+rX+7e0921aZFQ=;
 b=BBP2VMHvTOmrXLIuvIwJqgIebork+m8cTwSb7aC1tSF+O1BKFXL4tQp7
 xrG6k7XXWm7J+QzUW3vXl1oPzajsSfGyWzt3lZhO1h/SN5dPtwp5xPiPx
 UEtBtuaEcVDUoZERQX55/WRfXj+Rx20TJiKZcnMCjcMFB248UljLgfyyH
 ijbABTH2Y+UFkgl+cdbE+v0BKMARi+WTIPXn6zs8KwaMjJca/H6NePOR8
 EmR5fQFedbPZto9DGRMJFxGdP08WCjaGEqEpcngC5EobfExs/FsjSXmHh
 T7/18yHb4BOcVdXh1aSnUmZuQKUOLmfopq9BA62mtz+cNvzBNEZ467r/3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325675954"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325675954"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837671"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: SOF: Intel: remove unneeded dev_vdbg
Date: Mon, 19 Sep 2022 14:21:04 +0200
Message-Id: <20220919122108.43764-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
References: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Noah Klayman <noah.klayman@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Noah Klayman <noah.klayman@intel.com>

This patch removes an unneeded dev_vdbg call in hda-stream.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index b58662faa4aad..8344363beec09 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -93,9 +93,6 @@ static int hda_setup_bdle(struct snd_sof_dev *sdev,
 		bdl++;
 		hstream->frags++;
 		offset += chunk;
-
-		dev_vdbg(sdev->dev, "bdl, frags:%d, chunk size:0x%x;\n",
-			 hstream->frags, chunk);
 	}
 
 	*bdlp = bdl;
-- 
2.34.1

