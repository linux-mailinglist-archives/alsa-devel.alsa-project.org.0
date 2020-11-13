Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50F2B18DE
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 11:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8971884;
	Fri, 13 Nov 2020 11:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8971884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605262601;
	bh=/oACj6NyPs/iiIXh1EGNRemuh0D0s/7aEMylpO+1BM0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HzFbz+m71xL2m6ik/MTPakC+vNF5Ttl3ROAW39qMeIOhttO+3oaXbQ3y9HBxH9uYO
	 UHEBX8qvqcKCKzQGP+HZBT9QzvD4235X0UszaA9E67r1N8J7NowSLAJ+uMkYWj2Rce
	 L/NSpkoUaFQ1XIeU9WxEofRNSYK6PsH8G5Ua8Doo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76414F8022B;
	Fri, 13 Nov 2020 11:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8A2F8020C; Fri, 13 Nov 2020 11:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B78F800D1
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 11:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B78F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="kpYgf3v/"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAA4c8020423;
 Fri, 13 Nov 2020 10:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=O9lMpZFP41yaCeA000myOwBOAFcWscTOgS6iGKjFjOQ=;
 b=kpYgf3v/rE9/nCUwL+CTjfB7S/jZjoXFKlZ4trv9cFvdmzvnW4NI3xc4vWurmmceTEs3
 Es0oKmKapouWCYMwgvKgI/MxwAQOv3GfPVBbfyQ+T6zU5Sp8FaCr+1ezSztjfmFH1K3e
 o8WE7rP9uew9xRwWWZPLsQXlTGd8dTXY2+potFPKct0oqih1Ohs01i2H1m0RBG+xx7oM
 2fVFuVxmPLVM7mfrp5+iOH8uS2DEILpTsLgw5VBpF+YuiBcfJBoJ/9o2QAD5D+6+g0NA
 k6scAPwI5+wlRs+G5hD+zzUlfKKDGhMzgiJ5kyRXyrE9FGoe3rpmtvpSUCOtHaBRvWRi Tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34nh3ba1b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Nov 2020 10:14:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAAIcH179222;
 Fri, 13 Nov 2020 10:12:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34rtktbrgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 10:12:56 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ADACmdE011460;
 Fri, 13 Nov 2020 10:12:51 GMT
Received: from mwanda (/10.175.206.108)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 02:12:47 -0800
Date: Fri, 13 Nov 2020 13:12:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH] ALSA: firewire: Clean up a locking issue in copy_resp_to_buf()
Message-ID: <20201113101241.GB168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

The spin_lock/unlock_irq() functions cannot be nested.  The problem is
that presumably we would want the IRQs to be re-enabled on the second
call the spin_unlock_irq() but instead it will be enabled at the first
call so IRQs will be enabled earlier than expected.

In this situation the copy_resp_to_buf() function is only called from
one function and it is called with IRQs disabled.  We can just use
the regular spin_lock/unlock() functions.

Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
index 0f533f5bd960..9f8c53b39f95 100644
--- a/sound/firewire/fireworks/fireworks_transaction.c
+++ b/sound/firewire/fireworks/fireworks_transaction.c
@@ -123,7 +123,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
 	t = (struct snd_efw_transaction *)data;
 	length = min_t(size_t, be32_to_cpu(t->length) * sizeof(u32), length);
 
-	spin_lock_irq(&efw->lock);
+	spin_lock(&efw->lock);
 
 	if (efw->push_ptr < efw->pull_ptr)
 		capacity = (unsigned int)(efw->pull_ptr - efw->push_ptr);
@@ -190,7 +190,7 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
 
 	copy_resp_to_buf(efw, data, length, rcode);
 end:
-	spin_unlock_irq(&instances_lock);
+	spin_unlock(&instances_lock);
 }
 
 static void
-- 
2.28.0

