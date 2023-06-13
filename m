Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5A72D98F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 07:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED826C1;
	Tue, 13 Jun 2023 07:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED826C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686635570;
	bh=x4lwiCSvl3482aexKrUCYzQUlWVdul4GcFmhyK7U2po=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+D/g+314j7dXiIhpL9Zt81DE7kEiZVooP9Ak6LbIlYSdYUJ8q5zAINU9PELwXAUv
	 qbPYqMAqUZt8IGeh/akCzKym6zo4zqdsMcr3D+cJoHZ1iu7wFdRtYnm98JNM12VvrJ
	 Mc+KNymJ+aYzMZrHNdN2942XmAfuFhjTO3zUQz8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC0DF8052E; Tue, 13 Jun 2023 07:51:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 853B1F80132;
	Tue, 13 Jun 2023 07:51:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8518F80155; Tue, 13 Jun 2023 07:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 966DDF80132
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 07:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966DDF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rRoteub6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vGqQjjjz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 646171FD69;
	Tue, 13 Jun 2023 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686635370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKwIAx5KmC76gpFXoF6PzbILn6Eb+dYp5IrAZGdQslM=;
	b=rRoteub6zYBeh1vsBSNQapb5khDFt1f5FcXUHVLUgng09R/ETp2sxyQUhG1Txji0N8Iufl
	2DYKF2031ndkHGCw6B6LJPHRTOhrP+poK2gi5ZaKOxWV7/1ZuMBRIDm0Yj1KguccjSJk/9
	fC7tgJSyx0nslWFOxyMDuE9sLEFOy68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686635370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKwIAx5KmC76gpFXoF6PzbILn6Eb+dYp5IrAZGdQslM=;
	b=vGqQjjjzeIzo4y/cHRuNIY4sIpy7169gLloI84bLe5fIXAqK4S4YgEJMYe+VeYqfiMjovt
	7xgULW4cZu6AajBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4296513345;
	Tue, 13 Jun 2023 05:49:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id m5A2D2oDiGQFaAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 05:49:30 +0000
Date: Tue, 13 Jun 2023 07:49:29 +0200
Message-ID: <87pm5zlxna.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 0/9] ALSA: emu10k1: improvements related to the switchable
 word clock of E-MU cards
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SDZDDGBWOTQAMJACOQDAGEF73GBSYXYB
X-Message-ID-Hash: SDZDDGBWOTQAMJACOQDAGEF73GBSYXYB
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDZDDGBWOTQAMJACOQDAGEF73GBSYXYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Jun 2023 21:13:16 +0200,
Oswald Buddenhagen wrote:
> 
> 
> Oswald Buddenhagen (9):
>   ALSA: emu10k1: split off E-MU fallback clock from clock source
>   ALSA: emu10k1: make available E-MU clock sources card-specific
>   ALSA: emu10k1: query rate of external clock sources on E-MU cards
>   ALSA: emu10k1: fix sample rates for E-MU cards at 44.1 kHz word clock
>   ALSA: emu10k1: fix synthesizer pitch for E-MU cards at 44.1 kHz
>   ALSA: timer: minimize open-coded access to hw.resolution
>   ALSA: emu10k1: fix timer for E-MU cards at 44.1 kHz word clock
>   ALSA: emu10k1: add support for 12 kHz capture on Audigy
>   ALSA: emu10k1: actually show some S/PDIF status in /proc for E-MU
>     cards

Applied all patches now.  Thanks.


Takashi
