Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7F4C6250
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 06:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B9516E6;
	Mon, 28 Feb 2022 06:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B9516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646024494;
	bh=Bmid9a8UKFbaNYHPyDJdQHOnTYZMp256/rXKGnOE6m0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zr8KXw1gl3Mxafpvc1D43PYXXMkNDLhqnmA0Z4yasf9B/15+evNVDeUk9MRU4OFXw
	 2nPMaCrq0EAWtygukgil+RNdQr1A11GYod2+FxBjU3Ltz22ha4Bz7pO0Dc0DrluV1Y
	 NGX1Ab88h8Yb/+J7C8DZ68NsN2i8FT1SdQkozlhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01230F80054;
	Mon, 28 Feb 2022 06:00:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CA90F8015B; Mon, 28 Feb 2022 06:00:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90BE0F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:00:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90BE0F80128
X-QQ-mid: bizesmtp65t1646024415tgb8fz03
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 13:00:13 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: F3yR32iATbiob0GwumxSEecyqtbY2ZSDQEfiAHX9Jy4WUUwlk/vzNs9XabPiU
 3sU/gC1KLfAtN0c0h6J/3ARq4Dn6YVqOqRl+78uSQq9JkA0KZIav/4yv62k6ERNm6FbOxLZ
 1rfoiLiWAJi0FsF4DQRCK0Z0PalGZUkIFFX4TuMqTa16RvtGEkhxr05v2QPNQ17TapcAH3P
 ozeKVgqzGszy2SXixvrznqbM6R3hyb5urNIag/uI5RIXrXa1HmbvmhtIbYiIglVW3hhVYjA
 3ozIqcMuTXLEfAeitWHjkbhoYJ2orxNvZn+i8Id3iLEZTNoRMXX8Q79CYGlsbN5QuUSMzx0
 ZqjXd6XMM3+gmCzjnqiqHJKAbhnNyj/f3rRDndlyq2/LoWKCkg=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v3 2/2] ALSA: core: Remove redundant variable and return the
 last statement
Date: Mon, 28 Feb 2022 13:00:03 +0800
Message-Id: <20220228050003.32509-2-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220228050003.32509-1-tangmeng@uniontech.com>
References: <20220228050003.32509-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Cc: JOE Perches <joe@perches.com>, Meng Tang <tangmeng@uniontech.com>,
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
Signed-off-by: JOE Perches <joe@perches.com>
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



