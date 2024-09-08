Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68652970568
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2024 09:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80F882C;
	Sun,  8 Sep 2024 09:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80F882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725781693;
	bh=5UehFWUt0K1BUTxNcW1HJjuI3+130MQpcU47klPxKzs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L9Cr3uYBaS1dJZCkFz9oYJelsfr2x9oY6nN63QPRm3VhGHQ8iUgo5RmeQMtK8mKeY
	 YHTO23UnnBy5wqt4bLV1OmI0MYFmlLm+HtV7rUV6Ne6GGTKjnZn54zW3gYxuYPZ6bF
	 G/Y5iGycvjSK9GSLMGSnY+ttm9iYEq7S2S50Mamc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA9C8F805B1; Sun,  8 Sep 2024 09:47:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 974FCF8059F;
	Sun,  8 Sep 2024 09:47:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05A5CF801F5; Sun,  8 Sep 2024 09:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13436F800E9
	for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2024 09:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13436F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kvkWWxAI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hU6AsOxY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fVTVBvg3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KmRQ4qlH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F3E31F7C6;
	Sun,  8 Sep 2024 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725781651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsuLdmXzISZat7fXiN0cO6Jl6Y+DuzGQh+JMXsuwMQs=;
	b=kvkWWxAIQtXtbW+7KEjxmGXWCNwbaeBUjRl8co3w4mRWNzEtM73Fgw2mwd5/7F+bUQA+Za
	3jEKuQdrXfh3ezCdwEIcHxqtQ0JyMLU0B8mi5uy1ZQnbv9OtGfx6aEkWA8M181mudid7TN
	b0OUN5Bo96BsAJHKUiZXX0pK4RkYM0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725781651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsuLdmXzISZat7fXiN0cO6Jl6Y+DuzGQh+JMXsuwMQs=;
	b=hU6AsOxYfeGzW1n9bMff5iccBe+0/lzKu62xMcURQ2YKHynYxEhqRobqKCIi1kYSPjTnDw
	IicdF5OYy3ddtDBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fVTVBvg3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KmRQ4qlH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725781650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsuLdmXzISZat7fXiN0cO6Jl6Y+DuzGQh+JMXsuwMQs=;
	b=fVTVBvg3l/x8eIGBrIlWEX5ETb2u5rKpH+Wi5CZVd6eALBeXg6RD6QrOLuuJIjXZhiooo4
	IqECBJ/f0iVCgUvFEQ4BT30wt9zXNciiHX98dzfsVTvxeacScVCtWfEeNczatB7TZmKCjR
	4KS3dcv4ja2sLPW5XJIB6LAfd2l2BoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725781650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsuLdmXzISZat7fXiN0cO6Jl6Y+DuzGQh+JMXsuwMQs=;
	b=KmRQ4qlHuxcYFgD8wX2WyP/nJNZcred/67/PVXZ1nx5SbWfj4+w0GgDoIX5poUMl6bvkJA
	RYIAvLiDHWYhNSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A06A13ADE;
	Sun,  8 Sep 2024 07:47:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pvVUEJJW3WbOBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Sep 2024 07:47:30 +0000
Date: Sun, 08 Sep 2024 09:48:17 +0200
Message-ID: <878qw2d1ry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joshua Pius <joshuapius@chromium.org>
Cc: alsa-devel@alsa-project.org,
	Joshua Pius <joshuapius@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	Karol Kosik <k.kosik@outlook.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
In-Reply-To: <20240906211445.3924724-1-joshuapius@google.com>
References: <20240906211445.3924724-1-joshuapius@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8F3E31F7C6
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[alsa-project.org,google.com,perex.cz,suse.com,chromium.org,outlook.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: YLDVM7TQQ74DVPHHHYVYKL2M5SIZJGIF
X-Message-ID-Hash: YLDVM7TQQ74DVPHHHYVYKL2M5SIZJGIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLDVM7TQQ74DVPHHHYVYKL2M5SIZJGIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Sep 2024 23:14:38 +0200,
Joshua Pius wrote:
> 
> Specify shortnames for the following Logitech Devices: Rally bar, Rally
> bar mini, Tap, MeetUp and Huddle.
> 
> Signed-off-by: Joshua Pius <joshuapius@google.com>

Is this change needed only for UCM profiles?  UCM v2 should be able to
handle better to identify models, and such short name updates aren't
needed for them.

OTOH, I don't mind much to take this kind of small harmless changes
(unless it happens too frequently).  So I'll likely take this, but
just for verifying the situation.


thanks,

Takashi


> ---
>  sound/usb/card.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 778de9244f1e..9c411b82a218 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_audio_names[] = {
>  	/* Creative/Toshiba Multimedia Center SB-0500 */
>  	DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
>  
> +	/* Logitech Audio Devices */
> +	DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
> +	DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio"),
> +	DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
> +	DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
> +	DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
>  	DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
>  
>  	DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
> -- 
> 2.46.0.598.g6f2099f65c-goog
> 
