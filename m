Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A88D6654
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 18:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE0FE64;
	Fri, 31 May 2024 18:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE0FE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717171651;
	bh=xEdqlVv+yc6xxPC8F436pV7MA4qGjyS+19cc5fL/qdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fu1oTYC+ZP4wTR0ZNYQ0g555KmVumfndZcXwVsBUfRPEPljhhzQ4j2UFtNHW17lub
	 /VdhActpIhrc6QMX9TVqppNaS96SzuBTNLoRbsJ5wg421WXYhiUod+XOrjDCWFdBUM
	 /7WCedCw+D7okzVN5+Dfq+gRTLZK9tquvBgPFMWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BC88F805A0; Fri, 31 May 2024 18:06:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC16F80579;
	Fri, 31 May 2024 18:06:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F28AF8026D; Fri, 31 May 2024 18:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5610BF80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 18:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5610BF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oNn7ecS+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99935CE1D13;
	Fri, 31 May 2024 16:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60699C116B1;
	Fri, 31 May 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171596;
	bh=xEdqlVv+yc6xxPC8F436pV7MA4qGjyS+19cc5fL/qdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNn7ecS+B1fnRsmy8+fl1HimszXdSyd42J3hvvDH6VHJHwaci4o+Ez3/vR/y4flHT
	 8aUVVrsXUEvmDdPEU3VsuOQAI6pib0urxj+kBakXS48rdyvD121L3v4+MlurlMs8q/
	 wkWU6mJcQCzyHSjOteiZcxQrXIAZU/nkb4DxRUGwSq0hBuUUZH37mkrkgT7NKDkGT9
	 AfgSO6wzjvces+aADq3LHoZdBoVTd/yqSQI2pvLq2lHLyb2BuiFxO2Gvq/I10XY++m
	 JzSw1s/zlo+7ZCXH99HZfZkwnpPe7283pyOHoxgiKzxImKdYesyl0n9HteStQ6EIyV
	 xjGVLgjyF8uXw==
Date: Fri, 31 May 2024 17:06:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
 <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
 <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yZnX6EMpaBNVB9zA"
Content-Disposition: inline
In-Reply-To: 
 <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: VWGWD6VD2XZ7POS6O7QPQUPRSIT5EB43
X-Message-ID-Hash: VWGWD6VD2XZ7POS6O7QPQUPRSIT5EB43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWGWD6VD2XZ7POS6O7QPQUPRSIT5EB43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yZnX6EMpaBNVB9zA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 10:48:14AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > Why not just use the existing compatible - why would someone not want to
> > be able to use the ASRC if it's available in their system?

> That's true but it will be a problem if both `fsl-asoc-card.c` and
> `imx-spdif.c` drivers have the same compatible, and they don't
> have the same DT properties.

So merge the two then?

--yZnX6EMpaBNVB9zA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZ9YUACgkQJNaLcl1U
h9Ah0wf9F6py9uWrUIg1Rnm8ihwTDC9bWMpewQrTH27b7Ps5H2TxzLO6KV2GCTHH
bAcv+oyDym09iXKcPq3vvTrenJ0iPIaZWSOOwYS38JtGL5dAMnv07C3R6iWJJd98
z94n+vvDb3EL3UBU2+atXg0gUN5e4ekRdLRf7MmkjlGRszzVTuUafLdHUue4uPRw
gKDNcu2v2gC2e3OaZnA5jQh5ypP74fLrnWxyktzZg8acu482DkDBA7h13lSFCF7H
sZb+MsvHM7euPdKQ9nwfFk7bVErS0yb3PEPvNrd0ZJNvEE2aClUiFgNlKfNUY1hu
PvxfhbZEbZGiNyV8WXYwqtqGyzHB9w==
=o/G2
-----END PGP SIGNATURE-----

--yZnX6EMpaBNVB9zA--
