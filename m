Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66094A4FA2C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0412960349;
	Wed,  5 Mar 2025 10:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0412960349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167240;
	bh=8Nwo7D4UD8ql7KK9yeTVQ9rORh9gYJnRId9RnEE8GiI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JuZwPbbx5sLVwBr37SkhNo3+i0oZP7M+AXL/wNoWzR8vl5rQpqYZrLnM8kEkjgN28
	 xCa7dF/O/3qQgcqiOeKd6rkH/Egm/HzKkFDLZHoqboP+VA03ITfbFp+d7Q7t8OvE2r
	 pGXBI5fIIklVu2Mwh0Du3zlrKpqPo5KeotuG5XDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD45DF805DF; Wed,  5 Mar 2025 10:33:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D417F805D9;
	Wed,  5 Mar 2025 10:33:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 542A8F805C1; Wed,  5 Mar 2025 10:33:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29717F805C1
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 10:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29717F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=K6lU+AV/
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5259XCq541265339,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741167192; bh=8Nwo7D4UD8ql7KK9yeTVQ9rORh9gYJnRId9RnEE8GiI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=K6lU+AV/aeq4y/nqPyiTE3fsddHRVWyk52qBQSterB3n2jO+lhIxlcnkeRr5tBowG
	 7vRMlj6GctiTfCoJ2Y04ij7zEUFVPBPWkp2CBVql0x3S9uwX6PYlZD+sphXP99CIR5
	 kC49Y7sdOYQ628vDkBQ/De2VPXHLZvNVPp+fUwk3OtPKHSd/2FwDuo5baM+KlHhl2r
	 5LILtrVGZo98W7IlWpvSpzyv9IHH8mo/LH8dYj3QhOPnnk2H08jZSpPa4PwGUfvE/k
	 RIQLvtbaS76eQoJ3bYYCmhd0OUjzki2Ux0WV3559e/2/lR1fVtuB7wVsPeS2oMpylU
	 iu4LBjQlAWlLw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5259XCq541265339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 17:33:12 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 17:33:13 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 17:33:12 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 17:33:12 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: 
 AduNl/Z/2i7zvjW2RduQNmX+QwAWAP//kWCA//95iZCAAIztgP//eTeQgACQHQD//3QI8AAS4BiA//95jpA=
Date: Wed, 5 Mar 2025 09:33:12 +0000
Message-ID: <de985451c2c94c1588cd8d211f6a8234@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
	<87wmd3uc28.wl-tiwai@suse.de>	<494a665481e043a38b94d844654fa81f@realtek.com>
	<87tt87uail.wl-tiwai@suse.de>	<ec41e956050e4ea594daaf8042fd6d1c@realtek.com>
 <87plivu8os.wl-tiwai@suse.de>
In-Reply-To: <87plivu8os.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: HACBAAK7SVPSKHNXCVWZDDTDUVVHCT5X
X-Message-ID-Hash: HACBAAK7SVPSKHNXCVWZDDTDUVVHCT5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HACBAAK7SVPSKHNXCVWZDDTDUVVHCT5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, March 5, 2025 5:30 PM
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
> On Wed, 05 Mar 2025 10:22:04 +0100,
> Kailang wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, March 5, 2025 4:50 PM
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
> > > On Wed, 05 Mar 2025 09:22:20 +0100,
> > > Kailang wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Sent: Wednesday, March 5, 2025 4:17 PM
> > > > > To: Kailang <kailang@realtek.com>
> > > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > > > linux-sound@vger.kernel.org
> > > > > Subject: Re: update ALC222 depop optimize
> > > > >
> > > > >
> > > > > External mail : This email originated from outside the organizati=
on.
> > > > > Do not reply, click links, or open attachments unless you
> > > > > recognize the sender and know the content is safe.
> > > > >
> > > > >
> > > > >
> > > > > On Wed, 05 Mar 2025 08:56:41 +0100, Kailang wrote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > > Sent: Wednesday, March 5, 2025 3:54 PM
> > > > > > > To: Kailang <kailang@realtek.com>
> > > > > > > Cc: (alsa-devel@alsa-project.org)
> > > > > > > <alsa-devel@alsa-project.org>; linux-sound@vger.kernel.org
> > > > > > > Subject: Re: update ALC222 depop optimize
> > > > > > >
> > > > > > >
> > > > > > > External mail : This email originated from outside the organi=
zation.
> > > > > > > Do not reply, click links, or open attachments unless you
> > > > > > > recognize the sender and know the content is safe.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Wed, 05 Mar 2025 07:32:00 +0100, Kailang wrote:
> > > > > > > >
> > > > > > > > Hi Takashi,
> > > > > > > >
> > > > > > > > Update ALC222 depop optimize as attach.
> > > > > > >
> > > > > > > Could you give a bit more background info why this change is
> needed?
> > > > > > > Is it a mandatory change to fix something, or it improves
> something?
> > > > > > >
> > > > > > This codec has two headphone design.
> > > > > > The HP2 was nid 0x14.
> > > > >
> > > > > Sorry not clear enough: do you mean the patch is to fix the
> > > > > depop problems on the models with two headphone pins with ALC222?
> > > >
> > > > Yes, the original depop was only supported one headphone.
> > >
> > > OK, and then would it be a bit risky to blindly assume the second
> > > headphone pin 0x14?  Isn't it set up via pin config?
> > >
> > It doesn't have risk to set this pin as headphone or line out.
> > This pin (0x14) can be a line out or headphone. It has JD which driver =
will get
> it.
> > Line out and Headhpone were need to do depop procedure.
> > If pin 0x14 set to speaker, it wouldn't have JD.
> >
> > hp2_pin_sense =3D snd_hda_jack_detect(codec, 0x14);
> >
> > This just got JD to do depop.
>=20
> Fair enough, I took the patch now.  Thanks.

This codec speaker pin will be 0x17. 0x14 pin was not have class D amp. So,=
 0x14 pin will not assign to speaker pin.
>=20
>=20
> Takashi
