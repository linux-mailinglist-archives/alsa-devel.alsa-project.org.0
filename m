Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96751823DFF
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 09:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29A2DE8C;
	Thu,  4 Jan 2024 09:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29A2DE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704358677;
	bh=FDRlniXLhBKQ4dWdSFLJMStfRpTil8cTfufooUasPYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KCdSHbgGOZV5/mFpSX3Pkwr7KOtTsGZ8WRHAxAkBwWjTlt8T2l/kdTp33M1ZXWXVX
	 mNUFrIUeCVsLNPDPwz8iOJHl3Wht6z7sgdTWzsUXr3X3o9AUOUlRlJgA2s6U0Qe2yT
	 RtYRz1v8dgsUh2h2h5rNYpqQ34+qzMIG0yjek3Jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D048F805C9; Thu,  4 Jan 2024 09:57:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD02FF805AB;
	Thu,  4 Jan 2024 09:57:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AEB4F804B0; Thu,  4 Jan 2024 09:53:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6408F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 09:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6408F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g4VS069V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tNASG+Xn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=g4VS069V;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tNASG+Xn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D732B21E73;
	Thu,  4 Jan 2024 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704358433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39ivw71LqUS21AHzk6npVIxoB2Wru0TEY3ULbKRTSa0=;
	b=g4VS069VZjAwJqiX2Ro9RdUaWFLIIAo0xPX3CxGDoAMsDURUh3duIBjggma4lc7LwZIVLx
	32q7lDm3eSjwcRRGVYosxNOSE7Wmi51L/M7uOpKNzePY6oXV0/iwrKZj1I+cHHfBNJkvOa
	bHUv28PCvSfQl6odSMFZdaDHfQVq86k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704358433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39ivw71LqUS21AHzk6npVIxoB2Wru0TEY3ULbKRTSa0=;
	b=tNASG+XnkFV47RY/uSYc/EJHVsnIcbrmpbgwUzxytalcaM6Uluaa5wM9t9VdvYqYKQcUJe
	KaoZoYZSQcTLyvDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704358433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39ivw71LqUS21AHzk6npVIxoB2Wru0TEY3ULbKRTSa0=;
	b=g4VS069VZjAwJqiX2Ro9RdUaWFLIIAo0xPX3CxGDoAMsDURUh3duIBjggma4lc7LwZIVLx
	32q7lDm3eSjwcRRGVYosxNOSE7Wmi51L/M7uOpKNzePY6oXV0/iwrKZj1I+cHHfBNJkvOa
	bHUv28PCvSfQl6odSMFZdaDHfQVq86k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704358433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39ivw71LqUS21AHzk6npVIxoB2Wru0TEY3ULbKRTSa0=;
	b=tNASG+XnkFV47RY/uSYc/EJHVsnIcbrmpbgwUzxytalcaM6Uluaa5wM9t9VdvYqYKQcUJe
	KaoZoYZSQcTLyvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6BAE13722;
	Thu,  4 Jan 2024 08:53:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IStHKyFylmU0VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jan 2024 08:53:53 +0000
Date: Thu, 04 Jan 2024 09:53:53 +0100
Message-ID: <87h6jta38e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.7-rc8
In-Reply-To: <1f43da7b8c6e4c8cdc04b7e67838f258.broonie@kernel.org>
References: <1f43da7b8c6e4c8cdc04b7e67838f258.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.15 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[60.09%]
Message-ID-Hash: URKHIM5VHOYTZINILO4TYK5YMBWDCZHE
X-Message-ID-Hash: URKHIM5VHOYTZINILO4TYK5YMBWDCZHE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URKHIM5VHOYTZINILO4TYK5YMBWDCZHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jan 2024 21:29:50 +0100,
Mark Brown wrote:
> 
> The following changes since commit 8f0f01647550daf9cd8752c1656dcb0136d79ce1:
> 
>   ASoC: fsl_sai: Fix channel swap issue on i.MX8MP (2023-12-19 13:23:39 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-rc8
> 
> for you to fetch changes up to b036d8ef3120b996751495ce25994eea58032a98:
> 
>   ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux (2024-01-03 18:37:02 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.7
> 
> I recently got a LibreTech Sapphire board for my CI and while
> integrating it found and fixed some issues, including crashes for the
> enum validation.  There's also a couple of patches adding quirks for
> another x86 laptop from Hans and an error handling fix for the Freescale
> rpmsg driver.

Pulled now.  Thanks.


Takashi
