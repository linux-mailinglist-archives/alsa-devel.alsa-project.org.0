Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBE7AAEBB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 11:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB73E12;
	Fri, 22 Sep 2023 11:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB73E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695376222;
	bh=mzTZL1T9JXIJYO8lyVNozvXPmN6NVeeNIzy3oI5lMwE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tp+qTKasvHDyCQc9BUViVHDNoShnM1sNMlL0Psw/+ujRfp7O01gk2wJ6g9YO9KlLE
	 KyMnBVztcN9WF7IQhwoW9pYGyFejqsQsmyKiF91Jc55HRitR2HIrs795Z++4h3whEU
	 ekpeD646LVtmaGRpGeDadCSEpaEmb/RU9wZPfE8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB563F80494; Fri, 22 Sep 2023 11:49:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7E9F80125;
	Fri, 22 Sep 2023 11:49:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61E8FF801F5; Fri, 22 Sep 2023 11:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89083F800F4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 11:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89083F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wrK7gqgE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CuMxQSCT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A98801F45F;
	Fri, 22 Sep 2023 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695376154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OHleDVW/EWfCO2jlxKvuMDthf5XAZe9Js7GLKX4BZ4Y=;
	b=wrK7gqgEMqxN2EEFpr9tlrgPtg+tUnkqxFRaSet960sq0zCVbUDXWSE7DIjkrhPx8tnBGN
	T6boY3LxmG6ap/7sIme7lEOmvGLBA4v3DmwtLP7PAinGgjsV3zpHoFs2PPDUWae199zZsQ
	Tm122vpl05w/itw+yG6SCPjmkO5nZfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695376154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OHleDVW/EWfCO2jlxKvuMDthf5XAZe9Js7GLKX4BZ4Y=;
	b=CuMxQSCTzo4WxY8Y/dt5PoO0reVuGU2jfqQ7MZG6S0eyNMRYvljNLbMkG5lKzqTpTb+rT3
	cuxXxAxjcX+SeiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6708913478;
	Fri, 22 Sep 2023 09:49:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fUu6FxpjDWWHZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 09:49:14 +0000
Date: Fri, 22 Sep 2023 11:49:13 +0200
Message-ID: <877coiedwm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
Subject: Re: [PATCH] sound: usb: increase snd_card alloc size
In-Reply-To: <87h6nmegt9.wl-tiwai@suse.de>
References: <20230922005152.163640-1-ricardo@marliere.net>
	<87h6nmegt9.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WLU4DBGJSL3FFR6R3KGLXBR4G5MHRB7P
X-Message-ID-Hash: WLU4DBGJSL3FFR6R3KGLXBR4G5MHRB7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLU4DBGJSL3FFR6R3KGLXBR4G5MHRB7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 10:46:26 +0200,
Takashi Iwai wrote:
> 
> On Fri, 22 Sep 2023 02:51:53 +0200,
> Ricardo B. Marliere wrote:
> > 
> > Syzbot reports a slab-out-of-bounds read of a snd_card object. When
> > snd_usb_audio_create calls snd_card_new, it passes sizeof(*chip) as the
> > extra_size argument, which is not enough in this case.
> > 
> > Relevant logs below:
> > 
> > BUG: KASAN: slab-out-of-bounds in imon_probe+0x2983/0x3910
> > Read of size 1 at addr ffff8880436a2c71 by task kworker/1:2/777
> > (...)
> > The buggy address belongs to the object at ffff8880436a2000
> >  which belongs to the cache kmalloc-4k of size 4096
> > The buggy address is located 1 bytes to the right of
> >  allocated 3184-byte region [ffff8880436a2000, ffff8880436a2c70)
> > 
> > Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.co/m
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > ---
> >  sound/usb/card.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 1b2edc0fd2e9..6578326d33e8 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -619,7 +619,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
> >  	}
> >  
> >  	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
> > -			   sizeof(*chip), &card);
> > +			   sizeof(*chip) + 2, &card);
> 
> Sorry, it's no-no.  We have to fix the cause of the OOB access instead
> of papering over with a random number of increase.
> 
> Unfortunately, most important piece of information is trimmed in the
> changelog, so I can't judge what's going on.  The only useful info
> there is that it's something to do with imon driver, but it's
> completely independent from USB-audio.  How does it access to the
> external memory allocated by snd-usb-audio driver at all?
> 
> Before jumping to the solution, we must understand the problem.

Now I took a look at the syzbot URL and got more info.

Through a quick glance, my wild guess is that two different drivers
are bound to two interfaces of the device, the first one to usb-audio
and the second one to imon.  And imon driver blindly assumes that the
first interface is bound with imon, too, and that can be the cause.
A patch like below (totally untested!) might fix the problem.

Can you reproduce the problem in your side?  Or did you pick this up
randomly without testing?

In anyway, let's put media people to Cc.


thanks,

Takashi

--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2427,6 +2427,12 @@ static int imon_probe(struct usb_interface *interface,
 		goto fail;
 	}
 
+	if (first_if->dev.driver != interface->dev.driver) {
+		dev_err(&interface->dev, "inconsistent driver matching\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	if (ifnum == 0) {
 		ictx = imon_init_intf0(interface, id);
 		if (!ictx) {
