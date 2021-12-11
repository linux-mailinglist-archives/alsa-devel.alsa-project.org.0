Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B301471947
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 09:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC68F1AB0;
	Sun, 12 Dec 2021 09:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC68F1AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639297572;
	bh=13AT5D+FOJfPuY4u/Gjpk0HrVbNN/EMrwNqKixlp96k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f6/xUttnYlfh6F951UMePHvdo3+46U8B/VhYZ+m0Rz22Gyv0+eVNFi0t0vghDiY7a
	 1hZN3d0VSYPjpLAvZ55kTg+D6GmKl5s8TKlbnx8JLyRmEFjnyC8OeV56motm6IEHKz
	 MXvUOhmq5rTn3ULEeg9oD89Hc8qNrPGDZFJbnvGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55FB7F8051E;
	Sun, 12 Dec 2021 09:23:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F89F804CC; Sat, 11 Dec 2021 18:14:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9584FF80059
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 18:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9584FF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="PNNpqr3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639242856;
 bh=p5n6NZ013xXHxvRMkqqySCKi6/eXKwLtJ9F70QGZc0o=;
 h=From:To:Cc:Subject:Date;
 b=PNNpqr3SDUzMWFdxHwqoEf2l9o2JFteDBrFBw5T1Zf8NRbPOayM5yTULYu/dVD8AL
 S24nPIcVrr8waJhUDN0tSM1DqyaePhFUgvOWaRCp6DL2iEhFCIoXyNiBX4ZHIwHnsw
 7JtG4n9nJvI+tEDNu5O/uALqhKj1W+vQkGmlDNqQ=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 38E23CFB; Sun, 12 Dec 2021 01:14:14 +0800
X-QQ-mid: xmsmtpt1639242854tyvogz8ro
Message-ID: <tencent_3D368E118A8AF018A5B1FF16904166B2DC07@qq.com>
X-QQ-XMAILINFO: MgQY1K25Ph0m5cskmfXkJHT32Ic1Br3p3xihwpPCyouDYfrcqXKmOpkD63Sjx7
 JyAGlAGzvwR6jpDyiBKNosnXPC1dB3XyPG068Su9qs80c5yoGZh4zfBVW41hSlvbvIvctzAAiz8G
 E0SWDFjMFreEdLgrO5q1QKG21yk0ioYpxzI51MZVj94+SS4FmmtqQ6QkQVGy8hyOWi2KbhdcHRBC
 eyxyldjOaM1Uao7RMKEI9C+WIYIFt7aCBbf7MyZEk95+eXwzufIjfpz/TVuzoKH8SmIpzQ+I1aLE
 1m87OHjOqUUL8Gpxo0pXYb4bobFRIY+bzvETxKRPnXz/5RjXJtwNwfDcTnxTe8BdhOvv8WiClWjJ
 YB56GH6UpDlJP1eM583pB0r+QkZM/AqkT/ZiKcAW2SgXWw30kdBDXnI0R+b11WV7xYQikaGfaa89
 LXgOIlZzniQyUWkmu3qRov3TgDQPUZ7BkmetbCufQj6cWm+WEGEQoFAnLF2MDOZFwIDoVbW+5KoX
 Fe9DCtBtK/Hi9Go3MxqZW5/Ds11AJG3CEhCYtdfN47gppFes8qAv173/uD8G8yhsyjBE80W3gwRA
 6IjV+0m42G73ZifF7ldg92g17Df+Kid/oVnl8kVDBDR/aJCNB5VV/5VLHY5/4SFnxfZ4GEzsbElv
 DCb4M8BVSh3aT2J94kLVSd3BuASMI0qy67kN5cxUE18fQHiVsnfbpOh2mJHHS+2f5FbSSNR60whu
 AKJddfRfeiUj+wFTpCPu0NrgvmEmn8tT7418KKvqc/9TssniSNxBc6/7PdU2NVZEwDANYb87f46H
 N8FE9i2CSgdODnJEXEKq0s/zzCdsd8/cRS964oXgIXA/Ty8gkAZ617idelnZyVnfClR072LNt7Jw
 ==
From: xkernel <xkernel.wang@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: jack: Check the return value of kstrdup()
Date: Sun, 12 Dec 2021 01:13:26 +0800
X-OQ-MSGID: <20211211171326.872-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 12 Dec 2021 09:23:26 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 xkernel <xkernel.wang@foxmail.com>
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

kstrdup() can return NULL, it is better to check the return value of it.

Signed-off-by: xkernel <xkernel.wang@foxmail.com>
---
 sound/core/jack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 32350c6..5fd9954 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -509,6 +509,8 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		return -ENOMEM;
 
 	jack->id = kstrdup(id, GFP_KERNEL);
+	if (jack->id == NULL)
+		return -ENOMEM;
 
 	/* don't creat input device for phantom jack */
 	if (!phantom_jack) {
-- 

