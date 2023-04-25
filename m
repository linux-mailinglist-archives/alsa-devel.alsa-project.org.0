Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F66EE65A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 19:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B93F10E4;
	Tue, 25 Apr 2023 19:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B93F10E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682442467;
	bh=SVkDAenCLc4YxC42MyvcWJ7pLg3jV4kpEunhStZAwQQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FekJiCwc2dde6pCOsqWpOEqcNRirWn19SosEYrKNnKFw8KmZmT8xgn5ypoTzwEl5+
	 lp+0nAlyB5VL2evyCr5/vLdsijIPJcdWs51mMO/jqQW263AscZ56Rmmhgu1e3ZaomQ
	 wZToCWktvi2p8g8xyjv6W0JH9f5snzF8iLPUavuY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 972A5F8018A;
	Tue, 25 Apr 2023 19:06:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63BA3F80236; Tue, 25 Apr 2023 19:06:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47C9BF800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 19:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C9BF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Exe7xCpN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE3CC63013;
	Tue, 25 Apr 2023 17:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B532C433EF;
	Tue, 25 Apr 2023 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682442407;
	bh=SVkDAenCLc4YxC42MyvcWJ7pLg3jV4kpEunhStZAwQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Exe7xCpNhU6W4Id64yndI8vqNJBAoxVFY7HJL8XxFgU28COkPmxkauWwff9WqFcAb
	 wZZE9Wpk53xRpYOqCUzJOKFSgq4eby1oeJkqd2RHWSTF6cno4iFdAnTfucZMmyq7gU
	 OV6J5HvqkocwdSi6W6XcUVLdMOQr2ed+ZhzxEalYLdrCl34vT1ny/8Qdunx1Qx1Ia2
	 solynDX8vByRMyigLCT4Oep8fADn/0dxGtKLbupBYc7hc9RJCBZg6VdAXLXddZpqs+
	 vkG8w5FggezAMyKhTeLTLoOukMKv/lAZQ9WStn834b33F+stULspTe8cmH+ASOEsM0
	 1Xxo38KiT5oNQ==
Date: Tue, 25 Apr 2023 18:06:38 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 0/9] Add Chameleon v3 ASoC audio
Message-ID: <b4990c65-7414-4119-be8a-32db4887bd6e@sirena.org.uk>
References: <20230414140203.707729-1-pan@semihalf.com>
 <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
 <CAF9_jYRqr498j=5rgeqELEaZEkMRKqBTiNvRJC2ZduZO+399BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fYZIDEQRkolnGTx6"
Content-Disposition: inline
In-Reply-To: 
 <CAF9_jYRqr498j=5rgeqELEaZEkMRKqBTiNvRJC2ZduZO+399BQ@mail.gmail.com>
X-Cookie: The meek don't want it.
Message-ID-Hash: AFWK6XJOWK6TUWZZ4L7DZGVRTNJI63DV
X-Message-ID-Hash: AFWK6XJOWK6TUWZZ4L7DZGVRTNJI63DV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFWK6XJOWK6TUWZZ4L7DZGVRTNJI63DV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fYZIDEQRkolnGTx6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 05:58:59PM +0200, Pawe=C5=82 Anikiel wrote:

> > Please at least make a directory for Google as a vendor, we don't want
> > people adding directories for each individual product. That said
> > generally we add machine drivers in the directory for the relevant SoC
> > family, is there any reason that pattern isn't followed here?

> The board is based around an Intel Arria 10 SoC FPGA. The ring buffer
> device and all the routing is implemented inside the FPGA. Is it ok to
> put the machine driver in the product directory in this case?. As for
> the directory path, would sound/soc/google/chameleonv3/* be ok?

Does the individual product really need a directory - nobody's going to
reuse the IP on the FPGA for anything?

--fYZIDEQRkolnGTx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRICJ4ACgkQJNaLcl1U
h9A8hQf9HwsB2182A00Mh2ym3mFillUx1BrvfPG2lJuDB/WB4hqK34YYx/p5XvpQ
O8FpNd77/3voqyPYMKTpScOjMnOHbkR4Y99FlmnLZmHuxYxlPRe9jB9W0VnPuIl/
Q5FdVI/jOfy5eyjNmFNmbgaDVXKky5zhe41h+sE0Us90DI5zl3p6BBnsEtac91sD
dBV59kI3YJa8+Djk2XF0ZYacP9eCICenKhKvaVrTP8y5aqHGnXwgHHQD9ahBEfh0
gu96fnw1xgm6tE3NDceY6hqKChIMOrknSLSZJfQ1It8VJGyc16kCwbCfmQY0uJvV
u/egzxVNju9UlrquK7Qn4JIir/hVgQ==
=IxnK
-----END PGP SIGNATURE-----

--fYZIDEQRkolnGTx6--
