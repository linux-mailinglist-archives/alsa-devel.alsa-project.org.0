Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914E516498
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 15:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D014F15E0;
	Sun,  1 May 2022 15:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D014F15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651411457;
	bh=++iNHlIw5SqV2YVq14VBATRNNTjzqFKLXYK39QSoBM0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4KQtIc5i7tY5xkUGlp982TI3vBboGAnhRIPPCzrsuP7k68Xa3g67mzlWAyR16I2J
	 4vwTlvweEBG+rGDYgdAZnZ9XvqPfTRNK0NYzhaz9/sLpiGjKP4RGLKxaPb+ySXBpmk
	 KwgNdm9n9l9pqjsPC2054mD4Aa2+uEPqYshCx3Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FE56F8015B;
	Sun,  1 May 2022 15:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 589FEF800E9; Sun,  1 May 2022 15:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A9A0F800E9
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 15:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A9A0F800E9
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-321-bb2nzyNUNPyo2ky-b2_4Hw-1; Sun, 01 May 2022 14:23:07 +0100
X-MC-Unique: bb2nzyNUNPyo2ky-b2_4Hw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Sun, 1 May 2022 14:23:06 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Sun, 1 May 2022 14:23:06 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mauro Carvalho Chehab' <mchehab@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 1/2] module: update dependencies at try_module_get()
Thread-Topic: [PATCH v2 1/2] module: update dependencies at try_module_get()
Thread-Index: AQHYXJeYYtni3pRwP0OIc2wg6VHamK0KAauw
Date: Sun, 1 May 2022 13:23:06 +0000
Message-ID: <1e88a3d4df43460c91f049762b9f4630@AcuMS.aculab.com>
References: <cover.1651314499.git.mchehab@kernel.org>
 <3c7547d551558c9da02038dda45992f91b1f5141.1651314499.git.mchehab@kernel.org>
 <Ym0l6yeTWCCAeww8@kroah.com> <20220430143814.7184bd93@sal.lan>
In-Reply-To: <20220430143814.7184bd93@sal.lan>
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
 "mauro.chehab@linux.intel.com" <mauro.chehab@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kai
 Vehmanen <kai.vehmanen@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

From: Mauro Carvalho Chehab
> Sent: 30 April 2022 14:38
>=20
> Em Sat, 30 Apr 2022 14:04:59 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
>=20
> > On Sat, Apr 30, 2022 at 11:30:58AM +0100, Mauro Carvalho Chehab wrote:
>=20
> > Did you run checkpatch on this?  Please do :)
> >
> > > +
> > > +=09if (mod =3D=3D this)
> > > +=09=09return 0;
> >
> > How can this happen?
> > When people mistakenly call try_module_get(THIS_MODULE)?
>=20
> Yes. There are lots of place where this is happening:
>=20
> =09$ git grep try_module_get\(THIS_MODULE|wc -l
> =0982
>=20
> > We should
> > throw up a big warning when that happens anyway as that's always wrong.
> >
> > But that's a different issue from this change, sorry for the noise.
>=20
> It sounds very weird to use try_module_get(THIS_MODULE).
>=20
> We could add a WARN_ON() there - or something similar - but I would do it
> on a separate patch.

You could add a compile-time check.
But a run-time one seems unnecessary.
Clearly try_module_get(THIS_MODULE) usually succeeds.

I think I can invent a case where it can fail:
The module count must be zero, and a module unload in progress.
The thread doing the unload is blocked somewhere.
Another thread makes a callback into the module for some request
that (for instance) would need to create a kernel thread.
It tries to get a reference for the thread.
So try_module_get(THIS_MODULE) is the right call - and will fail here.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

