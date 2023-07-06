Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5474A19C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 17:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBBAC1D9;
	Thu,  6 Jul 2023 17:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBBAC1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688658872;
	bh=w1mVM4n5v7vjdwJvEbPvYu/AuRHJ/nQWDNPBy13gvlM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4HJI9sa8cDtGmJsj8T3KM13HfUARca2zOoxbxrxx3RQOIBH6mn744abIXaxNT1MG
	 1qp9UJ9i2GYIz7UGxTPzM73OEd4YMsJcgJ3qCODB87KVrYSpmE7Qhjz2vy7HfrjZJy
	 GuM5UTfNNHe7xsbzkmuE+osSVBufwcEMscMEK9xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1D4BF80100; Thu,  6 Jul 2023 17:53:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB08F80100;
	Thu,  6 Jul 2023 17:53:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1502F80124; Thu,  6 Jul 2023 17:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3906F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 17:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3906F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m7dlnuyc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AgouHxzL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CAA91F88F;
	Thu,  6 Jul 2023 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688658799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbQRYXTNKpMCvKnEIUA82+jXT6tTQQVn5w9bdZdurt8=;
	b=m7dlnuycTEHnXdQsObZRoL/o4BQZjbwrlFs6JqmjH7kJKAArs4Z3pMZvQy6tV6EYgOQibF
	/XiorWnvNmnf71/uI8lb1E7trb1g+TkOKdBPm0MTXfNfIP/+5067MnEfFkG0D+ZnPDt+Qi
	8KbEESncttqkUKsdgXyAdA6Owj6GpP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688658799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbQRYXTNKpMCvKnEIUA82+jXT6tTQQVn5w9bdZdurt8=;
	b=AgouHxzL0LBkQNQlTl6P/BJX7HvlC3ep8W8WOB04iiB46aLmhQJqFhSwV4VHfoIbrjoxlu
	JY9eACUeyfR1KcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAFE1138EE;
	Thu,  6 Jul 2023 15:53:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0xFiNG7jpmSKIQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 06 Jul 2023 15:53:18 +0000
Date: Thu, 06 Jul 2023 17:53:18 +0200
Message-ID: <874jmhm3yp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	alsa-devel@alsa-project.org
Subject: Re: [bug report] ALSA: jack: Access input_dev under mutex
In-Reply-To: <9919760c-aaef-06ea-b97c-7a2781f63fb1@linux.intel.com>
References: <cf95f7fe-a748-4990-8378-000491b40329@moroto.mountain>
	<87sfa42j76.wl-tiwai@suse.de>
	<b82e9ab6-5ae5-a414-f3f0-e864bf5a0a62@linux.intel.com>
	<9919760c-aaef-06ea-b97c-7a2781f63fb1@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NBA5YWCBBC7SEHBMMFGCPTZUPYMQP4O5
X-Message-ID-Hash: NBA5YWCBBC7SEHBMMFGCPTZUPYMQP4O5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBA5YWCBBC7SEHBMMFGCPTZUPYMQP4O5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jul 2023 17:16:38 +0200,
Amadeusz S³awiñski wrote:
> 
> On 7/5/2023 4:47 PM, Amadeusz S³awiñski wrote:
> > On 7/4/2023 10:07 AM, Takashi Iwai wrote:
> >> On Mon, 03 Jul 2023 16:18:27 +0200,
> >> Dan Carpenter wrote:
> >>> 
> >>> Hello Amadeusz S³awiñski,
> >>> 
> >>> The patch 1b6a6fc5280e: "ALSA: jack: Access input_dev under mutex"
> >>> from Apr 12, 2022, leads to the following Smatch static checker
> >>> warning:
> >>> 
> >>>     sound/core/jack.c:673 snd_jack_report()
> >>>     warn: sleeping in atomic context
> >>> 
> >>> sound/core/jack.c
> >>>      663         jack->hw_status_cache = status;
> >>>      664
> >>>      665         list_for_each_entry(jack_kctl, &jack->kctl_list, list)
> >>>      666                 if (jack_kctl->sw_inject_enable)
> >>>      667                         mask_bits |= jack_kctl->mask_bits;
> >>>      668                 else
> >>>      669                         snd_kctl_jack_report(jack->card,
> >>> jack_kctl->kctl,
> >>>      670                                              status &
> >>> jack_kctl->mask_bits);
> >>>      671
> >>>      672 #ifdef CONFIG_SND_JACK_INPUT_DEV
> >>> --> 673         mutex_lock(&jack->input_dev_lock);
> >>>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>> 
> >>> That patch adds this mutex but we can't take mutex because we're already
> >>> holding a spinlock.  The problematic call trees are:
> >>> 
> >>> virtsnd_event_notify_cb() <- disables preempt
> >>> virtsnd_disable_event_vq() <- disables preempt
> >>> -> virtsnd_event_dispatch()
> >>>     -> virtsnd_jack_event()
> >>>        -> snd_jack_report()
> >>> 
> >>> The virtsnd_event_notify_cb() and virtsnd_disable_event_vq() functions
> >>> take the spin_lock_irqsave(&queue->lock, flags);
> >> 
> >> Indeed it was no good choice to use the mutex there inside the report
> >> function.  It's supposed to be callable from an irq-disabled context,
> >> too.
> >> 
> >> How about simply using the device refcount like below?
> >> 
> >> Although we may drop the mutex from snd_jack, it can can be left, as
> >> it's still useful for protecting a potential race between creation and
> >> deletion.
> >> 
> >> 
> >> thanks,
> >> 
> >> Takashi
> >> 
> >> -- 8< --
> >> --- a/sound/core/jack.c
> >> +++ b/sound/core/jack.c
> >> @@ -654,6 +654,7 @@ void snd_jack_report(struct snd_jack *jack, int
> >> status)
> >>       struct snd_jack_kctl *jack_kctl;
> >>       unsigned int mask_bits = 0;
> >>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> >> +    struct input_dev *idev;
> >>       int i;
> >>   #endif
> >> @@ -670,17 +671,15 @@ void snd_jack_report(struct snd_jack *jack,
> >> int status)
> >>                            status & jack_kctl->mask_bits);
> >>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> >> -    mutex_lock(&jack->input_dev_lock);
> >> -    if (!jack->input_dev) {
> >> -        mutex_unlock(&jack->input_dev_lock);
> >> +    idev = input_get_device(jack->input_dev);
> >> +    if (!idev)
> >>           return;
> >> -    }
> >>       for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
> >>           int testbit = ((SND_JACK_BTN_0 >> i) & ~mask_bits);
> >>           if (jack->type & testbit)
> >> -            input_report_key(jack->input_dev, jack->key[i],
> >> +            input_report_key(idev, jack->key[i],
> >>                        status & testbit);
> >>       }
> >> @@ -688,13 +687,13 @@ void snd_jack_report(struct snd_jack *jack,
> >> int status)
> >>           int testbit = ((1 << i) & ~mask_bits);
> >>           if (jack->type & testbit)
> >> -            input_report_switch(jack->input_dev,
> >> +            input_report_switch(idev,
> >>                           jack_switch_types[i],
> >>                           status & testbit);
> >>       }
> >> -    input_sync(jack->input_dev);
> >> -    mutex_unlock(&jack->input_dev_lock);
> >> +    input_sync(idev);
> >> +    input_put_device(idev);
> >>   #endif /* CONFIG_SND_JACK_INPUT_DEV */
> >>   }
> >>   EXPORT_SYMBOL(snd_jack_report);
> > 
> > 
> > Looking at code it looks like it should also work. Will schedule
> > test run tomorrow to see if it causes any problems.
> 
> I've run tests and see nothing worrying, so
> Tested-by: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>

Good to hear, I'll submit the proper patch.


thanks,

Takashi
