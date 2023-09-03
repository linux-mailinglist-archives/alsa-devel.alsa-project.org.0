Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53006790C01
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 15:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731A7206;
	Sun,  3 Sep 2023 15:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731A7206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693746506;
	bh=hK5w5fhJqvCjA4eQXnAMdg5kcqUfGQMUg+iau9ya/EU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V5YPRVoZI8SiotWdEm985GAgwXS4wa7QKx3O2lVoc2PQUh12ofSj/VZ7CNwbCNZnI
	 nY9xkImD78mbm7pvV6AXK/0x7GvSXkaxkwH+u+4EcjtFRlFmrHDfCusYZ4LoMDS6m9
	 34Fyiu//2OrKfe/lRf48i7k2WqUOcuWvZK7axnzg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E50B0F80431; Sun,  3 Sep 2023 15:07:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8965DF80431;
	Sun,  3 Sep 2023 15:07:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35DB5F8047D; Sun,  3 Sep 2023 15:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9F94F80236
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 15:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F94F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=Isp4NlJi
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id cmniqQ8hcCR96cmniqWxe4; Sun, 03 Sep 2023 15:06:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1693746365;
	bh=O220rzlIlLp6o2xfxGxBVH/zqfS61CmNj2d3+epiJpo=;
	h=From:To:Cc:Subject:Date;
	b=Isp4NlJiXf0F+xOmZ1F1oiBm7dh/goI15PQk/DF3YbHfSuFKleoK3ZOv8NTYT9SlY
	 RqoUlPlgP0q6R9zwNteU/O7zq4hJweT30R32NaoDsJ8uEbaFwMx5XvVeDw9Utw7yHt
	 ccGob7O4Xw0vUhEiPxM6/Qvz5AUKFs0JcB5RwJMw+7FNxBmW0qkK0V3OO+lcLjTM5z
	 70zyTyWAr9T6QTIYDQ1UA4Yb7naP7EptKPeRFvYFZGPQa7jrL5qmyuNA5iA15dguBF
	 vhRrFOUpSRh9/UQiZI6pdGiUHitKj3o7rT6tM3+RNUUHrdSfSlm2ZnXhMYz2vK3zO5
	 XXFLD6RN/T7yA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Sep 2023 15:06:05 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix a potential memory leak in
 scarlett2_init_notify()
Date: Sun,  3 Sep 2023 15:06:00 +0200
Message-Id: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YIVXVWB7DLHTF4LBUOAARPAJ6OXXQJJC
X-Message-ID-Hash: YIVXVWB7DLHTF4LBUOAARPAJ6OXXQJJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIVXVWB7DLHTF4LBUOAARPAJ6OXXQJJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If usb_alloc_coherent() or usb_urb_ep_type_check() fail, we should release
the resources previously allocated.

Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/usb/midi2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index a27e244650c8..4109c82adff6 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -302,7 +302,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 		ctx->urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!ctx->urb) {
 			dev_err(&ep->dev->dev, "URB alloc failed\n");
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto err_free_all;
 		}
 		ctx->ep = ep;
 		buffer = usb_alloc_coherent(ep->dev, len, GFP_KERNEL,
@@ -310,7 +311,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 		if (!buffer) {
 			dev_err(&ep->dev->dev,
 				"URB buffer alloc failed (size %d)\n", len);
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto err_free_cur_urb;
 		}
 		if (ep->interval)
 			usb_fill_int_urb(ctx->urb, ep->dev, ep->pipe,
@@ -322,13 +324,22 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
 		if (err < 0) {
 			dev_err(&ep->dev->dev, "invalid MIDI EP %x\n",
 				endpoint);
-			return err;
+			goto err_free_cur_dma;
 		}
 		ctx->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		ep->num_urbs++;
 	}
 	ep->urb_free = ep->urb_free_mask = GENMASK(ep->num_urbs - 1, 0);
 	return 0;
+
+err_free_cur_dma:
+	usb_free_coherent(ep->dev, len, buffer, ctx->urb->transfer_dma);
+err_free_cur_urb:
+	usb_free_urb(ctx->urb);
+	ctx->urb = NULL;
+err_free_all:
+	free_midi_urbs(ep);
+	return err;
 }
 
 static struct snd_usb_midi2_endpoint *
-- 
2.34.1

