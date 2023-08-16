Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B982577E5FE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4970884C;
	Wed, 16 Aug 2023 18:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4970884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201978;
	bh=J2JFjKxmnj+2Zg82ee2JDZFziDfpEeii23cZvB5ZQoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UhN3u63enz1Lg73LYwx25JMkAfistX1EhQwjTPfWcaIaRThbhpxwmIawSYd449Gdb
	 wFudIPOtQ6eYzZitgRCPHNHHVv2ICm93Zwby5Ps8zgi6nXN4a1Hv1IeSEEJnEOQXZa
	 NppnvuaqE+WJwUWF2Q5sEjdWKtTsLnHXt9p9jv9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7D61F80272; Wed, 16 Aug 2023 18:05:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0373F80074;
	Wed, 16 Aug 2023 18:05:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A4A2F8016A; Wed, 16 Aug 2023 18:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77C5AF80272
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C5AF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F0RDBUUD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hiKjiajz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A4921F86C;
	Wed, 16 Aug 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ru2u5N458a3/VA/29YhYy0dpK2vWU8XfLXpEkrMzJLA=;
	b=F0RDBUUDMHPllqXcsxExPm7Nr567pocxb8PqDN9m6pvccrMTcUNFM+nCAeIa83BZPGNLJc
	00nDRnaAsRKlV2NFfofI3WIJpKbhLIXsOrgJt1fapGMS/hrD8bnRHqsNcZnQSHxoakDhZ7
	povuq/bJbizlYnUhmhXPS5shiJGVG88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ru2u5N458a3/VA/29YhYy0dpK2vWU8XfLXpEkrMzJLA=;
	b=hiKjiajzIAdIzvv8ObpiA12z2BZ1+MdhWh+kggsuZZ8dvl+/ISLfioBypBamPTEy107TMD
	TfzVIscXttjohcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0481139F8;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mA7POS/z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 7/9] ALSA: timer: Create device with snd_device_alloc()
Date: Wed, 16 Aug 2023 18:02:50 +0200
Message-Id: <20230816160252.23396-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLWY7YNCTY3LVNUFE3TE7H2RIBBVHU57
X-Message-ID-Hash: GLWY7YNCTY3LVNUFE3TE7H2RIBBVHU57
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLWY7YNCTY3LVNUFE3TE7H2RIBBVHU57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Align with the other components, and use snd_device_alloc() for the
new sound device for timer, too.  No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 9d0d2a5c2e15..e6e551d4a29e 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -2301,7 +2301,7 @@ static void snd_timer_free_all(void)
 		snd_timer_free(timer);
 }
 
-static struct device timer_dev;
+static struct device *timer_dev;
 
 /*
  *  ENTRY functions
@@ -2311,8 +2311,10 @@ static int __init alsa_timer_init(void)
 {
 	int err;
 
-	snd_device_initialize(&timer_dev, NULL);
-	dev_set_name(&timer_dev, "timer");
+	err = snd_device_alloc(&timer_dev, NULL);
+	if (err < 0)
+		return err;
+	dev_set_name(timer_dev, "timer");
 
 #ifdef SNDRV_OSS_INFO_DEV_TIMERS
 	snd_oss_info_register(SNDRV_OSS_INFO_DEV_TIMERS, SNDRV_CARDS - 1,
@@ -2326,7 +2328,7 @@ static int __init alsa_timer_init(void)
 	}
 
 	err = snd_register_device(SNDRV_DEVICE_TYPE_TIMER, NULL, 0,
-				  &snd_timer_f_ops, NULL, &timer_dev);
+				  &snd_timer_f_ops, NULL, timer_dev);
 	if (err < 0) {
 		pr_err("ALSA: unable to register timer device (%i)\n", err);
 		snd_timer_free_all();
@@ -2337,15 +2339,15 @@ static int __init alsa_timer_init(void)
 	return 0;
 
 put_timer:
-	put_device(&timer_dev);
+	put_device(timer_dev);
 	return err;
 }
 
 static void __exit alsa_timer_exit(void)
 {
-	snd_unregister_device(&timer_dev);
+	snd_unregister_device(timer_dev);
 	snd_timer_free_all();
-	put_device(&timer_dev);
+	put_device(timer_dev);
 	snd_timer_proc_done();
 #ifdef SNDRV_OSS_INFO_DEV_TIMERS
 	snd_oss_info_unregister(SNDRV_OSS_INFO_DEV_TIMERS, SNDRV_CARDS - 1);
-- 
2.35.3

