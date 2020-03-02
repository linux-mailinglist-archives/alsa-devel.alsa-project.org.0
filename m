Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F519175434
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 08:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12F316AB;
	Mon,  2 Mar 2020 08:01:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12F316AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583132538;
	bh=KoS2qZWvOzdgbkvyfhLCsQJLaTqK/quWPCe1q4LT8GM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7hCuq9Y9SRlfN0a7PHsNbe0lnxG2J2nANK+4CAPY/brG2ecq0PQtiX8lV53Yu5I9
	 4nISxRq2Ie22EYoIJU41R9CcsMlMIR7l/FjQoQjlgsMfzNacBZpduwflFmcCvGyY2F
	 OpQxK/3DrBqwSHAya6hK7+XcNc4eU6GCzAs32Vtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B145AF801ED;
	Mon,  2 Mar 2020 08:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CB85F801ED; Mon,  2 Mar 2020 08:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B31A7F800E5
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 08:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31A7F800E5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02270Jfj000710,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02270Jfj000710
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Mar 2020 15:00:19 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 2 Mar 2020 15:00:18 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 2 Mar 2020 15:00:18 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Mon, 2 Mar 2020 15:00:18 +0800
From: Kailang <kailang@realtek.com>
To: =?iso-8859-1?Q?Aur=E9lien_Croc?= <aurelien@ap2c.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy book
Thread-Topic: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy
 book
Thread-Index: AQHV5d5TCeR2iQwby0KYUy8ypm/1pKgiNgCggA40YwCABIn2cA==
Date: Mon, 2 Mar 2020 07:00:18 +0000
Message-ID: <672a747738f348d78bd47d044a2b8368@realtek.com>
References: <1610933.XPBrhYXKCp@antimony.ap2c.org>
 <s5h1rqsc1kd.wl-tiwai@suse.de> <bd2f299ee9784fe2898cc303ff3516d0@realtek.com>
 <3045783.YgvgG0t98J@antimony.ap2c.org>
In-Reply-To: <3045783.YgvgG0t98J@antimony.ap2c.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.171]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
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
> From: Aur=E9lien Croc <aurelien@ap2c.com>
> Sent: Saturday, February 29, 2020 1:40 AM
> To: alsa-devel@alsa-project.org
> Cc: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
> Subject: Re: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galax=
y
> book
>=20
> > Sorry.
> > Samsung didn't request this platform need to support Linux.
>=20
> I can understand that you can't work on my problem if your client (Samsun=
g)
> didn't paid for that. However is it possible to get ALC298 specs in order=
 to
> understand how-to configure it (in particular a document which explains i=
ts
> COEF registers and their meaning) and I will do the job.
>=20
Hi,
OK. I could try to request spec from our AE.

> Thank you in advance.
> Regards,
>=20
> Aur=E9lien
>=20
>=20
>=20
> ------Please consider the environment before printing this e-mail.
