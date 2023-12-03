Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A60802C3E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:41:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71EFE73;
	Mon,  4 Dec 2023 08:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71EFE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675716;
	bh=bl4NfAT9acYKun2YQdGsVd7hVpY2opMsEMjoXXnkmes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bvDw3+X1kO7Bl0coj4sYdx8VYPaC6AvRsniKiponMNUtZ90r81YBfLdPbNOxC6b4k
	 cjXvpS9hcMEShlv+oTfsAcFq7/OAIa9j848hyR7WCN92RHAA5fApz9RW/6FULjyD6g
	 NIYuxhXC1MHFY+MGoUpzyDi7jnYK2/h7XqEEwLG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55AEBF806B0; Mon,  4 Dec 2023 08:40:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0D8F806AE;
	Mon,  4 Dec 2023 08:40:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C9E2F8024E; Sun,  3 Dec 2023 20:34:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1523EF800F5
	for <alsa-devel@alsa-project.org>; Sun,  3 Dec 2023 20:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1523EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fc0ycTOC
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d3687a6574so35790787b3.2
        for <alsa-devel@alsa-project.org>;
 Sun, 03 Dec 2023 11:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701632045; x=1702236845;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHrqBjURy+mudPJ+6bg27Pk9qQM+xmaxDRnoUP1Py9c=;
        b=fc0ycTOCOrgNH41v6Zqe81pusRsd+fpZz4ib9+M3RgtEQQeE8V+Ot8OP+EmSazNzgY
         B/1D8KQdFZum0cz7/J77n0SZi/T4ZO//4SguA+9kp+3ClfONlR/vWR7c8mQ4PD5/+Tc+
         evdngRzlZzsjs0xdaxCWb9E1MIpag5WxATiqNiCtvW/sknEYVStK+IZEgZQQTDx/r6yi
         /aWWzWEN3A0qHQms8uxa202tWWWYgN4kLemMLhvYZQlDYCmUs9sE1VUjH8lvz6fdjNEd
         c9ovNAn8w6LRnRBZfwWFefmsreR8ftL1sH5QacOF3uJvmALsceroSf00w0HHsM7hqXek
         vzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701632045; x=1702236845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHrqBjURy+mudPJ+6bg27Pk9qQM+xmaxDRnoUP1Py9c=;
        b=qUDKO3dRtGnSPe2NIzpQbMDOb4xSJSVL2ImXCd/09onVHQxcaByNtkauAihpT0nvmR
         E4o4qj7JK9sE5b4LAtL+CbPVKBefifSkAauBO9zTjmo+qiREW1HQnoLCKpWSZBSImn1B
         WIG5BvHr/nDaUdUEOX/QUqI10kuhru0oAVIm1qIY8yHnqRMq7dD47hdbdIZazVwGk2Cs
         dMqs8Lh5O/+eDKMdbQVzs1Hf5Z+sM3ZNp/3vOYF9OjSI+NnOXQ/V5EZorrKurhDK9GOy
         rLn65NG02qLYvk2Of8+nbpuLxXxMj5PLdZKDGVxNTz5/EvUlKvC021Slc4NeqgWPMFY0
         dp0Q==
X-Gm-Message-State: AOJu0YxmXk1i2iJrfpAu+A2Ar7hcM6iJ4zLFmhVeYtRIVGnhhbNw7awG
	VahLmjzl6gEH771iqrqy0G4=
X-Google-Smtp-Source: 
 AGHT+IGc9OJCrz0Vs7Jwm9KKYJn6cgVwzSJPcWjmn+naJ4Os06xO0RgJu/5QwhQF/G6sjioOlbuV6Q==
X-Received: by 2002:a05:690c:368a:b0:5d7:1940:7d74 with SMTP id
 fu10-20020a05690c368a00b005d719407d74mr2240772ywb.75.1701632045662;
        Sun, 03 Dec 2023 11:34:05 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:cb98:c3e:57c:8191])
        by smtp.gmail.com with ESMTPSA id
 v127-20020a818585000000b005869fd2b5bcsm2769872ywf.127.2023.12.03.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:34:05 -0800 (PST)
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
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 32/35] ALSA: use atomic find_bit() functions where
 applicable
Date: Sun,  3 Dec 2023 11:33:04 -0800
Message-Id: <20231203193307.542794-31-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203193307.542794-1-yury.norov@gmail.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231203193307.542794-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PFQ3USXGWGWSOPM55HPPEOY7FZGYSE5Q
X-Message-ID-Hash: PFQ3USXGWGWSOPM55HPPEOY7FZGYSE5Q
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:36:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFQ3USXGWGWSOPM55HPPEOY7FZGYSE5Q/>
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
Acked-by: Takashi Iwai <tiwai@suse.de>
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
2.40.1

