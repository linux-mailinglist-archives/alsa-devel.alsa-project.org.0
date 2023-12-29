Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52282221D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2604CE9D;
	Tue,  2 Jan 2024 20:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2604CE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704224182;
	bh=cj2aQztrLECqQO5ttdMXf+9t9trVbYJkFWCVOYNyDZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O2w+HK7LKlt6wnJVMTAUGaee9vxkn6TW8YgOiEI+nBadIGe+9mwrZ9AzSSNe0xs6A
	 4t3CRUoKKfItfRq9LTTe7yeBkkvqLxUyDyb5XymdJ0XO4gYeENfixYqyCmcS7OyfTJ
	 UufIN3/mTvSoFEVngATs9ugIFdMX8Y18jSXaRgo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9896AF80611; Tue,  2 Jan 2024 20:35:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA21F80603;
	Tue,  2 Jan 2024 20:35:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C59DF80580; Tue,  2 Jan 2024 20:35:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB881F80074
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB881F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FRVD7qeQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pzTmEvk3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=FRVD7qeQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pzTmEvk3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49AFA1FD32;
	Fri, 29 Dec 2023 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQgIrfQv5/fxFKI+6NCuWK/yeY8eiMhu8aDJCVlquNU=;
	b=FRVD7qeQc9e0FTz/o1c//sPPHaQ9Au1+r7j5ZdgBLu3Bv48mPBP9txYJw1oS9K0RgZnl8H
	tmI7gwZgiP2y9JzkpjMoKSvru1Hvt87OCFZEXU9moTApBtM4S9RFQpaf63yx8ojMJ8U6Xw
	xkyg2UthlcVUI/kBFBTTB5VSHYj6KK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQgIrfQv5/fxFKI+6NCuWK/yeY8eiMhu8aDJCVlquNU=;
	b=pzTmEvk3CTYJhU48xxot3jlMWt0WycqjhzcjAFrnKcy4up43mKv4sv04zQJEX6ZgqTz83c
	7EVP3qTBdziUNRDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQgIrfQv5/fxFKI+6NCuWK/yeY8eiMhu8aDJCVlquNU=;
	b=FRVD7qeQc9e0FTz/o1c//sPPHaQ9Au1+r7j5ZdgBLu3Bv48mPBP9txYJw1oS9K0RgZnl8H
	tmI7gwZgiP2y9JzkpjMoKSvru1Hvt87OCFZEXU9moTApBtM4S9RFQpaf63yx8ojMJ8U6Xw
	xkyg2UthlcVUI/kBFBTTB5VSHYj6KK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQgIrfQv5/fxFKI+6NCuWK/yeY8eiMhu8aDJCVlquNU=;
	b=pzTmEvk3CTYJhU48xxot3jlMWt0WycqjhzcjAFrnKcy4up43mKv4sv04zQJEX6ZgqTz83c
	7EVP3qTBdziUNRDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13078133E5;
	Fri, 29 Dec 2023 15:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FgYiAwbhjmWTAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 15:08:54 +0000
Date: Fri, 29 Dec 2023 16:08:53 +0100
Message-ID: <87cyupxcze.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/11] ALSA: scarlett2: Firmware Upgrade and Error
 Handling Improvements
In-Reply-To: <cover.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: JN7Q2JX3R74DIA3ZFF73FDZTVE4HR3IC
X-Message-ID-Hash: JN7Q2JX3R74DIA3ZFF73FDZTVE4HR3IC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN7Q2JX3R74DIA3ZFF73FDZTVE4HR3IC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 18:36:04 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> 11 patches to improve error handling and add firmware upgrade support
> to the scarlett2 driver. The notes below incorporate your feedback &
> include answers to your questions in response to my previous RFC v2
> email.
> 
> Patch 1 adds GitHub links for the repo where I share this code before
> submission here, and for issue reporting.
> 
> Patches 2-5 add missing error/bounds checks.
> 
> Patch 6 adds a missing lock.
> 
> Patches 7-11 add support for firmware upgrades.
> 
> The usage of the hwdep interface is as per my previous proposal:
> 
> - ioctl pversion to check the protocol version
> - ioctl select_flash_segment SCARLETT2_SEGMENT_ID_SETTINGS
> - ioctl erase_flash_segment
> - ioctl get_erase_progress (optional)
> - ioctl select_flash_segment SCARLETT2_SEGMENT_ID_FIRMWARE
> - ioctl erase_flash_segment
> - ioctl get_erase_progress (optional)
> - write() the firmware
> - ioctl reboot
> 
> Notes on the hwdep interface:
> 
> - Conflicting mixer operations are denied with EBUSY.
> 
> - The hwdep interface is marked as exclusive so there can't be
>   conflicting hwdep operations.
> 
> - Invalid sequences of operations (e.g. erase before select, write
>   before erase) return an error.
> 
> - The erase operation is asynchronous, and the progress can optionally
>   be monitored by calling get_erase_progress.
> 
> - If the erase progress is not monitored then subsequent hwdep
>   operations will wait until the erase is complete.
> 
> - The write operation is synchronous, but <1KB can be written per
>   call, and it returns very quickly. On the user-side it looks like
>   this with error checking omitted:
> 
>   while (offset < len)
>     offset += snd_hwdep_write(hwdep, buf + offset, len - offset);
> 
> - By using a subset of the firmware-upgrade steps, other useful
>   high-level operations can be performed: reset-to-factory-defaults,
>   reset-to-factory-firmware, or just reboot.
> 
> - I considered combining the select and erase operations, but that
>   would prevent a future read-flash operation if that ever become
>   possible.
> 
> - I considered separate one-shot ioctls for reset-to-factory, etc.,
>   but that prevents providing progress feedback.
> 
> - In case the purpose of the other firmware segments is discovered in
>   the future, this implementation would be able to support
>   erase/write/read of them with minimal changes.
> 
> Here is a user-space implementation of all of the above:
> https://github.com/geoffreybennett/scarlett2
> 
> This has been tested by me on every supported Scarlett 2nd, 3rd, 4th
> Gen and Clarett+ device, and tested by a handful of others on their
> Scarlett 4th Gen devices.
> 
> Thanks,
> Geoffrey.
> 
> Geoffrey D. Bennett (11):
>   ALSA: scarlett2: Update maintainer info
>   ALSA: scarlett2: Add missing error check to scarlett2_config_save()
>   ALSA: scarlett2: Add missing error check to scarlett2_usb_set_config()
>   ALSA: scarlett2: Add missing error checks to *_ctl_get()
>   ALSA: scarlett2: Add clamp() in scarlett2_mixer_ctl_put()
>   ALSA: scarlett2: Add missing mutex lock around get meter levels
>   ALSA: scarlett2: Add #defines for firmware upgrade
>   ALSA: scarlett2: Retrieve useful flash segment numbers
>   ALSA: scarlett2: Add skeleton hwdep/ioctl interface
>   ALSA: scarlett2: Add ioctl commands to erase flash segments
>   ALSA: scarlett2: Add support for uploading new firmware

Now all patches have been merged to topic/scarlett2 branch (merged to
for-next branch for 6.8).


thanks,

Takashi
