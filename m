Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5F916A43
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 16:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BEEAE8;
	Tue, 25 Jun 2024 16:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BEEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719325614;
	bh=m6PWOWp/hNkt3iN22+iRD/P4J010HMxBMpdZByi81YM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cy9I1ks0FHxLF1Ofhd3oZnwa+XYAJPpFSDu8WSsNSvg6Rg4XPq3lDAWBFZD/MVkni
	 Kbw0caFcrtInOVdZkqlyYUQ6FIZ263IIuBdESettvFt8sEoCgPm+R4FR1A4k5pZQF4
	 pnfNAS88qkjANfZXJqX8ciyRyEYChbAyoJNvKKHY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD063F805B1; Tue, 25 Jun 2024 16:26:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFDDF805B2;
	Tue, 25 Jun 2024 16:26:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7ACEF804D6; Tue, 25 Jun 2024 16:26:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFF10F80423
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF10F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=118XsX4c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5x0tBgGB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=118XsX4c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5x0tBgGB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F41241F88B;
	Tue, 25 Jun 2024 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719325554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/zhzKQU/pPdoICo/ozlTnhxdzCab8RfWqCotEqhN9A=;
	b=118XsX4cUv5qk7X5aWXsBfHPVGoPwUTUVsKIlDjzmDt3XwP88Pa8JcBlc5A3dGziaj+j6U
	0eSK/wRHBpiqgI6LmvVPcgkEWuzvXsHCr70E0OOXkae4n3PrSkbxjgKSym1Li7WreSVtIj
	6NLcdWwwXJp6YJa93cZYbK0UUKZWv+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719325554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/zhzKQU/pPdoICo/ozlTnhxdzCab8RfWqCotEqhN9A=;
	b=5x0tBgGBedVEaWjkEfLNW8O5i7KvLOG4jN4jX9mV6d1NfaYUB6clNU2a73IbQF72NpQgXO
	t/Q3LJAEcfpxsOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719325554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/zhzKQU/pPdoICo/ozlTnhxdzCab8RfWqCotEqhN9A=;
	b=118XsX4cUv5qk7X5aWXsBfHPVGoPwUTUVsKIlDjzmDt3XwP88Pa8JcBlc5A3dGziaj+j6U
	0eSK/wRHBpiqgI6LmvVPcgkEWuzvXsHCr70E0OOXkae4n3PrSkbxjgKSym1Li7WreSVtIj
	6NLcdWwwXJp6YJa93cZYbK0UUKZWv+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719325554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/zhzKQU/pPdoICo/ozlTnhxdzCab8RfWqCotEqhN9A=;
	b=5x0tBgGBedVEaWjkEfLNW8O5i7KvLOG4jN4jX9mV6d1NfaYUB6clNU2a73IbQF72NpQgXO
	t/Q3LJAEcfpxsOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF8F31384C;
	Tue, 25 Jun 2024 14:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1qomLnHTembfKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Jun 2024 14:25:53 +0000
Date: Tue, 25 Jun 2024 16:26:21 +0200
Message-ID: <87msn9ksj6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rauty <rautyrauty@gmail.com>
Cc: wzhd@ustc.edu,
	Gergo Koteles <soyer@irl.hu>,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	simont@opensource.cirrus.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
In-Reply-To: 
 <CAGpJQTGR5WKuHUFGFUC286TUkOXYgcqigZRDb4K5deyE9uuz8w@mail.gmail.com>
References: <20240615125457.167844-1-rauty@altlinux.org>
	<2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
	<CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
	<CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
	<c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
	<871q4lm9dp.wl-tiwai@suse.de>
	<CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
	<87tthhktdz.wl-tiwai@suse.de>
	<87sex1kt6t.wl-tiwai@suse.de>
	<CAGpJQTGR5WKuHUFGFUC286TUkOXYgcqigZRDb4K5deyE9uuz8w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[suse.de:email,alsa-info.sh:url,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,alsa-info.sh:url,alsa-project.org:url,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: VFMVPJJU36CNZMNFMAY6BVC3PM56RI5W
X-Message-ID-Hash: VFMVPJJU36CNZMNFMAY6BVC3PM56RI5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFMVPJJU36CNZMNFMAY6BVC3PM56RI5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 16:16:56 +0200,
Rauty wrote:
> 
> On Tue, 25 Jun 2024 at 17:11, Takashi Iwai <tiwai@suse.de> wrote:
> > Zihao, do you still have the access to this machine?
> > If yes, could you give alsa-info.sh output, or a proc file output?
> 
> He sent it to me:
> https://alsa-project.org/db/?f=268601dbdb76f9a4c18d71e210091ffed4bf2818

Great.  Could you also give the one for IdeaPad 330?


thanks,

Takashi
