Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A74C59E0
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Feb 2022 08:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5798C179F;
	Sun, 27 Feb 2022 08:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5798C179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645946099;
	bh=pQzsazlHm6XEMv2XBuFvgWM8b0duypkIZ6WiHYfzCFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3oEUI12Fgm0adVVm0S+GYpnJR1nzkwlBO4y4NxTalwTHzwPqaiooE8Os7owx56QF
	 pjGgsdMUDX87AkXklaUdz1nsXOGrlxblnrfo0sly1zAH6nZnbvtUNbKRGTpaM7fuwB
	 slfRO6sgzy0Yxxn+OlaVAltzbiAsMjmPTt39SZxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7315CF804DA;
	Sun, 27 Feb 2022 08:13:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0D3F800B6; Sun, 27 Feb 2022 08:13:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3EDAF800B6
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 08:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3EDAF800B6
X-QQ-mid: bizesmtp70t1645945985tco67mqj
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 27 Feb 2022 15:13:03 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: 3uawQE1sH+2lICw+ZedXyXmezZ02nfmW2VAb3WTGJhCcG/Sjh/B+KE7HY3msG
 zJVyJ6z4h/heNy95zLfEGLrB+d7aX6Q1KpSvyvNtdrE4fA4aX41ImHD96Yn8TIxIZqlc5fT
 yOj8Iwfz0J+fLU/IuGWXIy8FpJqSx9AqxGkyynfXwMJZkIL2+WENoLDLlKKUjLSl/O4bmtH
 f5ZZjC+sqri9ZZtCuerJph3EIetiOlWM9YFCAeP/8T0CpoWzDUW52H42D/ugcllaJOAlDUK
 cvo5Tkze721SNajnnpy6iRhG03jnermB6wm5xxA1UAVM78/IjWI4hrdKnry4Ipxk2fQMZUc
 YUycIqFyilaHy7DnKQ+fr5C33CPXByE9dkE4zf3
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 2/2] ALSA: core: Remove redundant 'err' variable
Date: Sun, 27 Feb 2022 15:12:53 +0800
Message-Id: <20220227071253.28193-2-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220227071253.28193-1-tangmeng@uniontech.com>
References: <20220227071253.28193-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
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

Return the result from file->f_op->open() directly instead of
taking this in another redundant variable.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/sound_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 2ee54070b2b5..e7fa820b08be 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -586,13 +586,12 @@ static int soundcore_open(struct inode *inode, struct file *file)
 		 * We rely upon the fact that we can't be unloaded while the
 		 * subdriver is there.
 		 */
-		int err = 0;
 		replace_fops(file, new_fops);
 
 		if (file->f_op->open)
-			err = file->f_op->open(inode,file);
+			return file->f_op->open(inode, file);
 
-		return err;
+		return 0;
 	}
 	return -ENODEV;
 }
-- 
2.20.1



