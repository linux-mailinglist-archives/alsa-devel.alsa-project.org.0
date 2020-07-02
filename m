Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C02212B3F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EA916DF;
	Thu,  2 Jul 2020 19:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EA916DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710998;
	bh=ALjHZlTpDozSt4boDM2j+OgZjxm9zq2qrg+pHaMBzZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gZ9Qg5CCGvlRVH0yIUwNrvdUdVTwqihcYXjGZ3XWbeYmcppSaj2qR3cVEgzg2zWxa
	 VTfFLaGGEP24JiuAaHQV0pAXcsQhFUK67hGkxuczBMO87bcxSceBdYXdt/4dGbYe4g
	 VCEobftx2KaVOUx9HZVssXZOeObSBwWCg1/Zt8wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB33F8022D;
	Thu,  2 Jul 2020 19:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 390AAF80245; Thu,  2 Jul 2020 19:28:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF792F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF792F800C1
IronPort-SDR: XQz4j0Cgcmo5H4UOl3St/3UjnZZb94YmOnESK5MtTvmIzt1GOKWNgE3wW72MaGf1TGADi1PF//
 39XTNdJEMQNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="127060582"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="127060582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:28:08 -0700
IronPort-SDR: NNo4OeUNEJ++ad5NPAM1SHicAw7jt8wAVaPNQEsIuGniX/IfAkQtqNJkCE9khEIblcdWQsGCjX
 20tZcR1aRfgA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="455596973"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:28:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-ac97: fix kernel-doc
Date: Thu,  2 Jul 2020 12:28:00 -0500
Message-Id: <20200702172800.164986-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Fix W=1 warning. Add missing arguments

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-ac97.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 906106ed8ca1..65db083e242b 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -393,6 +393,8 @@ EXPORT_SYMBOL_GPL(snd_soc_set_ac97_ops);
 
 /**
  * snd_soc_set_ac97_ops_of_reset - Set ac97 ops with generic ac97 reset functions
+ * @ops: bus ops
+ * @pdev: platform device
  *
  * This function sets the reset and warm_reset properties of ops and parses
  * the device node of pdev to get pinctrl states and gpio numbers to use.
-- 
2.25.1

