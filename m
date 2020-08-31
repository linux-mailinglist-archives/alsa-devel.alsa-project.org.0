Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17527257627
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90840183A;
	Mon, 31 Aug 2020 11:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90840183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865098;
	bh=dJl/Yz+/BWuFW+lTgl6wUJcsqYFTfa6BDSSbWreoYYs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zu+eKZzHmzV4rDHcr9rCe+Z6G2ZX/9JPcxKknLXpoLFzjoIfbsA5DKtBXR0DBm8JL
	 bnhAf7l5G50soW0P+iDNjwcyKZTIPbV4pgB2tH+xkPNqxyNSKLmqES0pQ3LtHTw+HD
	 v2UEQwcKU3dr57vUm1SqN76w1HBOe7t1+TEcHS5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 005D4F802E0;
	Mon, 31 Aug 2020 11:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FA8F802D2; Mon, 31 Aug 2020 11:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6F6AF80058
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F6AF80058
IronPort-SDR: qyUn3Jvtk7EbqeJX4AA9PrJ/PUIdLzlHudrsQ3pWXsYUS9OvFE0DgdTTLfAK3u9NaPJFvjt6wW
 LCEr8OrapUXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466747"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466747"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:07 -0700
IronPort-SDR: IYfgFZ6e+buIiEJk4LIZVQVMXRcK6ZjeSKLKY5go8DSjHUcxCR6Kjh6pwjzWpZyqD+TCUYYAGS
 XvqcxzmxmbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286878"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:05 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 03/10] topology: decode: Remove decoding values for enum
 control
Date: Mon, 31 Aug 2020 11:08:56 +0200
Message-Id: <1598864943-22883-4-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

Values have no representation in standard ALSA configuration files,
therefore there is no need to populate them. Also memory for values
wasn't allocated which was causing undefined behaviour.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 src/topology/ctl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 0aa49ab..02e482e 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1367,11 +1367,8 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 		et->texts = tplg_calloc(heap, sizeof(char *) * ec->items);
 		if (!et->texts)
 			return -ENOMEM;
-		for (i = 0; i < ec->items; i++) {
-			unsigned int j = i * sizeof(int) * ENUM_VAL_SIZE;
+		for (i = 0; i < ec->items; i++)
 			et->texts[i] = ec->texts[i];
-			et->values[i] = (int *)&ec->values[j];
-		}
 	}
 
 	et->map = tplg_calloc(heap, sizeof(struct snd_tplg_channel_map_template));
-- 
2.7.4

