Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BF937A9E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 18:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C680BE72;
	Fri, 19 Jul 2024 18:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C680BE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721405846;
	bh=N9ikjv8nlCsUDD+kFGy+dOFLLsoIRaRFd/BqgpCx/Es=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z0zdK5fRFbxj4zZpneQzjahcqjhJlWSNGN8xXgYrjl9dCnt4G/PKZ01XxdunpY/WB
	 cg/6QvE9iYTSSXaUbpNvADkhLJ1hrYCB1U18+OzZx8mZI0ucbdfKdjRP/hcixxQBpo
	 VOYXDjPoeqMvNIQ3oM/boNhX1a1TJVaUIJRW0+PU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 842C2F805D3; Fri, 19 Jul 2024 18:16:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA73F805D7;
	Fri, 19 Jul 2024 18:16:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC9AF80508; Fri, 19 Jul 2024 18:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17143F800FA
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17143F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GuksSN/A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=G2PTHp0o;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GuksSN/A;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=G2PTHp0o
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE93921195;
	Fri, 19 Jul 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/H93cFyUfCuxRcjvdGlgdf3FPdOykcZU4faiSSn7exo=;
	b=GuksSN/ACzX0MAc+q7DDgh4n7vrgV6r4nS5ZUeTrebX35YmNk+DYXpRwoxxQkN5ooLoA6e
	33Cksqku0uApBfqKc21pkOuEDjlHWp95jqM6VUT3USnZrZeMdmOUYmz1cNY7XBmp8HDSu6
	A/pD1sex72m8pgfCgHDmW8jKW0rSV8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/H93cFyUfCuxRcjvdGlgdf3FPdOykcZU4faiSSn7exo=;
	b=G2PTHp0oBcqKdtUqL5TT2fDZ/xdZr5KVu0X0hon/WQZ9cTBB1Vbotnbx1p67CPCXPdywju
	gc+uuoH+//z5xbBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="GuksSN/A";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=G2PTHp0o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/H93cFyUfCuxRcjvdGlgdf3FPdOykcZU4faiSSn7exo=;
	b=GuksSN/ACzX0MAc+q7DDgh4n7vrgV6r4nS5ZUeTrebX35YmNk+DYXpRwoxxQkN5ooLoA6e
	33Cksqku0uApBfqKc21pkOuEDjlHWp95jqM6VUT3USnZrZeMdmOUYmz1cNY7XBmp8HDSu6
	A/pD1sex72m8pgfCgHDmW8jKW0rSV8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405194;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/H93cFyUfCuxRcjvdGlgdf3FPdOykcZU4faiSSn7exo=;
	b=G2PTHp0oBcqKdtUqL5TT2fDZ/xdZr5KVu0X0hon/WQZ9cTBB1Vbotnbx1p67CPCXPdywju
	gc+uuoH+//z5xbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68BF013808;
	Fri, 19 Jul 2024 16:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pS5fGAqPmmYdEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 16:06:34 +0000
Date: Fri, 19 Jul 2024 18:07:07 +0200
Message-ID: <875xt1s6vo.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3] ALSA: usb-audio: Fix microphone sound on HD webcam.
In-Reply-To: <20240719020906.8078-1-wangdich9700@163.com>
References: <20240719020906.8078-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.31 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Queue-Id: AE93921195
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /
Message-ID-Hash: 77CSZAM6WUPSAKHD7F7TW3NWG7BZBVVI
X-Message-ID-Hash: 77CSZAM6WUPSAKHD7F7TW3NWG7BZBVVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77CSZAM6WUPSAKHD7F7TW3NWG7BZBVVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jul 2024 04:09:06 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> I own an external usb Webcam, HD webcam, which had low mic volume and
> inconsistent sound quality. Video works as expected.
> 
> (snip)
> [   95.473820][ 1] [   T73] usb 5-2.2: new high-speed USB device number 7 using xhci_hcd
> [   95.773974][ 1] [   T73] usb 5-2.2: New USB device found, idVendor=1bcf, idProduct=2281, bcdDevice= 0.05
> [   95.783445][ 1] [   T73] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   95.791872][ 1] [   T73] usb 5-2.2: Product: HD webcam
> [   95.797001][ 1] [   T73] usb 5-2.2: Manufacturer: Sunplus IT Co
> [   95.802996][ 1] [   T73] usb 5-2.2: SerialNumber: 20200513
> [   96.092610][ 2] [ T3680] usb 5-2.2: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
> [   96.102436][ 2] [ T3680] usb 5-2.2: [5] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
> 
> Set up quirk cval->res to 16 for 256 levels,
> Set GET_SAMPLE_RATE quirk flag to stop trying to get the sample rate.
> Confirmed that happened anyway later due to the backoff mechanism,
> After 3 failures.
> 
> All audio stream on device interfaces share the same values,
> apart from wMaxPacketSize and tSamFreq :
> 
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
> 
> Interface Descriptor:
>   bLength                 9
>   bDescriptorType         4
>   bInterfaceNumber        3
>   bAlternateSetting       4
>   bNumEndpoints           1
>   bInterfaceClass         1 Audio
>   bInterfaceSubClass      2 Streaming
>   bInterfaceProtocol      0
>   iInterface              0
>   AudioStreaming Interface Descriptor:
>     bLength                 7
>     bDescriptorType        36
>     bDescriptorSubtype      1 (AS_GENERAL)
>     bTerminalLink           3
>     bDelay                  1 frames
>     wFormatTag         0x0001 PCM
>   AudioStreaming Interface Descriptor:
>     bLength                11
>     bDescriptorType        36
>     bDescriptorSubtype      2 (FORMAT_TYPE)
>     bFormatType             1 (FORMAT_TYPE_I)
>     bNrChannels             1
>     bSubframeSize           2
>     bBitResolution         16
>     bSamFreqType            1 Discrete
>     tSamFreq[ 0]        48000
>   Endpoint Descriptor:
>     bLength                 9
>     bDescriptorType         5
>     bEndpointAddress     0x86  EP 6 IN
>     bmAttributes            5
>       Transfer Type            Isochronous
>       Synch Type               Asynchronous
>       Usage Type               Data
>     wMaxPacketSize     0x0064  1x 100 bytes
>     bInterval               4
>     bRefresh                0
>     bSynchAddress           0
>     AudioStreaming Endpoint Descriptor:
>       bLength                 7
>       bDescriptorType        37
>       bDescriptorSubtype      1 (EP_GENERAL)
>       bmAttributes         0x01
>         Sampling Frequency
>       bLockDelayUnits         0 Undefined
>       wLockDelay         0x0000
> (snip)
> 
> Testing patch provides consistent good sound recording quality and volume range.
> 
> (snip)
> [   95.473820][ 1] [   T73] usb 5-2.2: new high-speed USB device number 7 using xhci_hcd
> [   95.773974][ 1] [   T73] usb 5-2.2: New USB device found, idVendor=1bcf, idProduct=2281, bcdDevice= 0.05
> [   95.783445][ 1] [   T73] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   95.791872][ 1] [   T73] usb 5-2.2: Product: HD webcam
> [   95.797001][ 1] [   T73] usb 5-2.2: Manufacturer: Sunplus IT Co
> [   95.802996][ 1] [   T73] usb 5-2.2: SerialNumber: 20200513
> [   96.110630][ 3] [ T3680] usbcore: registered new interface driver snd-usb-audio
> [   96.114329][ 7] [ T3677] usb 5-2.2: Found UVC 1.00 device HD webcam (1bcf:2281)
> [   96.167555][ 7] [ T3677] usbcore: registered new interface driver uvcvideo
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
> v2 -> v3: make the mail address of Signed-off-by  consistent with the From address
> V1 -> V2: align the space,Update code to v6.8-rc3,and make modifications based on it

Thanks, applied now.


Takashi
