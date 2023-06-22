Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B673A112
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 14:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4B5839;
	Thu, 22 Jun 2023 14:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4B5839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687437525;
	bh=9XaDF2RthAQmdrdmCFkOGNNhCvKsp8J7wQuzuY1Xzo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ck1syB2Hh0So61t5yU9yGp+D5lNpcBCqHvjbg8Z9GM0XVgqlKdKmodYYCEElnUWPK
	 omV4zKdnVd6oW0gaPHPjILz4QyNRdxUOMiihw8Fto/UMrNgrUniB+mHpgoOL1xk40B
	 5dL2q6Ro9qKYQBsBfdTklX6LZXAUOFx4EcP5habM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE84F80130; Thu, 22 Jun 2023 14:37:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A1BF80132;
	Thu, 22 Jun 2023 14:37:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB958F80141; Thu, 22 Jun 2023 14:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D292BF8003A
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 14:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D292BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q3iA/PY3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C51B617BD;
	Thu, 22 Jun 2023 12:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FDAC433C0;
	Thu, 22 Jun 2023 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687437445;
	bh=9XaDF2RthAQmdrdmCFkOGNNhCvKsp8J7wQuzuY1Xzo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3iA/PY3K0c6DyMFWt2N6acw8dbrWe9b/FUCoSWn4IOy2pW78FRVUT+p5lRksAhy/
	 WGPLppGW/kvP9UIxIljb4+YKWK9tDkBu+Pjr1JxFuBh5f5bDxDRdStXNdWxJxGYR9R
	 2R2psweZ+UruqniqSldMKCtuHpnsb7ILxh66sytQB4wsvKpbAxt9+voBe3++hkvVE7
	 NIVHExjtdRq0EqvHD047wxTz8hqEmtQP55UNdeTuwB1OxBpbDgzky/xfr4bpGOGGaR
	 wwIZQH/WpU2I1oA4Yg443+zJoYYiC0Se7HpZG4h5hfxmtULzRUoYa1YYIrNOl+Vxm6
	 QQ3cH0sGUwkvg==
Date: Thu, 22 Jun 2023 13:37:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Laight <David.Laight@aculab.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
Message-ID: <16fd9b2e-bb57-4833-a79f-e2cec3b8635a@sirena.org.uk>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
 <20230615152631.224529-8-herve.codina@bootlin.com>
 <70697b976107473b8779eea7d6c8a189@AcuMS.aculab.com>
 <20230622143233.7300a813@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gEIzLdQpVdT262K/"
Content-Disposition: inline
In-Reply-To: <20230622143233.7300a813@bootlin.com>
X-Cookie: Please ignore previous fortune.
Message-ID-Hash: LHDIJJWLYG6CY5W3HR2EWOCYMPTVGN3E
X-Message-ID-Hash: LHDIJJWLYG6CY5W3HR2EWOCYMPTVGN3E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHDIJJWLYG6CY5W3HR2EWOCYMPTVGN3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gEIzLdQpVdT262K/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 22, 2023 at 02:32:33PM +0200, Herve Codina wrote:

> Is it ok for you if we keep as it ?

I think any issues here can be addressed incrementally rather than
holding up the rest of the series.

--gEIzLdQpVdT262K/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSUQH0ACgkQJNaLcl1U
h9D77gf/WZKuHeud9npCKNm315R9EOMXA2ffWN2OykjOoq74ujmcoqY53KEBaRWp
PJQarOs2YWJvoFTo4xqTNy1nkSxEjgw+aYk8jq21txGWU36YzQwuDAQZRvdkVxlJ
gwxzRvrGlJf9i1G3peKn4SWSoSmuyz974T4YiOcs1tqrPi1BVRHjRJmDgdyysDWk
rVY4DaBH+TzMR30K621RWC/8PUY2AG9LhMcO1g5TUmmkx7uNaOb1/U9hwXWTAaUP
MzURE0Map8d4wYa9li6pCSPhQ0egfE5gX9URMon5APX+ai6MAm1rkyr+2x/5MyDx
6lZDCohWYdGVRtQRDVL03GUIdONLwg==
=FIdM
-----END PGP SIGNATURE-----

--gEIzLdQpVdT262K/--
