Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63833215527
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 12:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F296E167F;
	Mon,  6 Jul 2020 12:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F296E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594030209;
	bh=CCmwh3KEH9oxpyf6AYKRsjIPTDLo9Ww2T923lwD00s0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMrDDDbzMOkoKOTimpjFfmGSdjaaU4KRDvgD/HcWLDY5V2miflCCQjJjbj+YANWqW
	 qhxtakoN9hpbF2kdNgARJK3bepaOttfHQh0v6rU8ipzpMh5tkrbP8jHu7rxAD2ajH2
	 mHEo1krg9s+jbW4YqMTxKNEJx9dil21RjuAJjrls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9224F80150;
	Mon,  6 Jul 2020 12:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2CE3F80161; Mon,  6 Jul 2020 12:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CE26F80150
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 12:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE26F80150
IronPort-SDR: /vxFELzwTekQ+42JlCPj9dJy7DHiZFDsPMqJUKVr1HvAYzpZaQjOL9oM65XXcGGsaAz3z12vbL
 JRBSO8Fs0FRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="135637961"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="135637961"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:07:34 -0700
IronPort-SDR: NMkuNHvtonQZPZMyxHer2HEP5Zzw5zzHzJtMVgl2+zK+S1tsW/nzC5unNZDrL5+GQKoMsS7KE1
 5eOKd9rIXnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="313912991"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 03:07:32 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/10] topology: decode: Fix infinite loop in decoding enum
 control
Date: Mon,  6 Jul 2020 11:05:55 +0200
Message-Id: <1594026363-30276-3-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
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

Change-Id: Ide6b4d0e6ee7801bb7185e286be5d2fbf29695a6
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

