Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ED533D532
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 14:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2277E18B5;
	Tue, 16 Mar 2021 14:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2277E18B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615902744;
	bh=v0MQftmjchfDyMC/gsPtVSaYN1KMEK0Xi5b0nN0zZoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nobqI9IgncDU8gJx3XVbxfTe2YqKJh+wcDgabpumzyEgWdDWBtwD5w/5WbUgQoX2G
	 EqbM09a7k7i+yZRZHoltTNJGcjR9VWOuRgXeeKymMhl8fe3bkmylN6bwJqVR+1z5o+
	 FTcPScj6rARi++45En41IsHlxukr/NRbS7sp72AU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E39DF80171;
	Tue, 16 Mar 2021 14:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5ACAF80148; Tue, 16 Mar 2021 14:50:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F163AF80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 14:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F163AF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d2iQ8AfM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 118C165053;
 Tue, 16 Mar 2021 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615902632;
 bh=v0MQftmjchfDyMC/gsPtVSaYN1KMEK0Xi5b0nN0zZoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2iQ8AfMIkcRJMiwCyMDrEYQ+fm2BuhcqJBrRDiqtLgZgbWR6A2s9flaTfKez135q
 fdSRDHEXaqaWbIV5WoEHS3ARyh4Y+xL3xUNi+zW+teWI8G+pe/bpgpB0d/TPgyrk6V
 2b9m5gDUqiCoIqZ8pj5Z10mELK7htU7kbHpvYxm+T3euNlvollP5cYdBCrg5C58Sex
 0Zj6ic7R1OD5C9FtTyl+m4G1jnOaHtZqmbQgBxRQbWgCljhiYenYXdhL9g1ancsbm/
 mhS9jEwKaQr+8wwBBQPfjhRhVSFyl0ruRGkoOxu3DHt0qNO+TMQcwsp0w81WV5q+rL
 s3pH4/TS+Yk8Q==
Date: Tue, 16 Mar 2021 13:49:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Message-ID: <20210316134915.GB4309@sirena.org.uk>
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
 <20210316125839.GA4309@sirena.org.uk>
 <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
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


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:42:40PM +0000, Viorel Suman wrote:

> To me it makes sense to manage the clocks and reset from the same place.
> Currently we have the clocks management moved completely into runtime PM
> fsl_sai_runtime_resume and fsl_sai_runtime_suspend callbacks.=20

Usually the pattern is to have probe() leave everything powered up then
let runtime PM power things down if it's enabled, you can often do the
power up by having an open coded call to the resume callback in probe().

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBQt1oACgkQJNaLcl1U
h9BD2gf8CYq0baSLf4YPI5H7xjw4JepkHBJKPXid4yN7feW5rEKKZIlNzYx5AYT5
jh10YF8ND602x/tBHwlqL2tNdjBFzSi4dT/1QapmOaS4NqEXPAWU97VUPECfxWLm
29HZ7+Kw4LfDE2PI/2sKnBYd0wE8w0l2prCM0Ms8JT4hVal8O53kgzjJ6+dzHfpe
jisKXgGv8qtNVlK+6AMK3H+vs8ROYnTfiYTsFNR4XF1nrvGSxwwvM8KuJb+rYb5+
VNB58e4KMaolnwOyxf7QAQQpAAQ7gFl/GkRyXquIpeOlV2WER5v9N6rVV1DMpwII
0zlVO4v7O5Cts1nqzxxdfsUHu1yNjg==
=3CXS
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
