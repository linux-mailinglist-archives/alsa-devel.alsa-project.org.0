Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2938591C7
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 19:36:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC6A84A;
	Sat, 17 Feb 2024 19:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC6A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708194955;
	bh=JZmENFr1/E49tYj8nITnU3QnMwuNKMj08cRzSpfOLcw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ccQFzc5wSLbyksDlaksWXErEn/Z8lkMZUDMDc0zySZE3GgsD980TEw/ej8ArJhtr1
	 4/GmFjaMOtofsm4ZhWQp5dcsWCehY0pC0rHvUEN3XB7yv+M5+ZbFCu+MGoltTbie7Y
	 OcITndQR/NNNm1k5JOeA8uLZi+dbMFIE5z/svCRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB7C4F80578; Sat, 17 Feb 2024 19:35:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B30F80578;
	Sat, 17 Feb 2024 19:35:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2778F80238; Sat, 17 Feb 2024 19:35:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A257CF800BF
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 19:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A257CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GqVrhd4n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cYMmScP8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GqVrhd4n;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cYMmScP8
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9A8621FF9;
	Sat, 17 Feb 2024 18:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708194898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCpnJvjlWwU46xbEg8kPZwPBFVx75dBdkJOjoJNk6a0=;
	b=GqVrhd4nJPq080UQ9K4v7hTjmxmyz4IYpjGr3yrugYU+gawsbsQt2O5bl9fNvPvmiyJoxw
	JHNSd883bNeCP+rWmsIV50G1dbGCcQ+qjc2H8Ax2UYxj+GdAs+aua1Lrh8IOdRyK1y/C1v
	ynCCVLOruMdUftbD36EaZ3kPFrO6/Rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708194898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCpnJvjlWwU46xbEg8kPZwPBFVx75dBdkJOjoJNk6a0=;
	b=cYMmScP8qgCxRqPYb9aXx4J/hu042iqRdMikfbW/PjJcGjFxaKTscdD/3HFujo3qpdmM69
	ExVd+AG07VmJAuBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708194898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCpnJvjlWwU46xbEg8kPZwPBFVx75dBdkJOjoJNk6a0=;
	b=GqVrhd4nJPq080UQ9K4v7hTjmxmyz4IYpjGr3yrugYU+gawsbsQt2O5bl9fNvPvmiyJoxw
	JHNSd883bNeCP+rWmsIV50G1dbGCcQ+qjc2H8Ax2UYxj+GdAs+aua1Lrh8IOdRyK1y/C1v
	ynCCVLOruMdUftbD36EaZ3kPFrO6/Rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708194898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCpnJvjlWwU46xbEg8kPZwPBFVx75dBdkJOjoJNk6a0=;
	b=cYMmScP8qgCxRqPYb9aXx4J/hu042iqRdMikfbW/PjJcGjFxaKTscdD/3HFujo3qpdmM69
	ExVd+AG07VmJAuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 603BE1370C;
	Sat, 17 Feb 2024 18:34:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Cw8YFVL80GUadwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Feb 2024 18:34:58 +0000
Date: Sat, 17 Feb 2024 19:34:57 +0100
Message-ID: <87msrzos6m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	stable@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
In-Reply-To: <ZdDXJyXiZ++KiNqW@finisterre.sirena.org.uk>
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
	<7a0cd63f-8a83-4dc5-8763-63dcdae8d68a@leemhuis.info>
	<878r3qxcyr.wl-tiwai@suse.de>
	<871q9hwz2w.wl-tiwai@suse.de>
	<ZdDXJyXiZ++KiNqW@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.11 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.01)[95.09%]
Message-ID-Hash: 4OLKVTIS7NKIQ7FKRBV4535OYHH3CKV6
X-Message-ID-Hash: 4OLKVTIS7NKIQ7FKRBV4535OYHH3CKV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OLKVTIS7NKIQ7FKRBV4535OYHH3CKV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 17 Feb 2024 16:56:23 +0100,
Mark Brown wrote:
> 
> On Mon, Feb 12, 2024 at 03:12:55PM +0100, Takashi Iwai wrote:
> > Takashi Iwai wrote:
> 
> > > Interestingly, the system seems working with 6.8-rc3, so some piece
> > > might be missing.  Or simply reverting this patch should fix.
> 
> > In the bugzilla entry, the reporter confirmed that the revert of the
> > commit 4b6986b170f2f2 fixed the problem.
> 
> Any news on a patch for this?  Venkata?

It was already reverted in 6.7.5, as there was no further follow up.


thanks,

Takashi
