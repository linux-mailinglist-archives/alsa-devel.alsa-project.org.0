Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484EC7AAAD6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 09:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A267DEF;
	Fri, 22 Sep 2023 09:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A267DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695369278;
	bh=L5vy6RwzEPcOwMXiTeLuAKLW5Um5lmpsw25dx7JxhfQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U/15QUDoI1DwAj6mfHv/hhf8TJS65MhjfsEjboSneULv9dsg9TmGgyNWuxHpEc9xr
	 HHbQ5RCOkDLeOn+D8EYaGowyDFmy57fD9qxIQ8gH+xK6zXo2xGhy6fuDe3cUHbQsl4
	 VRZ8v0EI5FKRXAG2dRRAuDfHj2uRK+2vMsL6eVrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70C8CF8047D; Fri, 22 Sep 2023 09:53:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29429F80125;
	Fri, 22 Sep 2023 09:53:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4138F801F5; Fri, 22 Sep 2023 02:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86AADF800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 02:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AADF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=marliere.net header.i=ricardo@marliere.net
 header.a=rsa-sha256 header.s=zmail header.b=CawUBV8S
Delivered-To: ricardo@marliere.net
ARC-Seal: i=1; a=rsa-sha256; t=1695343962; cv=none;
	d=zohomail.com; s=zohoarc;
	b=gx/PDXOp9fJP1H3Mmco4a2vkqGUGk8O9bFLvii12wfX7tZ5NEDK/oLC0Y7i9rONR2eealv8miCn+pQckoYgLcbOGdcga9xdG2Nm051s6poqmJsHDBRflWMElH0e27xgwZUFxRrPG1xIm9dju3c1n2SYO86lfL3l9YmR6Q22POhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1695343962;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=2zFhR/B8Wliu/U9DfZEw9AYH1z4/jqjAMIdokfhTfU0=;
	b=Mjuq9ydmy8uNdJ5AtD1amYv6PkjQNMj7j+9uF2YhQOE5qYEoDsHWPQUD5JonEnlZ7YPbLg9RBUHgnZbicL/7si2Gum6XOodNYrWBJWX1xG8cw4do2zqoJ88TWumhZfarYBwVrnL3W3z6YiwQv7YKwxOTb2mHuERHDlBVFkPMD4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=marliere.net;
	spf=pass  smtp.mailfrom=ricardo@marliere.net;
	dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695343962;
	s=zmail; d=marliere.net; i=ricardo@marliere.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2zFhR/B8Wliu/U9DfZEw9AYH1z4/jqjAMIdokfhTfU0=;
	b=CawUBV8SyXJkq63xYRlDA+vjyMmegrcXA5LU+GUN75yX/z0PmOuxVIL+SbBNqK+l
	Q5hFrAnzvTBOykkEiHmVrPPWay/xtFtVJn5ojeyUZMUHzMuRX3O00Aa7pFpjVy3JWuH
	NLuul+L79+sEIdZxp0SRWpd49LQzh4DxnLj+Hygs=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
	with SMTPS id 1695343961324118.64966551399345;
 Thu, 21 Sep 2023 17:52:41 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
Subject: [PATCH] sound: usb: increase snd_card alloc size
Date: Thu, 21 Sep 2023 21:51:53 -0300
Message-Id: <20230922005152.163640-1-ricardo@marliere.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-MailFrom: ricardo@marliere.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ED6F3MPPGCIOWY25LMQKXIIJ6TNU3KH2
X-Message-ID-Hash: ED6F3MPPGCIOWY25LMQKXIIJ6TNU3KH2
X-Mailman-Approved-At: Fri, 22 Sep 2023 07:51:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ED6F3MPPGCIOWY25LMQKXIIJ6TNU3KH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Syzbot reports a slab-out-of-bounds read of a snd_card object. When
snd_usb_audio_create calls snd_card_new, it passes sizeof(*chip) as the
extra_size argument, which is not enough in this case.

Relevant logs below:

BUG: KASAN: slab-out-of-bounds in imon_probe+0x2983/0x3910
Read of size 1 at addr ffff8880436a2c71 by task kworker/1:2/777
(...)
The buggy address belongs to the object at ffff8880436a2000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1 bytes to the right of
 allocated 3184-byte region [ffff8880436a2000, ffff8880436a2c70)

Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.com/
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1b2edc0fd2e9..6578326d33e8 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -619,7 +619,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	}
 
 	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
-			   sizeof(*chip), &card);
+			   sizeof(*chip) + 2, &card);
 	if (err < 0) {
 		dev_err(&dev->dev, "cannot create card instance %d\n", idx);
 		return err;
-- 
2.40.1

