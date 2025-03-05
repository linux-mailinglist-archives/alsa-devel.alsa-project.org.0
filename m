Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0567A4F8AD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 09:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42ABE602D6;
	Wed,  5 Mar 2025 09:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42ABE602D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741162986;
	bh=hrRbjSlJreKepA+VuqjygtT3jlFK9HCQWhZjEr7LQHY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6dzYCws6Bu27GBCdDprcRgJOu0lK52JTQQVMRo/7yLwfQGGd1QnJ/Z9wrbEoEWLp
	 0bfPme3blxciyjQKF1u2FyW0pl9EavMEqZHFSPNvB+Sxw+agrWhqEAJcAIgftOZ8Du
	 IPKtGbttcH7JJ7wwl7hbCC7PagRl44Cg9jDadC3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22DACF805BF; Wed,  5 Mar 2025 09:22:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE7CFF805BD;
	Wed,  5 Mar 2025 09:22:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6398EF804FD; Wed,  5 Mar 2025 09:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8343DF80171
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 09:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8343DF80171
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=wk2tTDZo
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5258ML7501173756,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741162941; bh=hrRbjSlJreKepA+VuqjygtT3jlFK9HCQWhZjEr7LQHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=wk2tTDZo20Wq8vEOkHt40bmqRtIXFNWCloXZExz2BNikRX3oI0m22fMo8/M1sjH3t
	 Hv88fsvCRfkfsyvvvCgGzFXpYWFVjE7djqd9gBOmDk06pJhz+VqugJ4G32AjSE2RSn
	 nwYUoHGiAye6U6K9InJRfy+sM/ULvaUQQcbfm+M4KOJIIQHRcupzvoPdK3emaR6DxX
	 RrP0IzpJE22DiSw7Drr5evXbUxp4Pv9tMb1+hRxSt7CWhTQJSv0k4Td0upT4gzG1q4
	 qKRxBZmzBkCoQApB3g7hDQFWz1Ze5AmHUmu8AV7gjrOyeaA2lAH9l0MW421NYZyslt
	 nuz5cvZaG/Fzg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5258ML7501173756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 16:22:21 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 16:22:21 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZCAAIztgP//eTeQ
Date: Wed, 5 Mar 2025 08:22:20 +0000
Message-ID: <494a665481e043a38b94d844654fa81f@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
 <87wmd3uc28.wl-tiwai@suse.de>
In-Reply-To: <87wmd3uc28.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: U6T7Y3LO3EYP4WCMTRB4FNYELY4H2PDS
X-Message-ID-Hash: U6T7Y3LO3EYP4WCMTRB4FNYELY4H2PDS
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6T7Y3LO3EYP4WCMTRB4FNYELY4H2PDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, March 5, 2025 4:17 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> linux-sound@vger.kernel.org
> Subject: Re: update ALC222 depop optimize
>=20
>=20
> External mail : This email originated from outside the organization. Do n=
ot
> reply, click links, or open attachments unless you recognize the sender a=
nd
> know the content is safe.
>=20
>=20
>=20
> On Wed, 05 Mar 2025 08:56:41 +0100,
> Kailang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, March 5, 2025 3:54 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > linux-sound@vger.kernel.org
> > > Subject: Re: update ALC222 depop optimize
> > >
> > >
> > > External mail : This email originated from outside the organization.
> > > Do not reply, click links, or open attachments unless you recognize
> > > the sender and know the content is safe.
> > >
> > >
> > >
> > > On Wed, 05 Mar 2025 07:32:00 +0100,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Update ALC222 depop optimize as attach.
> > >
> > > Could you give a bit more background info why this change is needed?
> > > Is it a mandatory change to fix something, or it improves something?
> > >
> > This codec has two headphone design.
> > The HP2 was nid 0x14.
>=20
> Sorry not clear enough: do you mean the patch is to fix the depop problem=
s on
> the models with two headphone pins with ALC222?

Yes, the original depop was only supported one headphone.

>=20
>=20
> thanks,
>=20
> Takashi
