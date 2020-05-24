Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8EE1E0A8E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2913845;
	Mon, 25 May 2020 11:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2913845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590399058;
	bh=Jq+ZUX4P7qhaQ9O/zuOBnGnGSC3SaDtCUaDHM8Fw+CI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJol9oYaZ/PDJELmPVjsfdbjlGj+sGX+ER+SUiWKQwABkcWJfHhd5UQUT/L9ltODb
	 YHZbTB79u+SerCYe0bxLYCXawp6i4VGuPsOYyBgt29Dwe7c41BEX1Z6mzHahbBQnn+
	 EuxyT8QaHGp+k4ymjzLmAxJnWTeux3PdYsscgg+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D775F802DD;
	Mon, 25 May 2020 11:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3734FF801D8; Sun, 24 May 2020 02:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE16F80140
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 02:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE16F80140
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 3704C16005C
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 02:24:42 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 49V1FQ2TN6z6tmP;
 Sun, 24 May 2020 02:24:41 +0200 (CEST)
From: Melvin Vermeeren <mail@mel.vin>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: Dice firewire support
Date: Sun, 24 May 2020 02:24:33 +0200
Message-ID: <2204634.7cJeLMavbB@verm-r4e>
In-Reply-To: <4243350.MNUmLrt7UK@verm-r4e>
References: <276893435.728967.1590133905081.JavaMail.administrator@n7.nabble.com>
 <CALic0i3=qUMQxK_E1oFA_=K0+ABk0LJwF3hGZumA0nU8PQV4tw@mail.gmail.com>
 <4243350.MNUmLrt7UK@verm-r4e>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1875152.F0jBVD7ps7";
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

--nextPart1875152.F0jBVD7ps7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Takashi,

On Friday, 22 May 2020 13:36:13 CEST Melvin Vermeeren wrote:
> Since I am running 5.5.17
> (buster-backports) kernel right now I will do some testing later today to
> see if there are still any issues in this version, the Mytek is still used
> daily.

I have just tested it with 5.5.17 and can confirm this issue still exists. It 
is not very noticeable when playing music but it instantly apparent when 
playing a 500hz tone for a few seconds. It sounds there is some small ticking 
in the background instead of a pure tone. Happens every few hundred 
milliseconds or so and is fully consistent, as if a timing or cycle issue.

Next I checked with current master v5.7-rc2-1808-g40e1763b6246 (snd_dice and 
snd_firewire_lib) with the same results. I believe the status is the same 
posted in 2018[1][2]. The old out-of-tree have served me well throughout the 
years, so I will probably keep using them for now. Perhaps this final issue 
will be found one day, if I can help you with anything please let me know.

[1] https://www.alsa-project.org/pipermail/alsa-devel/2018-June/136829.html
[2] https://www.alsa-project.org/pipermail/alsa-devel/2018-June/137160.html

Thanks,

-- 
Melvin Vermeeren
--nextPart1875152.F0jBVD7ps7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETnzUjuV5O+rCrz6nRiwQnTrHuFkFAl7JvsEACgkQRiwQnTrH
uFmDRw//eM+1QB0bYeDbDQHHhuxqqUp5fnu/UWfCsfFzvCBvegCOcpjj20Fzjm8T
J17PZsj4kTSGhtfzjsrXUkdZ3ismVssJCyDdNyOlCGnc5zLOr3mT7uNP/q2dtT/E
JByZyqqwR2maDlHXaeKRUa57W5giLy4ui8xJ+P47HEtW42VcjPFxYfOsd6JgI3IS
6I+JoHRtvPgnuiPKEelFcUNaF/ppDPUTiKXc1gLruQdMHIbbSHsAltzlBu51sbee
w/mWqaSTKkoikPRsE71YYtwd+5IyqJxvrJpE0Lr9lQ963Uy03QvpIeq+zY1g2Jza
gs5MNF/5AQhI8pjxBtwTfYCJZB0xEFvSpYqHaajcIO0wX+XUsKSCuLTkiNGQ5owk
QX7zyQ8sZWRQ5T2KzrV3C08wlfgf+GXJ4dsiMkjTAj3YBQjJZgNqXSJkuTgYMbnf
beKLNekambyH4zJNGjiltk/z+fhwnr7ZL1rvS08COddqHhEYrw/fH5MtwVJL2YNE
bcEZlt7nF9ZyN4d7id4BiHgdp3igDxYD0XdZ94tffTy4YS+TM5BXHMrVPe2MEkg/
RtYNZWq5WABZT886UPodhk7FcUhsZ0XFqFPw6gNSQsD2HGpelI/LHgy2p/1tEG4B
eTZ3qiWwOF0Ltn5hunF+zCznDuunWhM3Qt0rrjwvbfWcLxcm8Co=
=efdP
-----END PGP SIGNATURE-----

--nextPart1875152.F0jBVD7ps7--



