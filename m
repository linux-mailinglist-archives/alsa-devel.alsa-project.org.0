Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3B215533
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 12:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19CE3167D;
	Mon,  6 Jul 2020 12:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19CE3167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594030327;
	bh=DBjE0IkCKMsNzIza9NTZeeepT03hTlNwXbTXrFOgWGc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCRifHdpg51iN/whpewXfJlH8CpaJasLEq7J9fBbuTHMKn9gg7TcD/yU3epb3XZFl
	 IdRRpmCfHx3WVjsjCV1A6AgbcAkXlKabmyMxLK0TQD1pWQjeLvn4GXM3bO4IPoWcCM
	 Y7L2DtyakdMvc6/ZjK7C1RszbpZFfa25MpD4Jvjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 218C5F802E3;
	Mon,  6 Jul 2020 12:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A287F8027C; Mon,  6 Jul 2020 12:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC32F8015A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 12:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC32F8015A
IronPort-SDR: cXz9/jE2qI66egOidk70+t8nGerFzvdKOBeoGHdHYJoJQvku6zz4H3XEIKJ3bhTazYgzWQwtfi
 IMLdrkCVwJ+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="135637966"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="135637966"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:07:38 -0700
IronPort-SDR: rzvKcWazLe5A66xWajnc079EUZTuKVoYRuVmxSZBPqM2oDF63PxdbVaeIfvVRHoHmprXSsQOYu
 pCiPhX6v9DsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="313913013"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 03:07:37 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/10] topology: decode: Fix printing texts section
Date: Mon,  6 Jul 2020 11:05:58 +0200
Message-Id: <1594026363-30276-6-git-send-email-piotrx.maziarz@linux.intel.com>
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

Change-Id: Ie00ca47b18f527140b63b8c31e948f8850dfe11f
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

