Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56911E0A87
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755F7170D;
	Mon, 25 May 2020 11:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755F7170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590399019;
	bh=flKECIQlU0aEnkV9D0q/b02j/YXWCtYQLTGOHQb16Ko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VI2vnu4/cQZhfN4doHZNy6YvsvT84iIxbnwiiA3eIBvw0fdu7attEtzoe0KQkS++8
	 I3Fc6eb0f/Ud67Z2lp5YO2f7xFvnJZTqNesdHmkUuKH3/h2GWPpNIBG9RtXBBJm7PB
	 8F0cNzDecZOu4v4OWUkalekbKI7OS6VFxUP7Twa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6CFDF802BD;
	Mon, 25 May 2020 11:25:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB8EDF80140; Fri, 22 May 2020 13:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24573F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24573F80140
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 6D9E5160063
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:36:21 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 49T4FJ2CxJz9rxY;
 Fri, 22 May 2020 13:36:19 +0200 (CEST)
From: Melvin Vermeeren <mail@mel.vin>
To: Pascal Bomel <bomelp@gmail.com>
Subject: Re: Dice firewire support
Date: Fri, 22 May 2020 13:36:13 +0200
Message-ID: <4243350.MNUmLrt7UK@verm-r4e>
In-Reply-To: <CALic0i3=qUMQxK_E1oFA_=K0+ABk0LJwF3hGZumA0nU8PQV4tw@mail.gmail.com>
References: <276893435.728967.1590133905081.JavaMail.administrator@n7.nabble.com>
 <20200522081047.GA105169@workstation>
 <CALic0i3=qUMQxK_E1oFA_=K0+ABk0LJwF3hGZumA0nU8PQV4tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2045970.BcCf8ka06L";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Mon, 25 May 2020 11:25:08 +0200
Cc: alsa-devel@alsa-project.org
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

--nextPart2045970.BcCf8ka06L
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

On Friday, 22 May 2020 11:07:06 CEST Pascal Bomel wrote:
> Thank you so much Takashi.
> Actually i have a debian 4.9.12 "stretch" release with 4.9.211 kernel
> version (uname -v)
> This kernel has snd-dice module inside isn't it ?
> I am not very familiar with linux, that's why i appreciate your help.

You can either upgrade to Debian buster, which has 4.19, or install a kernel 
from stretch-backports, which is also 4.19. Assuming you have amd64 hardware 
that would be https://packages.debian.org/stretch-backports/linux-image-amd64.
See also https://backports.debian.org/Instructions/ for more instructions.

Some background information below, from how I remember things. Do note that 
there were many details and I may be mistaken about some of them.

At the time of 4.18 there was some issue with the timing that caused non-bit-
perfect playback, resulting in audio artefacts that were hard to detect as it 
was near perfect. DSD over PCM (DoP) mode however made it very obvious this 
issue existed, as it would not work reliably at all. It was also noticeable 
when listening to a fixed Hz tone, it wasn't perfectly smooth.

I believe there was some significant refactoring going on with snd_dice at the 
cause, which caused some previously working things to stop working as snd_dice 
became more compliant with device's listed features and protocols.

Older versions "just sent a new stream" when frequency changed (iirc), which 
actually caused the DAC to sometimes not catch the signal and made it silent. 
You then had to restart jack (or ALSA stream) a few times. The new version 
used proper lock mechanism (AMDTP?) meaning it worked 100% of the time, except 
for the non-bit-perfect issue.

Since those days of experimenting I have been running snd_dice and 
snd_firewire_lib from sound-4.4-rc7-692-g2eb65d67afbf out of tree, with minor 
patches to make them compatible with modern kernels and overrides for the DAC.

Thanks for the mention Takashi, I appreciate it. Since I am running 5.5.17 
(buster-backports) kernel right now I will do some testing later today to see 
if there are still any issues in this version, the Mytek is still used daily.

Cheers,

-- 
Melvin Vermeeren
--nextPart2045970.BcCf8ka06L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETnzUjuV5O+rCrz6nRiwQnTrHuFkFAl7HuS0ACgkQRiwQnTrH
uFm6wA/8CzU77sjW2p8L53jhZd2A0UAuCulbZ46I3WecPAIswzHTl5ssy9YhNbVx
1RAIQ+9YRKjb0US7XucTncvG/BvTq6BvQEQzwH24bybjUghSk6QrRpOo/N4/+vfy
pJlqIPUIoRq5tcZCB8AFb03V16VvtuxGk2BlgbTV2Q13Sw9q90oBreq5J9zp00PR
Apo5szF5QIYNMMQdDxaa+QbGpFFF3zmgzuEFJJhbj+UaZqZH1u8lCuWm97adzEx2
VutHWARjy84R6MBTsXc5RetoV72kBE3HzwfjUL2JBLqaL0lJHiwZmB+Oq6t8Ur37
0I7qAi5VxV+BMnWQrjaqjUVTpIsMvdG71JhBcS/tMoFFgk6rvptiY6GHg0Q1QrlN
Sws10vzVkEodwW0aQQskl+ALVB4swxS7qJ0diA4Q4q56RtkldBKnFJOhF9xOynTG
vWxiFCzoez6r85smaLL5YxDNbOTY8byPXyXNXfXp4lInhW0Pxqm47N+E2sKrbiAh
fG88XXgRyNJY1c7vJdtiDV/KZu9/DaqQ220DHdQaIV6jgQPCtIz/01b8cHasylik
NCfrUpEav4upWueHnKHSyEtMmVp8oKzt+d1Bwuy+nY44TaTuDKUgogIG1shD4Uu5
2vRuzBLWt7kW6ZItntdWuxh+DTc+JnSkEB4t5nly+RFMLHNvKqc=
=GWye
-----END PGP SIGNATURE-----

--nextPart2045970.BcCf8ka06L--



