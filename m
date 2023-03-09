Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F46B2124
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 11:18:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDCB189F;
	Thu,  9 Mar 2023 11:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDCB189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678357094;
	bh=ZWX9MW98gflRPM5o6Ec8MnvK2pZmd98e8wfar5XlSHg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XcCQcGpn1jXBbWzIU/t1WBCZJfJgBnWmh4N6VtytnHrgm5Hsm/rk9PhiQgfvZA6Qb
	 /klI/dUzVSqVyKmG5Akg0PUD2xq3QDKF30iYTxd4Zfr0gSSh0hWoOqcJUYIb4blOzR
	 GUc5pUOt/O9W50G79d9dzF6FAymyWKvCaXFxskOs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB53F80236;
	Thu,  9 Mar 2023 11:17:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BD1EF8042F; Thu,  9 Mar 2023 11:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE3DFF80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 11:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3DFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qcOPoABF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF1F8B81ED5;
	Thu,  9 Mar 2023 10:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF87C433D2;
	Thu,  9 Mar 2023 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678357032;
	bh=ZWX9MW98gflRPM5o6Ec8MnvK2pZmd98e8wfar5XlSHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcOPoABFf3qMlwGJkcAMTvhuwcfAFGS5OssE+3W0Lzj0PUcNA5AA4W0S825ZGTzAn
	 vc1JybaA49YPF6Zc2IHRQcmzbhHgrw4oOtnPYY3pfeHHH2C67zirf4jGXKXGGyI0y0
	 uxCfr34qcBBiC0CFKky7LDgIusFay+6/t4v8ZI3FwwzEk4rTigWBvaDFQ7lYYzqufq
	 x53n16kKvC1LbNU8pdZGnRem4OdgdFmwAmrWyHE9ulDgBmBsK3B7F9SfvagusUAt76
	 7MTuXTFZ24lIeOlm8CKPJtmiIr6ZBf+ObjrOLWdJTkJZBNNmMkxpof2C813dVf4boI
	 rqQj3YcqdvTFQ==
Date: Thu, 9 Mar 2023 10:17:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Subject: Re: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Message-ID: <e1446fd1-adff-4a43-aeaa-e0ea6628722d@sirena.org.uk>
References: <167829274851.108660.12928497382811712287.b4-ty@kernel.org>
 <20230309065432.4150700-1-emas@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eh6qlmb9AS2aCQYD"
Content-Disposition: inline
In-Reply-To: <20230309065432.4150700-1-emas@bang-olufsen.dk>
X-Cookie: I will never lie to you.
Message-ID-Hash: QQYNW772ZZAJLPIPK5NX4ID65CLWVWSA
X-Message-ID-Hash: QQYNW772ZZAJLPIPK5NX4ID65CLWVWSA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQYNW772ZZAJLPIPK5NX4ID65CLWVWSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eh6qlmb9AS2aCQYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 06:54:41AM +0000, Emil Abildgaard Svendsen wrote:
> I have accidentally inverted "tx".

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--eh6qlmb9AS2aCQYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQJsiIACgkQJNaLcl1U
h9BleAgAggfRwJUyHjrjMsc+OB/tRHz41D7G4VIhoOX24N2ycQjV6IzZ+U6MQ7gO
OTLxjIZds/skaKXchIZu4gCksT2H5JTr48P1H+U4nhVYDyaDK3tFdploGKuJ9jsg
yg4MgjpuS24fr9tVqewF8Bb3HNECsgGDYQqe+Rbaz0Ql81s3ZD3LQFltMfQhF/em
RFNtTC3BdfJU35goY9v31aoeLbG6QcwrJxSDllCilyRFP132rLaHIwFlOaKKumtP
+o3of4/pY4XtrqIPMGuRiYM6uu68AIQUygb01WJZum17Za44urtjJ1lgcKtfQ1pr
cO0dqh97rYpFE4CJkiFzoupEvj3DyA==
=aQX/
-----END PGP SIGNATURE-----

--eh6qlmb9AS2aCQYD--
