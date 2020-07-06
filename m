Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3021554E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 12:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3B61682;
	Mon,  6 Jul 2020 12:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3B61682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594030506;
	bh=EzKVS1WST4ATVLY8ixzGQxiWpuU4uP96t/suRRtmyNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r6EQ8YD8nl98+PvsH47IgyxfgNZ6aEc1L28PdgXeu20S9OFverPeodYlLe1eIrsnG
	 +H5zv/NNJlfzlbMAAx1aKtSrT1oCavXSGyIgJ2rqYXrWU1oxfzLULhRrAbO9QkEdRg
	 di1HSoJxWHqO21mM3PFCB91/edSqg0FFBPB+oEpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C90C5F80322;
	Mon,  6 Jul 2020 12:07:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF68F802F7; Mon,  6 Jul 2020 12:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2BBFF80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 12:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BBFF80125
IronPort-SDR: 4rfLHY4ebj4mgyxfMXlz5A12QvyNY076Y2GkWUtxdSisLhIu7KNef2ZXGWhjBFoiFH/v99by0W
 3LiQ72HljNAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="135637975"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="135637975"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 03:07:44 -0700
IronPort-SDR: mGophpnQgsVHtNuwWFnpdmrB7TrCLPVgva+niAWFKcoxGXPab9Wj0roJUCbbd7TNVZYNjpbV/q
 bSOmILmj7SmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="313913042"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 03:07:43 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/10] topology: decode: Add DAI name printing
Date: Mon,  6 Jul 2020 11:06:02 +0200
Message-Id: <1594026363-30276-10-git-send-email-piotrx.maziarz@linux.intel.com>
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

DAI name is a part of topology binary. Not printing makes data loss while
converting from binary to UCM.

Change-Id: I57307108b5e922d18db2f155b9237db3fe175d7f
---
 src/topology/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index 49c5eab..5a54e15 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -781,7 +781,9 @@ int tplg_save_fe_dai(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	struct snd_soc_tplg_pcm *pcm = elem->pcm;
 	int err = 0;
 
-	if (pcm->dai_id > 0)
+	if (strlen(pcm->dai_name))
+		err = tplg_save_printf(dst, pfx, "dai.'%s'.id %u\n", pcm->dai_name, pcm->dai_id);
+	else if (pcm->dai_id > 0)
 		err = tplg_save_printf(dst, pfx, "dai.0.id %u\n", pcm->dai_id);
 	return err;
 }
-- 
2.7.4

