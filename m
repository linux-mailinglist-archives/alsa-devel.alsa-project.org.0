Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CC739F93F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856931845;
	Tue,  8 Jun 2021 16:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856931845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162809;
	bh=ari7yVWVgKH9ppjVmH7YO+gyqRCAtynmCk18nf2544A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qwW9IStmUAgHnC8/9yZRyloV3hgOMzcYbWJY3R31vi+MkK5U4R5SpN0GGPY+TboW0
	 Fo7piU5J4XMUw6HVzKLvxo/15JKXDnysKPjqjXi/3UNLCugdMBhZzQ0QIYL11BHrig
	 18A1HAJ3entUJq+Tx8a46Lwy2kVgZY5D+DJS4ZJE=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AD4F804AC;
	Tue,  8 Jun 2021 16:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C1FEF804AC; Tue,  8 Jun 2021 16:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C40F80256
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C40F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pEFiR8ed"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90CA61078;
 Tue,  8 Jun 2021 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623161544;
 bh=ari7yVWVgKH9ppjVmH7YO+gyqRCAtynmCk18nf2544A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pEFiR8edqqA7xThEI5CNAjrJ5P469BNXiyufR3THfQqasXdvjY4vs06PJ0P52KaF3
 5Q+xRvfsowpM+KvxjIMQ8yXz8A3e0RFASiB4pcX11o7sGGH1Ab7KqetKrw0mSTEGHr
 nevJ9T7ihV7jTT41CtT1eMw6uoUvwj892m+S+/mOiS0HLpTCijSX6Bkhr9yT4RXYgo
 OMurmZn3Lpmt3Tae13Uw9SjNX2im7xmIu4ToE8HTU0a8kh3i0hPAG2zyOs/ef7m0CV
 dreLNfUweCtzQIt1fpbkA4ano0iSuFlVOIU3HMGB7ofGiNLRX6exiMzWxm1+25wjZM
 MLOJzzT7UrjuA==
Date: Tue, 8 Jun 2021 15:12:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v8 3/9] ASoC: codecs: wcd938x: add basic driver
Message-ID: <20210608141209.GF4200@sirena.org.uk>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
 <20210601113158.16085-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline
In-Reply-To: <20210601113158.16085-4-srinivas.kandagatla@linaro.org>
X-Cookie: Auction:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
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


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 12:31:52PM +0100, Srinivas Kandagatla wrote:
> This patch adds basic SoundWire codec driver to support for
> WCD938X TX and RX devices.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/Kconfig   |    4 +
>  sound/soc/codecs/Makefile  |    2 +

It would have been nicer to add the Kconfig and Makefile changes last
for the benefit of bisection.

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC/ergACgkQJNaLcl1U
h9ATOQf9GVwxHqO9SFJme6lrZ7lLpmKoTnKPSTfSPpV61X1zS7itVhMaz41WbHg7
374N5eNwQh59eRjRG0zyKo1wBGh+Cgxi1gjqediOC3leMYX6WYAW1fc3+zNGjfVj
AtUPzlCIlY+P1meOf2ZTzF6UzkQZs8O/sB+SOGZr+Kh90CAwUy7u6E2AjqcMtCD8
2MOryEoXpOeo61pKEJSbKQ23aPeHU3gs0KyaVsHrQVDz8WWKmSmswtj94uojjnEw
7CsFI9rfK8g9b7SbFR5BsVS9GYf5zdlwU66dsxMGwTzuvxIaIuU13MNdkdPuZHCx
JTgKqP/iNrrgCCx8nbobinhLkU3b8Q==
=1xrn
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
