Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6191E221
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 16:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924C62354;
	Mon,  1 Jul 2024 16:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924C62354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719843445;
	bh=Mjjza8FfMvz4cHw1UobsfT8udVzT0tLlV7IEjtDFLMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ib/n58jUnAd0HhSVEjlIlblaAUw1F8DuY7viLB7bY7MPk90hylv5ETt/m2aHIfT4W
	 lDUgsMZAmGVEIoT7KrxUzzdt3muk8SczTawnwCJHOGMOt9bcKyJA5a5GsHQ53EeFUl
	 xcJRuMrTOu+/Z54Ak7rQ3rH10DpcOfM2Ip+W8rs8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1889F8013D; Mon,  1 Jul 2024 16:16:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0077F805A1;
	Mon,  1 Jul 2024 16:16:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3205F8028B; Mon,  1 Jul 2024 16:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65088F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 16:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65088F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=toujm+yU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TArBXRSH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=toujm+yU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TArBXRSH
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 851EF21A5C;
	Mon,  1 Jul 2024 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719843403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=toujm+yUihyTTB8Ukg0gtXfjKVTbYRxS+GyK7xjzmNfXMqw1KtyChAuiaRQyE88O0vQHvY
	OQDGwlJsb156ENG4/ShtQlY5TmneQ7xRmGjEt+Z+TvJw9xOJHq731do+J/9cYVKRUw4isR
	crZSOS7/Sle0eikkk+ntPWe48ijJNqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719843403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=TArBXRSH6nREcqXK9HFC4yiQqSUQFVUsUVm4nSAWOmcJoXVtN8I6MP0MOu8dL58+vCXc9B
	P6y+Xn99UQxGkhAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719843403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=toujm+yUihyTTB8Ukg0gtXfjKVTbYRxS+GyK7xjzmNfXMqw1KtyChAuiaRQyE88O0vQHvY
	OQDGwlJsb156ENG4/ShtQlY5TmneQ7xRmGjEt+Z+TvJw9xOJHq731do+J/9cYVKRUw4isR
	crZSOS7/Sle0eikkk+ntPWe48ijJNqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719843403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/waVY45CQIHYYJTuHmhw142WDxIKLlVSuY6XurD0EuQ=;
	b=TArBXRSH6nREcqXK9HFC4yiQqSUQFVUsUVm4nSAWOmcJoXVtN8I6MP0MOu8dL58+vCXc9B
	P6y+Xn99UQxGkhAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A769139C2;
	Mon,  1 Jul 2024 14:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i2LVFEu6gmZYawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jul 2024 14:16:43 +0000
Date: Mon, 01 Jul 2024 16:17:11 +0200
Message-ID: <8734ot42oo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Asahi Lina <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 5JHLT2DENW5C63TITVTZ4FYRD2JRRGY3
X-Message-ID-Hash: 5JHLT2DENW5C63TITVTZ4FYRD2JRRGY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JHLT2DENW5C63TITVTZ4FYRD2JRRGY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Jun 2024 18:04:41 +0200,
Asahi Lina wrote:
> 
> Hi,
> 
> I'm reverse engineering and implementing support for the RME Digiface
> USB, which is an ADAT interface with a non-class-compliant interface
> (probably similar to other RME interfaces like the MADIface, but I don't
> have any others to test). The basic audio streaming works fine with an
> entry in quirks-table.h and a format quirk to set the system sample rate
> in quirks.c. Now I need to figure out how to implement the mixer controls.
> 
> Currently I have the snd-usb-audio driver claiming only interface #0
> (streaming) and I use a Python script to control the mixer/settings
> directly with libusb (control transfers and interface #1). This works
> fine and there's some prior art for this in the firewire world (for
> example, snd-dice doesn't do any mixer control stuff and you have to use
> ffado-mixer to control everything from userspace) but I assume it's not
> really the best way to go?
> 
> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.
> 
> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.
> 
> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.
> 
> System settings/general status/output faders go via control transfers,
> while interface #1 has an interrupt IN endpoint (streaming state
> feedback, not very useful) and two bulk endpoints (matrix mixer control
> out, VU meter data in). There's another pair of bulk endpoints in
> interface #2 which I'm guessing are for firmware updates (I haven't
> looked at that part). So in principle it's not crazy to expose all the
> system controls/output faders as mixer controls in ALSA and leave
> interface #1 entirely unclaimed so a userspace program can directly
> configure the matrix mixer and access VU meter levels. There is a global
> mixer enable bit (controlled via ctl transfer), so if that is exposed as
> an ALSA control and disabled by default the interface will operate as a
> 1:1 in/out interface without needing any custom userspace to configure
> the mixer.
> 
> There's one other quirky thing: it also needs a way to set the sample
> rate as a mixer control, because you need to be able to configure the
> rate even when the PCM device is not open (since that affects
> stand-alone mixer operation). I imagine the right logic here would be to
> have a selector control for the system sample rate, and automatically
> change it and lock it when the PCM is opened with a given rate?
> 
> Any thoughts welcome ^^

As Geoffrey already suggested, the matrix size can be reduced since
each kcontrol element can be an array, so the number of controls can
be either column or row size of the matrix, which is well manageable.

The VU meter can be provided as volatile read-only controls, too.

So from the API-wise POV, it'll be a most straightforward
implementation.

OTOH, if you need more efficiency (e.g. the control access is way too
much overhead), it can be implemented freely via a hwdep device and
your own ioctls or mmaps, too.  But this is literally h/w dependent,
and the API becomes too specific, no other way than using own tool, as
a drawback.


Takashi
