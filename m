Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B4713C8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 10:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18324184F;
	Tue, 23 Jul 2019 10:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18324184F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563869977;
	bh=CRdcY+k0LY4oU2/tWlIfiknZk4HKEqpICyQpivzwmps=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fucU3kJlQjWbQdQcPswiEchd83QfLJmnGiSEjbiWeVjUIVzQ0goR9qPkxBnZN55AN
	 J9QZpRQ1TdrKSXlZt8ZbRi5sV52S3f1xVnwHnpmvT4yMhFlRtNlYxvsyM8QU+BODVg
	 1F4o/shkGrfFAuvhJUlOJj86i+xcLLDGP2cMKT+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61900F80447;
	Tue, 23 Jul 2019 10:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DB24F803D0; Tue, 23 Jul 2019 09:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 10504F803D0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 09:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10504F803D0
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25d36baeda11-f8fc7;
 Tue, 23 Jul 2019 15:44:46 +0800 (CST)
X-RM-TRANSID: 2ee25d36baeda11-f8fc7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d36baed58e-84ede;
 Tue, 23 Jul 2019 15:44:45 +0800 (CST)
X-RM-TRANSID: 2ee15d36baed58e-84ede
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
To: perex@perex.cz,
	tiwai@suse.com
Date: Tue, 23 Jul 2019 15:44:41 +0800
Message-Id: <1563867881-2554-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 23 Jul 2019 10:16:32 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: ac97: Fix double free of
	ac97_codec_device
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

put_device will call ac97_codec_release to free
ac97_codec_device and other resources, so remove the kfree
and other redundant code.

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 sound/ac97/bus.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 7b977b7..7985dd8 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -122,17 +122,12 @@ static int ac97_codec_add(struct ac97_controller *ac97_ctrl, int idx,
 						      vendor_id);
 
 	ret = device_add(&codec->dev);
-	if (ret)
-		goto err_free_codec;
+	if (ret) {
+		put_device(&codec->dev);
+		return ret;
+	}
 
 	return 0;
-err_free_codec:
-	of_node_put(codec->dev.of_node);
-	put_device(&codec->dev);
-	kfree(codec);
-	ac97_ctrl->codecs[idx] = NULL;
-
-	return ret;
 }
 
 unsigned int snd_ac97_bus_scan_one(struct ac97_controller *adrv,
-- 
1.9.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
