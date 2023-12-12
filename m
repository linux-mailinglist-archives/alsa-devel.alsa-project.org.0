Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9E80F183
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAA2EDE5;
	Tue, 12 Dec 2023 16:53:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAA2EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702396441;
	bh=Czxk1mNGPMQxwyxerhcU6rxm2mhB62a/3IFHR4V1REw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hSzjfEIMPhd0Bc5n8ZnRgt+2525qg865kaIZrwxujoNS0NQofP+jjOOgmwIIc3Hk7
	 N3bC3Qk+mGm4czRk4Rj0HzMHHYyVDNcH8n0klCppP/g3L/9loSL6ugcFjRH2CbZvhR
	 hRfOzAoAPtOC6CAfZxvEuq36fJKFO6L8CtRm5vCI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 213D7F80675; Tue, 12 Dec 2023 16:52:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 563D6F80673;
	Tue, 12 Dec 2023 16:52:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CC88F8016A; Tue, 12 Dec 2023 03:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81764F80114
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 03:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81764F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bxO1/eQM
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5cece20f006so52134227b3.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348121; x=1702952921;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1ziCHmUMRjRbO8uC0DQdJSiPRQP/fDCaegFJhzzCaw=;
        b=bxO1/eQMvN00wUYop6ttmPLVf6Jk2TCTr2UaihS+n+zjtQ118J/owza8H36Rrs4GsI
         LONSI17ByK78foCcbCV4CUXpFzU53DoVLrZEd0LEE+aZnZxmoa42+IUq2lms/JSPSa9f
         Yu3zJI9JdNrhmp6sOK4ukj3/TaaYPAV0VQyRVSzT1cLWGfZiRxFE1FDIxCrsAfaEgTqr
         LQ34bGYqyl5H/QQyiNsc2XU2UgJwrag+58CU2NJTJUunPLmG8oHi+ZwpQ8ZrHM2hGKML
         fshspIc0PMugirntWdfqB28N0jntI9dwEusqPDSG++lSz8jtT+z13ZkHXOwgFRO+4HDZ
         /wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348121; x=1702952921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1ziCHmUMRjRbO8uC0DQdJSiPRQP/fDCaegFJhzzCaw=;
        b=CnYZfLTVB0aFRceX3ZVUWBig30Yr+TDNPpMWAUL4ljPlQuHiHu7V6r7+Fp8QlBW820
         Y1HODnBJXRO7UpjqoBvv35q1QyEZcSSnjAOUh85xW4K4HorhpYX1p4c4ZapnIt+2Nczq
         0FTM5HZ224856K4E4JxayO10aIZqCw0rVqRBd2UIo0qZY60OzPyANNK5PSfMi4FhfEkH
         JIEaOqXEsML/xD3XS0ApqOvApcomT0R9NonUg7wL5rl4loKzqc3RXw8QjiEM6Bv+3A81
         eqWuFdxvMxY0jI/1JXwNyEi6V5C6d9oyGb0LpAmgrvHV+gunrNIIPqiUkr9lhY0SOkwz
         7IVw==
X-Gm-Message-State: AOJu0YxH/9YrgS+ZGR+5zO0a9jdRghBlPTQiUCrFFA1nAW3IXumU5flZ
	U0huKbNUFNOX/S+XOYYzb+s=
X-Google-Smtp-Source: 
 AGHT+IEkj3SrO47EktQbRudrxe7SbWLYCP6nELjcTaeJUHnC5fYO3ykVx8HOtGA5GggcJQHNwWRRGA==
X-Received: by 2002:a0d:dbc5:0:b0:5cb:eac7:38aa with SMTP id
 d188-20020a0ddbc5000000b005cbeac738aamr4593499ywe.35.1702348120890;
        Mon, 11 Dec 2023 18:28:40 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a0deb0b000000b005af5bb5e840sm3454168ywe.34.2023.12.11.18.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:40 -0800 (PST)
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
Subject: [PATCH v3 32/35] ALSA: use atomic find_bit() functions where
 applicable
Date: Mon, 11 Dec 2023 18:27:46 -0800
Message-Id: <20231212022749.625238-33-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PMDV7EVSEJJY6OAJZCILM4MINFJ43HOE
X-Message-ID-Hash: PMDV7EVSEJJY6OAJZCILM4MINFJ43HOE
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:52:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMDV7EVSEJJY6OAJZCILM4MINFJ43HOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA code tests each bit in bitmaps in a for() loop. Switch it to
using dedicated atomic find_bit() API.

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

