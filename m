Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B862D1B2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 04:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD591657;
	Thu, 17 Nov 2022 04:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD591657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668655748;
	bh=tZ7LwGFCziS6uyAkDJPPWYp3E1r7xWzb6xvOr82h2/o=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NmmAhYdktU+1IXBfsRpwvwi11pncFC5APIfWqXmANmxebgEvACJWR8l0oUZqndIjg
	 0gZPHUkV/60a2pKcTeCULT/JpruMWQBu+7uATEqM0XBWcKa6knwBfDdtwFQewDUtLF
	 NR96+IXTtMn774ezLUtfOz49z0925xvceQ5TPtAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 117E4F800B5;
	Thu, 17 Nov 2022 04:28:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05FAF8025A; Thu, 17 Nov 2022 04:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBABEF800B8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 04:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBABEF800B8
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NCQNF4vFcz8RTZR;
 Thu, 17 Nov 2022 11:27:57 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
 by mse-fl2.zte.com.cn with SMTP id 2AH3RSOc053408;
 Thu, 17 Nov 2022 11:27:46 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid31;
 Thu, 17 Nov 2022 11:27:47 +0800 (CST)
Date: Thu, 17 Nov 2022 11:27:47 +0800 (CST)
X-Zmail-TransId: 2af96375aa3352d13a9c
X-Mailer: Zmail v1.0
Message-ID: <202211171127475450476@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <srinivas.kandagatla@linaro.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIHNsaW1idXM6IGNvcmU6IFVzZSBkZXZpY2VfbWF0Y2hfb2Zfbm9kZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AH3RSOc053408
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID
 6375AA3D.002 by FangMail milter!
X-FangMail-Envelope: 1668655677/4NCQNF4vFcz8RTZR/6375AA3D.002/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6375AA3D.002/4NCQNF4vFcz8RTZR
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with device_match_of_node().

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/slimbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 219483b79c09..9cafd33e7ddb 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -389,7 +389,7 @@ static int of_slim_match_dev(struct device *dev, void *data)
 	struct device_node *np = data;
 	struct slim_device *sbdev = to_slim_device(dev);

-	return (sbdev->dev.of_node == np);
+	return device_match_of_node(&sbdev->dev, np);
 }

 static struct slim_device *of_find_slim_device(struct slim_controller *ctrl,
-- 
2.25.1
