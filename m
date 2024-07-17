Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F79339CF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56278E0;
	Wed, 17 Jul 2024 11:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56278E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208508;
	bh=GSeA4PcrdkP6SJWYfJVHD1jiIOgZl3XKc2jY4obLw4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGlGuiF+p6noNzeHlzuJ16dHKhSN9h6RuWNJspOcZV+iS7wQeiM/6jnrGuDZigCbp
	 Mk5CO8GTSUFVSxpz7KpeDyYDjhBkGz1MfIO7yjb2RpW7K6tcwt+UiT8v1BTpbTpbxs
	 ASRrGcG94j49U/avjNKEFLWCZOR4T2/C7FLoo5I8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAA6BF805A9; Wed, 17 Jul 2024 11:27:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BC2F805AE;
	Wed, 17 Jul 2024 11:27:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36140F8026D; Wed, 17 Jul 2024 11:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85C51F8007E
	for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2024 11:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C51F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DPJ73xBr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nq6a81xg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=DPJ73xBr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nq6a81xg
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7135221AD1;
	Wed, 17 Jul 2024 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721208313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmNCkLtrjI+fG5BWtot2mLs+buqGfR+f5WECiw7z6xw=;
	b=DPJ73xBr4gGkyARfcnUrOKT6aP9aH8BISgFqvA/qx8WjtfcVDwSZ/A59mRX+znKADqp4aR
	+QKLMu37ceYMKMdEOszElbZyo+oNU6Eu2G4SzbPKhYmf3eSfX9VEbQ6nmstb+60IcW0Ia/
	V3TYmn65q6QK4HbMoFNv3sgZgqlA7bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721208313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmNCkLtrjI+fG5BWtot2mLs+buqGfR+f5WECiw7z6xw=;
	b=nq6a81xgMgSEYZaqc2YKb0IvdncZ3D5mP2JFKLS3bN4mnTEfzkBo6SCV+22agDw2gtRFkt
	kqKl8nbDk8c1jHBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721208313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmNCkLtrjI+fG5BWtot2mLs+buqGfR+f5WECiw7z6xw=;
	b=DPJ73xBr4gGkyARfcnUrOKT6aP9aH8BISgFqvA/qx8WjtfcVDwSZ/A59mRX+znKADqp4aR
	+QKLMu37ceYMKMdEOszElbZyo+oNU6Eu2G4SzbPKhYmf3eSfX9VEbQ6nmstb+60IcW0Ia/
	V3TYmn65q6QK4HbMoFNv3sgZgqlA7bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721208313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmNCkLtrjI+fG5BWtot2mLs+buqGfR+f5WECiw7z6xw=;
	b=nq6a81xgMgSEYZaqc2YKb0IvdncZ3D5mP2JFKLS3bN4mnTEfzkBo6SCV+22agDw2gtRFkt
	kqKl8nbDk8c1jHBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33CE4136E5;
	Wed, 17 Jul 2024 09:25:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0r1wC/mNl2a7JQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jul 2024 09:25:13 +0000
Date: Wed, 17 Jul 2024 11:25:45 +0200
Message-ID: <87sew8xtd2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: usb-audio: Fix microphone sound on HD webcam.
In-Reply-To: <20240717091951.11344-1-wangdich9700@163.com>
References: <20240717091951.11344-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.70 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: X4YEJ65ZSS5HTET2XJX5JX5FBJRBXW5F
X-Message-ID-Hash: X4YEJ65ZSS5HTET2XJX5JX5FBJRBXW5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4YEJ65ZSS5HTET2XJX5JX5FBJRBXW5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Jul 2024 11:19:51 +0200,
wangdicheng wrote:
> V1 -> V2: align the space

Please put "v2" in the subject, i.e. "[PATCH v2] ALSA: ..."

> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2179,6 +2179,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_FIXED_RATE),
>  	DEVICE_FLG(0x1bcf, 0x2283, /* NexiGo N930AF FHD Webcam */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> +	DEVICE_FLG(0x1bcf, 0x2281, /* HD Webcam */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),
>  
>  	/* Vendor matches */
>  	VENDOR_FLG(0x045e, /* MS Lifecam */

This still doesn't to apply the latest code cleanly.
You must be using an old kernel code.  There was rearrangement of the
table entries in the commit 668abe6dc7b6, and this has been backported
to some stable kernels as well.

Please try to rebase to the latest code.


thanks,

Takashi
