Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E383AB18
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 14:44:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84913741;
	Wed, 24 Jan 2024 14:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84913741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706103876;
	bh=vMtRdSXgt7L8bMsRDxC0blHzjN8Dvs+MLmFOLF3aUE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cbaLwhnX4ZDdirBsx+JfCizBlGXWBH9+jMXDxzlF3c5bNLe0v+H2Xowa+ns1I1WA0
	 Sz31fqPEKNpHxInyvdkFrgh76GkEcj5CYAAWu0hl+vN8HIKu/80P84Rh2RZg9lpmGn
	 xw1zGPxnLVzik2k+PMlwIHSiOuE/S16fuewpndmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0919BF802BE; Wed, 24 Jan 2024 14:44:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52454F8022B;
	Wed, 24 Jan 2024 14:44:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9CA7F8028D; Wed, 24 Jan 2024 14:44:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D0E0F804F1
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 14:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0E0F804F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P2OicQ8p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RCi9SLJT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=WNFwW3T4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LdfouFrw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D92B01FD64;
	Wed, 24 Jan 2024 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ws3ePQym3fkrskSLqJwcWIdMaVWU/CiRF9N+1vjYBSo=;
	b=P2OicQ8pGSacpqLm7iUQG2B5vy3P1/l/MrDvKZcJRNY37GObzFmMJNaX/WzlafZGKMWfG+
	yKj8JYkOvdF1qehGfymALMWn1oJIQIHxJafby9kt0YQp5r/Skfp2Sh/H1yF6SWQz1UnOg6
	wwNKiZ+8srHeBQzFZ+4qZ/RuwzXolBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ws3ePQym3fkrskSLqJwcWIdMaVWU/CiRF9N+1vjYBSo=;
	b=RCi9SLJTxFtGi5sXX7JpxOq4DwrH/icBnW5ZhSEPWWQ/m0wX4UQKb2LpdP/16LRuH+kN85
	Fqc/WdPAdE1X2nCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ws3ePQym3fkrskSLqJwcWIdMaVWU/CiRF9N+1vjYBSo=;
	b=WNFwW3T4Erffs21hWG/t4hUxa+X71N58pWGz77On+c9oVDe4tFNsL7fREuxt0JO+Hl4p2U
	WoeNsO+6ua1IbNWAq2SnsL7/VMjpTanGyvY5UWLPoEK2uYJ1s67++Z7TyTzeQ3q9fSyur2
	nEVK8kk4loaoZpouqVM+MDnkTIaspbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ws3ePQym3fkrskSLqJwcWIdMaVWU/CiRF9N+1vjYBSo=;
	b=LdfouFrwy/9nZX25I4wD7TEfabsZc/sJ0wNTGck81gSokJZUOiGmFW62VMg4s6oY+kO1lo
	YYyUe7vC0GRU0yCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8190E13786;
	Wed, 24 Jan 2024 13:43:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id INk1HhMUsWVJSwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Jan 2024 13:43:47 +0000
Date: Wed, 24 Jan 2024 14:43:47 +0100
Message-ID: <87plxqlucs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<soyer@irl.hu>,
	<shenghao-ding@ti.com>,
	<perex@perex.cz>,
	<linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ALSA: hda: Move component binding support into
 separate library
In-Reply-To: <20240124112607.77614-1-rf@opensource.cirrus.com>
References: <20240124112607.77614-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WNFwW3T4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LdfouFrw
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.89)[94.41%]
X-Rspamd-Queue-Id: D92B01FD64
Message-ID-Hash: BPTTGOKTXCB5P3EHAUE6J74VQYGTNSGO
X-Message-ID-Hash: BPTTGOKTXCB5P3EHAUE6J74VQYGTNSGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPTTGOKTXCB5P3EHAUE6J74VQYGTNSGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 12:26:05 +0100,
Richard Fitzgerald wrote:
> 
> The Cirrus Logic amplifiers are currently paired with Realtek HDA codecs.
> But they could be used with other codecs. To prepare for this, these two
> patches move the manager side of the component binding out of the Realtek
> driver into a library module.
> 
> The first patch tweaks the CS35L41 code so that it is not hardcoded to
> CS35L41, and changes the TAS2781 handling so that it re-uses that code
> instead of having a near-identical copy of it.
> 
> Can someone please test that these two patches don't break TAS2781?
> I have checked that they should work in theory but I don't have hardware
> to test on.
> 
> Richard Fitzgerald (2):
>   ALSA: hda: realtek: Re-work CS35L41 fixups to re-use for other amps
>   ALSA: hda: realtek: Move hda_component implementation to module

Through a quick glance, it looks good.
I'll wait for the verification for TAS codec for a while.


thanks,

Takashi
