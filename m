Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005D7F4509
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 12:43:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B15846;
	Wed, 22 Nov 2023 12:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B15846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700653399;
	bh=QEKSREZFB9WcaZBZKKMacGvB5GHLDryHAUrK5PwyzeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LoQjWIQ/9vWatpxjaFyAsyaRG6taZDPE2c95KgVX8DmyAh19CBzKHN3nLa0kAkKpn
	 OGy7GoJpfmEeQJl5Xn9yR2l0s8zUYW5CrPX9FBYe4nOLndhVylSQ8Xdz33ftHqGCkR
	 nQa22z4tj9XVHh8EI2LbMydcGBQKk/lZ2nZifHwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDFDF805A0; Wed, 22 Nov 2023 12:42:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5E3F80579;
	Wed, 22 Nov 2023 12:42:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30697F802E8; Wed, 22 Nov 2023 12:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5270CF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 12:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5270CF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WBqiAAQ2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 718BFCE1DE8;
	Wed, 22 Nov 2023 11:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAD1C433C8;
	Wed, 22 Nov 2023 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653350;
	bh=QEKSREZFB9WcaZBZKKMacGvB5GHLDryHAUrK5PwyzeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBqiAAQ2L28tf9RBZgy3zkdD02qnghFQovUzDCLddDVS/blqqN03OejYwzMPFRTaD
	 aneNmQlPQXa5R41Fm/hNHNUHglVTWWoiNVsV1ijnMeet9atGN10P+HhKBx7SZy3yJR
	 Q2yXF0FIAi8V9bRzDl6HwTY3OGTZIiBKcNOIJl9ggZWfSQfSxwOIk1pawH4fcd/LGe
	 nAOPB9MwDW6P2BpOqu8LN7gd9Iey77qqozVvAq7BQxs9aS+VyiMiOgehCdBEwYqNTq
	 W22N8LsD1LvYo7qJf4esfClOt2IeZabgCiLjDRR30j4PlbDK6sCX1l6ibTmp/Vdr5m
	 KfnCAUISVWmtg==
Date: Wed, 22 Nov 2023 11:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, paul.gortmaker@windriver.com
Subject: Re: [PATCH 2/2] ASoC: cs4270: Remove unused codec
Message-ID: <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
 <20231122062712.2250426-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sizIwLURlAo5DBqL"
Content-Disposition: inline
In-Reply-To: <20231122062712.2250426-2-mpe@ellerman.id.au>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: RR3QI36OUVPIE3I6EPSZYDUC64TNOVXX
X-Message-ID-Hash: RR3QI36OUVPIE3I6EPSZYDUC64TNOVXX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RR3QI36OUVPIE3I6EPSZYDUC64TNOVXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sizIwLURlAo5DBqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 05:27:12PM +1100, Michael Ellerman wrote:
> The only driver to enable SND_SOC_CS4270 was SND_SOC_MPC8610_HPCD, which
> was dropped in the preceding commit. Remove the codec as unused.

There's no real overhead from having extra drivers and we do have
generic drivers that people can attach CODECs to.

--sizIwLURlAo5DBqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd6SAACgkQJNaLcl1U
h9AI/Qf+J4DIRnTf3NQShXZHpoX3Pl0SkRoY1ASOBLv/amwIrdoVcjmfHrm8Mth0
cJtFdkyQmmjeem1kXEZm29r1Ro4GyCaRUYQah6JHIbJPJbIOwStqbdI2WmYL8jw1
GO5y4mE6ZVg3dUXwFm6znHoylg3FRrVaLxGxBnXyrL3MMNuz9uPyDR1rFUFTl8WU
lvMR2VOuMawEFJ1GiQ6aaaLu9t8i+8VvoKSn7GD1xTI2tU9PppIT4R0s3CUogNjK
DRx2A9aLQcQmdXN+2LykYfsOw3UZUwOEZGQXZwSNKYXRKu4reowv/ytzO8RaEAxh
h5OlnboVbe6voabyne7F1oieLvRg+w==
=YIcX
-----END PGP SIGNATURE-----

--sizIwLURlAo5DBqL--
