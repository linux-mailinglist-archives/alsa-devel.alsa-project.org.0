Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8E4C6254
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 06:04:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32B31708;
	Mon, 28 Feb 2022 06:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32B31708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646024665;
	bh=FdOYa+LEomGd82cf4oEJt1f3p762ZODo5r7rHfRdrJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYGALiU3rjLz4j/YYY2OTdY6hu6wA2vLla/c+KOD9X9em8f6vfFfG/wWzo/z06HmC
	 2IalW+T4Ti2OoknbtqrED1cjMt2mkMbjrsNtxLXdOaYfScSvE4pRx8btVm7WLnVrKi
	 GNGzHU/1/hJ0x3YSfbHzp0B/L10zEbqK749tHUtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC53F80154;
	Mon, 28 Feb 2022 06:03:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B53F80154; Mon, 28 Feb 2022 06:03:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A7C0F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7C0F80125
X-QQ-mid: bizesmtp89t1646024586thfoje1b
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 13:03:03 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: F3yR32iATbg9d5KYQoSp6pbqoXLzpCAtG22FQb/l2d/WkjkQ8W2X83f0xqELi
 ioPVP2wdmyr+G9ms9m4klr5ImSsOwKlK9kljCNPU+W8BsEomi5gA7urgpjE8PxUUSi/7ZGx
 kFMIpTZ/0Hb6SoMWZVRuMhcbMjbCKISv+EFwLq1RO8bZEsedwO96RUfe4Z0uVr8RA4fb3J8
 jNyGaUjArZjHt808yF8FhsqAQU1JW3jNqqJEp4tF670bUJANIY29fNeMhL/AbPPsu365Nwb
 tIcvfX54Ah8Lc+vofq9eBCsdNTPFrkiH7u67Q/VKQwo80BetBDI47mo1aHj73Ayas0tlp01
 X6OIN1ITReTYFjWmbHIV8h+vCC7gI1OEfRmjTUBE/cxJRyvAL8=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v4 2/2] ALSA: core: Remove redundant variable and return the
 last statement
Date: Mon, 28 Feb 2022 13:02:53 +0800
Message-Id: <20220228050253.1649-2-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220228050253.1649-1-tangmeng@uniontech.com>
References: <20220228050253.1649-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: Joe Perches <joe@perches.com>, Meng Tang <tangmeng@uniontech.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Return the result from file->f_op->open() directly instead of
taking this in another redundant variable. Make the typical
return the last statement, return early and reduce the indentation
too.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
Signed-off-by: Joe Perches <joe@perches.com>
---
 sound/sound_core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index aa4a57e488e5..3332fe321737 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -577,20 +577,20 @@ static int soundcore_open(struct inode *inode, struct file *file)
 			new_fops = fops_get(s->unit_fops);
 	}
 	spin_unlock(&sound_loader_lock);
-	if (new_fops) {
-		/*
-		 * We rely upon the fact that we can't be unloaded while the
-		 * subdriver is there.
-		 */
-		int err = 0;
-		replace_fops(file, new_fops);
 
-		if (file->f_op->open)
-			err = file->f_op->open(inode,file);
+	if (!new_fops)
+		return -ENODEV;
 
-		return err;
-	}
-	return -ENODEV;
+	/*
+	 * We rely upon the fact that we can't be unloaded while the
+	 * subdriver is there.
+	 */
+	replace_fops(file, new_fops);
+
+	if (!file->f_op->open)
+		return -ENODEV;
+
+	return file->f_op->open(inode, file);
 }
 
 MODULE_ALIAS_CHARDEV_MAJOR(SOUND_MAJOR);
-- 
2.20.1



