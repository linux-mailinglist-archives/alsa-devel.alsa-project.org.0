Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974899DF509
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Dec 2024 09:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF446F55;
	Sun,  1 Dec 2024 09:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF446F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733043104;
	bh=Qe+D83qXumroTRyr7fSFDsUTe1V0pjsTvwSStSp0B0c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tUDfoJVtj4ZgGgGBIUWJQ3F6ZMl6BsgN843SIJTtihs5tZxipN9ivqtMTEbV0liG2
	 rdC0KSGOgIpV49oAwOYTKHZxxkLSdSepdyiK3/Le5Gp7IaAQXssFm2Y02bdobTUo5H
	 hE5e9oHH75uYGTEmK7x6jvepUSuWGCYgSWMZShME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8680EF805B2; Sun,  1 Dec 2024 09:51:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9572CF805AE;
	Sun,  1 Dec 2024 09:51:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F41EF8032D; Sun,  1 Dec 2024 09:51:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE385F80116
	for <alsa-devel@alsa-project.org>; Sun,  1 Dec 2024 09:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE385F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tIftdx7D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=m9/4G5Fh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1w6Y9+zv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Fjk5g+Fb
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2CD51F383;
	Sun,  1 Dec 2024 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733043062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aeExrs1aYdDHfUzMH082DL4FWKhLKEf0fhA1eUJbfOo=;
	b=tIftdx7DxR5mJwRJkblKYUtIsGmUSD3MmPb6R/t3+ixr+9QRWgt5HG8QhuzTFNlur/y63V
	bFOAgL/FOUZTS25E2OmDDRxyIGG/AEM3We6xhK9wBLLOBe3EEvlxdEVUnk/Owsvx6SDqyO
	Tz9yN0NMpqrKSY0UamoONtd+yPk2AYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733043062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aeExrs1aYdDHfUzMH082DL4FWKhLKEf0fhA1eUJbfOo=;
	b=m9/4G5Fhep6XwzUrlhwL5ueKThrX3vz1f1iCUY1KZNGqErKu3l5iCUPXCSTeRkbTrz0rQH
	v2N00U9H3cNqVZAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1w6Y9+zv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fjk5g+Fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733043061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aeExrs1aYdDHfUzMH082DL4FWKhLKEf0fhA1eUJbfOo=;
	b=1w6Y9+zvVfeuOK/mhSIEwpV7g9EU0QrXuQ0Y9QNx7dTGD9dnwrw9u1h3ppgToGShyxGDfJ
	YkIG6rCJSwY72IHbSB7mb9YM3ltmkZk9RiruEi+G70lityVux5784LUWm2RIPMOwtDjxe0
	EBgQ5E707DLY75yQyPTILglNBCkMxgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733043061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aeExrs1aYdDHfUzMH082DL4FWKhLKEf0fhA1eUJbfOo=;
	b=Fjk5g+Fb0y8eNeohAi9B2FCD6Z3I0z/smUCflaDVzFzXVM+WMds1osM8pwJL6MMvdmDH1e
	mnh4Not/M2HFC9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3E9613974;
	Sun,  1 Dec 2024 08:51:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ONurJnUjTGfTRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 01 Dec 2024 08:51:01 +0000
Date: Sun, 01 Dec 2024 09:51:01 +0100
Message-ID: <87cyibzszu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nazar Bilinskyi <nbilinskyi@gmail.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute and micmute LED on HP
 ProBook 430 G8
In-Reply-To: <20241130231631.8929-1-nbilinskyi@gmail.com>
References: <20241130231631.8929-1-nbilinskyi@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D2CD51F383
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: R2BIMYKUZB7V5ALEV6QYTG67UHVLQBKR
X-Message-ID-Hash: R2BIMYKUZB7V5ALEV6QYTG67UHVLQBKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2BIMYKUZB7V5ALEV6QYTG67UHVLQBKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 01 Dec 2024 00:16:31 +0100,
Nazar Bilinskyi wrote:
> 
> HP ProBook 430 G8 has a mute and micmute LEDs that can be made to work
> using quirk ALC236_FIXUP_HP_GPIO_LED. Enable already existing quirk.
> 
> Signed-off-by: Nazar Bilinskyi <nbilinskyi@gmail.com>

Thanks, applied now.


Takashi
