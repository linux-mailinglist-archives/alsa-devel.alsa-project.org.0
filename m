Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A000184764
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 14:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 280531800;
	Fri, 13 Mar 2020 14:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 280531800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584104688;
	bh=uBLuFgcOmKNI2+XVjDFiZf6WWg72808Y6/WMZo8Owzg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQJVdKdsS+eCSA+Kvl881xgCaM0QRJWEREFtidWruVx59WCaivBk0iqNiZ8ima/GU
	 OAc6zmRW7J9zqaah7pj8N2tgGM8qnPox0g7EY0fzlV4KGmKybQSyWFROfhqJcd2ng6
	 I3vHz5noX6ZRZWVa3RRMyrEuowDGBlsknUoaSTJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17B7F801F7;
	Fri, 13 Mar 2020 14:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E282AF801EB; Fri, 13 Mar 2020 14:02:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D305DF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 14:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D305DF80086
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0DF72ACE8
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:02:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Fix superfluous snprintf() usage
Date: Fri, 13 Mar 2020 14:02:23 +0100
Message-Id: <20200313130223.8908-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

show_pcm_class() returns obviously a short string that can't overflow
PAGE_SIZE.  And even if it were to overflow, using snprintf() there is
just wrong, as it doesn't return the correct size.
So simplify with sprintf() instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index a141a301369f..b6d2331a82f7 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1019,7 +1019,7 @@ static ssize_t show_pcm_class(struct device *dev,
 		str = "none";
 	else
 		str = strs[pcm->dev_class];
-        return snprintf(buf, PAGE_SIZE, "%s\n", str);
+	return sprintf(buf, "%s\n", str);
 }
 
 static DEVICE_ATTR(pcm_class, 0444, show_pcm_class, NULL);
-- 
2.16.4

