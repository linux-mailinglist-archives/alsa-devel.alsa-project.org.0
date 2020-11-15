Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A02B379C
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 19:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C291317A6;
	Sun, 15 Nov 2020 19:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C291317A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605463538;
	bh=nGlS8GolxHFuqK9hpJANmRmkipvpNYC5y3qvWcsnAKw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f+eo8RJd3KwqOpXqxc4grdzJtJt4aNUR0evLgbA5WrK17XxnPpPuW7mSVbZM3JbcE
	 BQ9f876RfyLZTxT/C2JfMcTFGYtfjikBbKyyiCY7OYbqhJLZgFQnN/2onrKK+OrO88
	 +lr9liHzoltP4Mxhq/4+OvMa5JV85yU8qyV1hPDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 216DFF801ED;
	Sun, 15 Nov 2020 19:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A57AF801F5; Sun, 15 Nov 2020 19:04:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.sleepmap.de (sleepmap.de [85.10.206.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBD4FF800E9
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 19:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD4FF800E9
Date: Sun, 15 Nov 2020 19:03:53 +0100
From: David Runge <dave@sleepmap.de>
To: alsa-devel@alsa-project.org
Subject: fireface: FF800 periodic burst of Xruns
Message-ID: <X7FtiSRt9vSPGNLD@hmbx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OQtj1M7d191nGPEu"
Content-Disposition: inline
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


--OQtj1M7d191nGPEu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2020 19:03:53 +0100
From: David Runge <dave@sleepmap.de>
To: alsa-devel@alsa-project.org
Subject: fireface: FF800 periodic burst of Xruns

Hi!

I'm currently testing the snd-fireface module on kernel > 5.9 with the
RME Fireface 800 (FF800).

Unfortunately, when running jackd using that device it generates large
bursts of Xruns (~10000) quite periodically.

  /usr/bin/jackd -P80 -p 512 -d alsa -d hw:Fireface800 -n 3 -p 256 -r
  48000

The issues do not seem to correlate with any load events on the system
(and in between the Xrun events there are no Xruns even under load).
I am not entirely sure how to further debug this. Any hints and
suggestions would be very much welcome!

Note:
While using libffado for the device works it is not at all stable since
kernel > 5.9 (sporadic rediscovery events of firewire-ohci, requiring
the unplugging/replugging of the device's firewire cable and of course
the restart of jackd).
This is why I tried the snd-fireface module again, but it seems to
suffer from a different set of issues ;-)

Best,
David

--=20
https://sleepmap.de

--OQtj1M7d191nGPEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEkb2IFf4AQPp/9daHVMKPT/WhqUkFAl+xbYkACgkQVMKPT/Wh
qUki9xAAsOXZn0oZMaS3iOa2d0TyZzug8WQ1c0FkpOF+S1cnJ4a6oHo1R2yly9/6
9aAFNIIVWmoYXMR4sa5F9p8ZhLobN4ClKEsGsNwTD/l8QE9MkP7hP4J/dBB2Z9d+
tevsZQgfhyNs6PykaQCuwH46HSHQXMQw8e3rzpgaGRbVUVtlDajYnm2tnYNF+eGv
pFt8ngqJEinyouvHfkGKZULHACWrIfgd7Q3QszxwV8C3TiHMMWeAa578viexoJIP
y2uyJs7Hz7KFJrvutyvJp0E3Fux7gCiuPOt0pjZgQhQ8ELxOOzD0iGtabjr0bK8f
5rcZCjqgiHZh/lgvHgI9qL96gibAGAK3gXLWyiTs7orEOa/zltvnXPGIsaKdM76P
CV5FQ3d4CNR2FQEsAe6paeClThOXWtwzH6h7KUhDBXduGIvp/rNojDBnA3NvftJj
4ny7FyNqrCI3E2DZf9fnznAl7Eh5NiTvdQirDYj/SRIla7JPpAAMengRl8x5bvVd
fuqwzCB3kMJhDHYa4+9Y1HC+mkwD2FYCCciGpCf3axvjG5AMbLUpRT1hpF/TcNKf
I75uKrti8QaOAEcybAgu7qmAldBo+1AVfzUdS1VO1M1SALMjRTbJZ9LW5NeqJnEb
pL0XdXQg2pew8Fv0nGtGY1VOKkFa47jo8ieKyfAogU8vp+1rAu0=
=wuCA
-----END PGP SIGNATURE-----

--OQtj1M7d191nGPEu--
