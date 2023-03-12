Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF46B6BF8
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Mar 2023 23:30:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697DE1424;
	Sun, 12 Mar 2023 23:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697DE1424
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678660207;
	bh=h3mDD9V3RraGDU/VpKbobrz/Y1YCr7Kb5j9JSQ1T7uk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Cymhj4p5KbV0E1+gobjbmkR4I1Lv7lvuIm/9D28LokO54UCCClbDE3CqxxrY1dZK+
	 Id6X98OqLwIkkllHHVOlcTwKihs1D9LBWv+0Xg0jaxpbw8NTsulp2uJ4GN3YqvDCP6
	 waj51FTwaARNZnBxL9ZAE8+1ymvMBgCbZeyDa1Rs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F32F800C9;
	Sun, 12 Mar 2023 23:29:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B06FF80423; Sun, 12 Mar 2023 23:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C676CF800C9
	for <alsa-devel@alsa-project.org>; Sun, 12 Mar 2023 23:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C676CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SdNC01Qv
Received: by mail-qv1-xf29.google.com with SMTP id nf5so7199188qvb.5
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Mar 2023 15:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678660139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bm8357knKBz2M26Sj/9hOvriOOgO862bSiwrgatoRU=;
        b=SdNC01QvISkfUd6mLyOxMYpMiwmohWX04EGJAd2LdJQUqBvKn34hqgFX+/kqLRhr2T
         ea3DWFMAUIW33aTPAVp+t40D5y6yzgqvmlsx8qqIm05cq6ZcUEw4s1CFCDNLbEKT1QDr
         1UvQEoIbGif4Ihb7LEMu1rsdXDjcXWSMwDZM/kZr540WMJJNTQbDaV+L1qyRU4mDSDd4
         zUJFcGPoZhoLfvTIZdZHLHsWnQlNBzRieoZJLYUeW7a1BpU2HREPgf91DdiAitWw4+lh
         minpXg+W/qbA7aA+WI5J984ZcNd7izX31GEkq9ucaVs5eYDEPB0JWfT3vT9B2nG+J27O
         +qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678660139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Bm8357knKBz2M26Sj/9hOvriOOgO862bSiwrgatoRU=;
        b=VVXWje5/DYJOcamdgUZgxF/VU09/K6cgWDQhAtqK1rBwg1cTmrDnwWgQztDRG8qQ2F
         JxustGPSZtLnurn5aXpS+RsAf+szzT5ZPSHgDILyZGN1Q/FV16FyN749xqPnI4tFs9oa
         CkQdipUOmuEBwKT8NgRggFqs4hvs1RVSZycP9peCV3s5G6kgQ7xAlfLRjEhd5AVlvDwk
         GvQyblOYGWH+M902GAqYKucasRWhef37BVUleQfcwfbL/qXLhnesJd7bM+dXe23FUMCw
         5Mvp8RPWtfZ9ItN6GoCWVi95oGpkHHO8fw2uzq44JQs7YqfXg7ShvpRj9vpZldMouE4y
         n7VQ==
X-Gm-Message-State: AO0yUKVVLE7+njkBryiiO/Qiq8WDm14FQBcKFmYMOYvLqe8sNCvAHiya
	8hEWq1oN+EaaoJkCuHQjmsU=
X-Google-Smtp-Source: 
 AK7set+AEA4x5zoXDBLqU0q2A2fxnkrHDdCSS2ejWSQY+y6StT7fu+Z/pZ6GaUMrC0zLC1KZQcXOBA==
X-Received: by 2002:a05:6214:1bc7:b0:57f:5ab1:a42b with SMTP id
 m7-20020a0562141bc700b0057f5ab1a42bmr11877192qvc.32.1678660138951;
        Sun, 12 Mar 2023 15:28:58 -0700 (PDT)
Received: from localhost ([72.138.97.66])
        by smtp.gmail.com with ESMTPSA id
 r200-20020a3744d1000000b0074305413c73sm4183807qka.95.2023.03.12.15.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 15:28:58 -0700 (PDT)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound: usb: remove Wireless USB dead code
Date: Sun, 12 Mar 2023 18:28:57 -0400
Message-Id: <20230312222857.296623-1-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 66WDJZOJD34K243N5IY25CONIGDZ2WH5
X-Message-ID-Hash: 66WDJZOJD34K243N5IY25CONIGDZ2WH5
X-MailFrom: ruslan.bilovol@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66WDJZOJD34K243N5IY25CONIGDZ2WH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Wireless USB host controller support has been removed
from Linux Kernel more than 3 years ago in commit
caa6772db4c1 ("Staging: remove wusbcore and UWB from the
kernel tree."), and the associated code in the
snd-usb-audio driver became unused and untested.

If in the future somebody will return WUSB/UWB support
back to the kernel, the snd-usb-audio driver will reject
Wireless USB audio devices at probe stage, and this patch
should be reverted.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 sound/usb/card.c     |  1 -
 sound/usb/endpoint.c | 16 +---------------
 sound/usb/helper.c   |  1 -
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 26268ffb8274..f6e99ced8068 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -609,7 +609,6 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	case USB_SPEED_LOW:
 	case USB_SPEED_FULL:
 	case USB_SPEED_HIGH:
-	case USB_SPEED_WIRELESS:
 	case USB_SPEED_SUPER:
 	case USB_SPEED_SUPER_PLUS:
 		break;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 419302e2057e..1e0af1179ca8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1173,22 +1173,8 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 	 */
 	if (usb_pipein(ep->pipe) || ep->implicit_fb_sync) {
 
-		urb_packs = packs_per_ms;
-		/*
-		 * Wireless devices can poll at a max rate of once per 4ms.
-		 * For dataintervals less than 5, increase the packet count to
-		 * allow the host controller to use bursting to fill in the
-		 * gaps.
-		 */
-		if (snd_usb_get_speed(chip->dev) == USB_SPEED_WIRELESS) {
-			int interval = ep->datainterval;
-			while (interval < 5) {
-				urb_packs <<= 1;
-				++interval;
-			}
-		}
 		/* make capture URBs <= 1 ms and smaller than a period */
-		urb_packs = min(max_packs_per_urb, urb_packs);
+		urb_packs = min(max_packs_per_urb, packs_per_ms);
 		while (urb_packs > 1 && urb_packs * maxsize >= ep->cur_period_bytes)
 			urb_packs >>= 1;
 		ep->nurbs = MAX_URBS;
diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index a4410267bf70..bf80e55d013a 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -108,7 +108,6 @@ unsigned char snd_usb_parse_datainterval(struct snd_usb_audio *chip,
 {
 	switch (snd_usb_get_speed(chip->dev)) {
 	case USB_SPEED_HIGH:
-	case USB_SPEED_WIRELESS:
 	case USB_SPEED_SUPER:
 	case USB_SPEED_SUPER_PLUS:
 		if (get_endpoint(alts, 0)->bInterval >= 1 &&
-- 
2.39.2

