Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562A85F3FD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 10:08:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D849F6;
	Thu, 22 Feb 2024 10:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D849F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708592910;
	bh=caYL7S46dYbJ6MqUJ5Tc6qr0ttAat8UQ2n9Kka7dr9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nfFyCrZH6DSyWs7I6XmSTHwVMxrhcBlhYxJOIEEvDPeqzwtg+sqzzXuKDbwxNBHYu
	 HjdbH8Y7rD8lWq6hyK4t8PI3BGhyNoNHsiOyWQCiIDy9X+cW6ums6Z1svcAud7IDUo
	 HWrzdCN3iypd3rHmOY6/99Iv5gcusSKONaqLxooM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38467F805A9; Thu, 22 Feb 2024 10:07:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E36DF800EE;
	Thu, 22 Feb 2024 10:07:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E17B9F80496; Thu, 22 Feb 2024 10:06:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31B6CF800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 10:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B6CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Eca0GC5V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bFnCNCQ7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tCUqd8XN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fv9U37kA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3695E21EFD;
	Thu, 22 Feb 2024 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708592628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8L9bOwG2ZDrSZaGMetmK5ju/fKbbJC2wUSyS9V4gboA=;
	b=Eca0GC5VPb1qUv9WB1IB6EAJXLGHBpZUeOhJjB5MbOGR2U65vjSeF+lPH3YiqBeDWrGoEe
	nDohVyqrxb2tkgIZR4fu3gEkFSy8RP1exkP/pAsQO+DjFoRbqkDD4zepUEBQBPlRAoUr+F
	tiEAVyY/SBtqfBir2CiaydD2IzjkNgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708592628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8L9bOwG2ZDrSZaGMetmK5ju/fKbbJC2wUSyS9V4gboA=;
	b=bFnCNCQ7qm3NvERNTMarl6a3DV2wrapjsMBDv03C0HJkwTbOcpDL6yvTBjgnXr3CD7TnAl
	vm6sAcAQMr0FLwDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708592627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8L9bOwG2ZDrSZaGMetmK5ju/fKbbJC2wUSyS9V4gboA=;
	b=tCUqd8XNncgdI1e1LV+SRSI14KQE/Hcx4SCkK6Qzo1Aqj824jRmAbfWbatOk7PPjKKuj/X
	xfJGx59oUgay355aYdmRIE6KZg4WEZHQ1jM4di8s/+gFEFY5FS4SN8cOCfvufLRtUyiidB
	2Wdy/6GalkjC1trNqmq1Ls8E3V1w3tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708592627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8L9bOwG2ZDrSZaGMetmK5ju/fKbbJC2wUSyS9V4gboA=;
	b=fv9U37kAC8DYAkRpS2il8MNAl84KV7tsf+VFrnPgB/Ol4DwO79H31iRjPKhHJ5h+tb10XI
	EJCSu9CJbVSU5dCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9D4313A8C;
	Thu, 22 Feb 2024 09:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r2ghN/IN12XNeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 09:03:46 +0000
Date: Thu, 22 Feb 2024 10:03:46 +0100
Message-ID: <87ttm06fbh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/9] ALSA: cs35l56: Apply calibration from EFI
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tCUqd8XN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fv9U37kA
X-Spamd-Result: default: False [-0.60 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.29)[74.58%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3695E21EFD
X-Spamd-Bar: /
Message-ID-Hash: VVBCS6SZS52PBO7GFCURRWMCW2ITMO6M
X-Message-ID-Hash: VVBCS6SZS52PBO7GFCURRWMCW2ITMO6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVBCS6SZS52PBO7GFCURRWMCW2ITMO6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 16:04:58 +0100,
Richard Fitzgerald wrote:
> 
> Factory calibration of the speakers stores the calibration information
> into an EFI variable.
> 
> This set of patches adds support for applying speaker calibration
> data from that EFI variable.
> 
> Patch #1 and #2 are bugfixes that are prerequisites.
> 
> The HDA patches #7 and #8 depend on the ASoC patches.
> 
> Patch #9 is a KUnit test for the new cs-amp-lib library.
> 
> Richard Fitzgerald (8):
>   ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
>   ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
>   ASoC: cs-amp-lib: Add helpers for factory calibration data
>   ASoC: cs35l56: Add helper functions for amp calibration
>   ASoC: cs35l56: Apply amp calibration from EFI data
>   ALSA: hda: hda_cs_dsp_ctl: Add helper function to write calibration
>   ALSA: hda: cs35l56: Apply amp calibration from EFI data
>   ASoC: cs-amp-lib: Add KUnit test for calibration helpers
> 
> Simon Trimmer (1):
>   ALSA: hda: hda_cs_dsp_ctl: Only call notify when a control has been
>     added to a card

I guess it's better to be merged through ASoC tree.
Feel free to my review tag

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
