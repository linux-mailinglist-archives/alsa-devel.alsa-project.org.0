Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B1E1CBEC6
	for <lists+alsa-devel@lfdr.de>; Sat,  9 May 2020 10:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CA015E0;
	Sat,  9 May 2020 10:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CA015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589011994;
	bh=i7sfCI16no/6Bt+K0vVV9qc8bgD31C2tuzMIvrlS3Fo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EXQWlgLF5d+iaWkXwdmHRufZuLr4Dpdzo7CZEmj30lRqwHbGGFN00O/OrGZ5ru8F5
	 riQeu+aVZ/vkeJM5znXJYMIGgtRXuRgSQ2dTmkMdwzKLK3szupCZOrsFDyb4unRaSX
	 UCGGeKPLaM4bWHQjVyh9NMEoIYNaBrNl5Bvu/cH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2FB7F800BF;
	Sat,  9 May 2020 10:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EEA4F8015F; Sat,  9 May 2020 10:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F247FF800BF
 for <alsa-devel@alsa-project.org>; Sat,  9 May 2020 10:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F247FF800BF
IronPort-SDR: fHFmphtH7DA7szqr4En9S6gFKEPme8JLhmieVzNrC5qJKGuYaEwTIacxslk1H3czPr4Yz5XLVT
 OuB6cF+7beug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2020 01:11:19 -0700
IronPort-SDR: 8rIcegv+aSsB0L/bnYJrvb39VFmcgw90Pgy1a/sx1viq1IGImPOm9iage9WFgNM2lDh5v6eLNr
 cdJyTr6in7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,371,1583222400"; d="scan'208";a="264628342"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2020 01:11:18 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: topology: log all headers being parsed
Date: Sat,  9 May 2020 16:22:48 +0800
Message-Id: <20200509082248.2757-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Keyon Jie <yang.jie@linux.intel.com>
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

The check (tplg->pass == le32_to_cpu(hdr->type)) makes no sense as it is
comparing two different enums, remove the check and log all headers that
being parsed.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 sound/soc/soc-topology.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 49875978a1ce..58cf5a12af3f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2685,11 +2685,10 @@ static int soc_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	if (tplg->pass == le32_to_cpu(hdr->type))
-		dev_dbg(tplg->dev,
-			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
-			hdr->payload_size, hdr->type, hdr->version,
-			hdr->vendor_type, tplg->pass);
+	dev_dbg(tplg->dev,
+		"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
+		hdr->payload_size, hdr->type, hdr->version,
+		hdr->vendor_type, tplg->pass);
 
 	return 1;
 }
-- 
2.20.1

