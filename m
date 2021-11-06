Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9B44704F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Nov 2021 21:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4101F83B;
	Sat,  6 Nov 2021 20:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4101F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636228839;
	bh=hvTYLRBmSPH9Sd7oiQG0PabEt2eocap6wzP73BlwPJE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jvlcx+w3alR2zSN9BCVSRScAOjyTo3JYjuNaGCMwFmbdtNvrqlsXk7AJRi1SMD3Nn
	 A/IyMgH8c4c4rTfrXBeXiKv3q3iTdXdZS6V5Uq844u09BG5iDAD2RHRUi+LBdtSPPg
	 j1bZ7R2ztiBEIIodXMBUKrZ6A4VtpkY/YtuJwKPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E82F8025F;
	Sat,  6 Nov 2021 20:59:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0C5F800ED; Sat,  6 Nov 2021 20:59:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dormouse.elm.relay.mailchannels.net
 (dormouse.elm.relay.mailchannels.net [23.83.212.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C71EEF800ED
 for <alsa-devel@alsa-project.org>; Sat,  6 Nov 2021 20:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C71EEF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=thevertigo.com header.i=@thevertigo.com header.b="Qmi4vhZZ"
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 07CE26C02B8;
 Sat,  6 Nov 2021 19:59:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a218.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 893E66C08FF;
 Sat,  6 Nov 2021 19:59:00 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from pdx1-sub0-mail-a218.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.105.57.75 (trex/6.4.3); Sat, 06 Nov 2021 19:59:00 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kip@thevertigo.com
X-MailChannels-Auth-Id: dreamhost
X-Reign-Hook: 28c2882a32f480eb_1636228740836_1423579741
X-MC-Loop-Signature: 1636228740836:3498063398
X-MC-Ingress-Time: 1636228740836
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a218.dreamhost.com (Postfix) with ESMTPSA id 4Hmp9J0tmSz1Rn; 
 Sat,  6 Nov 2021 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1636228740; bh=eE1atjEsVm6SE6fMcZp+OhD+bPU=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=Qmi4vhZZTRsP7E1y0UF5esaZXhTCDHTbr985nKtXymCe4bXfRRK/DMCA9sXgyg7F5
 +FeMRKxsX5HwHvuYuA03TAmmqjzR6tOCk+pDqzc2cL85cecaPs4Ah2oyJo/YfFvOCg
 ejQtAUqGlpY+dSgzcflEVhrl6ni7/OZlZivIXOsw=
Message-ID: <07abba7df72f0dd27432a5dcda46f6b24483b78d.camel@thevertigo.com>
Subject: Re: [Alsa-user] USB audio on riscv64
From: Kip Warner <kip@thevertigo.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Sat, 06 Nov 2021 12:58:59 -0700
In-Reply-To: <s5ho86xeoiy.wl-tiwai@suse.de>
References: <f2ec64dab6a74c7eee0625533d3c3630adb62a41.camel@thevertigo.com>
 <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
 <e91d7a44b9a456141d856ea57aa2948c3be4422f.camel@thevertigo.com>
 <s5h35oahppb.wl-tiwai@suse.de>
 <3832054fd315605b19bd9d74977f83078a95ee08.camel@thevertigo.com>
 <s5hr1bue8fz.wl-tiwai@suse.de>
 <35c65f0177395968c01ea4b00d52c021cf2f9191.camel@thevertigo.com>
 <s5ho86xeoiy.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-GNQmUCHc4bsXKirY3ugx"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Cc: Alsa-user@lists.sourceforge.net, alsa-devel@alsa-project.org,
 Dmitri Seletski <drjoms@gmail.com>
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


--=-GNQmUCHc4bsXKirY3ugx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-11-06 at 08:23 +0100, Takashi Iwai wrote:
> How about to run as root?

It works as root!

   $ sudo aplay -Dplughw:1 -vv /usr/share/games/lincity-ng/sounds/Water1.wa=
v

So there appears to be a permission issue. I wonder why?

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-GNQmUCHc4bsXKirY3ugx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmGG3oMACgkQRLRlxF7U
4wTD1xAAjkvb9jWtJclQT11+EdQmq2UFX0pQxCLzVOzWDjB92qsWsfqR+Hs6ESny
H4Due+svR9kFRyGpbHw+G7/U8boTKo91p0YLvlBsyWXXMIOe0o811lmZTvR5WYgo
tPq6h0MiCHV8d67BGj55O1vk+Al/AEfORP8IDS8jyph3ADolZzt8lAyAZsZC/u+J
CrcYY8LuZSZ0ccEcU2qHC/tIVoy+badd0NfJ+Nsgm8rCoWTvOHcyxKC7muAnNbYc
OeGIm6MQH9zEqPtak+g5GfQgor8ca3kTL1lbe0NIYL7lnQFQaAJrjYuXAbK666rc
7Vv+R8hBiDDkiyoqzaiHCuAQjT8p8qPTP04+pOBLJrbN0NpnqoV4Z94L6s8SM6qb
YLbo7mPkg+q4z6t7J2cYeasy2cnkk4nKl7L+6TWAiHy3pkqXSyVARENh2B+JJoOO
f2V+wN5OuiI/Nmv3OZ9HgIp8fc66Nr8APAsCXeMaca8D1+BIhYs0+1gqyOgkqB9W
OAHz4UOQelua4nYW/WM9I9naG0/+kxYrgdQ8sTw/vSHFQkyUcsWHctl6zE6JtkWF
602QkxZUwQIk6hzSrFiyHvllENeHLEV/ml5HBlfv5b3EN9BsAh687yr96HPpF1Ny
vliQVhkDhnvZRcwoj5YS44D3V/40JqFOqnN6ne4N5cat1nCvOv4=
=QmLI
-----END PGP SIGNATURE-----

--=-GNQmUCHc4bsXKirY3ugx--

