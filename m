Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D771BF492
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 11:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E495F168A;
	Thu, 30 Apr 2020 11:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E495F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588240440;
	bh=J+UTYB3zRUfrpObJzgFlADHCCy4kf7DJOKjG8+JOMWU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJ5RvSLpK+pSAiQAaXRd31X33gu5LlWTvHdt4+DaxxzHRQB1GVRpQx+Qs8qdawNRe
	 Pqy0s+J1ZWI3nHHNQbbL1Ym/JnuwdOgl9Vpaj76kZ7OZNuCvI9JKxhMK5NYVC4JQi2
	 BuZUx8MPMZgkWGSpOtKXwJqQ5M4QRkv/KxieFet4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1941BF801EB;
	Thu, 30 Apr 2020 11:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F77DF801DB; Thu, 30 Apr 2020 11:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476E4F800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 11:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476E4F800B6
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-128-jza2LrHfM5yaVMLeML32iw-1; Thu, 30 Apr 2020 10:52:09 +0100
X-MC-Unique: jza2LrHfM5yaVMLeML32iw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 30 Apr 2020 10:52:09 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 30 Apr 2020 10:52:09 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Takashi Iwai' <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: opti9xx: shut up gcc-10 range warning
Thread-Topic: [PATCH] ALSA: opti9xx: shut up gcc-10 range warning
Thread-Index: AQHWHljP0SPhFOMubESmHZ4J5JyFcqiRUaDQ///yewCAACbi8A==
Date: Thu, 30 Apr 2020 09:52:09 +0000
Message-ID: <94cc90ff07364743809698fae2ef7138@AcuMS.aculab.com>
References: <20200429190216.85919-1-arnd@arndb.de>
 <c513eb4c4a01470eb3c47d8134afbec1@AcuMS.aculab.com>
 <s5hk11xidob.wl-tiwai@suse.de>
In-Reply-To: <s5hk11xidob.wl-tiwai@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, 'Arnd Bergmann' <arnd@arndb.de>
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

From: Takashi Iwai
> Sent: 30 April 2020 09:25
>=20
> On Thu, 30 Apr 2020 10:15:02 +0200,
> David Laight wrote:
> >
> > From: Arnd Bergmann
....
> > > +static inline void snd_miro_write_mask(struct snd_miro *chip,
> > > +=09=09unsigned char reg, unsigned char value, unsigned char mask)
> > > +{
> > > +=09unsigned char oldval =3D snd_miro_read(chip, reg);
> > >
> > > -#define snd_miro_write_mask(chip, reg, value, mask)=09\
> > > -=09snd_miro_write(chip, reg,=09=09=09\
> > > -=09=09(snd_miro_read(chip, reg) & ~(mask)) | ((value) & (mask)))
> > > +=09snd_miro_write(chip, reg, (oldval & ~mask) | (value & mask));
> > > +}
> >
> > Isn't that likely to add additional masking with 0xff at the call sites=
?
> > You will probably get better code if the arguments are 'unsigned int'.
>=20
> I don't think such a micro optimization is needed.
> All registers, values and masks in the driver are 8bit, so keeping all
> unsigned char is rather an improvement of readability.

And every time you do any arithmetic they get extended to int.
And if you pass them to a function (as char) the compiler
has to mask the result of any arithmetic back to 8 bits.

On x86 the compiler can use the 'as if' rule and do 8 bit arithmetic.
But only if it can determine that the high bits aren't actually used.
On almost every other architecture you are likely to get a lot
of masking operations.

Just because the domain of a variable of 0..255 doesn't mean
that 'unsigned char' is an appropriate type for a variable.

For x86-64 (and probably others) 'unsigned int' is usually best for
anything that cannot be negative.
In particular it saves the sign extension instruction that has to
be inserted when an 'int' variable is used as an array index.

FWIW I think that somewhere else the ~mask had to be replaced
with (mask ^ 0xff) do avoid another spurious compiler warning.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

