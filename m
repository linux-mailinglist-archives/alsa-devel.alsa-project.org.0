Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2BD83DD38
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 16:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754A3825;
	Fri, 26 Jan 2024 16:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754A3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706282139;
	bh=xR5OqKJHgzoeSr73MWTEO6XlarE2SYI2VkCSpnevdKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QBEHoL9pIiy9FogDkV606VI5qe7GKtDalh5l+fhi0XYJl7mueGEyUBEmYICqB/VD8
	 q7a2M9APu3lRD4kXU3aS5GnsnkauZ/C7ZaRT5sB5y8xGf7Sb3aMmzM2TeD/2cPV7F/
	 sBPMgq1VsNEjMUceGqpeSBx9GtuJQTWG0EXwKeZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D35F80520; Fri, 26 Jan 2024 16:15:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2615F80520;
	Fri, 26 Jan 2024 16:15:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84EFFF8028D; Fri, 26 Jan 2024 16:15:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24076F800C1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 16:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24076F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=T6yvCaEW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wGfagHKN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=T6yvCaEW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wGfagHKN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54CF721DCF;
	Fri, 26 Jan 2024 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706282097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4SUEWYijM+vF7TtPJURVmNeX8K+VvFmQtAMWbV0ogA=;
	b=T6yvCaEWFmiN6iq977b+hnl19VCDk4Ndf8wJTFRj3l/8brTsEMDM7q7J4BPEOhMTeaJy2t
	82yxPTPkgsKimrFakGEbqJItroFrcFtv07EuqERdczaOOkfAreJ03BKkCTSRw1OVGQw1gS
	pMGQ/Yim/a0CrywxV5fLIfYyH8tpQ/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706282097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4SUEWYijM+vF7TtPJURVmNeX8K+VvFmQtAMWbV0ogA=;
	b=wGfagHKNEN6Y39n6r13lPlKa1yUJhNSQJhFUqp8KLJoDmpXQ5xqbdXGF1p4XM6CNHofRD0
	mi814hTVqi4rp3Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706282097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4SUEWYijM+vF7TtPJURVmNeX8K+VvFmQtAMWbV0ogA=;
	b=T6yvCaEWFmiN6iq977b+hnl19VCDk4Ndf8wJTFRj3l/8brTsEMDM7q7J4BPEOhMTeaJy2t
	82yxPTPkgsKimrFakGEbqJItroFrcFtv07EuqERdczaOOkfAreJ03BKkCTSRw1OVGQw1gS
	pMGQ/Yim/a0CrywxV5fLIfYyH8tpQ/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706282097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4SUEWYijM+vF7TtPJURVmNeX8K+VvFmQtAMWbV0ogA=;
	b=wGfagHKNEN6Y39n6r13lPlKa1yUJhNSQJhFUqp8KLJoDmpXQ5xqbdXGF1p4XM6CNHofRD0
	mi814hTVqi4rp3Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 170BB134C3;
	Fri, 26 Jan 2024 15:14:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +3UqBHHMs2X0fwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jan 2024 15:14:57 +0000
Date: Fri, 26 Jan 2024 16:14:56 +0100
Message-ID: <87wmrwnn2n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/4] Support HP Models without _DSD
In-Reply-To: <20240126113007.4084-1-sbinding@opensource.cirrus.com>
References: <20240126113007.4084-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.61 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.996];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.31)[96.79%]
Message-ID-Hash: UFWITOYWY7ADCMPOUYP5YMUEZWVWVME7
X-Message-ID-Hash: UFWITOYWY7ADCMPOUYP5YMUEZWVWVME7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFWITOYWY7ADCMPOUYP5YMUEZWVWVME7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Jan 2024 12:30:03 +0100,
Stefan Binding wrote:
> 
> Add Quirks and driver properties for Dell models.
> Driver properties are required since these models do not have _DSD.
> Some models require special handing for Speaker ID and cannot use
> the configuration table to add properties.
> Also fix an issue for Channel Index property, when set through the
> configuration table, to use the same method as when loading _DSD
> properties. This is needed for laptops with 4 amps where the
> channels do not alternate.
> 
> Stefan Binding (4):
>   ALSA: hda: cs35l41: Set Channel Index correctly when system is missing
>     _DSD
>   ALSA: hda: cs35l41: Support additional HP Envy Models
>   ALSA: hda: cs35l41: Support HP models without _DSD using dual Speaker
>     ID
>   ALSA: hda/realtek: Add quirks for various HP ENVY models

The last one conflicts with the latest for-next branch due to the
recent change from Cirrus.  Could you rebase and resubmit?


thanks,

Takashi
