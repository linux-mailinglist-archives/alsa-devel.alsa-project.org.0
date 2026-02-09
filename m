Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJLCNVcXimmsGwAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Feb 2026 18:20:23 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB6112FDF
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Feb 2026 18:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613BB601F5;
	Mon,  9 Feb 2026 18:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613BB601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770657622;
	bh=nAZH3Jq0CQ4l2bgqW3TGLnrsFn4eEi9GxRCUAoAX2s8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQckPrpTMT2wXFW2pzMXcnnHAkHuo+qHs8BkVqI7mZP4QSmKoSgo/PbiEQuTVfK86
	 8VvaA8XWw6QtoPSNS8J4GemOJBL5ZVW75fgud7Sr1wTcimDpArs3bKXHxSsOpKIqkF
	 ugIGcudeCL+U5kKMbZ1kW3k/6BQOkIHzpcD0A3hE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CE35F805D9; Mon,  9 Feb 2026 18:19:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 398C1F805E8;
	Mon,  9 Feb 2026 18:19:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C48F80448; Mon,  9 Feb 2026 18:18:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E81BF800F3
	for <alsa-devel@alsa-project.org>; Mon,  9 Feb 2026 18:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E81BF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jyIWc5qr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=K6r/S2Mp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jyIWc5qr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=K6r/S2Mp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 141943E70A;
	Mon,  9 Feb 2026 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1770657504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntHyHahQGnVK8zyogowtebQlw92yjJMQD2aX116/bVo=;
	b=jyIWc5qrUrVryQB0EZeyjXGqqQDrw37+5g92YplKblMCy582e+rQResL/QoLhlppg9IUII
	SFtI1tW7NmuABS0F3/26hBUCJgCxU1bsLdDFzuo3LEgzjXDlgj8hqIV9S0AYHKUAtKvcXL
	AluB7DRTmkq9PLBUL96jFy4S7BW+yWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770657504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntHyHahQGnVK8zyogowtebQlw92yjJMQD2aX116/bVo=;
	b=K6r/S2Mp4K5EFNKUw6j+Vbe1CGNsWgtVOpN4JdyKLSSlU56f0LSeuNBoEhGW8TD6ZKzCrv
	pUKKeC4OEVA+T0Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jyIWc5qr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="K6r/S2Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1770657504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntHyHahQGnVK8zyogowtebQlw92yjJMQD2aX116/bVo=;
	b=jyIWc5qrUrVryQB0EZeyjXGqqQDrw37+5g92YplKblMCy582e+rQResL/QoLhlppg9IUII
	SFtI1tW7NmuABS0F3/26hBUCJgCxU1bsLdDFzuo3LEgzjXDlgj8hqIV9S0AYHKUAtKvcXL
	AluB7DRTmkq9PLBUL96jFy4S7BW+yWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770657504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntHyHahQGnVK8zyogowtebQlw92yjJMQD2aX116/bVo=;
	b=K6r/S2Mp4K5EFNKUw6j+Vbe1CGNsWgtVOpN4JdyKLSSlU56f0LSeuNBoEhGW8TD6ZKzCrv
	pUKKeC4OEVA+T0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D91CD3EA63;
	Mon,  9 Feb 2026 17:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Dr+MM98WimmTQwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 17:18:23 +0000
Date: Mon, 09 Feb 2026 18:18:23 +0100
Message-ID: <87wm0lzvhc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.20
In-Reply-To: <20260209162610.290911AC57EB@finisterre.sirena.org.uk>
References: <20260209162610.290911AC57EB@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SINK3TL3QADOI4HQ5QQ3XI5BF65SLPIW
X-Message-ID-Hash: SINK3TL3QADOI4HQ5QQ3XI5BF65SLPIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SINK3TL3QADOI4HQ5QQ3XI5BF65SLPIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 77EB6112FDF
X-Rspamd-Action: no action

On Mon, 09 Feb 2026 17:26:05 +0100,
Mark Brown wrote:
> 
> The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:
> 
>   Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.20
> 
> for you to fetch changes up to f8f774913b4b599169381073f6674e20976e5529:
> 
>   ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control (2026-02-09 12:27:28 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v7.0
> 
> This release is almost all abut driers, there's very little core work
> here, although some of that driver work is in more generic areas like
> SDCA and SOF:
> 
>  - Generic SDCA support for reporting jack events.
>  - Continuing platform support, cleanup and feature improements for the
>    AMD, Intel, Qualcomm and SOF code.
>  - Platform description improvements for the Cirrus drivers.
>  - Support for NXP i.MX952, Realtek RT1320 and RT5575, and Sophogo
>    CV1800B.
> 
> We also pulled in one small SPI API update and some more substantial
> regmap work (cache description improvements) for use in drivers.

Thanks, pulled now.


Takashi
