Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB1937AA1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 18:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C10DE69;
	Fri, 19 Jul 2024 18:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C10DE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721405862;
	bh=RMhP1Z4sADxz47j/P5FZWYi2zXHSitW0a6FkOyAo558=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCdE2AGdVKOiA3HdmFzolJ3HpSYWoW2+TdGB8d9ZXYCj6WvSkgjZkuevWgTlSUFar
	 /AzM6ysOmL8CcTdyiz87i9MlWl6NWjyAm+FdVzWu8Ep6ldmuVk/LAp+WnKQsNZS6B6
	 UU1bf19lQ5MImMeHcvHd3IyA8y3cc687nCJmelu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFFE4F805F5; Fri, 19 Jul 2024 18:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7398F80600;
	Fri, 19 Jul 2024 18:16:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77A01F804FC; Fri, 19 Jul 2024 18:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14159F8007E
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 18:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14159F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dW32yFjR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NQV2fahJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dW32yFjR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NQV2fahJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4AA41F787;
	Fri, 19 Jul 2024 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VXnP+LUtkukngDMB+xer+YZySzVDjzhuSjA8LRXZCc=;
	b=dW32yFjRsFYHJW3VVR96+RbPO2mDc/qVvP711VqlyHMjkcBIc8MzvjHB8Xhs/FdIyg9KCS
	y8praeMhCArECRVD0kw0Po6ZcJaSMTnSV0vRYVGn8acR1Ni7AKHX7Fo92TRr/E6duvscT/
	UiFlOGrr2pkxy4ljwjDIdkbxu08BO3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VXnP+LUtkukngDMB+xer+YZySzVDjzhuSjA8LRXZCc=;
	b=NQV2fahJmA8KHZa5fpU8jZR2gaNQC0j8zSJEWEYqq9UfEDq91LwTIbkTilrITQTbS6KhXe
	laOE9y1YF9g4HSAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dW32yFjR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NQV2fahJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VXnP+LUtkukngDMB+xer+YZySzVDjzhuSjA8LRXZCc=;
	b=dW32yFjRsFYHJW3VVR96+RbPO2mDc/qVvP711VqlyHMjkcBIc8MzvjHB8Xhs/FdIyg9KCS
	y8praeMhCArECRVD0kw0Po6ZcJaSMTnSV0vRYVGn8acR1Ni7AKHX7Fo92TRr/E6duvscT/
	UiFlOGrr2pkxy4ljwjDIdkbxu08BO3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VXnP+LUtkukngDMB+xer+YZySzVDjzhuSjA8LRXZCc=;
	b=NQV2fahJmA8KHZa5fpU8jZR2gaNQC0j8zSJEWEYqq9UfEDq91LwTIbkTilrITQTbS6KhXe
	laOE9y1YF9g4HSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97BB413808;
	Fri, 19 Jul 2024 16:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9pXZIySPmmZDEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 16:07:00 +0000
Date: Fri, 19 Jul 2024 18:07:34 +0200
Message-ID: <874j8ls6ux.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
In-Reply-To: <20240719022956.9861-1-wangdich9700@163.com>
References: <20240719022956.9861-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D4AA41F787
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: UESQEQTKW6Y5NO2PWEGIBR45OJFUGLML
X-Message-ID-Hash: UESQEQTKW6Y5NO2PWEGIBR45OJFUGLML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UESQEQTKW6Y5NO2PWEGIBR45OJFUGLML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jul 2024 04:29:56 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Sonix HD USB Camera does not support reading the sample rate which leads
> to many lines of "cannot get freq at ep 0x84".
> This patch adds the USB ID to quirks.c and avoids those error messages.
> 
> (snip)
> [1.789698] usb 3-3: new high-speed USB device number 2 using xhci_hcd
> [1.984121] usb 3-3: New USB device found, idVendor=0c45, idProduct=6340, bcdDevice= 0.00
> [1.984124] usb 3-3: New USB device strings: Mfr=2, Product=1, SerialNumber=0
> [1.984127] usb 3-3: Product: USB 2.0 Camera
> [1.984128] usb 3-3: Manufacturer: Sonix Technology Co., Ltd.
> [5.440957] usb 3-3: 3:1: cannot get freq at ep 0x84
> [12.130679] usb 3-3: 3:1: cannot get freq at ep 0x84
> [12.175065] usb 3-3: 3:1: cannot get freq at ep 0x84
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 09712e61c606..c1fd690cbac0 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2033,6 +2033,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> +	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),
>  	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
>  		   QUIRK_FLAG_GET_SAMPLE_RATE),
>  	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */

The table is sorted in the ID order.  Could you put at the right
position?


thanks,

Takashi
