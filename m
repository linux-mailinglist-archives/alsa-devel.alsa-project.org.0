Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A351C7531B2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 08:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64BA4A4B;
	Fri, 14 Jul 2023 08:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64BA4A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689314644;
	bh=2qWyWGPbIWrX6puIuEArJClQcnwNbbdXXXmZULl9Ws0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jSV5jxOrnkIgcptVjuivWevAps+p21bIRBUp3iE8toOxeOK1GA7rptMLAmXeHqHTd
	 r/a2kAHrfUY6Y2aeBbpYSc2kAnRIqEsR8Whn0i/kJqmuCbMOwPyi68Cn2aS+rcbLn5
	 Fox6fpyw2RIY4Y8Jr8LUoP+ved0WTlBIphNPzACc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 628B8F80290; Fri, 14 Jul 2023 08:03:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 308BFF80236;
	Fri, 14 Jul 2023 08:03:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C952F80249; Fri, 14 Jul 2023 07:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6A92F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 07:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A92F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0IHJHvUe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4iJK7mxr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0629D22132;
	Fri, 14 Jul 2023 05:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689314330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gu0FFJ+R4gobXXT6CHnm0hg9iiaJzUc3BBW1Fq5ptXU=;
	b=0IHJHvUenq+o6mL8jmP9Yesrk5AwmykOqBSoNnb5VlWHeeX3/uZlMIFjf02CfkU6t8MfuZ
	RSKa0p1GJYCgEdHQgQhw4A5zssreTZqy5MLOde7ECBA4VpDbIPkHBUk3eRLhUeSl8Bj6g4
	96xOSb0P8AAelUpBt/J9/sjm9ILZpEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689314330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gu0FFJ+R4gobXXT6CHnm0hg9iiaJzUc3BBW1Fq5ptXU=;
	b=4iJK7mxrI55wWKz6WYwdhnUmDIrcSgxJx5pnfNuw2z97fyh4tvW16JT2GgVQPFkuQgv04/
	UgaZyGrZp9b4ckBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C79BF13A15;
	Fri, 14 Jul 2023 05:58:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id F4rULxnksGRfDgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 14 Jul 2023 05:58:49 +0000
Date: Fri, 14 Jul 2023 07:58:49 +0200
Message-ID: <878rbjdofa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <1f83caa215ad4374aec8859c70044b00@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>
	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>
	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
	<87353kd8b9.wl-tiwai@suse.de>
	<1170325957764b4cbd7cd3639575f285@realtek.com>
	<CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
	<873536js7q.wl-tiwai@suse.de>
	<CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
	<2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
	<CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
	<485f99149508488080d563144454040e@realtek.com>
	<CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
	<2831c55638a5431ca9e37d9caf365ed2@realtek.com>
	<CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
	<3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
	<CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com>
	<87h6rhcef2.wl-tiwai@suse.de>
	<0990300d759846d890de9c92fcad9a9d@realtek.com>
	<CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
	<878rctcavz.wl-tiwai@suse.de>
	<874jnhc9u4.wl-tiwai@suse.de>
	<CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
	<875y7vbxpg.wl-tiwai@suse.de>
	<CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
	<87wn0aa1s4.wl-tiwai@suse.de>
	<CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
	<87leg7x4h7.wl-tiwai@suse.de>
	<f4969213b5a14cc5a11befb4df861481@realtek.com>
	<87cz182hfk.wl-tiwai@suse.de>
	<4678992299664babac4403d9978e7ba7@realtek.com>
	<CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
	<1f83caa215ad4374aec8859c70044b00@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QQADO6ORHV4GMQ5SJSXNE6EJJ3AF2Q25
X-Message-ID-Hash: QQADO6ORHV4GMQ5SJSXNE6EJJ3AF2Q25
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQADO6ORHV4GMQ5SJSXNE6EJJ3AF2Q25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jul 2023 04:46:25 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Could you agree this workaround?

Yes, looks fine.  I applied it now.

Thanks!

Takashi

> 
> BR,
> Kailang
> 
> > -----Original Message-----
> > From: Joseph C. Sible <josephcsible@gmail.com>
> > Sent: Friday, July 14, 2023 9:11 AM
> > To: Kailang <kailang@realtek.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; Bagas Sanjaya <bagasdotme@gmail.com>;
> > regressions@lists.linux.dev; perex@perex.cz; tiwai@suse.com;
> > alsa-devel@alsa-project.org
> > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > 15z-fc000 on warm boot
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Thu, Jul 13, 2023 at 4:25 AM Kailang <kailang@realtek.com> wrote:
> > >
> > > Hi Joseph,
> > >
> > > Could you test attach patch?
> > >
> > > BR,
> > > Kailang
> > 
> > I applied that patch on top of kernel 6.4.3 and tested it, and yes, it does fix the
> > problem.
> > 
> > Thanks,
> > 
> > Joseph C. Sible
> > 
> > ------Please consider the environment before printing this e-mail.
> 
