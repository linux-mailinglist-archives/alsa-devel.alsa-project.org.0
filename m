Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4372CF02
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:08:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA1B85D;
	Mon, 12 Jun 2023 21:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA1B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686596899;
	bh=mk05hiqVuQOkNG31wsfdF8l9b1T8ODQwo8DQQ3yFd1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pOWhJCfsYfZGA2CqOZ+Ueev5FJgXipeTpMuTJ2KW/TabCi7OPHaMUFywpDqdOYx+A
	 XZQnegbxO3WB7/DL4WEVCUqHdKXdJXv0Er7qgU/xw0VfYUA78kYlPEqn6q/+PFU+E2
	 VYH3xRf0Sl3dA2pxVD7miO9btZhyxfvhxDvAVtX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09D14F8052E; Mon, 12 Jun 2023 21:07:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91281F80155;
	Mon, 12 Jun 2023 21:07:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 566E0F80155; Mon, 12 Jun 2023 21:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA8E5F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8E5F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ErGzFvvF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EAD9162537;
	Mon, 12 Jun 2023 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE723C433EF;
	Mon, 12 Jun 2023 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686596840;
	bh=mk05hiqVuQOkNG31wsfdF8l9b1T8ODQwo8DQQ3yFd1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErGzFvvFq6o4ZGVDQZ/vBfQpDXY7Nyi/gjUsN+rs0sz3BVdqcW0IWGxWYO96XUZSy
	 PPVU0mpKJwsSrx4DsUfS+PEFoZy39V2IZZeRgK+NmzYQa8ekzQ5KmMrxhzpECRyKX1
	 qbnzbqfJUfznMRx0TmQak09ozXBQ/DqVBFGPfCQuo8KYnToit2fnh0czlvu/TN+NgK
	 QrUoRGxlksjXznt2p80FNfEjEfx93xiP5wgedneppWDIeqTFvh1ECmbuA4hNFv3PK4
	 neuUG7CMpB3KgcQnWEf+lkbMdW/XgRdOZxKovmnks6lSxbVwhNLmdE09Z+hqrHQl1N
	 if5SURcRhNISQ==
Date: Mon, 12 Jun 2023 20:07:15 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 0/3] Add Loongson I2S controller support
Message-ID: <31bd1de1-feb7-4544-aca6-cfb983722057@sirena.org.uk>
References: <20230612085048.3039471-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aGAp6bLuWy6L25TL"
Content-Disposition: inline
In-Reply-To: <20230612085048.3039471-1-mengyingkun@loongson.cn>
X-Cookie: If it heals good, say it.
Message-ID-Hash: ZIRA6CK7BKWDXKDL4NQAP343NKVRPYIY
X-Message-ID-Hash: ZIRA6CK7BKWDXKDL4NQAP343NKVRPYIY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIRA6CK7BKWDXKDL4NQAP343NKVRPYIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aGAp6bLuWy6L25TL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 04:50:48PM +0800, YingKun Meng wrote:
> Hi all,
>=20
> This patchset adds support for Loongson I2S controller, and
> introduce a ASoC machine driver for loongson platform.
>=20
> The Loongson I2S controller is available on Loongson
> 7a2000/2k2000 chips, works as a PCI device. It has two
> private DMA controllers used to playback and capture.
> Each DMA controller has one channel.
>=20
> The ASoC machine driver adds support for audio device which
> using loongson I2S controller to tranfser the audio data.
> The audio device uses "PRP0001" as its ACPI device ID, which
> provides a means to use the existing DT-compatible device
> identification in ACPI.

The code here all looks broadly good - I did have a few review comments
that I sent in reply to the individual patches but they're more
stylistic than anything too substantial.

--aGAp6bLuWy6L25TL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSHbOIACgkQJNaLcl1U
h9DUAQf8DIP6BdZ4T6E3xGHa2YdR0z6PaBGz4mRmB9uiBBdSyk0dpa50B6luQF39
RKmdnMfjmyUnENOCDs2fYvaJKyuL7d7koZZlRszE4zcooow4AX8P2sfie2rkGQ6w
EI5+5RcDJeJXtEvfPyy9JLNvJfcFyEb90UfatTXQ7H/+lgLKZd9x+IFVp3dzqrJ3
VRCoe0WI3TiFklsl8vaoq7iOR1MR++hHNUEhiVqghQK1lnM3COGMKzZWCoDOMvpx
ElMZotNr4EtyyCd6Rc1cBdosKQXyxPATRHuKACshxrr3AQ6nIY3zxRS4ee8tFc1F
A79RICNenb4blFgjBLC7BSXs2aBARA==
=fZju
-----END PGP SIGNATURE-----

--aGAp6bLuWy6L25TL--
