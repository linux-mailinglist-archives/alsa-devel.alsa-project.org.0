Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1BB46BBD0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 13:52:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C7052366;
	Tue,  7 Dec 2021 13:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C7052366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638881566;
	bh=Lauct6mJnrC0lFeI5SJXPUsWS66dw1/YWLLELZ3IsJ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=le/06nFFoS5bplEoLl3f56JdFu1Pj2w8/4sOEDiS8RHlSJOf+eKv0Xh6fSRx+bsCF
	 QkbUjPgBpPtAiNvKdWpG+uIOF7LMTnbcO5pdBJX//z8Lu39RUjVqZMgpVKdCOSvmoW
	 J/eZlLNhmLIvKQU1p8BflwQ4IOpNyv6qAkd1vEB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3AAFF80253;
	Tue,  7 Dec 2021 13:51:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAAB9F8028D; Tue,  7 Dec 2021 13:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B530F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 13:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B530F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g9jFpGmA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18E74B81754;
 Tue,  7 Dec 2021 12:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A8DC341C3;
 Tue,  7 Dec 2021 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638881482;
 bh=Lauct6mJnrC0lFeI5SJXPUsWS66dw1/YWLLELZ3IsJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9jFpGmAW5gdiBdvK6IkgfOnFrhnEH+DuyvS1FznPii4tFUjdTMdbVrmGtuPh3oiJ
 IBeQDVq9xhS4jkAZY03CyRORD1k+iFiBZW9gVIQOqAe6rMD79n2z06AF4i1chUgMn0
 q94iL/85LWs29FWgee26nz2x91P3BAme0s5oqnTTzDZYHwTfddeV5PY0HJdwc8+iHg
 LUs4nCR9KGJb3kjy+3BViSWTiCgdiMTyP8R0am1U8ntWCyhPfN5cLr5BYUqph+UBoH
 JT3xxs0PSFnxnIHA/8TsaAnF9h/S5vT4fEG6aAxuAwuGMt8Oz9e5nA0O2o/xmzQHAr
 SV1UnzQtkCGWw==
Date: Tue, 7 Dec 2021 12:51:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ameer Hamza <amhamza.mgc@gmail.com>
Subject: Re: [PATCH] ASoC: test-component: fix null pointer dereference.
Message-ID: <Ya9YxoUqkATCOASh@sirena.org.uk>
References: <20211205204200.7852-1-amhamza.mgc@gmail.com>
 <TYCPR01MB55813B26BB2B3BB6D1E072F2D46C9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
 <20211206092937.GA5609@hamza-OptiPlex-7040>
 <TYCPR01MB5581998AD64AE249C7D86C26D46D9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
 <20211207081522.GA9690@hamza-OptiPlex-7040>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pA7XGybufHONhAT+"
Content-Disposition: inline
In-Reply-To: <20211207081522.GA9690@hamza-OptiPlex-7040>
X-Cookie: Only God can make random selections.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
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


--pA7XGybufHONhAT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 01:15:22PM +0500, Ameer Hamza wrote:
> On Mon, Dec 06, 2021 at 11:19:36PM +0000, Kuninori Morimoto wrote:

> > -	const struct test_adata *adata =3D of_id->data;
> > +	const struct test_adata *adata =3D of_device_get_match_data(&pdev->de=
v);

> Thanks, that's a cleaner way. Can you advise how should proceed with
> this since previous patch is already applied. Should I send a updated
> version of patch, e.g., v2 or a new patch.=20

Please send an incremental patch on top of what is already applied as
covered in the message saying the patch was applied.

--pA7XGybufHONhAT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGvWMUACgkQJNaLcl1U
h9DGOgf8DeE7v3W0DSMKplQPk7WTS8kqB2KvSaa33nkG8xCydpkF1R/KpD/TjwgY
MVjcWFyeNTqZxZUQAfdwhY2ZakLTYNeGdaUAt6A90oZBNkqE2nHe45CZrdYLoIq8
R+DJDVqg81jPkCDg7y1mxLnc1YS86nSLGjBZKN8L8ujdnBWk1XbcG4VLnaTOmUFL
uZGfwris4SWI3zz7ji6CshgOJh6qnTp7t3j8GeR9rzgI/KJGwTx7n3k2IWrGyF6T
kgbLRjgjWnfLGySjBk+Dphbiy4MN/y8CjxPOAplVOmCVs0iIvnxteoh2dar7ZUpR
9WbB9wt0TUtdRZ/34ThpENSpcl6HEQ==
=y9/g
-----END PGP SIGNATURE-----

--pA7XGybufHONhAT+--
