Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E48929BE
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Mar 2024 09:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60B8D2CA9;
	Sat, 30 Mar 2024 09:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60B8D2CA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711788300;
	bh=0yrqjuNnlfumpGwdRGoXq9Rorc75sw1LbVM5vR15tUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kkfWTFrN8EvV/UXw8xkf7ofQgsYo/R7vsOCqRi9mSWNBAuzL62yk715kSa7NwhK2u
	 b4d12BP5X5fY4BghLdE/FCjnazV5Z2WQKJkDGlh99189PtWD6qBIiR0TOwx6D/hB7a
	 GwST4OQj2+NgMR36VlmtJIaAgUX+dlaBSkpJnYL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F1D8F805B1; Sat, 30 Mar 2024 09:44:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9352F805D3;
	Sat, 30 Mar 2024 09:44:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D36F80570; Sat, 30 Mar 2024 09:40:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42367F80563
	for <alsa-devel@alsa-project.org>; Sat, 30 Mar 2024 09:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42367F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TEgOtIQ1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=c+kTOGDy
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D16A85D2D6;
	Sat, 30 Mar 2024 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711788027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NzIUrhYo1Cw3sQoKqYI3sYPX+W+/DiYB3PH1BSBVBeI=;
	b=TEgOtIQ1tUxkHmfRxUIzpjfCJ3C6lgskMHwHPy5ejZV6lNgdzDf1PyZIi9pZ5jp9T6BaNJ
	BcJ1//TjBNg4ZPJo1ZMyY88HgPotfT0KCZPhvMbSVw5R/Neyj1b4Zhk9fIMbjEVRkOPjzW
	YOQCXZbX4RTvyeI3WOrqwwx5k3+/62g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711788027;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NzIUrhYo1Cw3sQoKqYI3sYPX+W+/DiYB3PH1BSBVBeI=;
	b=c+kTOGDycv9C1pQlfnNWcLXNoxBpi+vwt2BmrSb1tly4iEilgURPqdeUCrZ3uC5oWZHihK
	KtnYWPp036IWKdAQ==
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F09613A90;
	Sat, 30 Mar 2024 08:40:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id xwYLIfvPB2b7bgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Sat, 30 Mar 2024 08:40:27 +0000
Date: Sat, 30 Mar 2024 09:40:30 +0100
Message-ID: <87o7awnmdd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ALSA: cirrus: Tidy up of firmware control read/write
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.60 / 50.00];
	BAYES_HAM(-1.30)[90.11%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: FHG22KSOACVF4IFJJ2V57OA2USMZKSBZ
X-Message-ID-Hash: FHG22KSOACVF4IFJJ2V57OA2USMZKSBZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHG22KSOACVF4IFJJ2V57OA2USMZKSBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 12:31:22 +0100,
Richard Fitzgerald wrote:
> 
> This set of patches factors out some repeated code to clean up
> firmware control read/write functions, and removes some redundant
> control notification code.
> 
> Simon Trimmer (5):
>   firmware: cs_dsp: Add locked wrappers for coeff read and write
>   ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
>   ALSA: hda: hda_cs_dsp_ctl: Use
>     cs_dsp_coeff_lock_and_[read|write]_ctrl()
>   ASoC: wm_adsp: Remove notification of driver write
>   ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write

The patch 4 doesn't look cleanly applicable to my tree.
Should it be applied via Mark's tree?


thanks,

Takashi
