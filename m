Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085ED1BF275
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E0F1689;
	Thu, 30 Apr 2020 10:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E0F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588234615;
	bh=OzxPLCUofmP4kmP7kkYcE7k4r/lVdwcXTAMwAnUh9fI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvIOEy/Y03NEFT6OkwplZh6RFbVrH8YofoOQNJd7NWZNQSgbphNhzKR5hCxOJ/2R3
	 Ijqb7UoA+ZmsBVwtxS3GIR3mwhoOtF7BfR6QEByuk/qOL3dFZpMEkM1gwxMyQgq1PG
	 Lq2hNymOqYFd8ZXo6CMAHBgG+WfWtyCFsUJFnPHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D84F801EB;
	Thu, 30 Apr 2020 10:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 417A9F801DB; Thu, 30 Apr 2020 10:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64BDAF800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BDAF800B6
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-163-g0_seeJgO5ihcWbcW0LISw-1; Thu, 30 Apr 2020 09:15:03 +0100
X-MC-Unique: g0_seeJgO5ihcWbcW0LISw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 30 Apr 2020 09:15:02 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 30 Apr 2020 09:15:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>
Subject: RE: [PATCH] ALSA: opti9xx: shut up gcc-10 range warning
Thread-Topic: [PATCH] ALSA: opti9xx: shut up gcc-10 range warning
Thread-Index: AQHWHljP0SPhFOMubESmHZ4J5JyFcqiRUaDQ
Date: Thu, 30 Apr 2020 08:15:02 +0000
Message-ID: <c513eb4c4a01470eb3c47d8134afbec1@AcuMS.aculab.com>
References: <20200429190216.85919-1-arnd@arndb.de>
In-Reply-To: <20200429190216.85919-1-arnd@arndb.de>
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
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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

From: Arnd Bergmann
> Sent: 29 April 2020 20:02
> gcc-10 points out a few instances of suspicious integer arithmetic
> leading to value truncation:
>=20
> sound/isa/opti9xx/opti92x-ad1848.c: In function 'snd_opti9xx_configure':
> sound/isa/opti9xx/opti92x-ad1848.c:322:43: error: overflow in conversion =
from 'int' to 'unsigned char'
> changes value from '(int)snd_opti9xx_read(chip, 3) & -256 | 240' to '240'=
 [-Werror=3Doverflow]
>   322 |   (snd_opti9xx_read(chip, reg) & ~(mask)) | ((value) & (mask)))
>       |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> sound/isa/opti9xx/opti92x-ad1848.c:351:3: note: in expansion of macro 'sn=
d_opti9xx_write_mask'
>   351 |   snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(3), 0xf0, 0xff);
>       |   ^~~~~~~~~~~~~~~~~~~~~~
> sound/isa/opti9xx/miro.c: In function 'snd_miro_configure':
> sound/isa/opti9xx/miro.c:873:40: error: overflow in conversion from 'int'=
 to 'unsigned char' changes
> value from '(int)snd_miro_read(chip, 3) & -256 | 240' to '240' [-Werror=
=3Doverflow]
>   873 |   (snd_miro_read(chip, reg) & ~(mask)) | ((value) & (mask)))
>       |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
> sound/isa/opti9xx/miro.c:1010:3: note: in expansion of macro 'snd_miro_wr=
ite_mask'
>  1010 |   snd_miro_write_mask(chip, OPTi9XX_MC_REG(3), 0xf0, 0xff);
>       |   ^~~~~~~~~~~~~~~~~~~
>=20
> These are all harmless here as only the low 8 bit are passed down
> anyway. Change the macros to inline functions to make the code
> more readable and also avoid the warning.
>=20
> Strictly speaking those functions also need locking to make the
> read/write pair atomic, but it seems unlikely that anyone would
> still run into that issue.
>=20
> Fixes: 1841f613fd2e ("[ALSA] Add snd-miro driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/isa/opti9xx/miro.c           | 9 ++++++---
>  sound/isa/opti9xx/opti92x-ad1848.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
> index e764816a8f7a..b039429e6871 100644
> --- a/sound/isa/opti9xx/miro.c
> +++ b/sound/isa/opti9xx/miro.c
> @@ -867,10 +867,13 @@ static void snd_miro_write(struct snd_miro *chip, u=
nsigned char reg,
>  =09spin_unlock_irqrestore(&chip->lock, flags);
>  }
>=20
> +static inline void snd_miro_write_mask(struct snd_miro *chip,
> +=09=09unsigned char reg, unsigned char value, unsigned char mask)
> +{
> +=09unsigned char oldval =3D snd_miro_read(chip, reg);
>=20
> -#define snd_miro_write_mask(chip, reg, value, mask)=09\
> -=09snd_miro_write(chip, reg,=09=09=09\
> -=09=09(snd_miro_read(chip, reg) & ~(mask)) | ((value) & (mask)))
> +=09snd_miro_write(chip, reg, (oldval & ~mask) | (value & mask));
> +}

Isn't that likely to add additional masking with 0xff at the call sites?
You will probably get better code if the arguments are 'unsigned int'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

