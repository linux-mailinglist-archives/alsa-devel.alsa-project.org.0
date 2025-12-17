Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A01CC6B60
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6532D601E9;
	Wed, 17 Dec 2025 10:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6532D601E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962510;
	bh=kEd4vr5Zfnix+8NBJtgdcMwgX2jJ8X2s4E1aH880Blw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C08GzEIwO/TN3zGnKHDR6efSavFzq+4uFWcEUQ3ThkVqHhdEW18W3CLUru98j0JZX
	 j7slYANcZSRMAl4YGCRDqcV2JQYdJe/iTbyzcG8ku1A6yNFyPazxaQsA3ZLLynXCQQ
	 kjAQl5WgT3ew0ydhjsSX0tZwJflJja55ZEGBNSlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C10F805CB; Wed, 17 Dec 2025 10:07:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE57F805C9;
	Wed, 17 Dec 2025 10:07:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2115EF805A8; Wed, 17 Dec 2025 10:07:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 349E2F8007E
	for <alsa-devel@alsa-project.org>; Wed, 17 Dec 2025 10:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349E2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=biRnbKjh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=l156j0Sh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2WywiZdj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=M4nz7YkV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 071B0336C2;
	Wed, 17 Dec 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765962449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+zLJgzkxEngLDZCT/mMUBbySSeiiGhJg+8VBTFCVpY=;
	b=biRnbKjhs6eHD9VhZF5yE6VfTZ6xRh6jdsoHXXton6qXmcFtB9DlGm6KMSd2sQiifL6PvG
	fsbacqBO6GpBTx+uYum0dxN68JA+/LC3ZKcW+mjjuP/o3kPEDo1xJykinLVATIHDN550eD
	hf12tmmJwjRa+vX2PRKEDfuApOjGgAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+zLJgzkxEngLDZCT/mMUBbySSeiiGhJg+8VBTFCVpY=;
	b=l156j0ShIVG9mxeUd42/MwP40SWwb+Sq/aOmwjcU4R7fU6LJgkB5Egfg98SRJqUJelBVJC
	g0sDVBWhupt3N+DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765962448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+zLJgzkxEngLDZCT/mMUBbySSeiiGhJg+8VBTFCVpY=;
	b=2WywiZdjugDjDa186z9zmzDN3cNZtvvOROn+6cyx5zSJRNSaTtS4kLGPPIhkZedAaUY5k8
	yj/B69an7uq9O+xPgC416YyJUuwOw+b5i9mJaRKvmPjBEA719z8X1kFciHo41nz698bJz8
	3D7mX0STFmyOINPVmkP3CZyFjGWVhVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765962448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+zLJgzkxEngLDZCT/mMUBbySSeiiGhJg+8VBTFCVpY=;
	b=M4nz7YkVyGcuOh0wZwM9ajlGzOkMjpch1+nHbyyRDE/YV4Vg54YWl2QvxYh5juc0GJ5v+O
	atILlpv54jeOy9DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA3D93EA65;
	Wed, 17 Dec 2025 09:07:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A42bK89yQmn1UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Dec 2025 09:07:27 +0000
Date: Wed, 17 Dec 2025 10:07:27 +0100
Message-ID: <87y0n1cw8g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shipei Qu <qu@darknavy.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	vr@darknavy.com
Subject: Re: [PATCH v3] ALSA: usb-mixer: us16x08: validate meter packet
 indices
In-Reply-To: <20251217024630.59576-1-qu@darknavy.com>
References: <878qf2g0tm.wl-tiwai@suse.de>
	<20251217024630.59576-1-qu@darknavy.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.16)[-0.781];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
Message-ID-Hash: NEZTDQO6DLKKZR5HGSDUED6OH6EJ2LTM
X-Message-ID-Hash: NEZTDQO6DLKKZR5HGSDUED6OH6EJ2LTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEZTDQO6DLKKZR5HGSDUED6OH6EJ2LTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Dec 2025 03:46:30 +0100,
Shipei Qu wrote:
> 
> get_meter_levels_from_urb() parses the 64-byte meter packets sent by
> the device and fills the per-channel arrays meter_level[],
> comp_level[] and master_level[] in struct snd_us16x08_meter_store.
> 
> Currently the function derives the channel index directly from the
> meter packet (MUB2(meter_urb, s) - 1) and uses it to index those
> arrays without validating the range. If the packet contains a
> negative or out-of-range channel number, the driver may write past
> the end of these arrays.
> 
> Introduce a local channel variable and validate it before updating the
> arrays. We reject negative indices, limit meter_level[] and
> comp_level[] to SND_US16X08_MAX_CHANNELS, and guard master_level[]
> updates with ARRAY_SIZE(master_level).
> 
> Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
> Signed-off-by: Shipei Qu <qu@darknavy.com>

Applied now.  Thanks.


Takashi
