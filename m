Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD27AE2F0C
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jun 2025 11:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4398601F6;
	Sun, 22 Jun 2025 11:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4398601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750584524;
	bh=dQ9dzIAbkmbYIf+5CTqCak6tp0Hj3oSheYkOwIYvcM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EG8LYs9gg73VjCSDA6yltjnPeJ2165dOLJxtPAVTxfTnyfx7mZJuxUARIIyjtzcO3
	 14zTw+6ggwt/AtOIg/arHT7tEvkb1+IjCbAVTZKU1QIQgoug3wF70HN673Es5iRdLD
	 kcioBIAiiRNQR0cFtJV6Yh3GjSlqn6xudN+6dajA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D02F805C9; Sun, 22 Jun 2025 11:28:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C94CFF805C6;
	Sun, 22 Jun 2025 11:28:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC4B2F804FF; Sun, 22 Jun 2025 11:28:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10290F80087
	for <alsa-devel@alsa-project.org>; Sun, 22 Jun 2025 11:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10290F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=d2sGV8hX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uLh8f5vA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dDFxPWvT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=74pdsojr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E42061F388;
	Sun, 22 Jun 2025 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750584480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvabKmxSHAwQ4pLlPNh5bjofXg9A4Q0XaO0cGXp92Ls=;
	b=d2sGV8hX8RGmSWYv+2OkwXV++6N8bFw0LQXmLgrOsFrAWBKcZwPyih4WgbmHdF7J4vz2SV
	L27NtHrNBtA/K6XIHAverzLoKnUg4nPxofbl+EOahoqMIBR2Xe9TDLgGzfBWciFBcIsl4+
	zzwmNKQUXrxcN6UoGD09Oj1tEQbXqMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvabKmxSHAwQ4pLlPNh5bjofXg9A4Q0XaO0cGXp92Ls=;
	b=uLh8f5vAjpOfk3Ri25b+cw0HqI0lRaw224ut8twsrZWACx7UbkPFo3ymPX3q0VO7xJAh02
	4XnAoqnY7lozKYAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dDFxPWvT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=74pdsojr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750584479;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvabKmxSHAwQ4pLlPNh5bjofXg9A4Q0XaO0cGXp92Ls=;
	b=dDFxPWvTlhq78gcCdcm3eFEpIEmUHhzsFOBSSawUUvTr8pfs9c+3IrjXC+QcjbR1nGxMLj
	e1c1m1jSC1hlP6YrLd9HGQmSa9jBT3sbZ2pTmgQoc4XQKmH9kecpOw25gUu+UQaasjt03u
	bU1vmN2vDzXKjnKlmn+M57hmPd8LUkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvabKmxSHAwQ4pLlPNh5bjofXg9A4Q0XaO0cGXp92Ls=;
	b=74pdsojrKCYSkdyQSfFeCR05YnB9ewrVTgMrWgTMnRj5ffJyqyd0OgKpLhahawybgsgwul
	L3o9ny7UaNvfr5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9A1F13A69;
	Sun, 22 Jun 2025 09:27:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IlbNK5/MV2iAKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Jun 2025 09:27:59 +0000
Date: Sun, 22 Jun 2025 11:27:59 +0200
Message-ID: <87o6ugw2g0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kaden Berger <kadenb816@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: add fixup for HP Spectre x360
 14t-ea100 (ALC245)
In-Reply-To: 
 <CAPgmYfAvGQHP5VVb7d+Xsh7Mx4OopRJtiL-TRcp+kb0UHrmK8A@mail.gmail.com>
References: 
 <CAPgmYfAvGQHP5VVb7d+Xsh7Mx4OopRJtiL-TRcp+kb0UHrmK8A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E42061F388
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: GCX7I4VNX5LCHLNCBT4TMESZT4BDRFHD
X-Message-ID-Hash: GCX7I4VNX5LCHLNCBT4TMESZT4BDRFHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCX7I4VNX5LCHLNCBT4TMESZT4BDRFHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 21 Jun 2025 21:35:40 +0200,
Kaden Berger wrote:
> 
> 
> This patch adds a quirk to enable proper speaker output on the HP Spectre x360
> 14t-ea100 with the Realtek ALC245 code. 
> 
> SIgned-off-by: Kaden Berger <kadenb816@gmail.com>
> 
> diff -ura linux-6.15.1.orig/sound/pci/hda/patch_realtek.c linux-6.15.1.new/
> sound/pci/hda/patch_realtek.c
> --- linux-6.15.1.orig/sound/pci/hda/patch_realtek.c 2025-06-09
> 08:21:07.178183524 -0500
> +++ linux-6.15.1.new/sound/pci/hda/patch_realtek.c 2025-06-09
> 08:26:16.859486062 -0500
> @@ -10792,6 +10793,7 @@
>   SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
>   SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx",
> ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
> + SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100",
> ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
>   SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx",
> ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
>   SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
>   SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX",
> ALC245_FIXUP_HP_X360_MUTE_LEDS),

Thanks for the patch.  Unfortunately the submitted patch isn't
applicable.  Your mailer didn't keep the patch format properly.
Could you try to fix the setup and resubmit?

Also, the table is sorted in PCI SSID order.  Please try to put the
new entry at the right position.


thanks,

Takashi
