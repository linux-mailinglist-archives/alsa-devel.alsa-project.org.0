Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B00790BF6
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 14:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58706206;
	Sun,  3 Sep 2023 14:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58706206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693745064;
	bh=fkT7NN9aEka8o3o986AJ2AXPaAwyFxw3rtZ6pKH9uYI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D2/rRUX3rX2YU0leX3y5nISUumkmcwtKSQmLRog2dm0OS+NIu9pT7U/Pce2UjvPCi
	 TgeE9F/PxY2w1UUIDsZW4sbaanRSxuZoKKUkULRakPPBpeT0s3Gs0rrT0v7m0hu5lf
	 B8O78QjEigTiHghsdKgCWOkREHbhKAkIVOhBa3k8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BF3AF80551; Sun,  3 Sep 2023 14:43:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C214F80431;
	Sun,  3 Sep 2023 14:43:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 577B6F8047D; Sun,  3 Sep 2023 14:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A30FF80236
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 14:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A30FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=p3cOoNST
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id cmQEqRX1vhaW6cmQEq3SIb; Sun, 03 Sep 2023 14:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1693744910;
	bh=PHniSO2zYUYgC/x8zH3jPDQE+1EC8XtwBC0f5Q2U7xI=;
	h=From:To:Cc:Subject:Date;
	b=p3cOoNSTCEea5D5oUBy6qdvbEiqZFrWMjMElRRmZoMrmpAH4hBl2M8hACnmdhqJ1i
	 EyCgf1nubhvpvq8HCStgz6nhrJ46QIxGmTJEQmbJfozESIV2/yenVMQxiPmpqLnRpj
	 PlxRM3AyqRlwAJyihfsYOvfZsbjQhcWuE7fs3KqTRvGjKFNEJz2VMwNqCbt28PZspL
	 As87C0CVcy08dt5rfQ77esx7au0YZbXMUtAmJW7NaeuKfc7f/wIP5CEu6bBn+YXVZM
	 CGxdk1/HBxGPwRSVWbIMvxjpTyvFGS+kv6fnQqZQ7lWsBhs4wA6qCVnG1LMEmwVwDw
	 OSJT2CuRgTevg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Sep 2023 14:41:50 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: scarlett2: Fix a potential memory leak in
 scarlett2_init_notify()
Date: Sun,  3 Sep 2023 14:41:45 +0200
Message-Id: 
 <73aab53d53df156a5df2bc61314ff26448526749.1693744859.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RSXKAVBYCM5OXT6IO54YXUEZPFGVTUHW
X-Message-ID-Hash: RSXKAVBYCM5OXT6IO54YXUEZPFGVTUHW
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSXKAVBYCM5OXT6IO54YXUEZPFGVTUHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If kmalloc() fails, we should release 'mixer->urb'.

Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/usb/mixer_scarlett_gen2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 9d11bb08667e..a439c7f64b2e 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -4060,8 +4060,10 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 		return -ENOMEM;
 
 	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
-	if (!transfer_buffer)
+	if (!transfer_buffer) {
+		usb_free_urb(mixer->urb);
 		return -ENOMEM;
+	}
 
 	usb_fill_int_urb(mixer->urb, dev, pipe,
 			 transfer_buffer, private->wMaxPacketSize,
-- 
2.34.1

