Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2BA7135C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 10:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092DB60193;
	Wed, 26 Mar 2025 10:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092DB60193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742980292;
	bh=NnQwNZhrJn0kJOUxGptj8Ywrr5SlWHhb++N9tf5qPV0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HtXctX9m5YqfE11Nd4bco7RlyCo+lMbI7I6Ahes5/Md4PxkKdqQEZZA1PMOb72OM1
	 SultmgATLdXupMjNYt47/8qETulmpdyEV0WGGTzHbHnLE3pjSfsp3/f9Lw3NEa0kPq
	 Ltnoq+GStOhU3bHlavJFpBbVfrIKJ9EIG6fnzM7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B28B6F805AE; Wed, 26 Mar 2025 10:10:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96422F805BD;
	Wed, 26 Mar 2025 10:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D873CF8013D; Fri, 21 Mar 2025 19:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F3F9F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 19:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3F9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nppct.ru header.i=@nppct.ru header.a=rsa-sha256
 header.s=dkim header.b=VFhFFPxN
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 1D3881C17A6
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 21:27:16 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1742581635; x=
	1743445636; bh=NnQwNZhrJn0kJOUxGptj8Ywrr5SlWHhb++N9tf5qPV0=; b=V
	FhFFPxN0iOOYIXzPPmogOULoKLMWG3s+KIRocSY73nJRaPQ+92UXVt7QR4yQOijL
	LNYMgXZSGTECc8lHtV/0mBhSGv1tkGgMSCumxaCKfOWTSGnK+Euimw3UhjmlJd+M
	4JH+75YrJo0dzKIF/K6mrW1SfKrkuekMJKuSBq765g=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m9x-fwYPZ4B5 for <alsa-devel@alsa-project.org>;
	Fri, 21 Mar 2025 21:27:15 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id E0C2B1C16F4;
	Fri, 21 Mar 2025 21:27:09 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	syzbot+4e7919b09c67ffd198ae@syzkaller.appspotmail.com,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.1] ALSA: control: Avoid WARN() for symlink errors
Date: Fri, 21 Mar 2025 18:27:00 +0000
Message-ID: <20250321182701.1729403-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sdl@nppct.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HNOWTJN7X4B3TQRYWFII3HSF3ETDCKIZ
X-Message-ID-Hash: HNOWTJN7X4B3TQRYWFII3HSF3ETDCKIZ
X-Mailman-Approved-At: Wed, 26 Mar 2025 09:10:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNOWTJN7X4B3TQRYWFII3HSF3ETDCKIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

commit b2e538a9827dd04ab5273bf4be8eb2edb84357b0 upstream.

Using WARN() for showing the error of symlink creations don't give
more information than telling that something goes wrong, since the
usual code path is a lregister callback from each control element
creation.  More badly, the use of WARN() rather confuses fuzzer as if
it were serious issues.

This patch downgrades the warning messages to use the normal dev_err()
instead of WARN().  For making it clearer, add the function name to
the prefix, too.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Reported-by: syzbot+4e7919b09c67ffd198ae@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/675664c7.050a0220.a30f1.018c.GAE@google.com
Link: https://patch.msgid.link/20241209095614.4273-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[ Alexey Nepomnyashih: changed &card->ctl_dev->kobj
 to &card->ctl_dev.kobj. ]
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 sound/core/control_led.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3cadd40100f3..6d81a6a59f29 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -688,10 +688,16 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 			goto cerr;
 		led->cards[card->number] = led_card;
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
-		WARN(sysfs_create_link(&card->ctl_dev.kobj, &led_card->dev.kobj, link_name),
-			"can't create symlink to controlC%i device\n", card->number);
-		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
-			"can't create symlink to card%i\n", card->number);
+		if (sysfs_create_link(&card->ctl_dev.kobj, &led_card->dev.kobj,
+				      link_name))
+			dev_err(card->dev,
+				"%s: can't create symlink to controlC%i device\n",
+				 __func__, card->number);
+		if (sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj,
+				      "card"))
+			dev_err(card->dev,
+				"%s: can't create symlink to card%i\n",
+				__func__, card->number);
 
 		continue;
 cerr:
-- 
2.43.0

