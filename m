Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E672FE34
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 14:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6E7846;
	Wed, 14 Jun 2023 14:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6E7846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686745044;
	bh=Fmge8By/Nx8Yql8ThihnxxcBBzPP2Qfn8rf5N+JXjcI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YUjDYKY1jGYGI6/7DiFxYnR6JVFgf0FdkDps1Uzu8vMIYDOEURk5QNoCLpHv8hw4L
	 sRN5zIVtlCFGkxn4pFUogbhgabF9gfgNkZt278c4Ay7Ul7gAXGpWKjeLPs1O40ANBi
	 NrmkJHX2MDAappfVrvueZD+FeLf8Jr+ZCAYw0X5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8CFF80564; Wed, 14 Jun 2023 14:16:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CDCAF80558;
	Wed, 14 Jun 2023 14:16:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5D23F80155; Wed, 14 Jun 2023 11:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B1E3F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 11:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B1E3F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=XPHxjyw0
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35E9GDf0116018;
	Wed, 14 Jun 2023 04:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686734173;
	bh=jZILcimbO8H9jFnvBhpps4l+5iwNtwlePffU+vZJXl0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XPHxjyw0Q7oAQVl0HaGg0DsbErpLF/2yHp2cFQrxaDra2hCcgbwXRtd6I8bVRZWc2
	 LTIAOuzc2I4Di4+3FYEf2jzUywDZ3MnEfww+FFx89L3FH0O3gUoyronjc+Sq7hrdYd
	 6ft9mxHheH7h29GzgP17/DOaCRCin+ka57WhE/kE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35E9GDaN031427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 04:16:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 04:16:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 04:16:13 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35E9GCeN044274;
	Wed, 14 Jun 2023 04:16:12 -0500
Date: Wed, 14 Jun 2023 14:46:14 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,tlv320aic3x: Add missing type for
 "gpio-reset"
Message-ID: <zzblrbz4mqddye6pphgtjdeh5nrxtefgiom7j2xksrasozlma4@ohvdju6vpas6>
References: <20230613201006.2822985-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w3legnfqvlxrn5cn"
Content-Disposition: inline
In-Reply-To: <20230613201006.2822985-1-robh@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XMIDFA63QGJKVWX7HECPJV7ZT3AOSH66
X-Message-ID-Hash: XMIDFA63QGJKVWX7HECPJV7ZT3AOSH66
X-Mailman-Approved-At: Wed, 14 Jun 2023 12:16:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMIDFA63QGJKVWX7HECPJV7ZT3AOSH66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--w3legnfqvlxrn5cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Jun 13, 2023 at 14:10:05 -0600, Rob Herring wrote:
> "gpio-reset" may be deprecated, but it still needs a type.

Oops, I missed that in the original patch. Thanks for the fix.

>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jai Luthra <j-luthra@ti.com>

> ---
>  Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml =
b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> index e8ca9f3369f8..206f6d61e362 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> @@ -61,6 +61,7 @@ properties:
>        GPIO specification for the active low RESET input.
> =20
>    gpio-reset:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>      maxItems: 1
>      description:
>        Deprecated, please use reset-gpios instead.
> --=20
> 2.39.2
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--w3legnfqvlxrn5cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmSJhV0ACgkQQ96R+SSa
cUUQ8xAApoeSPSomSMZ+WWp0ASO4pt7Svz982hz5vN+LvVw11igutkPuQFvZvwW3
2PpYD1HxN9hLLRw45vT7Vci7Z1NC3DflLGiF+AG8VgiYOpp1d+8Kxad7Mp9qMIbx
ffjoxoC0BHHR492ZjKsO9BOwbTVwiqZj4KQNbCZFkNweEwK0qPBG0p0PvCrET69H
iJbL4/8d1F9zVyBQs00af22aiVXVRb1KZHiefPyibbrAyrxII7tFZHMUjfNI5Nud
yusX1T1AhCPYzIvWmSbDWRUBQ2hh+qUWVz2CvXoCi8YLAxXGHmN/WH4zNh24TcFO
zzJP77JFFAXD0HhyUwEHDsnP92kBEoWD2jZeBIUKpHvL4KPZ0tYImC99Ud6yh+gZ
CeMZDCmMNessck7+MhCXn/JpA9Lh5y4Y7jASCRNtz/NhxWPOIPG9tPsVoCDAsevT
5mUCmFppsu3U71srU/as1XQjAJmFvnO6abC4a713bMMqFYKTQK3CAsU15iByu/7X
UztO40yTu37pX1/1liPXc0ghOSlbdSY5QQhrJdHIRHQxz56IXQw+kOfXHsGScBU9
3O95//qF4cBXrTIk9cl3aEInxe2pl7SLtCe34VuE8Ibf6mYkGZ/j3Tdrj4OtDIwP
2S2ETGoa+QPqi3D//0Ws6a2GdPISb4M7w+mAnHVV+/ylxs1MKxw=
=rfjt
-----END PGP SIGNATURE-----

--w3legnfqvlxrn5cn--
