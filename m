Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B063452F500
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541A6174D;
	Fri, 20 May 2022 23:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541A6174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081746;
	bh=zzzp6DdVnMVMBIYm+KLFZeV2M7cUlXgl5MrmkBwL7ZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rAMGtEdjcKZgQtBcXcBXZy1BP3MR7KU++iL5oF1VoP9d8sM4ftMbZcnsnPO0lRZT7
	 OlrVdkpYj5AiqZ45GJiqG1NhEQn9yAc/Bwpd4BAq+/yeyBmhYPdGSlRj6Sm4PHCqqa
	 qgDOYbrc6XYV2B8Hd5iFOxJy4pfFP9Ke6nCgXZ4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E4CF8052D;
	Fri, 20 May 2022 23:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F80FF80553; Fri, 20 May 2022 23:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D472F80525
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D472F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T5+QR3Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081467; x=1684617467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzzp6DdVnMVMBIYm+KLFZeV2M7cUlXgl5MrmkBwL7ZI=;
 b=T5+QR3Nv6XJAga24YW9MiQcbVyBk+PmjyL5W12y+ecLYBwSm4BPq+cvO
 lMu5572d1iVKH3PIvt6TxLKZPwcrHRPrsnksWrnO7FDKZLroo1EPN2JhW
 TAsH1nXDqUt6HIZWTPB/rJj1C1MaqYLvvsLIDAAuHdEbBKRvqb8WIaRuK
 yfq9QvJctIsoQJQd6mDUsLrLmKKmjVjXGCcqUcJrKFNzU4diJiqJjfFN6
 QHf0+8N3eGoUpB33TNyDNwC3xia5YaJN/9vE6tHWaYxZ8K+0bX9Bp7oU2
 siiJM/X3YU8J29mdRxqywYJ/YsE1yvmBHDfI+OZEf2HThDk5TJEm+N+oE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324253"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796067"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/16] ASoC: samsung: snow: simplify error handling
Date: Fri, 20 May 2022 16:17:18 -0500
Message-Id: <20220520211719.607543-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/samsung/snow.c:219:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/samsung/snow.c:215:6: note: If condition 'ret' is true, the
function will return/exit
if (ret)
     ^
sound/soc/samsung/snow.c:219:9: note: Returning identical expression
'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/samsung/snow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 02372109c251e..da342da038804 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -216,7 +216,7 @@ static int snow_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "snd_soc_register_card failed\n");
 
-	return ret;
+	return 0;
 }
 
 static int snow_remove(struct platform_device *pdev)
-- 
2.30.2

