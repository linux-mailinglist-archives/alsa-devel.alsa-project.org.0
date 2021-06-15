Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05833A7E46
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 515D71693;
	Tue, 15 Jun 2021 14:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 515D71693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623760629;
	bh=3Wq2+8NVL2BkUnnxNcF/n58X+TgoV/vpvH/oU15vV7U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=StKf2lvGYdduB4dUiCn7RNmqkPVIpGE46b2mhvWdqx0MtFumrrlFHJBZax4gtuAsQ
	 JVIET8dYVG52Ird6Vw82WtfAlap8pPT4shsZTJhw1x3zYuTHTLcJctBYO44UwXqM6I
	 SIvCfst5/cpmmgjHiB9vkBKDUKpwRZyt9RfS+F/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B254F8025A;
	Tue, 15 Jun 2021 14:35:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1224DF80171; Tue, 15 Jun 2021 14:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 808A7F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 14:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 808A7F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nVV1K/cb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8483261439;
 Tue, 15 Jun 2021 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623760530;
 bh=3Wq2+8NVL2BkUnnxNcF/n58X+TgoV/vpvH/oU15vV7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVV1K/cbGczQ8QwJv9mbThJVKX9OaXYWRSR8PYi+0/gCIM+rOPoyA1Cu3LXcJho39
 m3xHypjuHeWpIJQ8xjLo5HDnaBCQLXMl8MwWNU+UwhQCEyfZSud0dh81t4oOC82S6c
 xSTNFdYf35WNAVeo+L6ZEv8qWM7+kWGLOWbOducN+uOUaBPy+GTypudmXIp4VepOKv
 0a/Bs5+0R1OZd7iMWnNaAq5lTa/nQQMrqMo6NWtX7JY5k7FdNjL2tJiuOH9Hu14GWm
 lmaApRAvGq+Ph5A201h97LmvDs2VXxVEJZ7KPH+7HKCsGA4I9dPdP2bHZPW7LTWzNd
 3wrn8sk0jqfUQ==
Date: Tue, 15 Jun 2021 13:35:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: remove incorrect module
 interdependency
Message-ID: <20210615123206.GA50640@sirena.org.uk>
References: <20210615094839.27237-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <20210615094839.27237-1-srinivas.kandagatla@linaro.org>
X-Cookie: Simulated picture.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 10:48:39AM +0100, Srinivas Kandagatla wrote:
> For some reason we ended up with cyclic dependency between snd_soc_wcd938x
> and snd_soc_wcd938x_sdw modules.
>=20
> Remove this cyclic dependency by handling them in respective modules.
> Without this below error is reported during make modules_install

This breaks an x86 allmodconfig build:

/mnt/kernel/sound/soc/codecs/wcd938x-sdw.c: In function 'wcd9380_interrupt_=
callback':
/mnt/kernel/sound/soc/codecs/wcd938x-sdw.c:184:3: error: implicit declarati=
on of function 'handle_nested_irq' [-Werror=3Dimplicit-function-declaration]
   handle_nested_irq(irq_find_mapping(slave_irq, 0));
   ^~~~~~~~~~~~~~~~~


--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDInn4ACgkQJNaLcl1U
h9Dicgf/cDl99zA5mgDwaxaR3yr03dF4EsFzPUGjF9mrNYmBCckOJEU0Wg6cA8mZ
lhYYhyCzxE1aGHrom2kcY+c4h3T5KNzKzqprikedSz5oNldntR2Ld/I4vhkxkIiH
O6pUUTjRQEZLTN1F0JJnLhy7GeleTSG0hDGKEwPBAX820B1agC5vBYDl0SKB3shQ
8VG6r8PjNjBC8IccvXAna/yBGA+bF0+ll9wdD9aTzeyGB2wXsbv0vSIYxKl5CetC
Pcve/AZx5a3nwIqdR6QVqowB/Rj/aIo29L12RJUThDbt9yVCboQW6nPrwtEpb0zM
oOIHCadWaUu3UxQlje6jPjT0xDWvkg==
=17D0
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
