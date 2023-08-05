Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0273770EB2
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Aug 2023 10:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F372820;
	Sat,  5 Aug 2023 10:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F372820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691223143;
	bh=l5X5iwaj2hLCmxenyIJDglZ9Hir6LxfBNJfIR3ykhxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ABPnuNiU3SsjePGHYT5cHRNRNbQsDC2wvWd72CbHiZckTZtJiV4Fmccm3i0l2QohY
	 QzvXx5oII14/+lHs4l2aPjCApgrF7aNTLsl76nPXo8ily/BXR25OzzyQGAs6Db2PIN
	 NQfTL+pAGqP3USEDGNFGmSbWrbCUnb9kMGBg8FoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC8CAF802BE; Sat,  5 Aug 2023 10:11:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3446AF801D5;
	Sat,  5 Aug 2023 10:11:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27123F8025A; Sat,  5 Aug 2023 10:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 285BDF80149
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 10:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285BDF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DpaBi8To;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uzs4z8G/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5778421850;
	Sat,  5 Aug 2023 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691222999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOGT33veXv8dsWZLz+KR0541Ie+CIPA3qwGhKGKus3o=;
	b=DpaBi8To+TH8Z+dfySqtxyNZB0mm6+WaiABQeBkp94kWFSZF82NEm6t9A/cMX0e1MUbVSp
	D9NX+BiC9X3PzXKg2eKQqy0NlVrbA706ydSyQo41EE3MsB3WpxPiHYpwXAKVwGa0BiHgV1
	bxSbHlOLBwiy7s1bH4SNpI1O9FWopJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691222999;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOGT33veXv8dsWZLz+KR0541Ie+CIPA3qwGhKGKus3o=;
	b=uzs4z8G/6/gLFETrTwVS87gjIkQ43P1axrmomLLBapXc2H+Z29h74uQVcsmEFgHznKFLGl
	x7FuBMNq0A734HBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DF57139BC;
	Sat,  5 Aug 2023 08:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZDLcAdcDzmQbNAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 05 Aug 2023 08:09:59 +0000
Date: Sat, 05 Aug 2023 10:09:58 +0200
Message-ID: <87o7jloqp5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org,
	alsa-devel@alsa-project.org,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
In-Reply-To: 
 <CAOReqxjjwJec+Ho7vHg6tOjXHc8VEpVL317f6KE6gnmfDofa-g@mail.gmail.com>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
	<87cz06djxo.wl-tiwai@suse.de>
	<CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
	<87sf90b7hw.wl-tiwai@suse.de>
	<87cz04b0ku.wl-tiwai@suse.de>
	<CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
	<87zg379oap.wl-tiwai@suse.de>
	<CAOReqxjjwJec+Ho7vHg6tOjXHc8VEpVL317f6KE6gnmfDofa-g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ARU7RLOVOYYOMEW3UUY2HF7ZVOOJ5WPX
X-Message-ID-Hash: ARU7RLOVOYYOMEW3UUY2HF7ZVOOJ5WPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARU7RLOVOYYOMEW3UUY2HF7ZVOOJ5WPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 21:17:56 +0200,
Curtis Malainey wrote:
> 
> On Fri, Aug 4, 2023 at 1:58 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Now I've been reconsidering the problem, and thought of another
> > possible workaround.  We may add the card's refcount control for the
> > device init and release, so that we delay the actual resource free.
> > The basic idea is to take card->card_ref at the device init and unref
> > it at the actual device release callback.  Then the snd_card_free()
> > call is held until all those refcounted devices are released.
> >
> > Below is a PoC patch (yes, this can be split, too ;)
> > A quick test on VM seems OK, but needs more reviews and tests.
> >
> > It contains somewhat ugly conditional put_device() at the dev_free
> > ops.  We can make those a bit saner with some helpers later, too.
> >
> > BTW, this approach may avoid another potential problem by the delayed
> > release; if we finish the driver remove without waiting for the actual
> > device releases, it may hit a code (the piece of the device release
> > callback) of the already removed module, and it's not guaranteed to be
> > present.
> > I'm not sure whether this really happens, but it's another thing to be
> > considered.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > ---
> > diff --git a/include/sound/core.h b/include/sound/core.h
> > index f6e0dd648b80..00c514a80a4a 100644
> > --- a/include/sound/core.h
> > +++ b/include/sound/core.h
> 
> Unfortunately it doesn't hold up in my testing, hit the devm vs device
> race bug after a little over 30min of hammering snd-dummy (on top of
> your for-next branch)
(snip)
> I was talking with Stephen Boyd about this bug and his recommendation
> was to keep snd_card always out of devm and just allocate a pointer in
> devm to snd_card to puppet it as if it was managed via devm and just
> reference count rather than release the card so that its always
> handled through device->release. What do you think? This would go
> alongside the current patch proposed.

Indeed, that's another issue about devres vs delayed kobj release.
A quick fix would be something like below, I suppose.
(note: totally untested)


thanks,

Takashi

--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -188,7 +188,10 @@ EXPORT_SYMBOL(snd_card_new);
 
 static void __snd_card_release(struct device *dev, void *data)
 {
-	snd_card_free(data);
+	struct snd_card **card_p = data;
+
+	if (card_p)
+		snd_card_free(*card_p);
 }
 
 /**
@@ -221,21 +224,25 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 		      struct snd_card **card_ret)
 {
 	struct snd_card *card;
+	struct snd_card **card_devres;
 	int err;
 
 	*card_ret = NULL;
-	card = devres_alloc(__snd_card_release, sizeof(*card) + extra_size,
-			    GFP_KERNEL);
+	card_devres = devres_alloc(__snd_card_release, sizeof(void *), GFP_KERNEL);
+	if (!card_devres)
+		return -ENOMEM;
+	devres_add(parent, card_devres);
+
+	card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
+
 	card->managed = true;
 	err = snd_card_init(card, parent, idx, xid, module, extra_size);
-	if (err < 0) {
-		devres_free(card); /* in managed mode, we need to free manually */
+	if (err < 0)
 		return err;
-	}
 
-	devres_add(parent, card);
+	*card_devres = card;
 	*card_ret = card;
 	return 0;
 }
@@ -295,8 +302,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 		mutex_unlock(&snd_card_mutex);
 		dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
 			 idx, snd_ecards_limit - 1, err);
-		if (!card->managed)
-			kfree(card); /* manually free here, as no destructor called */
+		kfree(card); /* manually free here, as no destructor called */
 		return err;
 	}
 	set_bit(idx, snd_cards_lock);		/* lock it */
@@ -592,8 +598,7 @@ static int snd_card_do_free(struct snd_card *card)
 #endif
 	if (card->release_completion)
 		complete(card->release_completion);
-	if (!card->managed)
-		kfree(card);
+	kfree(card);
 	return 0;
 }
 
