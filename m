Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5DE91DF08
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B0223D1;
	Mon,  1 Jul 2024 14:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B0223D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836586;
	bh=RuFo+rj7IH+rMOczKL4ih3dsBtps5oyKpsIg/YRyQz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GF+yr7vMfEge/+nnvx+fNKUtmNCUCIF78WlU6+Ir0ViAHX3C15BzR3OmBb4WCHdB2
	 g8hFKz9ZodDmC6e5JFB0dgeDtv/JjyTmRM2b/aCGR1xPdHMVo47jE4EuHk5+KvzQGz
	 ZGFI5Pbg2i5X99h5g9JiqMp5d30eKNiZZEcuaO9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21D25F8074C; Mon,  1 Jul 2024 14:20:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 332FEF8074C;
	Mon,  1 Jul 2024 14:20:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89E53F801EB; Thu, 20 Jun 2024 19:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56BE8F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 19:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BE8F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XME0/YLT
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7046211e455so847222b3a.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906314; x=1719511114;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FW85PghmUwc3BgHXRaYJ+DzXpmwYGv3Aew2YdRltNsw=;
        b=XME0/YLTSqCKRNcpkkjstXmn9kA8qdPjgdDJwmMj2NmZULvWRGcrwD5Zhhu6uR2+LZ
         4u7n3IsNGX/Z4mWCgbCAF+oJCy8xSh0CIVLMCvO/PZnCeGQDNiPDXelaaQSLi9bYI0Ju
         yqV23apRjR2OVUtf21BUKrQ3pDfkw+a9nnW9Yym8ALgtB1mMp5mu83/gKerIwMxKC2p6
         4wcw6y/z7yXMCt22/SuE6+fir5TFbrpN4nyPpviBJevYthUWjGjTt/0Ey0rWXG/owZyI
         TKfkMARiHLNbvsEWq909MkRn1edSLi8fuLxjMMYc7XX+HymzKQn/WSjcAA0ruSV3Q4wO
         pc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906314; x=1719511114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW85PghmUwc3BgHXRaYJ+DzXpmwYGv3Aew2YdRltNsw=;
        b=CP2qky9Jdb0bcOG/lClYod2WCcJWQwZhlxcHA4hCAhl5vLf+A6muPWDDHFHLN53+y0
         XzhIqkmK0EdHXmHw7W5NFxYMWUnFc+BPMBH5sn9MJPV2++ATsV2hQ34veDahdGQO5t9h
         +Z2Q5P0uFvTJVCrktwtNRmdlpnh9Ms8EmDkgmEAVD7Wb5ONXOtRaYshVBuCQC1g+wsnC
         nSgjspTOpaiSZxGCDIJu49odrYRxa5VbB4RNm05/+9GDLvjCW+D7gRnrm64TIjsdSK9B
         FaMFQZrSQoZBeEOcT/8riHUzbw7HeSAr5kb3KxMLjRSG9BH/g5TzQQN7OsnmYiqvQ8aH
         IODw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX59TBze/BlOCLDRaxyMyX3Gn9LxNdF9WjkFSUAMm9pPV2EfqKWK5YiwYqnflU3pWI05se4lEQAM1QLWieuJQUWbiUsL6BIh5mGQmM=
X-Gm-Message-State: AOJu0Yz/fDphxHWpa5BAo6zINPlEQ3qyeZx5chedfLbJ5ason4uLMVXw
	twruIwhHU/DeDN/L76McAyuzzL43cfxP5GecxyVG1Dvbx0bevbQN
X-Google-Smtp-Source: 
 AGHT+IEoH3Qng23SGIOniQLh/mfoKH0d8yH2qow3ztjr66B8CysNLSQkypEK4r+/80Kz1cmwQvxiZw==
X-Received: by 2002:a05:6a20:7291:b0:1b5:cf26:ecfd with SMTP id
 adf61e73a8af0-1bcbb426fb3mr7450803637.24.1718906314118;
        Thu, 20 Jun 2024 10:58:34 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6fee2d34cc2sm11211938a12.64.2024.06.20.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:33 -0700 (PDT)
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
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v4 30/40] ALSA: use atomic find_bit() functions where
 applicable
Date: Thu, 20 Jun 2024 10:56:53 -0700
Message-ID: <20240620175703.605111-31-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MH7KOFKDWSQPLC5JWCYTGQBFSMJCZTZ6
X-Message-ID-Hash: MH7KOFKDWSQPLC5JWCYTGQBFSMJCZTZ6
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MH7KOFKDWSQPLC5JWCYTGQBFSMJCZTZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA code tests each bit in bitmaps in a for-loop. Switch it to
using dedicated atomic find_bit() API.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c |  8 ++++----
 sound/usb/caiaq/audio.c   | 14 ++++++--------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 325e8f0b99a8..7201afa82990 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -7,6 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/find_atomic.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
@@ -3263,10 +3264,9 @@ static int get_empty_pcm_device(struct hda_bus *bus, unsigned int type)
 
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
index 4981753652a7..93ecd5cfcb7d 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -4,6 +4,7 @@
 */
 
 #include <linux/device.h>
+#include <linux/find_atomic.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -610,7 +611,7 @@ static void read_completed(struct urb *urb)
 	struct snd_usb_caiaq_cb_info *info = urb->context;
 	struct snd_usb_caiaqdev *cdev;
 	struct device *dev;
-	struct urb *out = NULL;
+	struct urb *out;
 	int i, frame, len, send_it = 0, outframe = 0;
 	unsigned long flags;
 	size_t offset = 0;
@@ -625,17 +626,14 @@ static void read_completed(struct urb *urb)
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
2.43.0

