Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B4746B8A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E0BC1FE;
	Tue,  4 Jul 2023 10:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E0BC1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688458122;
	bh=cM2U4BPtihLtw4IqnCQzfBf021+9WmplwiPMP6wy7Qs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gC2u5+WM07p5DCxGTqOMAZVKkRauR3UPBAFIpgRvQ3AjgpWbxeHdXgqv2A6LJKEut
	 jS19AAOrJhvJ9FhsewLePwAl45gfO+SQbWNEXmkz6iukmh3QQr6lKeenYQ5aL6Ttzb
	 Ze+1MFX+wkXHC8881xepER6cG1BA4rEtq85XFU4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CDFDF80124; Tue,  4 Jul 2023 10:07:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0C3F80124;
	Tue,  4 Jul 2023 10:07:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29661F80125; Tue,  4 Jul 2023 10:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DD47F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD47F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XyvMTUgi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oi0IAqFv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D22D20405;
	Tue,  4 Jul 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688458062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rSPLRbJcf1HszajQDTFX0zxTKHnChF0gv1wRBOA+9Q=;
	b=XyvMTUgiJUbwEjSdWsU7FG0d96T4sKuPXYMEJnAeG2uL4Me5Kyqu3iD2C9YpN38rcWfLsw
	39/7DFxH+y+E3eh2fwrXoOtpNTYzfd3UK84XNUdckmxorjiXWMj8cY6L4U0i+k/HJ8yTiV
	2lDCFGjs5oQ7c/AW8gclR6AdLLRTw38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688458062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9rSPLRbJcf1HszajQDTFX0zxTKHnChF0gv1wRBOA+9Q=;
	b=oi0IAqFv3znvIoCI86/dIiq8Xmf5m92QpncJ3+JWUaUf0bxEINxiyTm2IR8n1mWzgZRcYE
	AVz0HeHNRzV7a0Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 595571346D;
	Tue,  4 Jul 2023 08:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nZ6lFE7To2QwIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 04 Jul 2023 08:07:42 +0000
Date: Tue, 04 Jul 2023 10:07:41 +0200
Message-ID: <87sfa42j76.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: amadeuszx.slawinski@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [bug report] ALSA: jack: Access input_dev under mutex
In-Reply-To: <cf95f7fe-a748-4990-8378-000491b40329@moroto.mountain>
References: <cf95f7fe-a748-4990-8378-000491b40329@moroto.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WWBAYXUXA435N27UYTVPG5HXEIWVKLYP
X-Message-ID-Hash: WWBAYXUXA435N27UYTVPG5HXEIWVKLYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWBAYXUXA435N27UYTVPG5HXEIWVKLYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 16:18:27 +0200,
Dan Carpenter wrote:
> 
> Hello Amadeusz S³awiñski,
> 
> The patch 1b6a6fc5280e: "ALSA: jack: Access input_dev under mutex"
> from Apr 12, 2022, leads to the following Smatch static checker
> warning:
> 
> 	sound/core/jack.c:673 snd_jack_report()
> 	warn: sleeping in atomic context
> 
> sound/core/jack.c
>     663         jack->hw_status_cache = status;
>     664 
>     665         list_for_each_entry(jack_kctl, &jack->kctl_list, list)
>     666                 if (jack_kctl->sw_inject_enable)
>     667                         mask_bits |= jack_kctl->mask_bits;
>     668                 else
>     669                         snd_kctl_jack_report(jack->card, jack_kctl->kctl,
>     670                                              status & jack_kctl->mask_bits);
>     671 
>     672 #ifdef CONFIG_SND_JACK_INPUT_DEV
> --> 673         mutex_lock(&jack->input_dev_lock);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> That patch adds this mutex but we can't take mutex because we're already
> holding a spinlock.  The problematic call trees are:
> 
> virtsnd_event_notify_cb() <- disables preempt
> virtsnd_disable_event_vq() <- disables preempt
> -> virtsnd_event_dispatch()
>    -> virtsnd_jack_event()
>       -> snd_jack_report()
> 
> The virtsnd_event_notify_cb() and virtsnd_disable_event_vq() functions
> take the spin_lock_irqsave(&queue->lock, flags);

Indeed it was no good choice to use the mutex there inside the report
function.  It's supposed to be callable from an irq-disabled context,
too.

How about simply using the device refcount like below?

Although we may drop the mutex from snd_jack, it can can be left, as
it's still useful for protecting a potential race between creation and
deletion.


thanks,

Takashi

-- 8< --
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
