Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7C21F134
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF1384D;
	Tue, 14 Jul 2020 14:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF1384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729780;
	bh=m89tNghibUgfqAhsPRl6eS/0WdchdK2L+CNsZZsql40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7u6gnYcehCkYnfMbLtjdoA9j2PFziko3mnGxivKJtoG20jW9wjWdeh86xw8c3lG5
	 0HsBkOFIo9LNpvPybdYBk/yGT9xVgwn/R0RupRGTpa74mb6Ij7Bv1++Nz8XN2ZNq2u
	 gH/jA/k7S/CcI5nQMZTCYz/pWdB9kexcY+v3/9u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40818F8028A;
	Tue, 14 Jul 2020 14:26:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E29F8026A; Tue, 14 Jul 2020 14:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1080EF8016F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1080EF8016F
IronPort-SDR: tjXF9z/r9zyeTIukzdMZwJ2UcytK5uPkB9W+WjgaukXR2QcfXUvvFVpLzx2ycHb2N3VS4pgMFS
 Xo5wv2/fsnYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981784"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:29 -0700
IronPort-SDR: LvBDnY0kG6d0ufWBF5zk5/S3jfwR1C70I8G59AyhKlCGfovDmccJGtg1iljXy+UvDfEpqE2Dlu
 4ny7kCioN3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860401"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:25 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 02/10] topology: decode: Fix infinite loop in decoding enum
 control
Date: Tue, 14 Jul 2020 13:25:03 +0200
Message-Id: <1594725911-14308-3-git-send-email-piotrx.maziarz@linux.intel.com>
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

Accessing memory outside of allocated boundaries caused segmentation fault.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
---
 src/topology/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 6e6c1d1..0aa49ab 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1367,7 +1367,7 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 		et->texts = tplg_calloc(heap, sizeof(char *) * ec->items);
 		if (!et->texts)
 			return -ENOMEM;
-		for (i = 0; ec->items; i++) {
+		for (i = 0; i < ec->items; i++) {
 			unsigned int j = i * sizeof(int) * ENUM_VAL_SIZE;
 			et->texts[i] = ec->texts[i];
 			et->values[i] = (int *)&ec->values[j];
-- 
2.7.4

