Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F898A689
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 16:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D53210F;
	Mon, 30 Sep 2024 16:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D53210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727704892;
	bh=72lvvQ0PsTP4unMTms3FQg9JNGWNrkS8yY3xWfl6tAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bdgq92zyy/Jy2Purw/tumvddC6OlYgLZs+4WeCwjGNlpMRnDlTzzQuAMyxX0q1Trk
	 ibpuIdzbt9CR6/qwvA8Nvmyrgib417YC+ar26aoARJHIGMeZqozGJUkwJTjaCfMvUL
	 ptdFZsPZlIIqf2Qv0Oi4Tc9XpRf2wjQGYrBe+G18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2828F80508; Mon, 30 Sep 2024 16:00:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A30AF805AD;
	Mon, 30 Sep 2024 16:00:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45D35F80517; Mon, 30 Sep 2024 16:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65837F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 16:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65837F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BD/lp7vk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WFHYX0ol;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cPV2ake/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HfhW9YkS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDF351FBA6;
	Mon, 30 Sep 2024 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727704847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojhulVOkhtorTaDB4sDU8EIIwO0cqoSan1fKY399IzQ=;
	b=BD/lp7vkdVTBj/O0qIrfDMpU1EehJRitSgYnjpkKZGI0EDfBZa2GwCD0Hs8tjHwk5kCwZg
	mfT6VTZ7JK05gzrtrddlTMiBBe7PoZdydOrIl3/igZuJefPsNhDuBEr9fLO3gkg/kJbTmS
	f9AnHBfUJV4KAc5gd6YFnNWcDgDloAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727704847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojhulVOkhtorTaDB4sDU8EIIwO0cqoSan1fKY399IzQ=;
	b=WFHYX0olRPTwyqddlN0549HVtB7lTQfQnqgxNN95/wY/UGgMIIaujJDDHXidrOG+kiBO0r
	Lt3MOEXM1KzV+sAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="cPV2ake/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HfhW9YkS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727704846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojhulVOkhtorTaDB4sDU8EIIwO0cqoSan1fKY399IzQ=;
	b=cPV2ake/vjaRBox8iekwVXmivyE4/1f4yy56Lv8vP8/bcVzOcxXL0AG8srturzzvSGyvEk
	qPJgaSNcXxdfXGPfUeE5jhj7Qqb+ZPME1aliojh9NnhndyfaUrs0tIrVYLq86WDe7cP8EY
	Q18UQPqcQ1Xfdprk4pEATO2Lb054aXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727704846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojhulVOkhtorTaDB4sDU8EIIwO0cqoSan1fKY399IzQ=;
	b=HfhW9YkSioVQc3ENMNPXquGpZ+K8miPoLVwWmgc7y8cbXwOb4igfK5pum6v7v2I4svbwUm
	BqJusqHS1DNoenDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 884DF13A8B;
	Mon, 30 Sep 2024 14:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GWEVIA6v+mawCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 14:00:46 +0000
Date: Mon, 30 Sep 2024 16:01:39 +0200
Message-ID: <87frphgrzw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: <alsa-devel@alsa-project.org>,
	<kailang@realtek.com>,
	<flove@realtek.com>,
	<jennifer_chen@realtek.com>,
	<geans_chen@realsil.com.cn>,
	Parsa Poorshikhian <parsa.poorsh@gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix the push button function for
 the ALC257
In-Reply-To: <20240930105039.3473266-1-oder_chiou@realtek.com>
References: <20240930105039.3473266-1-oder_chiou@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BDF351FBA6
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,realtek.com,realsil.com.cn,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: FDNWD42VYCDECJIEQPNK2U7O33ZSUSVQ
X-Message-ID-Hash: FDNWD42VYCDECJIEQPNK2U7O33ZSUSVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDNWD42VYCDECJIEQPNK2U7O33ZSUSVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Sep 2024 12:50:39 +0200,
Oder Chiou wrote:
> 
> The headset push button cannot work properly in case of the ALC257.
> This patch reverted the previous commit to correct the side effect.
> 
> Fixes: ef9718b3d54e ("ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7")
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>

As it's a regression, the revert is fine.  Now applied to for-linus
branch.

Meanwhile, we'd need to fix for IdeaPad 3 in a different way.
e.g. add a quirk entry to set alc_eapd_shutup or so.
Adding Parsa to Cc for the further work.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f787ff4182d4..86db1a4ec24c 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -587,6 +587,7 @@ static void alc_shutup_pins(struct hda_codec *codec)
>  	switch (codec->core.vendor_id) {
>  	case 0x10ec0236:
>  	case 0x10ec0256:
> +	case 0x10ec0257:
>  	case 0x19e58326:
>  	case 0x10ec0283:
>  	case 0x10ec0285:
> -- 
> 2.34.1
> 
