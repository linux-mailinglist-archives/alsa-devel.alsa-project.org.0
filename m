Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25610127B73
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B878F1670;
	Fri, 20 Dec 2019 14:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B878F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576846907;
	bh=K+rgoa8zN4AIQVXlsBMoYQKdArBhlEwuQQyKZH4cDP8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=esv8ad1Ee1JUWGJtjb6NR3WrVkMqOvzGpVtQz3Ox3qvlK9mMJHcNfVh5qmFLpu2eG
	 khLXUm82MESucbSyhGihfqhvxpKP073yqOZn+6dZfM9gMkfe/n/ewFO7u5ZdM9dPkz
	 +mcx4ZJsNq5/qrByPDomHjnGWm5eZqC1ms5K6I7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80BDCF80257;
	Fri, 20 Dec 2019 14:00:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B69CF8022C; Fri, 20 Dec 2019 14:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E209BF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E209BF80059
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D408430E;
 Fri, 20 Dec 2019 05:00:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53B4F3F719;
 Fri, 20 Dec 2019 05:00:32 -0800 (PST)
Date: Fri, 20 Dec 2019 13:00:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191220130030.GE4790@sirena.org.uk>
References: <20191219213257.366145-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20191219213257.366145-1-marex@denx.de>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, alsa-devel@alsa-project.org,
 festevam@gmail.com, Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO
	comparison
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
Content-Type: multipart/mixed; boundary="===============2721814942742187495=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2721814942742187495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 10:32:57PM +0100, Marek Vasut wrote:

>  #include "sgtl5000.h"
> =20
> +#include "../../../drivers/regulator/internal.h"
> +

This sort of peering inside the internals of the framework is obviously
not OK, please add an interface for this if it's needed.

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl38xe4ACgkQJNaLcl1U
h9CnbAf/QhNG7otRihP4TheQyGNOeGGPK6YAS1/FJYJX56rqaxVUUuTfY3Kh+4ez
MMaiODkz1qb7jS0AIjmmBX7/q5ip8Ww4JTd4YyGc8UU7I4fb1MeW4TMwpnGC5wow
50Bkcbe1Y23YDAjqh3+J/BKDHiZcaeNW4p+GlZy2Q2psr5WXmC0D/Bgn43DplpZ+
Rs4DjBFuOvgzC293U+gGvYqDzGfXapKjLacPyX0VvHyd6ZypemgbKmykw0IPSpYo
7N8Pco8kmy6vRJennngwUxMkG5mjrdt6mM3miG6Ws2JwOkAiJExShPFX5q2HU6wr
W8Wv88Zqv5bprM6yNuQt5ScZpHM02g==
=hD8x
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--

--===============2721814942742187495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2721814942742187495==--
