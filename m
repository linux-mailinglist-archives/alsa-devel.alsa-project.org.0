Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCCB938B0E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 10:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BA30E72;
	Mon, 22 Jul 2024 10:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BA30E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721636326;
	bh=eHUPXZOh4xUdc6W3Uil51m3p/Zn28VRZXZB5ndSUDmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4p6+5FoyXs9JYJNT98/AX8RZadyuLUgeRh5GM3jqV+vZGh+I7ChCTZjj1WBB+i1J
	 Fst2m/n0zASRO6E8BC1lqRZBjyeXcN0uGshoUew0VCf3H9tqwQItC/6NmdQhGCXrxH
	 a0SEyj9ZZHMVoT/pOfdqfo7F2LVu5SUa8XauGu0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA8CCF8013D; Mon, 22 Jul 2024 10:18:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB1DF8057A;
	Mon, 22 Jul 2024 10:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E18D4F8007E; Mon, 22 Jul 2024 10:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABA48F8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 10:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA48F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JLt6CO14;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hd19cqAm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mkUpZ9gy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1xQsJN7Y
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A69DD21B4B;
	Mon, 22 Jul 2024 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721635802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3nVbO7LI0uS2TAY9BwLJSq+PVHyir89ZNFncsheHCqk=;
	b=JLt6CO14Ok0bfDiWA+Gsa/GZWKrs1HHIwM3ocxtNyeEbBg4QGmCbesOmU6ZL58icL57Tfx
	MEyYI2WWAnwhLoVbo1t1vkkE2ssAscsCO0Un/+lvK7Foxt22FEdtZf89rZ5gMlPmWOfo2+
	caj9X7tmy4MRPOaRulDS9Mgnu/QUn0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721635802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3nVbO7LI0uS2TAY9BwLJSq+PVHyir89ZNFncsheHCqk=;
	b=Hd19cqAmkIE+vXnolN2CfzYGeJLdWqvu3dUFNBTLo8yNs8fyeDxLzn5Mfrl0tUhNohCHQ0
	oXFsY5rSxvM5sWBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mkUpZ9gy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1xQsJN7Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721635801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3nVbO7LI0uS2TAY9BwLJSq+PVHyir89ZNFncsheHCqk=;
	b=mkUpZ9gyN1+0BIp53UsrYiPOqYn5yvNTZMXPMgOVyBRI0mpTvPwxGFdHmAVqf/oWBUzVp+
	7xsQg/Gthf7xDXqVNR+BDhQFou1ztyAPdNviQJyIDrORJFY/nFAxpme4MV642VR47rX7yX
	xImxNsbGaqiV+QgZfC3yuChM+RA91Z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721635801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3nVbO7LI0uS2TAY9BwLJSq+PVHyir89ZNFncsheHCqk=;
	b=1xQsJN7YPK+lJOmeeubRo/n9rXgfjHu9g/u35s3msH1lmHypOA+R7/ysjtaTdYkJELwKEU
	NJ7+uJ+liZEnN2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64A6F138A7;
	Mon, 22 Jul 2024 08:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iz8bF9kTnma0VQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 08:10:01 +0000
Date: Mon, 22 Jul 2024 10:10:35 +0200
Message-ID: <87wmldq22s.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
In-Reply-To: <20240722013021.10727-1-wangdich9700@163.com>
References: <20240722013021.10727-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A69DD21B4B
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,kylinos.cn:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: KSSEYO3CKPB6N2IFJSRZC6OYTY5LQWVR
X-Message-ID-Hash: KSSEYO3CKPB6N2IFJSRZC6OYTY5LQWVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSSEYO3CKPB6N2IFJSRZC6OYTY5LQWVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jul 2024 03:30:21 +0200,
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
> v1 -> v2: Arrange the ID in order

It's still at a wrong position.  The ID 0c45 should be inserted at an
early position of the table.


thanks,

Takashi

> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 58156fbca02c..54b2d2f314ac 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2225,6 +2225,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_ALIGN_TRANSFER),
>  	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
>  		   QUIRK_FLAG_ALIGN_TRANSFER),
> +	DEVICE_FLG(0x0c45, 0x6340, /* Sonix HD USB Camera */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),
>  
>  	/* Vendor matches */
>  	VENDOR_FLG(0x045e, /* MS Lifecam */
> -- 
> 2.25.1
> 
