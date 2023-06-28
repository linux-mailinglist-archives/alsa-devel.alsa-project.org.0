Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5E741078
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7065C20C;
	Wed, 28 Jun 2023 13:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7065C20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687953266;
	bh=xVwb1hbny65LhXYunDaleFlCI4FDcQUSrTRPLj3KOu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jUE27BBKlJUaiBYNy7JuvIByLW5jhYNTmxuV0FC+9f2AfnAltio1DnnF1Zx1dOSqs
	 ZBtgHJDCYB6N3aUCxVyM77bX607jgAnpuhWviI87yWw6JqhbjetdqtWeFG0hhFpRp6
	 rdo2/YDio3b68vauuEABZSxoQRZ/h3Cppe2eZN9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD10EF80124; Wed, 28 Jun 2023 13:53:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81949F80124;
	Wed, 28 Jun 2023 13:53:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70A14F80212; Wed, 28 Jun 2023 13:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DAF0F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 13:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAF0F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n5+HSauX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C34361218;
	Wed, 28 Jun 2023 11:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E20C433C8;
	Wed, 28 Jun 2023 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687953204;
	bh=xVwb1hbny65LhXYunDaleFlCI4FDcQUSrTRPLj3KOu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5+HSauXIMq7f8QOzjxVRIWnK3eqJ1mLau90HUb4uVZsHYw7BRnhCeuJGwyOX6qWV
	 E16XKq5bnSNYMFnZCMR1M0ZYF8ZNUSO1L4Jylwy4G3PDb5X8+WrSS2ACWaT607iITu
	 fcKM++1YXmWkvyxdHi458eviBa+KPKIynKx9odHdDBLpiM95i0BQTri/X43JvEE1MG
	 oWAEQTUrC93KxgYtJTJqbS0p5EPVDvgg7Whzux/W9S+Yq/jAE0Zx6QbkK1M2lfBFgs
	 9Ljvr0Go4pxMvx8QlpRDw6Jyulq19dQHwUf45xFICTrZSXuyq2nV0NxOsvHymBVcox
	 L+lMr6g18Ojag==
Date: Wed, 28 Jun 2023 12:53:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Message-ID: <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hBi2IyGgla1GexBf"
Content-Disposition: inline
In-Reply-To: <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: G6AIYBXGDD2CXAPU767OQ6SHFLQFI7TY
X-Message-ID-Hash: G6AIYBXGDD2CXAPU767OQ6SHFLQFI7TY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6AIYBXGDD2CXAPU767OQ6SHFLQFI7TY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hBi2IyGgla1GexBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 11:26:20AM +0100, Srinivas Kandagatla wrote:
> Currently firmware file name is autogenerated based on card name and mode=
l number,
> however this imposed a restriction of finding firmware in a single firmwa=
re path.
> Platform specific firmwares are normally located in sub folders of the So=
C.
>=20
> Provide more flexibity by reading firmware-name from DT.

Why not try a series of firmware names/locations generated using the
identifying information for the card/system?  That way we don't have to
put a filename in the ABI which has fun scaling issues.

--hBi2IyGgla1GexBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScHyoACgkQJNaLcl1U
h9A3/Qf+M+M8zuT/1Y8FhzspndLccu9JqoTFH0Rx5lIglukamB7ABbwn7IZYk2Q/
A0l3/Gs8GOpaNVeWpWDp603eHiEdgL3Lxuoe5uFfIWDYiciH8JIYgenbpqJSpleG
NmcSFUwTLUC/Jd3pLlbBmjhRL8SncpXvEuReausjHNdnSzMqZurMFhC5wzli4Iv4
eFpFGmYvQ0S1ljHC0Kfs3s7TC9xfk5yNYBcRoC3V1tzQkFsBm7X237QCvyjQO7Q8
4d03zsBHN8y1jK+Iaz3qGLwu6MHlmkKkH7ZtKlPNDNziMjyg3F6XwiobWukjWYu7
/OqWgA7xwRYquR7taXpc2cpK116OrA==
=3HfF
-----END PGP SIGNATURE-----

--hBi2IyGgla1GexBf--
