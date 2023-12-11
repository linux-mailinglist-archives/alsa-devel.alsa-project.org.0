Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97880D3CE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 18:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD1BAE9;
	Mon, 11 Dec 2023 18:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD1BAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702315848;
	bh=LG9yC9T7WxDhr+BiUl3Dho2W3NGuanNuq2BwSSb2m7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FrfoJuI3uDXcaJM2xORvdkUoOSfJK9/SB58FqUNISJhhltk7rcsDByuhn4wBh766v
	 90XrjJ5HpNzxbI77GQU8FZZJhwXRtwtUn1JEI1jZ9dK6iuf/1ZMU7F6UmlxEyhuYHF
	 gyngnH+CnATQguvGsfTsJ9IzRtlSoqgfgcAiGup0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7879F8059F; Mon, 11 Dec 2023 18:30:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A801F80571;
	Mon, 11 Dec 2023 18:30:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA6A3F80166; Mon, 11 Dec 2023 18:30:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04243F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 18:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04243F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ksf5gdIj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65E83614B2;
	Mon, 11 Dec 2023 17:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A324EC433C7;
	Mon, 11 Dec 2023 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702315795;
	bh=LG9yC9T7WxDhr+BiUl3Dho2W3NGuanNuq2BwSSb2m7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ksf5gdIjvH4DynRW4uEWQpgrSlQ3E928IhMDsDZtLZ3Dt3HV/7GDqj93NZ+x0Wyeo
	 IurfMVxHjn6t507JQ1NrLC77E6y7MBZECoCktB7XuWMuN7k8VzJ5QVctnj+FsvsDMC
	 rRtse8JR7Z/d7PqqSEzK4b2mmCA99YAWi5dBFkMg+xcGYGWt2RNxa6LzOOwWjVe0U3
	 kZtKleeB2h68a6KhREyltBOM22qHz5e0D0b6+G/FsRDS3sYSw5cDWXl2o6Yr8YnWCp
	 Rusvi/R2boGbUY+iVdFPHeUEaBA1mIPWv5Sd5PsauUcGtoSOWNTpAf9xXfmH1bR/GE
	 mnfShQzYVVHIw==
Date: Mon, 11 Dec 2023 17:29:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Message-ID: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2LNFTi2k/ijpYbVF"
Content-Disposition: inline
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: RXE5AWIRA6XAX47K5V6ZDS4JBA5ICUJP
X-Message-ID-Hash: RXE5AWIRA6XAX47K5V6ZDS4JBA5ICUJP
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXE5AWIRA6XAX47K5V6ZDS4JBA5ICUJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2LNFTi2k/ijpYbVF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
> RX macro codec, which looks like compatible with earlier SM8550.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I wish you'd send cover letters when you send series of trivial patches
like this that could be acked in one go.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index cbc36646100f..b8540b30741e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -19,7 +19,9 @@ properties:
>            - qcom,sm8550-lpass-rx-macro
>            - qcom,sc8280xp-lpass-rx-macro
>        - items:
> -          - const: qcom,sm8650-lpass-rx-macro
> +          - enum:
> +              - qcom,sm8650-lpass-rx-macro
> +              - qcom,x1e80100-lpass-rx-macro
>            - const: qcom,sm8550-lpass-rx-macro
> =20
>    reg:
> --=20
> 2.34.1
>=20

--2LNFTi2k/ijpYbVF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXdHDgAKCRB4tDGHoIJi
0nU+AQDVDBF2Ue5mLjfFa/+I6TWQM2yfHXHlsApXW8yIzl//igEAgY0GeYGSN98Z
iBGGvTxVPokVS73NbLliSfIW9xpVwwg=
=MyYY
-----END PGP SIGNATURE-----

--2LNFTi2k/ijpYbVF--
