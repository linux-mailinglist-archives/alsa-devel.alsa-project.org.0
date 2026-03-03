Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAnpKN0Cp2k7bgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:48:45 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D11F2EA7
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 16:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66894601E3;
	Tue,  3 Mar 2026 16:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66894601E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772552924;
	bh=SwizLDbjFGtmTfsljXMyUDSSNywCg292AfL6ZmR1k2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GbER40/wYX8SO4uZuCvYKmvQpyOGD2S/4BubZOweRCoNgHB+VsYL+B5zTT1HpxAUh
	 aZNPs2b9r1BtNwYcr1ZmokBxd1F457wSCvmlha/CjJOjRH+R5doHmbPLZUJXnPrhQQ
	 VadhquIQ4BVbiBZ4xbY6FeQX+0IDoND0OjQ79XTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0A2EF805E4; Tue,  3 Mar 2026 16:48:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8037FF805E6;
	Tue,  3 Mar 2026 16:48:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BD9F804B4; Tue,  3 Mar 2026 16:48:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BE88F8015B
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 16:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE88F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iXSTN5kK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=orpb1Kh6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=iXSTN5kK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=orpb1Kh6
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 899895BE0C;
	Tue,  3 Mar 2026 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772552875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QuPsJYCuHIhEizr6kPqW6TAwPlDcT9J+GeBDrMRnBs=;
	b=iXSTN5kKITztVCs2pQbYgo5xCGMxJoLsSDvh2iapYK8fyc3tllO3ZWvkhr2HwqMPzk8W/7
	UxudAayEhULjGfZ4FdFMHjj1FnMCJL9oZVaTICRR3CbqftkbhgiQpFzwjBP7dJBzd6HJw/
	Sy5cnu0n3NGuSMHz9OivluzAYrA5eQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772552875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QuPsJYCuHIhEizr6kPqW6TAwPlDcT9J+GeBDrMRnBs=;
	b=orpb1Kh6ytDy4AlVrh/FK8ua6S/UGrkGIvUh3LJsrV0UImdxz6n+agdbQnJAqwwsapUEh4
	GLCymNAXauhW0uBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iXSTN5kK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=orpb1Kh6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772552875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QuPsJYCuHIhEizr6kPqW6TAwPlDcT9J+GeBDrMRnBs=;
	b=iXSTN5kKITztVCs2pQbYgo5xCGMxJoLsSDvh2iapYK8fyc3tllO3ZWvkhr2HwqMPzk8W/7
	UxudAayEhULjGfZ4FdFMHjj1FnMCJL9oZVaTICRR3CbqftkbhgiQpFzwjBP7dJBzd6HJw/
	Sy5cnu0n3NGuSMHz9OivluzAYrA5eQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772552875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QuPsJYCuHIhEizr6kPqW6TAwPlDcT9J+GeBDrMRnBs=;
	b=orpb1Kh6ytDy4AlVrh/FK8ua6S/UGrkGIvUh3LJsrV0UImdxz6n+agdbQnJAqwwsapUEh4
	GLCymNAXauhW0uBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DEAB3EA69;
	Tue,  3 Mar 2026 15:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xzIuGqsCp2l0YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 15:47:55 +0000
Date: Tue, 03 Mar 2026 16:47:55 +0100
Message-ID: <87seagx6c4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
In-Reply-To: <20260303145815.9930-2-mstrozek@opensource.cirrus.com>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GWS2XTC7BOAFL6MDK6BAHDPHGU4W3GYE
X-Message-ID-Hash: GWS2XTC7BOAFL6MDK6BAHDPHGU4W3GYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWS2XTC7BOAFL6MDK6BAHDPHGU4W3GYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 3A9D11F2EA7
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
	FORGED_RECIPIENTS(0.00)[m:mstrozek@opensource.cirrus.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,cirrus.com:email,perex.cz:email];
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

On Tue, 03 Mar 2026 15:58:00 +0100,
Maciej Strozek wrote:
> 
> The fixed-size components field in SNDRV_CTL_IOCTL_CARD_INFO can be too
> small on systems with many audio devices.
> 
> Keep the existing struct snd_ctl_card_info ABI intact and add a new ioctl
> to retrieve the full components string.
> 
> When the legacy components field is truncated, append '>' to indicate
> that the full string is available via the new ioctl.
> 
> Link: https://github.com/alsa-project/alsa-lib/pull/494
> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> Suggested-by: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> Changes for v3:
>  - change components field to a dynamic array resizable in 32 byte increments
>  - removed SNDRV_CTL_COMPONENTS_LEN define
>  - sanity check if 'components' requests more than 512 bytes
>  - added a commit to clean up trailing whitespaces
>  - alsa-utils link no longer needed
> Changes for v2:
>  - do not modify existing card->components field
>  - add a new ioctl and struct to keep the full components string
>  - handle the split/trim in snd_ctl_card_info()
> ---
>  include/sound/core.h        |  4 ++--
>  include/uapi/sound/asound.h | 14 ++++++++++++-
>  sound/core/control.c        | 35 ++++++++++++++++++++++++++++++++-
>  sound/core/control_compat.c |  2 ++
>  sound/core/init.c           | 39 +++++++++++++++++++++++++++++--------
>  5 files changed, 82 insertions(+), 12 deletions(-)
> 
> diff --git a/include/sound/core.h b/include/sound/core.h
> index 4093ec82a0a1..2b58f79b524d 100644
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -87,8 +87,8 @@ struct snd_card {
>  	char longname[80];		/* name of this soundcard */
>  	char irq_descr[32];		/* Interrupt description */
>  	char mixername[80];		/* mixer name */
> -	char components[128];		/* card components delimited with
> -								space */
> +	char *components_ptr;
> +	unsigned int components_ptr_alloc_size; // current memory allocation components_ptr.
>  	struct module *module;		/* top-level module */
> 
>  	void *private_data;		/* private data for soundcard */
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index d3ce75ba938a..422b0b07613d 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -1058,7 +1058,7 @@ struct snd_timer_tread {
>   *                                                                          *
>   ****************************************************************************/
> 
> -#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 9)
> +#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)
> 
>  struct snd_ctl_card_info {
>  	int card;			/* card number */
> @@ -1072,6 +1072,17 @@ struct snd_ctl_card_info {
>  	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
>  };
> 
> +/*
> + * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
> + * Use SNDRV_CTL_IOCTL_CARD_COMPONENTS to retrieve the full string.
> + *
> + */
> +struct snd_ctl_card_components {
> +	int card;
> +	unsigned int length;
> +	unsigned char *components;
> +};

Embedding a pointer for ioctl is a nightmare for 32bit compatibility,
and you seem to have forgotten it, too ;)

IMO, in this case, it'd be easier to use a flex array instead, e.g.

struct snd_ctl_card_components {
	int card;
	unsigned int length;
	unsigned char components[];
};

And the ioctl can serve for two purposes:

- When length=0 is set, the kernel stores the current number of bytes
  and returns without copying.  User-space can use this mode for
  allocating the buffer.

- When length > 0 is set, the kernel copies the data on components[]
  up to the given length.  The length field is updated again to store
  the number of bytes (which would be copied).

What this length field specifies is another question: is it a string
length or a buffer length including NUL?

Also, we can keep the current string size, too, for returning in the
sequence in the above, instead of doing strlen() at each time.


thanks,

Takashi
