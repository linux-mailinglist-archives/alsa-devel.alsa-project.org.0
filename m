Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E8B883B5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Sep 2025 09:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1834D601A2;
	Fri, 19 Sep 2025 09:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1834D601A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758267749;
	bh=ccnpj8Gb2CtlCCWAN+4R73F29Fbx8ab8R21tQE93Jp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p+i16bHb/j5lKtobcowJiNNh7LtKRlXcdXdYXLgLTVShnlyuxcyc6dGZnvlDs5t+r
	 lkz1TFIbPnEyq2RGJftTk3CYt1NP5GhPIgoXi3FpzkACFVfEiAoa48VUm4jR+uLw32
	 NATy+l7Yc2oWuY9/E8qMUFO6JHVZpnhfEXk9Y3M0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97CE6F805C9; Fri, 19 Sep 2025 09:41:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED539F805C9;
	Fri, 19 Sep 2025 09:41:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC51CF8027B; Fri, 19 Sep 2025 09:41:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 472CEF8014C
	for <alsa-devel@alsa-project.org>; Fri, 19 Sep 2025 09:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 472CEF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hdaX5VlN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UKJGzvpH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hdaX5VlN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UKJGzvpH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F6F7336BC;
	Fri, 19 Sep 2025 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758267675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPc+C7j6JGt7LhQljpEUEy20z1HQO0nJ2Rw9f4zXjwM=;
	b=hdaX5VlN1/81mhTR3gHF9E5k8N80L6Scofu9DgoeDgQHC/7Lfon/5LrBixAL1OCI3pNoxU
	Ui0/TMr/d2sYFF+OR7cJAg0UNClHAPiKCAE0fR6lH15CVYyWMNNmQzmiul2XdHOTKA1L6x
	zhYX3vPYupCJ+J1yYI4KanPjGoSgbh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758267675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPc+C7j6JGt7LhQljpEUEy20z1HQO0nJ2Rw9f4zXjwM=;
	b=UKJGzvpH3cNCMkF7kJLk4keLWhKcxyuWhYBIoSqatEQhCuA/Ozb9lAl/wjEh7WLQaf5UrU
	KaVJYR8pALJFG7CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hdaX5VlN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UKJGzvpH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758267675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPc+C7j6JGt7LhQljpEUEy20z1HQO0nJ2Rw9f4zXjwM=;
	b=hdaX5VlN1/81mhTR3gHF9E5k8N80L6Scofu9DgoeDgQHC/7Lfon/5LrBixAL1OCI3pNoxU
	Ui0/TMr/d2sYFF+OR7cJAg0UNClHAPiKCAE0fR6lH15CVYyWMNNmQzmiul2XdHOTKA1L6x
	zhYX3vPYupCJ+J1yYI4KanPjGoSgbh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758267675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPc+C7j6JGt7LhQljpEUEy20z1HQO0nJ2Rw9f4zXjwM=;
	b=UKJGzvpH3cNCMkF7kJLk4keLWhKcxyuWhYBIoSqatEQhCuA/Ozb9lAl/wjEh7WLQaf5UrU
	KaVJYR8pALJFG7CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0517513A78;
	Fri, 19 Sep 2025 07:41:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zP11OxoJzWgTFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Sep 2025 07:41:14 +0000
Date: Fri, 19 Sep 2025 09:41:14 +0200
Message-ID: <87h5wyanz9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kaden Berger <kadenb816@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre 14t-ea100
In-Reply-To: <aMxdGAmfOQ6VPNU8@archlinux>
References: <aMxdGAmfOQ6VPNU8@archlinux>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1F6F7336BC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,c.new:url,suse.de:dkim,suse.de:mid]
Message-ID-Hash: LMG5OJ3UZWEQJD2YH4QNOBTMWPVCJALN
X-Message-ID-Hash: LMG5OJ3UZWEQJD2YH4QNOBTMWPVCJALN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMG5OJ3UZWEQJD2YH4QNOBTMWPVCJALN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 Sep 2025 21:27:20 +0200,
Kaden Berger wrote:
> 

Could you give a proper patch description?  It should describe what
this patch does, why it's needed, etc.
Then put your Signed-off-by tag.  It's a legal requirement.

> --- patch_realtek.c	2025-06-22 11:36:47.365528716 -0500
> +++ patch_realtek.c.new	2025-09-18 13:59:13.610449218 -0500

The patch should be against a full path with a prefix to be applied
with -p1 option.  And, since 6.17 kernel, the code was moved to
another file path, so the patch should appear like:

 --- a/sound/hda/codecs/realtek/alc269.c ....
 +++ a/sound/hda/codecs/realtek/alc269.c ....

For the details about the patch submission, please refer to
Documentation/submitting-patches.rst.

> @@ -10779,6 +10779,7 @@
>  	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>  	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
>  	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),

The change itself is pretty trivial, and if you rather let other people
fixing it, let us know.  If you'd like to resubmit in a proper format,
that'll be appreciated, too, of course.


thanks,

Takashi
