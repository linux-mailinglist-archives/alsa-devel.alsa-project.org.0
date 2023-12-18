Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51681791D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 18:49:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8302F83E;
	Mon, 18 Dec 2023 18:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8302F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702921758;
	bh=3DwYD/QRVcsDe/P2lE4y82aABCICaXWb+jJ0UGtPO2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xh5VQllcpeTP3T5gqm6TO+Hp894iiM2OYA2PRuY9Yy5YzWAVFbS2ayl0+Eh1O9Mw4
	 DfrLCit5u753psBeukx5VokerotTS13BGaYX2CsuOJXPWHldUcK052TlGb+ofBk4Ag
	 YOwq/p4G0Y+Vpj0pY+i7R1DTKsqSHA+4z4DB8br4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B8CF805A1; Mon, 18 Dec 2023 18:48:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2893F80537;
	Mon, 18 Dec 2023 18:48:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADDB5F80431; Mon, 18 Dec 2023 18:48:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77D17F800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 18:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D17F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fo3WRtpx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jCecfQhV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fo3WRtpx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jCecfQhV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE5C51F450;
	Mon, 18 Dec 2023 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702921714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mByW+MzACC2iIlFrod5tliLDSa6iODdWULR3MPvcv1k=;
	b=fo3WRtpxplWsMWAJAgHAABgqYDphcx0eUH7HkrMTOkrTsEDgB8JYls43teIEmtgWVGHD4M
	QU8ucJXRpx3lcnVgXXYVrUjzMdpLCNQeOsnioexAX5m33H/UvnWDxJq9CEE9gPcZlKqJRL
	5vlqaV5As/6sl2lQAwGfDdY0Rw3WFKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702921714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mByW+MzACC2iIlFrod5tliLDSa6iODdWULR3MPvcv1k=;
	b=jCecfQhVtAhd+AteH8NwM9577MFzdVRpmEKwRYQFlQ5bL9gc/dwl0vWgmLthDCxI0ZMZbz
	5SmBHLRmHBcru5CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702921714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mByW+MzACC2iIlFrod5tliLDSa6iODdWULR3MPvcv1k=;
	b=fo3WRtpxplWsMWAJAgHAABgqYDphcx0eUH7HkrMTOkrTsEDgB8JYls43teIEmtgWVGHD4M
	QU8ucJXRpx3lcnVgXXYVrUjzMdpLCNQeOsnioexAX5m33H/UvnWDxJq9CEE9gPcZlKqJRL
	5vlqaV5As/6sl2lQAwGfDdY0Rw3WFKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702921714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mByW+MzACC2iIlFrod5tliLDSa6iODdWULR3MPvcv1k=;
	b=jCecfQhVtAhd+AteH8NwM9577MFzdVRpmEKwRYQFlQ5bL9gc/dwl0vWgmLthDCxI0ZMZbz
	5SmBHLRmHBcru5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E08713894;
	Mon, 18 Dec 2023 17:48:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dOEwGfKFgGUSKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 Dec 2023 17:48:34 +0000
Date: Mon, 18 Dec 2023 18:48:34 +0100
Message-ID: <878r5rz9jh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
In-Reply-To: <20231218151221.388745-1-sbinding@opensource.cirrus.com>
References: <20231218151221.388745-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: ZR5FO4DL4BQLWOFNZYMLVV7F2VHEGZGS
X-Message-ID-Hash: ZR5FO4DL4BQLWOFNZYMLVV7F2VHEGZGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZR5FO4DL4BQLWOFNZYMLVV7F2VHEGZGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Dec 2023 16:12:14 +0100,
Stefan Binding wrote:
> 
> The CS35L41 HDA driver requires various system defined properties to configure
> the driver for an individual system. For some laptops, these properties are
> missing in the BIOS. To be able to support these laptops, there is a mechanism
> in the driver to get this configuration from a lookup table, to be able to add
> or patch _DSD as necessary.
> 
> However this mechanism currently only allows for laptops to be patched one at
> a time, however, in the case where there are many laptops which need to be
> configured generically, a generic function has been added, with an additional
> lookup table to the individual laptops, indexed by SSID.
> 
> To support laptops using SPI without _DSD, an additional workaround is needed
> to be able to support the SPI Chip Select GPIOs whose resources are defined
> inside the _CRS for the Speaker ACPI Node. This workaround only works for
> SPI laptops which contain up to 2 amps, since the SPI controller would not
> allow more than 2 amps to be instantiated without the cs-gpios entry in
> _DSD.
> 
> These patches add support for various ASUS laptops without _DSD, but the
> framework added here allows for support for more laptops in the future
> for other manufacturers. Support for laptops without _DSD from other
> manufacturers is coming in the future.
> 
> Note: for systems which use modified _DSD to emulate the missing _DSD,
> these patches are incompatible, and the modified _DSD must be removed in
> order for the support through this framework to work for those laptops.
> 
> Stefan Binding (7):
>   ALSA: hda: cs35l41: Add config table to support many laptops without
>     _DSD
>   ALSA: hda: cs35l41: Support additional ASUS ROG 2023 models
>   ALSA: hda/realtek: Add quirks for ASUS ROG 2023 models
>   ALSA: hda: cs35l41: Support additional ASUS Zenbook 2022 Models
>   ALSA: hda/realtek: Add quirks for ASUS Zenbook 2022 Models
>   ALSA: hda: cs35l41: Support additional ASUS Zenbook 2023 Models
>   ALSA: hda/realtek: Add quirks for ASUS Zenbook 2023 Models

Applied all seven patches now.  Thanks.


Takashi
