Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE2746C43
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F84E210;
	Tue,  4 Jul 2023 10:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F84E210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688460412;
	bh=ZNHPfcOuFLYSkDzPKfAXJyMILRvSIzYR5RXcNKB6cWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hBB8bIKLsrR5NSEjRD8jWxyy5JNSZ8CGlVZSwybkuWCWprP2fa493Y9DBPcBKasNM
	 j6hIeS34ocM78vtqt3nSlgBbxik2sQWntoLj/JeyYo6PixRPXmH6rUChyHyhPbtqXX
	 KP2y1VahMhe1ZUPC9xvBVwoZV404JLSQJKLqjlCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A09BF80124; Tue,  4 Jul 2023 10:46:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18DB9F80124;
	Tue,  4 Jul 2023 10:46:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E7E9F80125; Tue,  4 Jul 2023 10:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91DF0F80093
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91DF0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Rs2lBXkz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TQ8RRbED
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E36F92205A;
	Tue,  4 Jul 2023 08:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688460351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+/1M9IITV295Htp9Oc2MVJuPU/3zRIiUJmFmSJnoFc=;
	b=Rs2lBXkzfMcbbREZPNzL4jttuspe0ClzXfxKVwbsU4Biim4ZmW6ePj8aOPHu9RrWG6uKC8
	Akf6350dM+FJ8VRTLjVVtbgGFHD3sHkMyr/RDJtFLqp5JN3/8ZlMJafbq/7HDtjymmFDa/
	P2+LTa9v4noS6miWnlsqTyuWZXpYbeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688460351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+/1M9IITV295Htp9Oc2MVJuPU/3zRIiUJmFmSJnoFc=;
	b=TQ8RRbEDbxfyqElLN2cR+3XnrBVMOUZwqBBCZmG0SZhUd+3YZyrJqgcrZinY9Bsifobd9Q
	x8ZHePHCvb74irDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD0E1133F7;
	Tue,  4 Jul 2023 08:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id q3ycKD/co2RONwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 04 Jul 2023 08:45:51 +0000
Date: Tue, 04 Jul 2023 10:45:51 +0200
Message-ID: <87cz182hfk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <f4969213b5a14cc5a11befb4df861481@realtek.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MT26TDFJ264WHS4LBIQJQVLA23HXKVXB
X-Message-ID-Hash: MT26TDFJ264WHS4LBIQJQVLA23HXKVXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MT26TDFJ264WHS4LBIQJQVLA23HXKVXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Jul 2023 10:38:43 +0200,
Kailang wrote:
> 
> 
> Below was the relation patches.
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=5aec98913095ed3b4424ed6c5fdeb6964e9734da
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=f30741cded62f87bb4b1cc58bc627f076abcaba8
> 
> It shows ALC236 codec not need to run pull low 3k setting.
> 
> I trace windows code, find it add delay for read MIC jack detected at booting time.

I expected something like that ;)
If you have a test patch, let us know.


thanks,

Takashi

> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Sunday, June 25, 2023 5:43 PM
> > To: Joseph C. Sible <josephcsible@gmail.com>
> > Cc: Kailang <kailang@realtek.com>; Bagas Sanjaya <bagasdotme@gmail.com>;
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
> > On Sat, 24 Jun 2023 03:36:11 +0200,
> > Joseph C. Sible wrote:
> > >
> > > On Sun, Jun 11, 2023 at 3:36 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > Thanks for checking.  So the additional delay didn't help at all,
> > > > i.e. it's no timing issue.  We need to figure out which verb
> > > > actually breaks things.  Oh well.
> > >
> > > Was there something else specific you wanted me to try for this? If
> > > not, what do you think the next steps to get this fixed are? Do you
> > > think it might be good to just cook the partial revert I posted a
> > > while back after all?
> > 
> > It's rather a call to Kailang, after all.
> > I'm fine with any way as long as it avoids further regressions.
> > 
> > 
> > Takashi
> > 
> > ------Please consider the environment before printing this e-mail.
