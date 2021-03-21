Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF6343FC5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 12:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50729166A;
	Mon, 22 Mar 2021 12:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50729166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616412652;
	bh=7/OWK8jEXsMEiXV55uSvnbFhg7rNYOQIMV0WECcZD4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLCDa6hO7C2gG6dvNTLqNmwkVnty3VLEpKDvyG9O+PpvllCZXWAeewvKc3nbv5ml1
	 qYBurNyuqqjWuH+jQ4Hc0vJW7aCkJ6DCOwnYPh0ghaU1I+7WAramzgsOTwO5w+2ViM
	 GQ2VDutyZXqXDqC+UU5zeTEJVoH375um9ZrFQL7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D995F801D5;
	Mon, 22 Mar 2021 12:29:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2898F80254; Sun, 21 Mar 2021 10:15:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1940F80155
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 10:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1940F80155
Received: from DAG2EX05-BASE.srv.huawei-3com.com ([10.8.0.68])
 by h3cspam02-ex.h3c.com with ESMTP id 12L9F2Rs099394;
 Sun, 21 Mar 2021 17:15:02 +0800 (GMT-8)
 (envelope-from xi.fengfei@h3c.com)
Received: from localhost.localdomain (10.99.222.162) by
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 21 Mar 2021 17:15:05 +0800
From: Fengfei Xi <xi.fengfei@h3c.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH] sound: remove unnecessary blank
Date: Sun, 21 Mar 2021 16:59:48 +0800
Message-ID: <20210321085948.11491-1-xi.fengfei@h3c.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.99.222.162]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 12L9F2Rs099394
X-Mailman-Approved-At: Mon, 22 Mar 2021 12:28:47 +0100
Cc: Fengfei Xi <xi.fengfei@h3c.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Remove unnecessary blank when calling kmalloc_array().

Signed-off-by: Fengfei Xi <xi.fengfei@h3c.com>
---
 sound/oss/dmasound/dmasound_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 49679aa86..78bb9dfe2 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -421,7 +421,7 @@ static int sq_allocate_buffers(struct sound_queue *sq, int num, int size)
 		return 0;
 	sq->numBufs = num;
 	sq->bufSize = size;
-	sq->buffers = kmalloc_array (num, sizeof(char *), GFP_KERNEL);
+	sq->buffers = kmalloc_array(num, sizeof(char *), GFP_KERNEL);
 	if (!sq->buffers)
 		return -ENOMEM;
 	for (i = 0; i < num; i++) {
-- 
2.17.1

