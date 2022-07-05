Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27B567909
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 22:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88AA516A2;
	Tue,  5 Jul 2022 22:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88AA516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657054790;
	bh=IbmVrAKlWijkdQ5ebbEp6oCPsHF0O8OlYtTkQZBGwDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGbt1yn3JFwLgjCfvZU1y8wznA6s+N8b4kMsCxV6gZp/D17/i+vRXwIOhUXz3lky/
	 TN3+MlYyFK3FIzufM760uBHfYy9eek9OKgzHCD3T7+YmsKm2BG+hvT5rdZRbNfxNOC
	 ayqgzSiOAjpeXbLnntcwJo6z8PO+A96zVxVYH5/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E89F80104;
	Tue,  5 Jul 2022 22:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17749F8015B; Tue,  5 Jul 2022 22:58:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D0A6F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 22:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D0A6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p0tanYVR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B8B5B818C4;
 Tue,  5 Jul 2022 20:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02891C341C7;
 Tue,  5 Jul 2022 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657054719;
 bh=IbmVrAKlWijkdQ5ebbEp6oCPsHF0O8OlYtTkQZBGwDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0tanYVReDJ/ZO3qbCCJdXZxLAzHEhYecLdl4cTFAJCcumA8WnuIaFxmiNgHWWlX/
 0JFqhmWdmHMe+HDdpr3C6BCxTbT/5YmDHDZAZQf/Hjcw5hoQfSSrELhxJqxOSFOLPr
 uhtzLIiogtmCA/1AOHYV67r9coXgD0Z1e0QVWSePBK7aebmuJLiwcSP12djKDnVlL2
 j4/wJCZtiBABHXUXiwrpfiYSqxTAS0chZhHgj99BA5BqwSjfgIpDwxHQhykMNPJ/Pz
 DQyCMU1ET+zFkrHJVwqSVGncwD2fwfOMyGnCRARSUXcTqZTnx2c/RThtv9gyKSXzWg
 2N3L6GOpZPd6Q==
Date: Tue, 5 Jul 2022 21:58:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal
 bias support
Message-ID: <YsSl+JOmMpGLK1Xc@sirena.org.uk>
References: <20220621035452.60272-1-samuel@sholland.org>
 <165636279016.4185952.318954133536578049.b4-ty@kernel.org>
 <3139722.aV6nBDHxoP@kista>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZVk6fcVA+73A5IXw"
Content-Disposition: inline
In-Reply-To: <3139722.aV6nBDHxoP@kista>
X-Cookie: Only God can make random selections.
Cc: devicetree@vger.kernel.org, arnaud.ferraris@collabora.com,
 alsa-devel@alsa-project.org, samuel@sholland.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, mripard@kernel.org, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--ZVk6fcVA+73A5IXw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 10:12:56PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 27. junij 2022 ob 22:46:30 CEST je Mark Brown napisal(a):
> > On Mon, 20 Jun 2022 22:54:49 -0500, Samuel Holland wrote:

> > [1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
> >       commit: 24e0b04dd42be34ec4b18dc1a1e139d66eb572a3
> > [2/3] ASoC: sun50i-codec-analog: Add support for internal bias
> >       commit: 25ae1a04da0d32c22db0b018e5668129b91fa104

> Can you also take patch 3? You picked bindings change, so it's easiest if=
 DT=20
> change goes through your tree too.

I can if the sunxi maintainers like, but normally changes to the DTs go
via the platform tree.

--ZVk6fcVA+73A5IXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLEpfcACgkQJNaLcl1U
h9DC5wf/RMKBqpKm/zHIhE2dv1fovXxq6NieGY7O8vL1kob6qMCw/aYUBbS1RVld
5qIgyC21wmo4MSF2QJJRcO+4N1zqfwqBG8kxyBVPKBi7bZGlDRUmDjAbRQh3fhjM
KE4Y83EURjzifgk1Vtk9LA/8X+XSiCkMD4m80bLHIzMChro6d8KMnwjc4MKY7lpu
rgwmztfYJHGXI+6vdfegXc5V8+OaIF7FwyEltTZvbnF2RO57oFmh25t1IJEpoRe4
RA4KhB2CPwYqP9sGZWVs9Xqx3NYxVJylXI5CDlxyHl4dDudj2PnpsV1PgNbca4Wj
dP1Wfstm+Na+EPYOvd8/+4tNjjS0rw==
=cr2k
-----END PGP SIGNATURE-----

--ZVk6fcVA+73A5IXw--
