Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43BB21F15B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981D31674;
	Tue, 14 Jul 2020 14:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981D31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594730019;
	bh=lbc2fS43hLE6cOu+Fjy/Orddi5XPhjNVYSn2y7z1uF4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhbx+0mKSH6PS5cwVuZbm5SZXMWeQ40ik1H5cJ7V8WUX12O6O+MaA0nlR2YerJ/Uj
	 IaIwAEk+OLAtE/AFh8WpsppjD7ySRJyZGbh+Xp1yZe9D1X+2uGCkMCsYHuTTEfD+Dv
	 nfStevVHEdLOKZ4ud3BfVaHJzXYajXVXUbXPA09k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE880F80316;
	Tue, 14 Jul 2020 14:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F7BBF8016F; Tue, 14 Jul 2020 14:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73446F801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73446F801EC
IronPort-SDR: 9qJL5Nklhw3M7i7Kz24tqa9Fv5GvZocEY+vZVmhWbHFYAX//sUcDvPjZEJpGxj1sXq6/L3CrUn
 RhhkIEWPHK5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="150304990"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="150304990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:38 -0700
IronPort-SDR: Wmg27iqK42LaI39q2yTHXX0fBvwPDTUWsgqH3smqcKWLcZipxcigYVVDsmL45m239JViiTZgEH
 5pQDrTEZG2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860457"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:36 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 09/10] topology: decode: Add DAI name printing
Date: Tue, 14 Jul 2020 13:25:10 +0200
Message-Id: <1594725911-14308-10-git-send-email-piotrx.maziarz@linux.intel.com>
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

DAI name is a part of topology binary. Not printing makes data loss while
converting from binary to standard ALSA configuration file.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
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

