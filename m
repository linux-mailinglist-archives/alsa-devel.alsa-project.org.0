Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7C978ECD
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2024 09:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66933E72;
	Sat, 14 Sep 2024 09:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66933E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726298029;
	bh=AbJMIeZvCoTsVK9qocj7reLzTp2czyRmXtuPeNASTAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oRNdPg9NaTIuU/WJYjP+zzSgYxsuqoehVwU2GvtaWHuDPQl0FSnRO1vHM6KKNbnDr
	 lSt6CaVWiGYXrLvTvgi6O58TcfNVA7uDd5VacPnrQ+nPk9g/hvyn2i4NlEPWKX1uMm
	 KgBdNbM14o1ZoC1sx/Pxp8PUGGLBIDYF1ZZ/8QVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 636FAF805C6; Sat, 14 Sep 2024 09:13:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9554F805C9;
	Sat, 14 Sep 2024 09:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 714B8F805A0; Sat, 14 Sep 2024 09:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01F1BF8019B
	for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2024 09:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F1BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tv3C+DCQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=H94YRj/Q;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tv3C+DCQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=H94YRj/Q
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B1181F78C;
	Sat, 14 Sep 2024 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726297996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XyF/p4OQp/CEEyz03H9A6FeGUxQMs2BNXVhZR4dIFU=;
	b=tv3C+DCQUXBnywB0qDTG6TFmZDNamXOYU1nZLBG1HY1uvTHToosWl81TOOIj5lcApJDNDf
	KjFdkQNRRnmWneAlZcGiN2X5o0VFabYu0PZm3IjgpegteKiXTvY984fbGDKEXwWltBXGox
	MhIqj2RHn1/m8ighSXXCSLwVpO/NBF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726297996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XyF/p4OQp/CEEyz03H9A6FeGUxQMs2BNXVhZR4dIFU=;
	b=H94YRj/Q74F+axeEinoKZOR8pCEfEGrKOisKOX3wBZlrE7s+PM0dAOOKl6yIP2ilwcI+wt
	J1vbMQlOaKFVIxDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tv3C+DCQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="H94YRj/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726297996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XyF/p4OQp/CEEyz03H9A6FeGUxQMs2BNXVhZR4dIFU=;
	b=tv3C+DCQUXBnywB0qDTG6TFmZDNamXOYU1nZLBG1HY1uvTHToosWl81TOOIj5lcApJDNDf
	KjFdkQNRRnmWneAlZcGiN2X5o0VFabYu0PZm3IjgpegteKiXTvY984fbGDKEXwWltBXGox
	MhIqj2RHn1/m8ighSXXCSLwVpO/NBF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726297996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1XyF/p4OQp/CEEyz03H9A6FeGUxQMs2BNXVhZR4dIFU=;
	b=H94YRj/Q74F+axeEinoKZOR8pCEfEGrKOisKOX3wBZlrE7s+PM0dAOOKl6yIP2ilwcI+wt
	J1vbMQlOaKFVIxDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C8A113A30;
	Sat, 14 Sep 2024 07:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4HJlFYw35WZWUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Sep 2024 07:13:16 +0000
Date: Sat, 14 Sep 2024 09:14:05 +0200
Message-ID: <87r09mbtc2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.12
In-Reply-To: <5bf63b66c653755954f3c69f115596df.broonie@kernel.org>
References: <5bf63b66c653755954f3c69f115596df.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7B1181F78C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: WVUL7OEGMC7OEBA73CPSUK3OBUHX47D2
X-Message-ID-Hash: WVUL7OEGMC7OEBA73CPSUK3OBUHX47D2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVUL7OEGMC7OEBA73CPSUK3OBUHX47D2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Sep 2024 22:42:17 +0200,
Mark Brown wrote:
> 
> The following changes since commit 839a4ec06f75cec8fec2cc5fc14e921d0c3f7369:
> 
>   ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict (2024-08-23 11:02:53 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.12
> 
> for you to fetch changes up to 2772ee6de6cf94e5f2a0c0ce6067d0796a4170ba:
> 
>   ASoC: topology: Fix redundant logical jump (2024-09-13 19:40:38 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.12
> 
> This is a very large set of changes, almost all in drivers rather than
> the core.  Even with the addition of several quite large drivers the
> overall diffstat is negative thanks to the removal of some old Intel
> board support which has been obsoleted by the AVS driver, helped a bit
> by some factoring out into helpers (especially around the Soundwire
> machine drivers for x86).
> 
> Highlights include:
> 
>  - More simplifications and cleanups throughout the subsystem from
>    Morimoto-san.
>  - Extensive cleanups and refactoring of the Soundwire drivers to make
>    better use of helpers.
>  - Removal of Intel machine support obsoleted by the AVS driver.
>  - Lots of DT schema conversions.
>  - Machine support for many AMD and Intel x86 platforms.
>  - Support for AMD ACP 7.1, Mediatek MT6367 and MT8365, Realtek RTL1320
>    SoundWire and rev C, and Texas Instruments TAS2563

Thanks, pulled now.


Takashi
