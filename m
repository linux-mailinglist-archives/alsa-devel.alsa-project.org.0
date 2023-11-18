Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DA97F186A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:18:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E051E74;
	Mon, 20 Nov 2023 17:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E051E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497126;
	bh=tJmQqOQ9JthaexzNbKAtvsYq2RSg1QnwuHNN76E+htA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxZM5ebeeC24HYp1J9qucTRbNGhQjT9LxSIrSiIMyUzU+pdjSLJPv7XkMO2qlkHuc
	 Ghm7K00pKzAJDCODFsj5n5X/MAUxBgoY6pZETUj2Vn/NF7k7JWA4RljjJ+Ms5G+lru
	 J2BDmW5c9MDbrdwYZliAhRsPZmJec0RonCBKORTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18698F805B5; Mon, 20 Nov 2023 17:16:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 058E8F805AF;
	Mon, 20 Nov 2023 17:16:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A972F801D5; Sat, 18 Nov 2023 16:52:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA933F80093
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 16:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA933F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iFI79q4B
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5ac376d311aso32139847b3.1
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Nov 2023 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700322713; x=1700927513;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pqvvn3jC6Vz8bzOhTQHPcM8ndCOZ4pDWuw3ZxWJvphM=;
        b=iFI79q4BWQIp9TWtkqVNG9vMw1EMvWUK+j+58N1qJlbofx+ws+us1DraTyeSXwHqAD
         Irl6GM64FpJAvGaMs7Bsf4URMOcQ275SmJ8bltroh74VCDXvrUHr5OfpyjULC6GcOpNF
         kyfXFxGGrojxTQs5L/I/rccDQihJ1+C2fIOcNUfmTTX6FYcx+M7LaVqaDsImg8ykPNm3
         SK87I5l86UipYJs47TPF5l+CLyArsAbVUQDQp8fLH4VZs+iTytQRr0cEWVpx48VxIM4o
         qpVpYtd0Duh/QgXr7+zOk4KhmE9YWB95VZ9X+vPMTgOODGHdOC84ezTUhyb7gIhzcVen
         Zqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322713; x=1700927513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pqvvn3jC6Vz8bzOhTQHPcM8ndCOZ4pDWuw3ZxWJvphM=;
        b=Q0kUdGPPoDLLIlMD+90zzKU1ksEEZDhcFkKHuZm0CkumSHYRMmSoVSLIK9uJhe5kzp
         7y/UFfAkbiYoPqX9GA/Z+BmyWm3vD5Xf7tni3qW1xBY71TnOvsoVpit/A4kOdu/9aZNj
         SpGF4kfsnreJWkq2Y8zHfZ7xX27ziwrKLARVO/Y+3iBLjfWM0aejJZptvCG3NyOabHeX
         MPCOKrZSAnWorMBLvkjFi+RFB3fGvabLUTmG5MCKp+SP7AwAPR4lu33MjsEYoa6l2RqA
         0AeHXCwb5TFmnNNEQMCb3ZOsaF5X3U5H0uhIkRBSaEm4+Gffjbk7F61YaCwYqAD8Ov7o
         pWPQ==
X-Gm-Message-State: AOJu0YwG0TPLBdAtqX+ZfBluek1wA5j2TYCvlc0mmYA+cfG1YoG2fbvz
	5UqVrmGhGohnYxY7AAa4oBA=
X-Google-Smtp-Source: 
 AGHT+IHi1UfS8eoFXkfozWsLdq/Iqyn0m7FQM2MTep2E1EPNYtNXp8LEwhBmcZHJxn/bgTZr34eiJg==
X-Received: by 2002:a81:f202:0:b0:5c9:9097:6427 with SMTP id
 i2-20020a81f202000000b005c990976427mr546580ywm.44.1700322713616;
        Sat, 18 Nov 2023 07:51:53 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:48a9:bd4c:868d:dc97])
        by smtp.gmail.com with ESMTPSA id
 b65-20020a0dd944000000b005a8c392f498sm1167875ywe.82.2023.11.18.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:51:52 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <zonque@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>
Subject: [PATCH 30/34] ALSA: use atomic find_bit() functions where applicable
Date: Sat, 18 Nov 2023 07:51:01 -0800
Message-Id: <20231118155105.25678-31-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KBUDORW3AAX4NLASHHPXO2RL2XISIZPB
X-Message-ID-Hash: KBUDORW3AAX4NLASHHPXO2RL2XISIZPB
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:16:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBUDORW3AAX4NLASHHPXO2RL2XISIZPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA code tests each bit in bitmaps in a for() loop. Switch it to
dedicated atomic find_bit() API.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 sound/pci/hda/hda_codec.c |  7 +++----
 sound/usb/caiaq/audio.c   | 13 +++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 01718b1fc9a7..29254005f394 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3275,10 +3275,9 @@ static int get_empty_pcm_device(struct hda_bus *bus, unsigned int type)
 
 #ifdef CONFIG_SND_DYNAMIC_MINORS
 	/* non-fixed slots starting from 10 */
-	for (i = 10; i < 32; i++) {
-		if (!test_and_set_bit(i, bus->pcm_dev_bits))
-			return i;
-	}
+	i = find_and_set_next_bit(bus->pcm_dev_bits, 32, 10);
+	if (i < 32)
+		return i;
 #endif
 
 	dev_warn(bus->card->dev, "Too many %s devices\n",
diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 4981753652a7..74dfcf32b439 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -610,7 +610,7 @@ static void read_completed(struct urb *urb)
 	struct snd_usb_caiaq_cb_info *info = urb->context;
 	struct snd_usb_caiaqdev *cdev;
 	struct device *dev;
-	struct urb *out = NULL;
+	struct urb *out;
 	int i, frame, len, send_it = 0, outframe = 0;
 	unsigned long flags;
 	size_t offset = 0;
@@ -625,17 +625,14 @@ static void read_completed(struct urb *urb)
 		return;
 
 	/* find an unused output urb that is unused */
-	for (i = 0; i < N_URBS; i++)
-		if (test_and_set_bit(i, &cdev->outurb_active_mask) == 0) {
-			out = cdev->data_urbs_out[i];
-			break;
-		}
-
-	if (!out) {
+	i = find_and_set_bit(&cdev->outurb_active_mask, N_URBS);
+	if (i >= N_URBS) {
 		dev_err(dev, "Unable to find an output urb to use\n");
 		goto requeue;
 	}
 
+	out = cdev->data_urbs_out[i];
+
 	/* read the recently received packet and send back one which has
 	 * the same layout */
 	for (frame = 0; frame < FRAMES_PER_URB; frame++) {
-- 
2.39.2

