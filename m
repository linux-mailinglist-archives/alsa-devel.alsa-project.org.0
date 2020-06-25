Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188FD209E27
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 14:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA6FC18D4;
	Thu, 25 Jun 2020 14:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA6FC18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593087014;
	bh=7zjFxo4K5u/n5nGsOUIchVQEE5hUS76ak8eFEPujWlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpkjzIMe1BO3JHajmpvH9Fa/b5eAvIHcbhV77yJ9wZf1uV9wp2B+J7lJtZ/SRWa7D
	 WTnmzzhE1xihq+22+Csedq1HOm3Gt8Cl9Z1f9LGoG0JhyTG+LgAgmVVINQvgYSCm8i
	 eXsQKBT9TNUW/iWkC9AYSVvX/4BJcyuyCJgJI/uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB304F802DD;
	Thu, 25 Jun 2020 14:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F62F802A8; Thu, 25 Jun 2020 14:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB708F80234
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 14:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB708F80234
IronPort-SDR: cbTNr1j1m8T46qJXj8p42V1yXgtJtWbBiNcP1kp4wbNMF389krkEIzCKEyNY+4CMFEfRzOKpzT
 KksCsezSnT3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="206389928"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="206389928"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:05:37 -0700
IronPort-SDR: +/k1B7mplXKKFL3eick5KAGE3xA/LlZ3m8n7ko2HdlK5WjbiuKxnSZEML/nrIAp367ITBNuJcK
 9re4DXA3lmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="354438953"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 05:05:36 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/8] topology: decode: Fix printing texts section
Date: Thu, 25 Jun 2020 13:03:41 +0200
Message-Id: <1593083026-7501-3-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
---
 src/topology/text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/topology/text.c b/src/topology/text.c
index 507c545..b899b28 100644
--- a/src/topology/text.c
+++ b/src/topology/text.c
@@ -103,7 +103,7 @@ int tplg_save_text(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 		return 0;
 	err = tplg_save_printf(dst, pfx, "'%s'.values [\n", elem->id);
 	for (i = 0; err >= 0 && i < texts->num_items; i++)
-		err = tplg_save_printf(dst, pfx, "\t'%s'\n", texts->items[i][0]);
+		err = tplg_save_printf(dst, pfx, "\t'%s'\n", texts->items[i]);
 	if (err >= 0)
 		err = tplg_save_printf(dst, pfx, "]\n");
 	return err;
-- 
2.7.4

