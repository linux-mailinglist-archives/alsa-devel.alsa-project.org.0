Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDC893C1A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 16:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F4D22C9;
	Mon,  1 Apr 2024 16:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F4D22C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711981121;
	bh=5bt+hlfswKgZWdinasBXnLJeTnqNA1b1IaHxT+bgZSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=htktxfuPRivkeHZ8lwTURkWd2C1+3Ddbc30LyfJ2HmNYI+WgQEqHUNUGTB7zN5waQ
	 8Rjsx2WDbkihuzzMDCSTlPVCwCL7AGyHP200M1DGoV8R7R5YHuQMErclif18Zvbxm8
	 qHztY36Cd+FGo6VdVnW3ZpmZJDk4lpiPveU2XKRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7BC6F805A1; Mon,  1 Apr 2024 16:18:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3BAF80579;
	Mon,  1 Apr 2024 16:18:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EB6F80236; Mon,  1 Apr 2024 16:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79BDCF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 16:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79BDCF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=a2TtN43c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711981079; x=1712585879;
	i=oswald.buddenhagen@gmx.de;
	bh=5bt+hlfswKgZWdinasBXnLJeTnqNA1b1IaHxT+bgZSc=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=a2TtN43c0mwsMFPvRRnV/nuDQ5fjYG3nY+0YU1EardXh8T1ZKmfYHA+p9l50iyEd
	 GeNLdU+1Q69p8BhKxIR1nkToSe85wLChqR5nJ8QhaTUdndiNzcxE0WBVZM5k2l2Jm
	 02CPZ9VoFxw53mdpeWKlrm+Awrd1YEkFbA3J63/zOcGSPhfBO4ZIDa3MoMRF/6+JJ
	 yeDz58It5D621z5lcB1EzBKrb78PS2SyaEnV3B0uMFqbPq6Y+3/QeCdS+Psg+Msvk
	 NebpQlb8TIMnO9Jj2sNi3m/Wd2byvEQY03Te70TQJfwF1EiKlaRieZh8KQVrHvYcg
	 iFS31jFPWdvvd6la5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbBk-1siRMn1Uow-00saIG; Mon, 01
 Apr 2024 16:17:59 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrITx-CYB-00; Mon, 01 Apr 2024 16:17:53 +0200
Date: Mon, 1 Apr 2024 16:17:53 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: aaci: report FIFO size in frames
Message-ID: <ZgrCEU6rHuEtT6/8@ugly>
References: <20240401101339.506625-1-oswald.buddenhagen@gmx.de>
 <ZgqNFjOU4mpcyHH8@shell.armlinux.org.uk>
 <ZgqOZ0B8h3l48aoh@shell.armlinux.org.uk>
 <ZgqSHq6obzwRDfXs@ugly>
 <ZgqU0ygGn3zhbgQw@shell.armlinux.org.uk>
 <ZgqeV4M8DGpl6KHJ@ugly>
 <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zgq33GqYqtln0qyX@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:2N+zk9+MXVXdPNiK9IJwS4wbO7i5h59M2ao72DAkBcpcBtwdC46
 Buf90cr/m9CKS/F1BCON2P6BmzicZH/3KTaNoOYtDj1u1LDc+8y5o6nppflNZ9B0q1b0Fw5
 VI6PUlLHTIawVfhEPCsKUNdplLh2P9LR37hRxz+dHu7xnEGn/2Q8gNwN3kp3+S3jCr6BAyR
 Pc0WTSwlWehJlyRpCAj6g==
UI-OutboundReport: notjunk:1;M01:P0:OhyQolpi3mM=;lWJPqYbPT5PxJJndQ73hhqNPY+U
 QVTyKwsNTwMoGDHYydHwaU47dlLhsspqoy2SWvZoeMap9to2Bcw8cq5sQVKqsWDNPjqtUC632
 Wl5UevBNUDOTpYUNvxZ77gjZeg66hZHchegZwON6YhQULmPrn8AyNiTY1dr/U0qUqJmUGGE5I
 7qUi34sLGmFLV2aBpN6ZzocjoLqlkbxnTxgBqg8mVZOVLZlahsAEVkGIwaZwYrtquPngqtumO
 SRbQ+wNGMe14JdFzrLb5mq9VbTMzFVGtg6nJId1ttoBlSNQyGW0Hp0iCTy5GAXA5kBQeQHOXp
 FQgeQ1iwPOd6rETT40FL00NvEChwh/x0sXcUv11ghNizjL3fWJhINU2+mcfAdROAQ31aF9oOz
 hgJaaix5S+7PyLtXHJMy9IdPDNrtHWSngp5dHA8AVSh70PLYsAdWZf4eH5u8oIWVevy0axopm
 8BnG0iGSYROZ1v/mRV+V8vWl4arYUbirnRzLNTnKRWb9wH+XmVAg4MpPH7RjbpW1svJxvinWc
 vMySx2pI04fW+E2R+S97H5IDgrZfvlbeSg9xxF4j+SkCQLMOB8ZLWPJQtp9xtedE/r4HP1ziV
 GI6EekNt9ofPeRg7VmEOgnfj3WC9k3/NS1Vc7sRsaUcOIjzQBZ6rG3jZUfU5OztarhSfp2b53
 7jTLKaP9hrpan795yQOuG5oSH+bcgqWBNFK3rjJBbmeo1DUJYO4nIOO4GnpaKxkEpzxArXbyF
 RC1CToZZYpuL+89HSpxKJbit69xAv2kND3fhsPWC6hfCkr7ZxX6oPI9MRfTf5TDU8WgZpC7aX
 w3BUuBsAWeN/PdQpwEx11t0OE/85LxWlryugJDmEkZd9A=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WRTEIUA2TYGUQ3ZFFECLC5K2XOKQBSYH
X-Message-ID-Hash: WRTEIUA2TYGUQ3ZFFECLC5K2XOKQBSYH
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRTEIUA2TYGUQ3ZFFECLC5K2XOKQBSYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 01, 2024 at 02:34:20PM +0100, Russell King (Oracle) wrote:
>Oh FFS. So you generated a patch based on the contents of a mere
>comment? That is NOT how kernel development should be done. Do not do
>this.
>
i think that speculative/rfc patches are a perfectly fine way to get
things clarified, and the linux kernel is no exception to that.

>Comments are not always correct.
>
so how about taking the opportunity to fix this one?

>NAK to *all* your patches whether I've seen them or
>not if this is how you behave.
>
it was a pleasure to work with you.

