Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD5B19CAF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 09:31:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A951D60230;
	Mon,  4 Aug 2025 09:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A951D60230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754292704;
	bh=7kS6JWQ4bA0nnvPjuDl9gS6z/CRXs1RO3PX1gxKC/FQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=POtaLh2B6w8A+Jmf2Pgeo/XHK8tMOL9EKzCaYbw7TiNH5r7Qow07z8RSU/0ccwtLJ
	 Y0u8ZKOeFmWgIG1WXXrfJksX2OlVGP3eQjHukGM7unzv+a9ILzCIDLmJife7YIIZH8
	 xkRyASPHtR/k4aWxsd5bSnxA7DFBmucSu8J4iCJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14316F805C6; Mon,  4 Aug 2025 09:31:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C56F805BE;
	Mon,  4 Aug 2025 09:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6231F804FB; Mon,  4 Aug 2025 09:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0A46F8003C
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 09:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A46F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=N945SvsD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XOZVTuU0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=N945SvsD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XOZVTuU0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16D471F387;
	Mon,  4 Aug 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754292638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PZp2tDEbriHIoR0mHOGKvifXiuzGOQ+lgb4SRiZHUaA=;
	b=N945SvsDs/wi+aoM4Pz0tkn2CEs/pMmejQY1Tj8dzqFqnMTZqCW7CeDHnRYkmTwiHBRV8i
	P4MI4A9AtOl/OmH39z+pULEobuVJjNaK8kn9cSqAHR78pA6CE9IPGlTR0IrRR8inLPYHa+
	wgEEot9t/PNes/4T4WuGp6xyKqCgrS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754292638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PZp2tDEbriHIoR0mHOGKvifXiuzGOQ+lgb4SRiZHUaA=;
	b=XOZVTuU0ljQ4ouN+eEp/eV8xAc9/nhJyL8WEbhmuZplEewwQoDZXiwpCk56yLVmVSD8MpI
	HrBqJUguP9tld4BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N945SvsD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XOZVTuU0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754292638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PZp2tDEbriHIoR0mHOGKvifXiuzGOQ+lgb4SRiZHUaA=;
	b=N945SvsDs/wi+aoM4Pz0tkn2CEs/pMmejQY1Tj8dzqFqnMTZqCW7CeDHnRYkmTwiHBRV8i
	P4MI4A9AtOl/OmH39z+pULEobuVJjNaK8kn9cSqAHR78pA6CE9IPGlTR0IrRR8inLPYHa+
	wgEEot9t/PNes/4T4WuGp6xyKqCgrS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754292638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PZp2tDEbriHIoR0mHOGKvifXiuzGOQ+lgb4SRiZHUaA=;
	b=XOZVTuU0ljQ4ouN+eEp/eV8xAc9/nhJyL8WEbhmuZplEewwQoDZXiwpCk56yLVmVSD8MpI
	HrBqJUguP9tld4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAEDE133D1;
	Mon,  4 Aug 2025 07:30:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BJeTN51hkGifXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Aug 2025 07:30:37 +0000
Date: Mon, 04 Aug 2025 09:30:37 +0200
Message-ID: <87cy9b1r36.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pablo Scatizza <pscatizza@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: Regression: Microphone broken on Intel Ice Lake with
 alsa-ucm-conf 1.2.10-150600.3.5.1 (openSUSE Leap 15.6)
In-Reply-To: 
 <CAOJTC7bb=qHnhMhNUsSzg=0kCHjSoZmR7hc1n7LvWPuVq09GiA@mail.gmail.com>
References: 
 <CAOJTC7bb=qHnhMhNUsSzg=0kCHjSoZmR7hc1n7LvWPuVq09GiA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-2.99)[99.97%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 16D471F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: M3J4OVCLDB6CC6IZQNBCJEVFPCMSWBCL
X-Message-ID-Hash: M3J4OVCLDB6CC6IZQNBCJEVFPCMSWBCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3J4OVCLDB6CC6IZQNBCJEVFPCMSWBCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Jul 2025 00:31:33 +0200,
Pablo Scatizza wrote:
> 
> Dear ALSA developers,
> 
> I would like to report a regression affecting the microphone on my laptop
> using Intel's Ice Lake-LP audio controller with the `sof-hda-dsp` driver.
> 
> After upgrading `alsa-ucm-conf` to version 1.2.10-150600.3.5.1 (as
> distributed in openSUSE Leap 15.6), the internal microphone stops working.
> No capture is possible via `arecord` or any application. The device still
> shows up in `arecord -l`, but it does not receive audio input.
> 
> Rolling back to the previous version (1.2.10-150600.1.2) using:
> sudo zypper install --oldpackage alsa-ucm-conf-1.2.10-150600.1.2.noarch
> 
> restores full microphone functionality.
> 
> **System information:**
> - Distribution: openSUSE Leap 15.6
> - Kernel: 6.4.0-150600.23.53-default
> - Audio device: Intel Corporation Ice Lake-LP Smart Sound Technology Audio
> Controller (rev 30)
> - ALSA driver: sof-hda-dsp
> 
> **Working `arecord -l` output with the old version:**
> card 0: sofhdadsp [sof-hda-dsp], device 0: HDA Analog (
> *) [] card 0: sofhdadsp [sof-hda-dsp], device 6: DMIC (*) []
> card 0: sofhdadsp [sof-hda-dsp], device 7: DMIC16kHz (*) []
> 
> Let me know if I can provide logs, diffs between UCM files, or further
> testing. I'd be happy to help.

It's a known regression that is specific to the previous maintenance
update of alsa-ucm-conf package for SLE15-SP6 / openSUSE Leap 15.6.
The fix has already queued for the release.


thanks,

Takashi
