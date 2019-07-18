Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE26CC60
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34646168D;
	Thu, 18 Jul 2019 11:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34646168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563443711;
	bh=4m1ee2+XJrItDYMm7OD1UHa28I2LXWz/wUvdaJMZC9A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cc4T9kEJQzqBl6UNzKZqAgKkOR2kfKzvWwyFHty4xMyGeEG1sybDAXopWeGgQQznn
	 22msZxpGru76EhHTC08sawPzAjTrMf4wCY4mHwODNWib2r488IxjGzxruYTvUds2PJ
	 LsjAq4qR0L59+j40o59eUkDP42OO6GPsk5wlFOwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A480F80377;
	Thu, 18 Jul 2019 11:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDAA7F80362; Thu, 18 Jul 2019 11:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74498F800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74498F800C0
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1ho36E-0000bu-57; Thu, 18 Jul 2019 09:53:18 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Date: Thu, 18 Jul 2019 17:53:13 +0800
Message-Id: <20190718095313.19498-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: line6: Fix wrong altsetting for
	LINE6_PODHD500_1
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

Commit 7b9584fa1c0b ("staging: line6: Move altsetting to properties")
set a wrong altsetting for LINE6_PODHD500_1 during refactoring.

Set the correct altsetting number to fix the issue.

BugLink: https://bugs.launchpad.net/bugs/1790595
Fixes: 7b9584fa1c0b ("staging: line6: Move altsetting to properties")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/usb/line6/podhd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index f0662bd4e50f..27bf61c177c0 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -368,7 +368,7 @@ static const struct line6_properties podhd_properties_table[] = {
 		.name = "POD HD500",
 		.capabilities	= LINE6_CAP_PCM
 				| LINE6_CAP_HWMON,
-		.altsetting = 1,
+		.altsetting = 0,
 		.ep_ctrl_r = 0x81,
 		.ep_ctrl_w = 0x01,
 		.ep_audio_r = 0x86,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
