Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D36EE6D4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 19:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 801DB10E3;
	Tue, 25 Apr 2023 19:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 801DB10E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682444048;
	bh=mcnUcuZCsp42gOl0koyvCmjFpEs0zWYiqO16h08PCjA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wi90gqkYlNxSKA+DlaoLT8SBfiVz63PwfgpHZql8RTpVbr/hP+pT5q9KWXHVkz5Tc
	 VEZU+AQK8YhqLg+/xJBK2wR5JTKAgbAFSnq/Y/HG/nm9y9gEhFyxl9+tsLcLtMYXce
	 aldKKf+KY68RhsYy+iKAklLrMyhq8582Qe7Qx8/E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A44CF800F8;
	Tue, 25 Apr 2023 19:33:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74DFDF80236; Tue, 25 Apr 2023 19:33:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 036C7F800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 19:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 036C7F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aMVYvKWD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F32262C2C;
	Tue, 25 Apr 2023 17:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D622AC433EF;
	Tue, 25 Apr 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682443989;
	bh=mcnUcuZCsp42gOl0koyvCmjFpEs0zWYiqO16h08PCjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMVYvKWDZ4NCuDhOb1y5atMlF1Y0M9iCVAWPsMGKAJrdFeuPJ0gC1F2uxB8nbcSiz
	 dqR13DU+eu0L58BuFuDvnHdjpiAMtLSxQIEGYN3h+2WiiU61WQgz07AD7Q2qVt0eJt
	 jP94kH2s2qdtjDbjOWXmYaGpSR/ZKSc8Ye4mmFBbuM8QO6Q+8zhcY+FtLBXC019Msb
	 j7t4LVSoq62WmLyVDQiFcw4t4Cl0YSbwQopnBQ4f0WFe41aHswhlDQBh5goRQR91Rd
	 rlYvFzwXMr/AxCKV2fIgOAtWmIFeNMxsLjSXq2D1cBTjvfZ2mrD4MRvEESRk9mcVvR
	 uys9mkE0bMcMA==
Date: Tue, 25 Apr 2023 18:33:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: sound: Add simple-iio-aux
Message-ID: <7682a443-7ae2-4bc2-9581-304c7e72942d@sirena.org.uk>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
 <20230421124122.324820-2-herve.codina@bootlin.com>
 <20230425173029.GA1967523-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QVyLAfDfdBkSU7kb"
Content-Disposition: inline
In-Reply-To: <20230425173029.GA1967523-robh@kernel.org>
X-Cookie: The meek don't want it.
Message-ID-Hash: 46UCJ4I7XGND3OO2UOGTVPVB6A3ZUCNQ
X-Message-ID-Hash: 46UCJ4I7XGND3OO2UOGTVPVB6A3ZUCNQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46UCJ4I7XGND3OO2UOGTVPVB6A3ZUCNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QVyLAfDfdBkSU7kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 25, 2023 at 12:30:29PM -0500, Rob Herring wrote:
> On Fri, Apr 21, 2023 at 02:41:19PM +0200, Herve Codina wrote:

> > +    aux {
> > +        compatible = "simple-iio-aux";
> > +        io-channels = <&iio 0>, <&iio 1>, <&iio 2>, <&iio 3>;
> > +        io-channel-names = "CH0", "CH1", "CH2", "CH3";

> Not really useful names. Do you have a real example?

I fear those might be real names for channels on an IIO device...

--QVyLAfDfdBkSU7kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRIDs4ACgkQJNaLcl1U
h9B3TAf/cTeNpl+HMeW2P0Vb5nstfBc6zxXBQOKy5lEeUHK8Gl78nKrJyAGI1j2A
XfAyeEhz4pNgn/xIQ/8bV41cnTMawrGJeZiNiq/+3ns2u2V+2XkUPBv6R1B5i629
xI2lyb4p5VlnX6sRCzcvnXFyl1aT71+Rw9xOAjuJB+l8Y6k86eHVlV9bDIM2w6/3
TrJtACmWndoZhtS9PK86WA9WYrMnjBflNG6KmeeKxDHl0k/PsCvbpijSZBb6e3QO
zg8BcfitzHMyCcmTt643bGufvXRarx+y2OdU2glNckGHXPSeCmXHCU/jUNgnLwqW
d2OEVBQZOmA3Btwz9T+eAUuggPGb6A==
=ax2u
-----END PGP SIGNATURE-----

--QVyLAfDfdBkSU7kb--
