Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BB7F9B7B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 09:17:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB48CA4A;
	Mon, 27 Nov 2023 09:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB48CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701073058;
	bh=nCiFcpfAmAPMvh5h5ChclItOMqW9RUZmxhjpoUl4sno=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sfCw03Dprax3LM12DbGlhqs4QTkgNupcZdKiUSBqTRcKRhglcHAjzMeDTdyXSNW39
	 gd+R1rT1YJ9WpiMG7wD98erOpVcwMxBE8O+l/ww5Z4gQFQrsudEtpMHp1Awy4AIqG+
	 /dcbIr1eKh+/ji8vyYrKegCB8HPal11HjWhlQhdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CFC8F80236; Mon, 27 Nov 2023 09:17:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A93F80254;
	Mon, 27 Nov 2023 09:17:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 659A3F801D5; Mon, 27 Nov 2023 09:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 964E9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 09:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964E9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=aP8zwePL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YoewsvyY
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0C8421AE1;
	Mon, 27 Nov 2023 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701072712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+7KwelkSM3mqlitmrjsGgQQGtwAo2jkBTXgAtfnjfQ=;
	b=aP8zwePLWsIsdbSUK2OTNv4zDH+4qvkeMcwEx/90nZPTNCxR3pIv9ugmcVUtxkM/4dqu/L
	VSczZN4ARfUdAqP5s9soSHvpp7s5ArO1R0sDBp+ZDNvzWF1LMaMeFJpo5jZJyYQSMyScry
	z5TCF1lJ81luchtoYnnp25tZdd1NXQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701072712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+7KwelkSM3mqlitmrjsGgQQGtwAo2jkBTXgAtfnjfQ=;
	b=YoewsvyYoJk/YgWT9KPrkWNZLdVldOu1huOR8o2kZJyXen4fCxg3I+N8+BQe3DG8PI5lpx
	d9zyeWMvCT0JUEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8110F1379A;
	Mon, 27 Nov 2023 08:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMSrG0hPZGUSJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Nov 2023 08:11:52 +0000
Date: Mon, 27 Nov 2023 09:11:52 +0100
Message-ID: <877cm3pqd3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julian Sikorski <belegdol@gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: Yamaha YIT-W12TX not working
In-Reply-To: <98d10b80-40cb-4511-898e-c287663f0882@gmail.com>
References: <47549112-b2c6-1957-9055-888a4191c6ab@gmail.com>
	<204b6079-7348-418e-8d97-82d798a28d69@gmail.com>
	<98d10b80-40cb-4511-898e-c287663f0882@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.19 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(1.84)[0.614];
	 NEURAL_HAM_LONG(-0.93)[-0.932];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[yamaha.com:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: ILD6IISVC3IY6MWZ42TTTO7GJ4ZUJNCC
X-Message-ID-Hash: ILD6IISVC3IY6MWZ42TTTO7GJ4ZUJNCC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILD6IISVC3IY6MWZ42TTTO7GJ4ZUJNCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 26 Nov 2023 10:12:56 +0100,
Julian Sikorski wrote:
> 
> Am 17.11.23 um 15:31 schrieb Julian Sikorski:
> > Am 13.12.2020 um 10:51 schrieb Julian Sikorski:
> >> Hi list,
> >> 
> >> Yamaha YIT-W12TX is a USB dongle which allows to transmit audio
> >> from PC to the YSP-4300 sound bar [1][2]. While it is quite old and
> >> no longer sold, I recently tried to make it work under
> >> linux. Unfortunately, it did not work:
> >> 
> >> [ 3676.366404] usb 2-1.1: new full-speed USB device number 5 using
> >> ehci-pci
> >> [ 3676.445995] usb 2-1.1: config 1 has an invalid interface number:
> >> 4 but max is 3
> >> [ 3676.446001] usb 2-1.1: config 1 has no interface number 2
> >> [ 3676.446664] usb 2-1.1: New USB device found, idVendor=0499,
> >> idProduct=3108, bcdDevice= 1.00
> >> [ 3676.446666] usb 2-1.1: New USB device strings: Mfr=2, Product=1,
> >> SerialNumber=0
> >> [ 3676.446679] usb 2-1.1: Product: YIT-W12TX
> >> [ 3676.446683] usb 2-1.1: Manufacturer: YAMAHA Corp.
> >> [ 3676.449508] hid-generic 0003:0499:3108.0001: hiddev96,hidraw0:
> >> USB HID v0.01 Device [YAMAHA Corp. YIT-W12TX] on
> >> usb-0000:00:1d.0-1.1/input3
> >> [ 3676.450846] input: YAMAHA Corp. YIT-W12TX as
> >> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1:1.4/0003:0499:3108.0002/input/input34
> >> [ 3676.503844] hid-generic 0003:0499:3108.0002: input,hidraw1: USB
> >> HID v1.00 Device [YAMAHA Corp. YIT-W12TX] on
> >> usb-0000:00:1d.0-1.1/input4
> >> [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
> >> [ 3676.675786] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.676476] usbcore: registered new interface driver snd-usb-audio
> >> [ 3676.731911] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.735658] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.739399] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.743131] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.746920] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.750648] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.754445] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.758524] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.762274] usb 2-1.1: 5:0: cannot get min/max values for
> >> control 2 (id 5)
> >> [ 3676.789671] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.790049] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.790414] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.790773] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.791169] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.792134] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.792547] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.792899] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.793254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.793634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.794900] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.795255] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.795634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.796008] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.796384] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.797543] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.797879] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.798254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.798634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.799007] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.813819] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.814281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.814686] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.815281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.815929] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.817807] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.818155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.818592] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.819165] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.819801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.822163] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.822802] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.823284] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.824161] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.824907] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.827683] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.828159] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.828675] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.829415] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.830157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.841801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.842155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.842551] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.843158] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.843785] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.844909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.845283] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.845673] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.846156] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.846800] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.848287] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.848799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.849280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.850031] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.850799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.852677] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.853154] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.853674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.854429] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.855155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.858916] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.859277] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.859672] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.860280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.860909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.862033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.862418] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.862797] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.863279] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.863923] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.865471] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.866033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.866590] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.867410] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.868157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.870162] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.870674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.871155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.871908] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.872676] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> [ 3676.900672] usb 2-1.1: USB disconnect, device number 5
> >> [ 3676.900688] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
> >> 
> >> This is with kernel-5.9.13-200.fc33.x86_64 and
> >> alsa-lib-1.2.4-5.fc33.x86_64 on Fedora 33. Under Windows 10 the
> >> dongle works without any special drivers from Yamaha, everything
> >> appears to be downloaded by Windows automatically, so I was hoping
> >> the device could be made to work under Linux relatively easily.
> >> 
> >> Best regards,
> >> Julian
> >> 
> >> [1]
> >> https://europe.yamaha.com/en/products/audio_visual/accessories/yit-w12/downloads.html#product-tabs
> >> [2]
> >> https://europe.yamaha.com/en/products/audio_visual/sound_bar/ysp-4300/downloads.html#product-tabs
> > 
> > Hello,
> > 
> > 3 years later I am still hoping for getting the device working. I am
> > on 6.5 kernel and Fedora 39.
> > I am attaching Windows' driver details screenshot as well as the inf
> > file used.
> > Does USB audio driver under linux have any parameters I could try?
> > 
> > Best regards,
> > Julian
> 
> Hi again,
> 
> turns out that getting the sound out was easier than expected:
> 
> options snd-usb-audio quirk_flags=0x1

And this alone helps to get the card working?
Once after confirmation, we can add the quirk to the static table.

> One cosmetic issue remains: in pavucontrol I can see 3 configuration
> options:
> - Analog Stereo output
> - Digital Stereo (IEC958) output
> - Pro Audio
> The first and the third one work normally whereas digital stereo
> output very quiet audio only.
> By contrast, both my built-in audio cards (AMD Renoir HDMI and analog
> output) only have two options:
> - Play HiFi quality Music
> - Pro Audio
> Is this expected?

When the device provides multiple outputs, yes, it's a sort of default
setup.  Different boards may have different own UCM configs to
override the default.
Check each output and verify what actual I/O they correspond.


Takashi
