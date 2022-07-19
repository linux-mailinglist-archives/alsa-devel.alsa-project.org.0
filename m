Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B45797C4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 12:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF51416D2;
	Tue, 19 Jul 2022 12:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF51416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658226959;
	bh=NYsbvGwWgrPYMQm7Q/jE5pHPJf2ZCxt84yxKVAFtZM0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLRskzdKV7pgdTKzQotAsopfrwe4c5f4JxbvIlEmgCwJw7zzKWZLDscL2muQvzE90
	 +ZlwEe6jVmCh7w4fu5LwkCapCwAB8TKXJdiyxHgwaoKi81Effp7iwZW1Xb0QjADLKj
	 S3Fw8H2GotZpT8JZ3Am1vfyzWQtyDHKhcXyp2frk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F3EEF80224;
	Tue, 19 Jul 2022 12:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E837F801EC; Tue, 19 Jul 2022 12:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F87BF80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 12:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F87BF80118
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-153-WfVlpVyTM_qbYoROTtpk1A-1; Tue, 19 Jul 2022 11:34:46 +0100
X-MC-Unique: WfVlpVyTM_qbYoROTtpk1A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Tue, 19 Jul 2022 11:34:45 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Tue, 19 Jul 2022 11:34:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mark Brown' <broonie@kernel.org>
Subject: RE: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Topic: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Index: AQHYm1RF9VBLG0gK5ky/ItlmeeUnS62FdfSA///0CICAABRvQA==
Date: Tue, 19 Jul 2022 10:34:44 +0000
Message-ID: <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
 <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk>
In-Reply-To: <YtaEpf6Cd7KH7wH4@sirena.org.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 'Shengjiu Wang' <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

From: Mark Brown
> Sent: 19 July 2022 11:17
>=20
> On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
> > From: Shengjiu Wang
>=20
> > > -=09ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_f=
ormat);
> > > +=09ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32 *)&asrc-=
>asrc_format);
>=20
> > Ugg, you really shouldn't need to do that.
> > It means that something is badly wrong somewhere.
> > Casting pointers to integer types is just asking for a bug.
>=20
> That's casting one pointer type to another pointer type.

It is casting the address of some type to a 'u32 *'.
This will then be dereferenced by the called function.
So the original type better be 32 bits.

I'm also guessing that sparse was complaining about endianness?
It isn't at all clear that these casts actually fix it.

(Mark: You'll be glad to hear that the office aircon is
broken again - two weeks lead time on the spare part.)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

