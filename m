Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A897821F13A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348371674;
	Tue, 14 Jul 2020 14:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348371674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729817;
	bh=zFwpH1r6/0ba8AC04QbvDI4fYPGF2/e1Dd3TP/mE6oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5bpeYszAEUBRyGG08qTpBtMcsI3cbVHgFsIb8xvnbrUVRqZeBz43ZA4y5Hx5sHDe
	 XEjijTfV9DSp0/yUr19Auxix2BKXeBBX7A/cz1+uZS8N172F+zyiygo1uBVHWOQJY6
	 aol+Qq4ZPokywcVI3L30RDEUHWlvKTqhSQA6XgTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3A7F802C4;
	Tue, 14 Jul 2020 14:26:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B5D7F8026F; Tue, 14 Jul 2020 14:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32237F801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32237F801EC
IronPort-SDR: RO5vAzlfq8mcu6RihWHkco+7g8VJfhVBQrB8jMBO7Apms6vKBTcSf2+4g9N+eD3uX8mx6xqzxN
 IOFWWtE1Pi7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981786"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:30 -0700
IronPort-SDR: nWpZ+aq55LLnKlLnAfnABKEKzqUj8dssW0r3Oj0xBrPyCIY4fBi9tXliN0cGQHXlDXlLUQF3XL
 WZMBDXvugK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860413"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:28 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 03/10] topology: decode: Remove decoding values for enum
 control
Date: Tue, 14 Jul 2020 13:25:04 +0200
Message-Id: <1594725911-14308-4-git-send-email-piotrx.maziarz@linux.intel.com>
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

Values have no representation in standard ALSA configuration files,
therefore there is no need to populate them. Also memory for values
wasn't allocated which was causing undefined behaviour.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
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

