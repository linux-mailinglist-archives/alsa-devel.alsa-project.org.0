Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAFD76FCB7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133437F8;
	Fri,  4 Aug 2023 10:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133437F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691139589;
	bh=F1/0QLHCS4gBERGLf0l732TUZEE12H8Q20+lwfH++YE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ScB/z9t943Rq7zrTsAl4kfu6pxE4C7k1g/101VU2n0Dz1H31WKGWgKPyT3PLvTnyV
	 qwaGl9DjEWe5+P1BiReuxVLu3XyNF4/InsBKKzdmHB//8i5qmU6h7ztp4ZX4l7Mx1X
	 Wi6iBjASA9GoHrP9cqAsCEXqPqWkgZKo8xi+6giA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6F94F80548; Fri,  4 Aug 2023 10:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A81F80425;
	Fri,  4 Aug 2023 10:58:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1908F80425; Fri,  4 Aug 2023 10:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22106F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22106F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lPSBx/zs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9ONGtaES
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D4B72186F;
	Fri,  4 Aug 2023 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691139519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7OmWTXxlnVlWCrST0eK+OofEBW9bWTQUUYiAQCwLjw=;
	b=lPSBx/zsTXfckbeRtNplLDFYAhYMe9c7bkv2pRIBSiQRmx+N8nJexvgZ0gefkvgbbfGscg
	jB4rUyuD7uM1uXhpWg/xG1fzd2RSxLsz3/+CJfrjY9j883SvrEBX/QqsPQOkoxEy6R68cs
	C20VDQ9ZrX3iGHSJQqI1iiiE2SM93og=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691139519;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7OmWTXxlnVlWCrST0eK+OofEBW9bWTQUUYiAQCwLjw=;
	b=9ONGtaESIRQ6paaRI4TNawqIHvl5zRj7ztuDdkDEK5M47nQ8gnHzzPpvDHlR9jldRMoT6n
	H0LJLkQUmg3iPWCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38CD4133B5;
	Fri,  4 Aug 2023 08:58:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nSnHDL+9zGT2CAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 08:58:39 +0000
Date: Fri, 04 Aug 2023 10:58:38 +0200
Message-ID: <87zg379oap.wl-tiwai@suse.de>
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
 <CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
	<87cz06djxo.wl-tiwai@suse.de>
	<CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
	<87sf90b7hw.wl-tiwai@suse.de>
	<87cz04b0ku.wl-tiwai@suse.de>
	<CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GQKNVLRF35YVA4UTJIM6ZNGRC62KFFN6
X-Message-ID-Hash: GQKNVLRF35YVA4UTJIM6ZNGRC62KFFN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQKNVLRF35YVA4UTJIM6ZNGRC62KFFN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 01:39:30 +0200,
Curtis Malainey wrote:
> > Now I slowly understand what's happening.  Essentially, it's because
> > the *embedded* struct device is released asynchronously from the
> > ALSA's resource management (via dev_free ops).  The objects may be
> > already released via card's device release (that calls
> > snd_device_free_all()), while the release of each struct device that
> > was already triggered beforehand can be delayed due to the debug
> > option.
> 
> Ah that actually is the second bug I am still working on and not this
> one. This patch fixes a bug in both the devm and non-devm case.
> 
> If you look at snd_card_init it installs release_card_device as the
> release function for the struct device card_dev.
> 
> snd_card also has another struct device embedded in it, ctl_dev.
> 
> release_card_device calls snd_card_do_free which at the end releases
> the snd_card struct.
> 
> The problem here is that in the kernel hacking situation, the release
> function on the devices are not always called inplace (i.e. assuming
> proper referencing counting behaviour). So with a bit of RNG, you hit
> a case where card_dev runs release_card_device before ctl_dev, or even
> before the PCM devices which results in the release function operating
> on a freed pointer.
> 
> The other sign this is an issue is that we have 2 struct devices in
> the same memory allocation (both in card and pcm), therefore they
> cannot properly own their release.

Right, that's why those two aren't coded like rawmidi and hwdep.

> > You code change looks mostly fine, but as far as I see,
> > compress_offload also needs a similar change.  Meanwhile, rawmidi and
> > hwdep do release the object via device release properly, so those are
> > fine.  Ditto for sequencer.  And timer is only a global device, hence
> > it must be fine.
> 
> Yes I noticed this too, will draft versions for them once I have the
> snd_card devm version solved. So far though only snd_card has
> reproduced the devm/release race.
> 
> >
> > And, I believe we need a bit more detailed patch description.  So,
> > could you improve the patch description, split the change to each
> > component (control, pcm and compress_offload), and resubmit?
> 
> I can definitely update this to contain a bit more detail. That being
> said, given the confusion about which bug this solves, do you still
> want me to split this up? The bug is not resolved without both PCM and
> card change for this bug which is hit in the delayed release, but they
> are for two different paths reported by KASAN.

It's rather for making changes easier to read.  The change for each
component seems completely individual and can be applied
independently.


> > Also, maybe it's worth to change snd_device_initialize() to take the
> > release (optional) argument, too, instead of setting it explicitly
> > afterwards at each place.  Already majority of callers will set own
> > release callbacks.  This can be done at one more additional patch at
> > last.
> 
> Sounds like a good idea, definitely an option once we get the
> underlying issue solved.

Now I've been reconsidering the problem, and thought of another
possible workaround.  We may add the card's refcount control for the
device init and release, so that we delay the actual resource free.
The basic idea is to take card->card_ref at the device init and unref
it at the actual device release callback.  Then the snd_card_free()
call is held until all those refcounted devices are released.

Below is a PoC patch (yes, this can be split, too ;)
A quick test on VM seems OK, but needs more reviews and tests.

It contains somewhat ugly conditional put_device() at the dev_free
ops.  We can make those a bit saner with some helpers later, too.

BTW, this approach may avoid another potential problem by the delayed
release; if we finish the driver remove without waiting for the actual
device releases, it may hit a code (the piece of the device release
callback) of the already removed module, and it's not guaranteed to be
present.
I'm not sure whether this really happens, but it's another thing to be
considered.


thanks,

Takashi

---
diff --git a/include/sound/core.h b/include/sound/core.h
index f6e0dd648b80..00c514a80a4a 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -239,7 +239,10 @@ extern struct dentry *sound_debugfs_root;
 
 void snd_request_card(int card);
 
-void snd_device_initialize(struct device *dev, struct snd_card *card);
+void __snd_device_initialize(struct device *dev, struct snd_card *card,
+			     bool with_ref);
+#define snd_device_initialize(dev, card) \
+	__snd_device_initialize(dev, card, false)
 
 int snd_register_device(int type, struct snd_card *card, int dev,
 			const struct file_operations *f_ops,
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 30f73097447b..a29398cc9d27 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1085,6 +1085,7 @@ static int snd_compress_dev_disconnect(struct snd_device *device)
 
 	compr = device->device_data;
 	snd_unregister_device(&compr->dev);
+	put_device(&compr->dev);
 	return 0;
 }
 
@@ -1158,7 +1159,8 @@ static int snd_compress_dev_free(struct snd_device *device)
 
 	compr = device->device_data;
 	snd_compress_proc_done(compr);
-	put_device(&compr->dev);
+	if (device->state != SNDRV_DEV_DISCONNECTED)
+		put_device(&compr->dev);
 	return 0;
 }
 
@@ -1189,7 +1191,7 @@ int snd_compress_new(struct snd_card *card, int device,
 
 	snd_compress_set_id(compr, id);
 
-	snd_device_initialize(&compr->dev, card);
+	__snd_device_initialize(&compr->dev, card, true);
 	dev_set_name(&compr->dev, "comprC%iD%i", card->number, device);
 
 	ret = snd_device_new(card, SNDRV_DEV_COMPRESS, compr, &ops);
diff --git a/sound/core/control.c b/sound/core/control.c
index 8386b53acdcd..bea501f20c4b 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2351,7 +2351,9 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	up_read(&snd_ctl_layer_rwsem);
 	up_read(&card->controls_rwsem);
 
-	return snd_unregister_device(&card->ctl_dev);
+	snd_unregister_device(&card->ctl_dev);
+	put_device(&card->ctl_dev);
+	return 0;
 }
 
 /*
@@ -2373,7 +2375,8 @@ static int snd_ctl_dev_free(struct snd_device *device)
 	xa_destroy(&card->ctl_hash);
 #endif
 	up_write(&card->controls_rwsem);
-	put_device(&card->ctl_dev);
+	if (device->state != SNDRV_DEV_DISCONNECTED)
+		put_device(&card->ctl_dev);
 	return 0;
 }
 
@@ -2395,7 +2398,7 @@ int snd_ctl_create(struct snd_card *card)
 	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
 		return -ENXIO;
 
-	snd_device_initialize(&card->ctl_dev, card);
+	__snd_device_initialize(&card->ctl_dev, card, true);
 	dev_set_name(&card->ctl_dev, "controlC%d", card->number);
 
 	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
diff --git a/sound/core/init.c b/sound/core/init.c
index baef2688d0cf..d122ff60c463 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -117,6 +117,10 @@ static int get_slot_from_bitmask(int mask, int (*check)(struct module *, int),
  */
 static void default_release(struct device *dev)
 {
+	struct snd_card *card = dev_get_drvdata(dev);
+
+	if (card)
+		snd_card_unref(card);
 }
 
 /**
@@ -124,15 +128,20 @@ static void default_release(struct device *dev)
  * @dev: device to initialize
  * @card: card to assign, optional
  */
-void snd_device_initialize(struct device *dev, struct snd_card *card)
+void __snd_device_initialize(struct device *dev, struct snd_card *card,
+			     bool with_ref)
 {
 	device_initialize(dev);
 	if (card)
 		dev->parent = &card->card_dev;
 	dev->class = &sound_class;
 	dev->release = default_release;
+	if (with_ref) {
+		dev_set_drvdata(dev, card);
+		get_device(&card->card_dev);
+	}
 }
-EXPORT_SYMBOL_GPL(snd_device_initialize);
+EXPORT_SYMBOL_GPL(__snd_device_initialize);
 
 static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e3731123..ccad084a359f 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -30,7 +30,7 @@ static DEFINE_MUTEX(register_mutex);
 static LIST_HEAD(snd_pcm_notify_list);
 #endif
 
-static int snd_pcm_free(struct snd_pcm *pcm);
+static int snd_pcm_free(struct snd_pcm *pcm, bool do_put);
 static int snd_pcm_dev_free(struct snd_device *device);
 static int snd_pcm_dev_register(struct snd_device *device);
 static int snd_pcm_dev_disconnect(struct snd_device *device);
@@ -650,7 +650,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 	if (!substream_count)
 		return 0;
 
-	snd_device_initialize(&pstr->dev, pcm->card);
+	__snd_device_initialize(&pstr->dev, pcm->card, true);
 	pstr->dev.groups = pcm_dev_attr_groups;
 	pstr->dev.type = &pcm_dev_type;
 	dev_set_name(&pstr->dev, "pcmC%iD%i%c", pcm->card->number, pcm->device,
@@ -752,7 +752,7 @@ static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
 	return 0;
 
 free_pcm:
-	snd_pcm_free(pcm);
+	snd_pcm_free(pcm, true);
 	return err;
 }
 
@@ -821,7 +821,7 @@ static void free_chmap(struct snd_pcm_str *pstr)
 	}
 }
 
-static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
+static void snd_pcm_free_stream(struct snd_pcm_str * pstr, bool do_put)
 {
 	struct snd_pcm_substream *substream, *substream_next;
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
@@ -846,7 +846,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 	}
 #endif
 	free_chmap(pstr);
-	if (pstr->substream_count)
+	if (pstr->substream_count && do_put)
 		put_device(&pstr->dev);
 }
 
@@ -861,7 +861,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
 #define pcm_call_notify(pcm, call) do {} while (0)
 #endif
 
-static int snd_pcm_free(struct snd_pcm *pcm)
+static int snd_pcm_free(struct snd_pcm *pcm, bool do_put)
 {
 	if (!pcm)
 		return 0;
@@ -870,8 +870,8 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 	if (pcm->private_free)
 		pcm->private_free(pcm);
 	snd_pcm_lib_preallocate_free_for_all(pcm);
-	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE]);
+	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK], do_put);
+	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE], do_put);
 	kfree(pcm);
 	return 0;
 }
@@ -879,7 +879,7 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 static int snd_pcm_dev_free(struct snd_device *device)
 {
 	struct snd_pcm *pcm = device->device_data;
-	return snd_pcm_free(pcm);
+	return snd_pcm_free(pcm, device->state != SNDRV_DEV_DISCONNECTED);
 }
 
 int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
@@ -1125,7 +1125,10 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 
 	pcm_call_notify(pcm, n_disconnect);
 	for (cidx = 0; cidx < 2; cidx++) {
+		if (!pcm->streams[cidx].substream_count)
+			continue;
 		snd_unregister_device(&pcm->streams[cidx].dev);
+		put_device(&pcm->streams[cidx].dev);
 		free_chmap(&pcm->streams[cidx]);
 	}
 	mutex_unlock(&pcm->open_mutex);
