Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5383FFA6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 09:08:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B97A86F;
	Mon, 29 Jan 2024 09:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B97A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706515699;
	bh=PqCqsBOfry4+69UAUYsb3HfIjbltpAZAydgLr11l3ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KSU4+81Oh18R3KJ9KVQ1doSEROMFhRELSQlxp57KCslzBqKYpjypr7ZJ5SpKWuPrA
	 KOPtZaolwT3tDRGfhmrYHI8TPTzOAeV4IN7nxHZs7GpmBHIaw7M+Fnv6VRiFzhJfYt
	 PcXCW/KE/o/XHVAFkLmMoCEbRU3oH2AcJE++R9oY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5708AF80520; Mon, 29 Jan 2024 09:07:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 029D6F80548;
	Mon, 29 Jan 2024 09:07:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C50C6F80310; Mon, 29 Jan 2024 09:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE4F3F80053
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 09:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4F3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nt38B+yM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=khuWJffl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pYPT6Igg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eqMQ/fTd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F30CB22275;
	Mon, 29 Jan 2024 08:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706515504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB4lpsv1mbtcY8UjXor5RZAb1mM1rlIbvlmyqYpPPNo=;
	b=nt38B+yMp9gNqX0tByGAJzbKEeBgKKkaaMqXKOUpP9dUOUQBcLun8Bz+TjUhBs6yONEXzi
	+L4IrPh6nm4Av3wzSPqE1Dg0tYxlj+KGzgAha6NiOfyX+0jOLOe+XpykcntDLk+F5Hab48
	MB0F49HVRkkE9octQvDTRZdsahfebdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB4lpsv1mbtcY8UjXor5RZAb1mM1rlIbvlmyqYpPPNo=;
	b=khuWJfflBHMQq0AP/lYE51YvmAyptPYqZQWkrlYmqeMtqLp9qpthBQDVKIjioE6OKOjyPQ
	NLRHipuPG0OxdVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706515503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB4lpsv1mbtcY8UjXor5RZAb1mM1rlIbvlmyqYpPPNo=;
	b=pYPT6Iggy4n9Il8dRAXu7tgDFURA2X4oQt9WOhQV5GXSNzGMu9YKczClXjMd0LKJ5yMzr1
	LgKcvgKm6F6wgdz7tbL3F3s+IQhGdEYNVCD4GDyCqamR33yJi14U5o5GdU10TLzZREgUOa
	VE7JQccjlvXyyuZqGeZ1tLM3aYMCBVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706515503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VB4lpsv1mbtcY8UjXor5RZAb1mM1rlIbvlmyqYpPPNo=;
	b=eqMQ/fTd4SajKqz2zyXN8djika09GUEgR2j8s92KevHg73QUu8Jt78qmR11k8POws+iZzQ
	6cWogacZXFp7lIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA81413647;
	Mon, 29 Jan 2024 08:05:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id flRILy9ct2V/WwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 08:05:03 +0000
Date: Mon, 29 Jan 2024 09:05:03 +0100
Message-ID: <87r0i0muog.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org,
	m.armsby@gmx.de
Subject: Re: [PATCH v2] ALSA: firewire-motu: add support for MOTU 896 mk3
 FireWire and Hybrid
In-Reply-To: <20240129022711.254383-1-o-takashi@sakamocchi.jp>
References: <20240129022711.254383-1-o-takashi@sakamocchi.jp>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[alsa-project.org,gmx.de];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[19.67%]
Message-ID-Hash: KGJ537XRYY7ZUTKULIWVAUJOF4ZWSLQQ
X-Message-ID-Hash: KGJ537XRYY7ZUTKULIWVAUJOF4ZWSLQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGJ537XRYY7ZUTKULIWVAUJOF4ZWSLQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 03:27:11 +0100,
Takashi Sakamoto wrote:
> 
> Mark of the Unicorn released 896 mk3 FireWire in 2008 as part of the third
> generation of its FireWire series. In 2011, 896 mk3 hybrid was released to
> support USB protocol.
> 
> It supports sampling transfer frequency up to 192.0 kHz. The packet
> format differs depending on both of current sampling transfer frequency
> and the type of signal in optical interfaces. The model supports
> transmission of PCM frames as well as MIDI messages.
> 
> The 896 mk3 FireWire consists of below ICs:
> 
>  * Texas Instruments TSB41AB2
>  * Xilinx Spartan-3A FPGA, XC3S500E
>  * Texas Instruments TMS320C6722
>  * Microchip (Atmel) AT91SAM SAM7S256
> 
> It supports sampling transfer frequency up to 192.0 kHz. The packet
> format differs depending on both of current sampling transfer frequency
> and the type of signal in two pairs of optical interfaces. The model
> supports transmission of PCM frames, while has no port for MIDi messages.
> 
> The model supports command mechanism to configure internal DSP. Hardware
> meter information is available in the first 2 chunks of each data block
> of tx packet.
> 
> This commit adds support for it. The 896 mk3 FireWire is just tested, but
> the 896 mk3 Hybrid is not yet.
> 
> $ config-rom-pretty-printer < motu-896mk3fw.img
>                ROM header and bus information block
>                -----------------------------------------------------------------
> 1024  04100ce1  bus_info_length 4, crc_length 16, crc 3297
> 1028  31333934  bus_name "1394"
> 1032  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
> 1036  0001f200  company_id 0001f2     |
> 1040  00093add  device_id 0000604893  | EUI-64 0547556791237341
> 
>                root directory
>                -----------------------------------------------------------------
> 1044  0004ef04  directory_length 4, crc 61188
> 1048  030001f2  vendor
> 1052  0c0083c0  node capabilities: per IEEE 1394
> 1056  d1000002  --> unit directory at 1064
> 1060  8d000005  --> eui-64 leaf at 1080
> 
>                unit directory at 1064
>                -----------------------------------------------------------------
> 1064  0003998d  directory_length 3, crc 39309
> 1068  120001f2  specifier id
> 1072  13000017  version
> 1076  17101800  model
> 
>                eui-64 leaf at 1080
>                -----------------------------------------------------------------
> 1080  0002cc82  leaf_length 2, crc 52354
> 1084  0001f200  company_id 0001f2     |
> 1088  00093add  device_id 0000604893  | EUI-64 0547556791237341
> 
> $ config-rom-pretty-printer < motu-896mk3hybrid.img
>                ROM header and bus information block
>                -----------------------------------------------------------------
> 1024  04103cbe  bus_info_length 4, crc_length 16, crc 15550
> 1028  31333934  bus_name "1394"
> 1032  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
> 1036  0001f200  company_id 0001f2     |
> 1040  000ae601  device_id 0000714241  | EUI-64 0547556791346689
> 
>                root directory
>                -----------------------------------------------------------------
> 1044  0004ef04  directory_length 4, crc 61188
> 1048  030001f2  vendor
> 1052  0c0083c0  node capabilities: per IEEE 1394
> 1056  d1000002  --> unit directory at 1064
> 1060  8d000005  --> eui-64 leaf at 1080
> 
>                unit directory at 1064
>                -----------------------------------------------------------------
> 1064  000394ac  directory_length 3, crc 38060
> 1068  120001f2  specifier id
> 1072  13000037  version
> 1076  17102800  model
> 
>                eui-64 leaf at 1080
>                -----------------------------------------------------------------
> 1080  0002cf69  leaf_length 2, crc 53097
> 1084  0001f200  company_id 0001f2     |
> 1088  000ae601  device_id 0000714241  | EUI-64 0547556791346689
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks, applied now.


Takashi
