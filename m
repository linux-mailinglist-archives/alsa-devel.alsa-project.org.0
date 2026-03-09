Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOdCGSiUrmmmGQIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:34:32 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BE236370
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ABA5602AB;
	Mon,  9 Mar 2026 10:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ABA5602AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773048871;
	bh=msN3ZiJEnwDLoCFL3ktp3bf7S5AjPmhNHN71nh2kZjg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ajcLhsgA88ijfpmYkDCeyxpFTXL7nXLTJUehlxgw2n0RwZQW/OOFtfEozYEKo8Noz
	 CTOr9onFmKIoNRZBn5PC+bsLWJHRFKpxcZJ2uoLbC2gIGkJeXWPsoEXVDf2wMD7yHp
	 xHnK+t6VRPP9YnqzcUUXDJwbjpFjRaPnB3YETaj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98EF1F80610; Mon,  9 Mar 2026 10:33:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A7E3F8061A;
	Mon,  9 Mar 2026 10:33:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4DCF80571; Mon,  9 Mar 2026 08:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 452CFF8001E
	for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2026 08:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 452CFF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=FipDDQ/5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ST
	Qwf4PoSneb90M0vtP5ikDTJD5DzHGA/Ui7t+WaGNw=; b=FipDDQ/5Hfe1297mbd
	2cShBsiOGj2SnIdBRKQCJNbQ7MA1dLjmI4zzQmJHYgj7HL5831r6ph8ICjboaU/A
	rMmQAhmDv0S/l8WzqkeDU9XQC/PVNdlghOLIBAgAdamqkLo2ZglfOHvAh3TFbccj
	wzjETc+4PsybJeEg0+8EFWWhg=
Received: from pek-lpg-core5.wrs.com (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wA3bfoPda5p73LiOg--.36932S2;
	Mon, 09 Mar 2026 15:21:52 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Cc: Robert Garcia <rob_garcia@163.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] ALSA: control: Avoid WARN() for symlink errors
Date: Mon,  9 Mar 2026 15:21:51 +0800
Message-Id: <20260309072151.2462506-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3bfoPda5p73LiOg--.36932S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy7Kr45CF4UJF47Gw4xXrb_yoW8tFy5pF
	4jganrt3Zrtr9rJa9rur17Wry3Xan7X3W7Z395KrykArWfAryrurykKrnYqFy3AFZ3JFyU
	Xr45JF1v934akrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR_wIhUUUUU=
X-Originating-IP: [60.247.85.88]
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbC5RFn0mmudRFzgAAA3R
X-MailFrom: rob_garcia@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation
Message-ID-Hash: H3VMT3YIHT5ALMXAS656UBNFUEKFQJBO
X-Message-ID-Hash: H3VMT3YIHT5ALMXAS656UBNFUEKFQJBO
X-Mailman-Approved-At: Mon, 09 Mar 2026 09:33:24 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3VMT3YIHT5ALMXAS656UBNFUEKFQJBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: DF5BE236370
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[163.com,alsa-project.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:tiwai@suse.de,m:rob_garcia@163.com,m:alsa-devel@alsa-project.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[rob_garcia@163.com,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rob_garcia@163.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,msgid.link:url,appspotmail.com:email,suse.de:email]
X-Rspamd-Action: no action

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit b2e538a9827dd04ab5273bf4be8eb2edb84357b0 ]

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
[ Use card->ctl_dev.kobj to keep struct consistent. ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 sound/core/control_led.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3eb1c5af82ad..df836ff550f8 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -693,10 +693,16 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
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
2.34.1

