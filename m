Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B179F21F144
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE1F1612;
	Tue, 14 Jul 2020 14:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE1F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729917;
	bh=7zjFxo4K5u/n5nGsOUIchVQEE5hUS76ak8eFEPujWlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oCWgbNn2zwHOuTPXvOfRtYp81KmOgHPGh8Y7QWtDo9uT3X4XbYuYJlzNttBS8nrKZ
	 iQCUSILjLwDzXOwI7cONn3NBIuimW3GozLScz31xHUljRpWygwiip8JKtYTLMBfz9b
	 rikcgadrPPB/o9xXClUgu8ZcSB6QVAGVp2casXxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEDDF802E9;
	Tue, 14 Jul 2020 14:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAFC8F8020C; Tue, 14 Jul 2020 14:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029A5F801F2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029A5F801F2
IronPort-SDR: s89gLCJvlITpr49d+axiehOPPXQwm/17RN0khL9btwSdqvOeHpMvE7QcIPM9Sw9c1iFOgxG88U
 edgEaMXQ5b+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981793"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981793"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:32 -0700
IronPort-SDR: /Qd/zZgl3asOuwKV1rntAI6sKwD9SCOGEL+NtZ491zQcvMNA9R8efOiGY++GJwI9xBzvGIUJ+0
 NMwEKa4M6dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860427"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:31 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 05/10] topology: decode: Fix printing texts section
Date: Tue, 14 Jul 2020 13:25:06 +0200
Message-Id: <1594725911-14308-6-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
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

