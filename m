Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C921F82D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EA391669;
	Tue, 14 Jul 2020 19:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EA391669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747800;
	bh=R6N4v2CYe/Lx3W7tlVvWs/T7H+CfVwVF1Nb5Y6waph8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4FE6Qp9Oo+htXTGafA7VuYvdzR49UaH/ATD7fJFCjxtAX8zPmVtDr/wBAz/gEkiA
	 6PP74uwyVADa18lar63UUSR4Y0/A5KltoUB9EOtUnCv6wfmKpOQywrN3PH6ZkNDBJa
	 cyKbUVcV2BW+kiH8reGE917XPDKWW0Utb2NTXzKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F51F8019B;
	Tue, 14 Jul 2020 19:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7807F802DC; Tue, 14 Jul 2020 19:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2162BF801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2162BF801EC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30D6CAD63
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/10] ALSA: ctxfi: Replace the word blacklist
Date: Tue, 14 Jul 2020 19:26:25 +0200
Message-Id: <20200714172631.25371-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
word "blacklist" appropriately.

Only correcting the error message, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctatc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index b1898fafc6a9..f8ac96cf38a4 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1282,7 +1282,7 @@ static int atc_identify_card(struct ct_atc *atc, unsigned int ssid)
 	if (p) {
 		if (p->value < 0) {
 			dev_err(atc->card->dev,
-				"Device %04x:%04x is black-listed\n",
+				"Device %04x:%04x is on the denylist\n",
 				vendor_id, device_id);
 			return -ENOENT;
 		}
-- 
2.16.4

