Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C1472AAF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 11:54:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858BB18DA;
	Mon, 13 Dec 2021 11:53:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858BB18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639392856;
	bh=FW5jW9IjJWvPkSVtfjZFlH2pte8TKVk1aueO6qntP/M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LdLX9MqaNiIGLiDQIVJl0/Ami/Qr/E4m/xAwVCvbMCwiEcOCcmt6DSqugPwnOxw4S
	 gaVHnd9xCvUkQioI36JU01Fx2JeJPRIVTfSvRMtyQFnoIJ0Ywki3VKVuytX5wA1QCY
	 22CLjdRkmeH0Xer/donqssYURXLYnycaQCJ+j26k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D40EBF8025F;
	Mon, 13 Dec 2021 11:53:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF859F8025D; Mon, 13 Dec 2021 11:53:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com
 [162.62.58.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC2BAF80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 11:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2BAF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="p0PWhaMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639392771;
 bh=u1lc4/21RdKYP+fM/Qi93hsRzybEub1fMzz15gjnxfk=;
 h=From:To:Cc:Subject:Date;
 b=p0PWhaMjFjpDvd3UvdMluqKsiwJGefDKw1LnSyzPEXbEuV8dUfJqundSvJKqb6+xc
 mue1x1boRZFdK2LrCvmv3sQvyXV1Fidtxi2+CA6yU+crlVZM1HxzPamjH5b0P/Eblg
 p60WdMoyk2QqmRptOSXDvqCDkoP1XUQXy5J7al6U=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id D3130477; Mon, 13 Dec 2021 18:52:49 +0800
X-QQ-mid: xmsmtpt1639392769trvav6rqp
Message-ID: <tencent_1E3950293AC22395ACFE99404C985D738309@qq.com>
X-QQ-XMAILINFO: MmWQdRkIb8niVI+ZUP/cjeYl0mj3kIryaWYG8J1BmJSztV9ztwQoOc4xjAK1/s
 W6if+2yi0jx1j1ZaDcJSg14N/vegmwvdAbefeLI7kd5zPkfBT1F8u7q4+LHDiwHcbJiQPvM7eP1b
 SWhZ20rKiPi0gFqg/wNMXhy92ev3S9mO0+bG1YmSotrcHeBqz2pKidpTQSlcTavsAWy807sRKYcA
 tWFJnvVldyAlIOrWfKCD+nFqF4OC0lkmT4DhN/Vb+wkn8Ae+u424O0wCJawuMRD/py+bhy/iriYX
 egzN69m+p2OwUCRSlHoON3Ur+v82nqRJOGcc3p1jpUmwENL9GaZGu/9Uvb7yUj+P29WJdFOiVvq3
 gp2i4+LHtshtyBK+DnY+zBek4bZLliIl6LDD6hM4QXYnJT8Jy0ksPmTkExUlnHh4Z7FJa3uXTJmX
 8m1YTCCQkkioyNodguHq0wkMklgGXMChDr+9VeLbtufaA1P6xz0T0t7+9HqZR88PS/KoADVLrQR6
 ZJCRdc4xTUZpSvbiO9ByorPI0vQS1O7g+53tp29xhDHaCt8Ut6U/2I7RuHH78OOzd6o8RQiuRt7S
 nWFgx5eqc1IgMrwXZw5BS8Q+/L7aid4bKEeyu378yYkPPP4XyUuSAVY9wwI8XnLVEofDRBP/ySkD
 m3qD5a0+iCCUdtsh0iOTZLaBk/1GHJO7y9WoTYpWyNRICxtjIXhZkfhP6bMgCovCvO4C0f4ZGrSq
 GN0w1/+wg628GwPTHx4bjcajZcS5EFb5zAtUjDEwKl9Hm8kpXoM2A7GPv5xTFZ2YhuqsvxopB9z+
 M1HblEGmW/aJY+fXHbtp/7FmJFMq8KT4EEb5i3LdwDOHg5Taifenq3BK9SWx9Ap2Qp6kvzS7x2VA
 pcDpsyiiHL
From: Xiaoke Wang <xkernel.wang@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: sound/isa/gus: check the return value of kstrdup()
Date: Mon, 13 Dec 2021 18:52:32 +0800
X-OQ-MSGID: <20211213105232.1052-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
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

kstrdup() returns NULL when some internal memory errors happen, it is
better to check the return value of it. Otherwise, we may not to be able
to catch some memory errors in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
Changes in v2:
 - add the proper error handling.
Thanks for the suggestions from Takashi Iwai. In the future, I'll pay 
more attention to what he mentioned.
---
sound/isa/gus/gus_mem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index ff9480f..4c691db 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -199,6 +199,10 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 		memcpy(&block.share_id, share_id, sizeof(block.share_id));
 	block.owner = owner;
 	block.name = kstrdup(name, GFP_KERNEL);
+	if (block.name == NULL) {
+		snd_gf1_mem_lock(alloc, 1);
+		return NULL;
+	}
 	nblock = snd_gf1_mem_xalloc(alloc, &block);
 	snd_gf1_mem_lock(alloc, 1);
 	return nblock;
@@ -237,13 +241,13 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
 		block.ptr = 0;
 		block.size = 1024;
 		block.name = kstrdup("InterWave LFOs", GFP_KERNEL);
-		if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+		if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
 			return -ENOMEM;
 	}
 	block.ptr = gus->gf1.default_voice_address;
 	block.size = 4;
 	block.name = kstrdup("Voice default (NULL's)", GFP_KERNEL);
-	if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+	if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
 		return -ENOMEM;
 #ifdef CONFIG_SND_DEBUG
 	snd_card_ro_proc_new(gus->card, "gusmem", gus, snd_gf1_mem_info_read);
-- 
