Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33574A19D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 17:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 515C67F4;
	Thu,  6 Jul 2023 17:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 515C67F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688658899;
	bh=IDjFzX4zTi/jrMUOnJjMRjGygKNVzZGh++Ivb1BtNaQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eupezKSUm8QV8+31UYStrvVF1tEcTwy+iDg6A+6ZFvTuCqXGZjgl8Rh+M8fnewb9Q
	 Aj8ZtjUKG4tY8Ib/2WL8fNt7ZsVL+coI5XAQvZrKpz+v+787RS8VTA8q2rt8U4hrw4
	 RS09K6BHRX2nn2iIAxvMv0XRZJ+AIcmbZnqXIHFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF4A6F800E4; Thu,  6 Jul 2023 17:54:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DD9F80125;
	Thu,  6 Jul 2023 17:54:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7888AF80132; Thu,  6 Jul 2023 17:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B543F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 17:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B543F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hHBdil3F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vbTFFeOj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 74E5321E94;
	Thu,  6 Jul 2023 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688658840;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3XhFnjKNIj1VOri1HQz3YLkjuNjb3uvmSIFlMXKXn5A=;
	b=hHBdil3FZKSbMtIUfh2ogxlORpJ2wEApEch7m+Qhvjd1pM0P0QB3yx0c/if+APM1PMWawg
	J1/qTXqZltdwubkdD4u2fbLzE7wKi+8L8aqNmHPArg0j1JEoMtpynuOGJU+DwLmFZUzVsN
	XAWOoxXqVbQJvaiZWzEuRNFv25kG7UU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688658840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3XhFnjKNIj1VOri1HQz3YLkjuNjb3uvmSIFlMXKXn5A=;
	b=vbTFFeOjafdYB0xBZFDQZ+OfWXhA7Gyuo/dBoBGHc8FCLoVg/rpIGgbJFakNr0WcWTi9SR
	cMmZDPooL2TcPtDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51C2B138EE;
	Thu,  6 Jul 2023 15:54:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RkERE5jjpmTZIQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 06 Jul 2023 15:54:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ALSA: jack: Fix mutex call in snd_jack_report()
Date: Thu,  6 Jul 2023 17:53:57 +0200
Message-Id: <20230706155357.3470-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GQDWOFG7HMT3CW6QUDY2CZZRM7HY5372
X-Message-ID-Hash: GQDWOFG7HMT3CW6QUDY2CZZRM7HY5372
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQDWOFG7HMT3CW6QUDY2CZZRM7HY5372/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_jack_report() is supposed to be callable from an IRQ context, too,
and it's indeed used in that way from virtsnd driver.  The fix for
input_dev race in commit 1b6a6fc5280e ("ALSA: jack: Access input_dev
under mutex"), however, introduced a mutex lock in snd_jack_report(),
and this resulted in a potential sleep-in-atomic.

For addressing that problem, this patch changes the relevant code to
use the object get/put and removes the mutex usage.  That is,
snd_jack_report(), it takes input_get_device() and leaves with
input_put_device() for assuring the input_dev being assigned.

Although the whole mutex could be reduced, we keep it because it can
be still a protection for potential races between creation and
deletion.

Fixes: 1b6a6fc5280e ("ALSA: jack: Access input_dev under mutex")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/cf95f7fe-a748-4990-8378-000491b40329@moroto.mountain
Tested-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/jack.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index 88493cc31914..03d155ed362b 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -654,6 +654,7 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	struct snd_jack_kctl *jack_kctl;
 	unsigned int mask_bits = 0;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
+	struct input_dev *idev;
 	int i;
 #endif
 
@@ -670,17 +671,15 @@ void snd_jack_report(struct snd_jack *jack, int status)
 					     status & jack_kctl->mask_bits);
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-	mutex_lock(&jack->input_dev_lock);
-	if (!jack->input_dev) {
-		mutex_unlock(&jack->input_dev_lock);
+	idev = input_get_device(jack->input_dev);
+	if (!idev)
 		return;
-	}
 
 	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
 		int testbit = ((SND_JACK_BTN_0 >> i) & ~mask_bits);
 
 		if (jack->type & testbit)
-			input_report_key(jack->input_dev, jack->key[i],
+			input_report_key(idev, jack->key[i],
 					 status & testbit);
 	}
 
@@ -688,13 +687,13 @@ void snd_jack_report(struct snd_jack *jack, int status)
 		int testbit = ((1 << i) & ~mask_bits);
 
 		if (jack->type & testbit)
-			input_report_switch(jack->input_dev,
+			input_report_switch(idev,
 					    jack_switch_types[i],
 					    status & testbit);
 	}
 
-	input_sync(jack->input_dev);
-	mutex_unlock(&jack->input_dev_lock);
+	input_sync(idev);
+	input_put_device(idev);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 }
 EXPORT_SYMBOL(snd_jack_report);
-- 
2.35.3

