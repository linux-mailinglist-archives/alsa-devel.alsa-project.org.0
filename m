Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5F42571B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 19:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943011614;
	Tue, 21 May 2019 19:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943011614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558461398;
	bh=/qz9J/UFQbCJ9M6HzmT0ne0GM4lY8Z8i1TCEe/3ATsI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YolydoMWIJHgSQ9e0tDQgaX8lT3EO104/TaGXrepv7a3d3QcMC6jYgKgcwL0880iA
	 vXETIj6rarQ/MeihcL2dAX40w9gLg5uWs1qZrSDIOoMkyt7Ve60vMlbjWyRjqFtx3g
	 Uoc/Go5KzskMWc9Dj9KpyJshfr93u4QHgJMNP4/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC79EF8079B;
	Tue, 21 May 2019 19:54:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2423F8972A; Tue, 21 May 2019 19:54:50 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB262F8079B
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 19:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB262F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bQVhsZXw"
Received: by mail-pf1-x441.google.com with SMTP id t87so9435395pfa.2
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 10:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=606JMBHU1WCSkVE8vEh8jp0Vn08O9hluQpv6YSChqEM=;
 b=bQVhsZXwJoS8kkAVFoHwkcLXby5dBYqyoeVKoiXPqgc7fmXn1bh8ym5oYjKC4HS7Tj
 9oCLmvze7JP4BG602rGkjb0Rp6P9Iw+/OkRoeJliB8fgxIRu1qINoBy3cwhjPL+63Tu/
 OU32v+ugrsYpgf4PkCeaVSWXM3XmJt0AC/wLyUKT6tv6vIUzy8XChksFv5QwqetG3l4l
 1t+jCnm+4R2NtxtdGjmnXXwDLUdqNqe6PXgjXqdvyUEcYZBIfbQBwf766rewrwLIWjl8
 b2dhZIJupbfBiYO3AqNNhhnTt8ST4hsQFVj3FO9ObC778Rd86z74h0x9191+G6uv3xka
 uiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=606JMBHU1WCSkVE8vEh8jp0Vn08O9hluQpv6YSChqEM=;
 b=cl51XaH0VvDUDfjpzf0omvsF5Cy5B0UajavFsbIecHDfzTzWXk7Ajnem2tNLdkWzdY
 5Ys+Q18eIIKNl1Ppk59CFKhFNwO4lDCmCFs8lb6+HFtPaYibwffv+Si20poUjBJsmElK
 epe4NOp6Lc1skNknLWCK/OWV0UTeWbSrFMAqLWpVadfp5fvLZ+LtfQZNHK+vJO94ogJm
 AWambABq1ZL0A7Uhzb0z52L4t69ndx/mDjJJxDejuhWHTQEmM27XKvvTtrsCPDUpUjh3
 S+pAoKaCeNu8lZD+S75Is5obLBS//F/75yMq0vKbHOLUQ+LWAs8ahX85q9xgKWxRnb9G
 Qfiw==
X-Gm-Message-State: APjAAAV7yt1HYewGKTGHAj+3wVe3xaMDyPBLgOVPcaS+cVCfPG9qCflI
 xIcTTD4UhXhZJQwKHG2ybvgzXg==
X-Google-Smtp-Source: APXvYqx9jmSTOfoHKfChiJWP6QeuV7uyrYxH5QrdJfyQeoHf+pjwRhSwqdCXVT6bvmqUA2iagFvxog==
X-Received: by 2002:a63:5166:: with SMTP id r38mr12376011pgl.429.1558460684705; 
 Tue, 21 May 2019 10:44:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id r77sm29853892pgr.93.2019.05.21.10.44.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 10:44:43 -0700 (PDT)
Date: Tue, 21 May 2019 10:44:38 -0700
From: Benson Leung <bleung@google.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20190521174438.GA2821@google.com>
References: <20190509211353.213194-1-gwendal@chromium.org>
 <CAPUE2ut4OUhrmbx6n8KCj7+ghXmC9iMnxGN8DMvyvZstznwwng@mail.gmail.com>
 <20190518063949.GY4319@dell>
MIME-Version: 1.0
In-Reply-To: <20190518063949.GY4319@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Jonathan Cameron <jic23@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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
Content-Type: multipart/mixed; boundary="===============8661567264948714174=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8661567264948714174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Sat, May 18, 2019 at 07:39:49AM +0100, Lee Jones wrote:
> On Fri, 17 May 2019, Gwendal Grignou wrote:
>=20
> > Lee,
> >=20
> > I verified and merged the changes on the kernels (3.18, 4.4 and 4.14)
> > used on chromebook using a squashed version of these patches.
> > (crrev.com/c/1583322, crrev.com/c/1583385, crrev.com/c/1583321
> > respectively)
> > Please let me know if you have any questions.
>=20
> Is no one else from Chromium going to review?
>=20
> These seem like quite important changes.
>=20

I've gone ahead and acked the whole series. Enric and I are OK with this go=
ing
in for 5.3, and as Gwendal mentioned, he's landed these changes into our
production kernels for Chrome OS as well, so this is what we want to sync o=
n.

Let me know if you have any other concerns.

Thanks,
Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXOQ5BgAKCRBzbaomhzOw
wt8HAP9uU1klLrzkR34L7NbfgwEDQgELzBnyp0zr6eH8FswIUwEAhSZ8hXpksiuJ
cuKw4zj4F0wocqqx1xPt59u73qeMXgM=
=Zm0H
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============8661567264948714174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8661567264948714174==--
