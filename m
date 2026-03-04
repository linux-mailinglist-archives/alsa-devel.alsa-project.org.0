Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPdCNGoJqGn2nQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 11:28:58 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5351FE589
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 11:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19BB60232;
	Wed,  4 Mar 2026 11:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19BB60232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772620137;
	bh=b81ScfWd1jG0p5XYX1b6cvjWXGekZhFJodb+XVntRmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kEqgqhQ4lGr5u7WPYChs3u/CUl6Rr5ZwF9iV3ZT1qfR/imxpPn0bOBnU6lxbht/+2
	 yxMnV+EKkeZq+es+R4rMxJs4bSYu8VmFwhs4kLBsQSxCe0bQ8S/XFTi0NNWbVSYrP7
	 a8g6aGpvmyycbkHXbmyz21hKrcN72XEBaVCjzKQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28243F805F3; Wed,  4 Mar 2026 11:28:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E67F8F805EA;
	Wed,  4 Mar 2026 11:28:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54887F805BD; Wed,  4 Mar 2026 11:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8717F80095
	for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2026 11:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8717F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eiAOisyL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RPIN6G5x;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=FGIouS6O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CWw/IMdP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F08665BDE4;
	Wed,  4 Mar 2026 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772620084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mArf4tYNRibel5SvxLMlnaDeIs8CZ/vp1KvzeNQk6z4=;
	b=eiAOisyLdj0DW8rrPO/XGn7Mlliv7RFdjDBqlElni1lruvNIPwwkgWWNd4YtmnZNny2m+s
	PpoT+5x5XGdQ1CWezac3FQQtd/j1oI5MuHXKMtNZEpS14LhZs7oYl7LjycZjbZgVM/ozDq
	CwaGABkykRKSNl4GDkh3K+4JtcoAVjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772620084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mArf4tYNRibel5SvxLMlnaDeIs8CZ/vp1KvzeNQk6z4=;
	b=RPIN6G5xGjoSF7LCI6t5F5hHrXqMdFv5ANiaRJNL/OVQ5Ir8UX4ZWZ6tzAC6faYNjQeZax
	M7jV1bZziwhU1FBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772620082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mArf4tYNRibel5SvxLMlnaDeIs8CZ/vp1KvzeNQk6z4=;
	b=FGIouS6OA5iQ72pzcq6tg4lwfTjpVjm8OT6hQZ45JkVlrIyo7vXDa6WBT7wk5INbnQIREY
	gbuS0oW7ZfX8D2/MnLLqyXV2zkAgn1r2FYNVGzFR9eD0M0Im5k5dznIYbEOZje0bNeSDxN
	gbJUSdc6NKHeK9Kz485cYz5Z5RzO+is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772620082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mArf4tYNRibel5SvxLMlnaDeIs8CZ/vp1KvzeNQk6z4=;
	b=CWw/IMdPuUjJ9AjZqidpjbPXBUZynkWQagzjkqtsEkkWfFA/H7/19WZ2xnc76RknoIEaMB
	SKfkrnVbk2TAuNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC4E23EA69;
	Wed,  4 Mar 2026 10:28:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wu7CLDIJqGmnDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Mar 2026 10:28:02 +0000
Date: Wed, 04 Mar 2026 11:28:02 +0100
Message-ID: <875x7bx51p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
In-Reply-To: <2a28e6a4-f6c8-4539-a45e-bd5ce7da43c6@perex.cz>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	<87seagx6c4.wl-tiwai@suse.de>
	<2a28e6a4-f6c8-4539-a45e-bd5ce7da43c6@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LU3X6226QGS43L7Y65RNXNJS6TZN5HVA
X-Message-ID-Hash: LU3X6226QGS43L7Y65RNXNJS6TZN5HVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU3X6226QGS43L7Y65RNXNJS6TZN5HVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 6C5351FE589
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:perex@perex.cz,m:mstrozek@opensource.cirrus.com,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:email,suse.de:dkim,suse.de:mid,suse.com:email,alsa-project.org:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Tue, 03 Mar 2026 20:23:11 +0100,
Jaroslav Kysela wrote:
> 
> On 3/3/26 16:47, Takashi Iwai wrote:
> > On Tue, 03 Mar 2026 15:58:00 +0100,
> > Maciej Strozek wrote:
> >> 
> >> The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
> >> small on systems with many audio devices.
> >> 
> >> Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
> >> to retrieve the full components string.
> >> 
> >> When the legacy components field is truncated, append '>' to indicate
> >> that the full string is available via the new ioctl.
> >> 
> >> Link: https://github.com/alsa-project/alsa-lib/pull/494
> >> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> >> Suggested-by: Takashi Iwai <tiwai@suse.com>
> >> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> >> ---
> >> Changes for v3:
> >>   - change components field to a dynamic array resizable in 32 byte increments
> >>   - removed SNDRV_CTL_COMPONENTS_LEN define
> >>   - sanity check if 'components' requests more than 512 bytes
> >>   - added a commit to clean up trailing whitespaces
> >>   - alsa-utils link no longer needed
> >> Changes for v2:
> >>   - do not modify existing card->components field
> >>   - add a new ioctl and struct to keep the full components string
> >>   - handle the split/trim in snd_ctl_card_info()
> >> ---
> >>   include/sound/core.h        |  4 ++--
> >>   include/uapi/sound/asound.h | 14 ++++++++++++-
> >>   sound/core/control.c        | 35 ++++++++++++++++++++++++++++++++-
> >>   sound/core/control_compat.c |  2 ++
> >>   sound/core/init.c           | 39 +++++++++++++++++++++++++++++--------
> >>   5 files changed, 82 insertions(+), 12 deletions(-)
> >> 
> >> diff --git a/include/sound/core.h b/include/sound/core.h
> >> index 4093ec82a0a1..2b58f79b524d 100644
> >> --- a/include/sound/core.h
> >> +++ b/include/sound/core.h
> >> @@ -87,8 +87,8 @@ struct snd_card {
> >>   	char longname[80];		/* name of this soundcard */
> >>   	char irq_descr[32];		/* Interrupt description */
> >>   	char mixername[80];		/* mixer name */
> >> -	char components[128];		/* card components delimited with
> >> -								space */
> >> +	char *components_ptr;
> >> +	unsigned int components_ptr_alloc_size; // current memory allocation components_ptr.
> >>   	struct module *module;		/* top-level module */
> >> 
> >>   	void *private_data;		/* private data for soundcard */
> >> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> >> index d3ce75ba938a..422b0b07613d 100644
> >> --- a/include/uapi/sound/asound.h
> >> +++ b/include/uapi/sound/asound.h
> >> @@ -1058,7 +1058,7 @@ struct snd_timer_tread {
> >>    *                                                                          *
> >>    ****************************************************************************/
> >> 
> >> -#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
> >> +#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)
> >> 
> >>   struct snd_ctl_card_info {
> >>   	int card;			/* card number */
> >> @@ -1072,6 +1072,17 @@ struct snd_ctl_card_info {
> >>   	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
> >>   };
> >> 
> >> +/*
> >> + * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
> >> + * Use SNDRV_CTL_IOCTL_CARD_COMPONENTS to retrieve the full string.
> >> + *
> >> + */
> >> +struct snd_ctl_card_components {
> >> +	int card;
> >> +	unsigned int length;
> >> +	unsigned char *components;
> >> +};
> > 
> > Embedding a pointer for ioctl is a nightmare for 32bit compatibility,
> > and you seem to have forgotten it, too ;)
> 
> It's doable and we have other more important structures like struct
> snd_xferi using those pointers. But yes, the translation is missing in
> this patch set. I already gave hint that control_compat.c must be
> modified, too.
> 
> > IMO, in this case, it'd be easier to use a flex array instead, e.g.
> > 
> > struct snd_ctl_card_components {
> > 	int card;
> > 	unsigned int length;
> > 	unsigned char components[];
> > };
> 
> There is an issue that flex arrays will break _IOC_SIZE().

That's true.  OTOH, having a pointer for the external data to be
copied means that _IOC_SIZE() doesn't cover the whole size but misses
the data, too.  So it's a question which implementation is uglier (or
easier to handle), after all.

BTW, it might be better to have both length and actual_length fields
in srtuct snd_ctl_card_components: the former specifies the allocated
buffer length while the latter is stored by kernel pointing to the
actual data size.  We can overwrite length field in return, but it
might be confusing when releasing a resource.


thanks,

Takashi
