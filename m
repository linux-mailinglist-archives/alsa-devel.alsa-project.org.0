Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD30CC2065
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 11:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8127260227;
	Tue, 16 Dec 2025 11:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8127260227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765882266;
	bh=mpZ/ZKLUqADpOvwdK5NsZAlv24FyQXRwJjY4cCIdy8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iZ6xx/nz2qMPOBb2wk9cgrma+QCberykhRk0dP9WgSBVcD1GG8YISmgth8/M1Ckjp
	 YBwrQyr8fMYObtD6DeVcdZ0vMvGVeYkU/+XVXBOP3HiznXJndeBVBoMzXKOhDXBzJi
	 2Z+DlZCQLtt94HRtvnGEu50y80yVe7oUqSN7C8nw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877A9F80552; Tue, 16 Dec 2025 11:50:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F05F805CA;
	Tue, 16 Dec 2025 11:50:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A5CAF80217; Tue, 16 Dec 2025 11:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 670E8F800DF
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 11:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 670E8F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rLUyzqYj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p749Mwfo;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bE9CitNx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=y8wGbIRJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1EB5F33691;
	Tue, 16 Dec 2025 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765882071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=whbx1adhKsaqpbuop3INdSrzXBOLx7he2rBGx0Nxhb0=;
	b=rLUyzqYjWCC7imjDs1g8laSa0auzQ5W9PEbB3l5D5YD48Lrqy0RYxJgiVdJ8J4I8l570qL
	XHmX9cEMbCEtG7DKUrNB5NdqlRKbITAMSR7axIlHmy6qjncWfCJKjis27JxCtcXY4lUdlX
	T7xbOfJbH5DHlOEKs7pLv9Ek59J8z8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765882071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=whbx1adhKsaqpbuop3INdSrzXBOLx7he2rBGx0Nxhb0=;
	b=p749MwfotEBmorg09Brm/yUspcb7kA7Mo0IdTF7P4a7csr9k6Fu4R5o6CKXm0qPfKrAI+u
	LcKH5aUe3btsMSCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bE9CitNx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y8wGbIRJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765882070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=whbx1adhKsaqpbuop3INdSrzXBOLx7he2rBGx0Nxhb0=;
	b=bE9CitNxBXG1QnBPjVPLGM+lceSbd9UUAnpJeJoseV7tLdeLQh71TKjgcF9cpwJ8Fkn7tk
	wwu8H5wVFy7hinRfBEk7HWEb1U/s7l53swhl4QtC+LN8/dQoMgSXuSme2fXGNUMgsGszDz
	Iv8FrXNhmxPmrGhX/dBV0plRphjfDr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765882070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=whbx1adhKsaqpbuop3INdSrzXBOLx7he2rBGx0Nxhb0=;
	b=y8wGbIRJtEeNk9wvNpi1f8Fa2ptTICsAsqmdTxVAvzORSmsAMhWcUBW9BTx2WbiICanU5g
	M1unGr7PvZ4lxJCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 045AE3EA63;
	Tue, 16 Dec 2025 10:47:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XFGKANY4QWm6AQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Dec 2025 10:47:50 +0000
Date: Tue, 16 Dec 2025 11:47:49 +0100
Message-ID: <878qf2g0tm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shipei Qu <qu@darknavy.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	DARKNAVY <vr@darknavy.com>
Subject: Re: [PATCH v2] ALSA: usb-mixer: us16x08: validate meter packet
 indices
In-Reply-To: <20251216060156.41320-4-qu@darknavy.com>
References: <20251216060156.41320-4-qu@darknavy.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1EB5F33691
Message-ID-Hash: BAQCCFQBL463FYHU2OK4L7ICOTOTO3KG
X-Message-ID-Hash: BAQCCFQBL463FYHU2OK4L7ICOTOTO3KG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BAQCCFQBL463FYHU2OK4L7ICOTOTO3KG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Dec 2025 07:01:56 +0100,
Shipei Qu wrote:
> 
> Hi,
> 
> resending with a properly formatted diff (the previous email had a malformed
> patch header). The change itself is the same: while fuzzing a USB gadget that
> emulates a Tascam US-16x08 we found that get_meter_levels_from_urb() in
> mixer_us16x08.c uses a channel index taken directly from the 64-byte meter
> packet to index meter_level[], comp_level[] and master_level[] without any
> bounds checking. A malformed packet can therefore cause out-of-bounds writes in
> the snd_us16x08_meter_store.
> 
> A malicious USB audio device (or USB gadget implementation) that pretends to be
> a US-16x08-compatible interface can trigger this by sending crafted meter
> packets. We have a small USB gadget-based PoC for this behaviour and can share
> it if that would be helpful.
> 
> This driver is used by common distributions (e.g. Ubuntu) when a US-16x08 or
> compatible USB audio device is present. The same pattern is present in current
> mainline kernels.
> 
> This issue was first reported via security@kernel.org. The kernel security team
> explained that, in the upstream threat model, USB endpoints are expected to be
> trusted (i.e. only trusted devices should be bound to drivers), so they
> consider this a normal bug rather than a security vulnerability, and asked us
> to send a fix to the development lists. The patch below adds simple range
> checks before updating these arrays.
> 
> Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
> Signed-off-by: Shipei Qu <qu@darknavy.com>

Thanks, now it looks applicable, and the code change itself looks
good.

But, could you try to rephrase the patch description above?  It'll be
used directly as the commit message.  So it should be well descriptive
about the bug and the fix, while it should concentrate on the
technical issues.

You can check other commits how they look like, and also see
Documentation/process/submitting-patches.rst.


thanks,

Takashi

> ---
>  sound/usb/mixer_us16x08.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
> index 1c5712c31..f9df40730 100644
> --- a/sound/usb/mixer_us16x08.c
> +++ b/sound/usb/mixer_us16x08.c
> @@ -655,17 +655,25 @@ static void get_meter_levels_from_urb(int s,
>  	u8 *meter_urb)
>  {
>  	int val = MUC2(meter_urb, s) + (MUC3(meter_urb, s) << 8);
> +	int ch = MUB2(meter_urb, s) - 1;
> +
> +	if (ch < 0)
> +		return;
>  
>  	if (MUA0(meter_urb, s) == 0x61 && MUA1(meter_urb, s) == 0x02 &&
>  		MUA2(meter_urb, s) == 0x04 && MUB0(meter_urb, s) == 0x62) {
> -		if (MUC0(meter_urb, s) == 0x72)
> -			store->meter_level[MUB2(meter_urb, s) - 1] = val;
> -		if (MUC0(meter_urb, s) == 0xb2)
> -			store->comp_level[MUB2(meter_urb, s) - 1] = val;
> +		if (ch < SND_US16X08_MAX_CHANNELS) {
> +			if (MUC0(meter_urb, s) == 0x72)
> +				store->meter_level[ch] = val;
> +			if (MUC0(meter_urb, s) == 0xb2)
> +				store->comp_level[ch] = val;
> +		}
>  	}
>  	if (MUA0(meter_urb, s) == 0x61 && MUA1(meter_urb, s) == 0x02 &&
> -		MUA2(meter_urb, s) == 0x02 && MUB0(meter_urb, s) == 0x62)
> -		store->master_level[MUB2(meter_urb, s) - 1] = val;
> +		MUA2(meter_urb, s) == 0x02 && MUB0(meter_urb, s) == 0x62) {
> +		if (ch < ARRAY_SIZE(store->master_level))
> +			store->master_level[ch] = val;
> +	}
>  }
>  
>  /* Function to retrieve current meter values from the device.
> -- 
> 2.45.1
