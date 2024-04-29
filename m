Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D08B578E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 14:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3914A827;
	Mon, 29 Apr 2024 14:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3914A827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714392756;
	bh=Kv9UVoqr4FPtC8ayOP5lsOjpRRdbK3TbUzE2L4pIu3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OgBhKkq3WPPaHj5hghQsLo3W0x0QZJDBUrFt2+mXyPZ9BA5Jar1STUQVcEuVQHJ4X
	 Z1wdHk+zo2qLDgFp0h31kIvVy4RyJT9kCeC+5P+vGzk0azCIvULCpgL3cMC95+9tP/
	 EEku2nqKsRVMpEyHqX3Gh+lAKtFr5EjvjGGmMN0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DE7F8057C; Mon, 29 Apr 2024 14:12:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2CAF805A0;
	Mon, 29 Apr 2024 14:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EFDAF8028D; Mon, 29 Apr 2024 14:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4044F800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 14:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4044F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=r7wHopYS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=v6PkS9iC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=r7wHopYS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=v6PkS9iC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 227723373E;
	Mon, 29 Apr 2024 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714392690;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZnWgq4tXzT/pnbV9TmhzqgQBTHbr85kNIzhNWX8X4Q=;
	b=r7wHopYSw64Ks0Q94uS2D/MljcGTpCE5Wd5xQUBqEiafxM0l1mAvPGo01+ZyWBBc6URMsX
	8x3KvUIv/4MXVln7irBteQ03i+kt8xKMzS9DSYCN7Y0Oe9deAJYhwlDaj5XvnrjlFbdw9D
	RaCJqBhUTGAGHtdY8EnqTv5/L1g7xXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714392690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZnWgq4tXzT/pnbV9TmhzqgQBTHbr85kNIzhNWX8X4Q=;
	b=v6PkS9iCjsDfJlMRAseJm2xGdpPi4HY7EH/zD9Dne+kRlONHO0sE5M79hOZmpNAU8s5h8Y
	bCFZaPNgPMHnnxDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714392690;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZnWgq4tXzT/pnbV9TmhzqgQBTHbr85kNIzhNWX8X4Q=;
	b=r7wHopYSw64Ks0Q94uS2D/MljcGTpCE5Wd5xQUBqEiafxM0l1mAvPGo01+ZyWBBc6URMsX
	8x3KvUIv/4MXVln7irBteQ03i+kt8xKMzS9DSYCN7Y0Oe9deAJYhwlDaj5XvnrjlFbdw9D
	RaCJqBhUTGAGHtdY8EnqTv5/L1g7xXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714392690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZnWgq4tXzT/pnbV9TmhzqgQBTHbr85kNIzhNWX8X4Q=;
	b=v6PkS9iCjsDfJlMRAseJm2xGdpPi4HY7EH/zD9Dne+kRlONHO0sE5M79hOZmpNAU8s5h8Y
	bCFZaPNgPMHnnxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A05A139DE;
	Mon, 29 Apr 2024 12:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id il5OJHGOL2bmVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 12:11:29 +0000
Date: Mon, 29 Apr 2024 14:11:41 +0200
Message-ID: <87jzkgpdvm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ManuLinares <mbarriolinares@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	dengxiang <dengxiang@nfschina.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Max McCarthy <mmccarthy@mcintoshlabs.com>,
	WhaleChang <whalechang@google.com>,
	Lukasz Tyl <ltyl@hem-e.com>,
	Jeremie Knuesel <knuesel@gmail.com>,
	Alexander Tsoy <alexander@tsoy.me>,
	Jussi Laako <jussi@sonarnerd.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add sampling rates support for Mbox3
In-Reply-To: <20240428005733.202978-1-mbarriolinares@gmail.com>
References: <20240428005733.202978-1-mbarriolinares@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,suse.com,nfschina.com,gmail.com,mcintoshlabs.com,google.com,hem-e.com,tsoy.me,sonarnerd.net,vger.kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: CN2RLL6J3KH4DLKOSGJJGAGXTHI5SJXW
X-Message-ID-Hash: CN2RLL6J3KH4DLKOSGJJGAGXTHI5SJXW
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CN2RLL6J3KH4DLKOSGJJGAGXTHI5SJXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 28 Apr 2024 02:57:29 +0200,
ManuLinares wrote:
> 
> This adds support for all sample rates supported by the hardware,
> Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}
> 
> Fixes syncing clock issues that presented as pops. To test this, without
> this patch playing 440hz tone produces pops.
> 
> Clock is now synced between playback and capture interfaces so no more
> latency drift issue when using pipewire pro-profile.
> (https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)
> 
> Signed-off-by: ManuLinares <mbarriolinares@gmail.com>
(snip)
> -	dev_dbg(&dev->dev, "device initialised!\n");
> +	dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
>  
>  	err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
>  		&dev->descriptor, sizeof(dev->descriptor));
>  	config = dev->actconfig;
> -	if (err < 0)
> -		dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> +	if (err < 0) 

You put a tailing sparce superfluously.

> +		dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
>  
>  	err = usb_reset_configuration(dev);
> -	if (err < 0)
> -		dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
> -	dev_dbg(&dev->dev, "mbox3_boot: new boot length = %d\n",
> +	if (err < 0) 

Ditto.  Try to run checkpatch.pl at the next time; it should warn you
such errors.

(snip)
> +static void mbox3_set_format_quirk(struct snd_usb_substream *subs,
> +									const struct audioformat *fmt)
> +{
> +	// Set rate only for one interface
> +	//u8 iface = subs->data_endpoint->iface;
> +	//if (iface != 2) return;
> +
> +	u8 buffer[4] = {0};
> +	u32 new_rate = subs->data_endpoint->cur_rate;

Let's to be classic: try to put the variable definitions at the begin
of the function.

(snip)
> +	__le32 set_rate = cpu_to_le32(new_rate);

Ditto.

(snip)
> +	// Check whether the change was successful
> +	buffer[0] = 0; buffer[1] = 0; buffer[2] = 0; buffer[3] = 0;

You can use memset().  (Or if it were a __le32 variable, it can be
simply zero assignment.)

> +	snd_usb_ctl_msg(subs->dev,
> +					usb_sndctrlpipe(subs->dev, 0),
> +					0x01, 0x21 | USB_DIR_IN, 0x0100, 0x8101, &buffer, 4);
> +	//set_rate = *(int *)buffer;
> +	set_rate = le32_to_cpu(*(u32 *)buffer);

Strictly speaking, this won't work always as no alignment is
guaranteed for char[4].  If you need to pass/receive a 4-byte integer,
better to use a __le32 variable instead.  For a one-byte temporary
buffer, you can use another variable additionally.

Could you resubmit with those corrections?


thanks,

Takashi
