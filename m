Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01B1A08BB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 09:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FFF166D;
	Tue,  7 Apr 2020 09:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FFF166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586246105;
	bh=UPEPQgsZ0AEBzMTWm0k3Dmho0vV3THcjb5h9yUUUPjI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2l4e0H5o+9gQUHPzttdyquSvwFCjIzLi33+cDYDyN980OEFsrmv3+SGQ/Fon0eX4
	 h+JplRO+9WgYUUZRWZsJEwKmjI26Xx2et2lZqzK95LO5aVyV4TqidTa1YVSVAtDA1F
	 dTLVs6KjmsWWdXXhbzY86c4hJ9u4DBpxk9xmsqx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5261F80121;
	Tue,  7 Apr 2020 09:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B4FF801F9; Tue,  7 Apr 2020 09:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE331F8011B
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 09:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE331F8011B
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0377r5m95031391,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0377r5m95031391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 7 Apr 2020 15:53:05 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 7 Apr 2020 15:53:04 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Tue, 7 Apr 2020 15:53:04 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: New HP mute led feature
Thread-Topic: New HP mute led feature
Thread-Index: AdYH51wtUO4r/n8vTQmHwBcFof06lf//hbSA//X/XnCAE4jIgP//eZmQ
Date: Tue, 7 Apr 2020 07:53:04 +0000
Message-ID: <275032440193466a8fbf3c99b10a159e@realtek.com>
References: <e8a61928cfae439b9fa99d80e3c5c6cc@realtek.com>
 <s5hlfnf686q.wl-tiwai@suse.de>	<6741211598ba499687362ff2aa30626b@realtek.com>
 <s5hk12rohs0.wl-tiwai@suse.de>
In-Reply-To: <s5hk12rohs0.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.171]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, April 7, 2020 3:51 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: New HP mute led feature
>=20
> On Tue, 07 Apr 2020 09:05:49 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > I modified as attaches.
>=20
> Thanks.  They had, however, a few typos that didn't compile, so I applied
> them with corrections.
> Please check the commits in sound git tree later.

Thanks a lot. ^^

>=20
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, April 1, 2020 2:18 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: New HP mute led feature
> > >
> > > On Wed, 01 Apr 2020 07:37:50 +0200,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > HP had new mute led feature.
> > > > Attach two patches will enable it.
> > >
> > > They don't seem applied cleanly.
> > > Could you rebase to the latest git tree?
> > >
> > > Also, it might be worth unifying the handling.  Both patches
> > > introduce very similar functions, and the values to mask and set can =
be
> referred, e.g.
> > > spec->coefbit_mask, etc.  But such a cleanup can be done in a
> > > spec->separate patch
> > > later, too.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > ------Please consider the environment before printing this e-mail.
> > [2 0001-hp-thinclient-0x877a-mute-led.patch <application/octet-stream
> > (base64)>]
> >
> > [3 0002-hp-thinclient-0x877d-mute-led.patch <application/octet-stream
> > (base64)>]
> >
