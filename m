Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A769E7E5615
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 13:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7488C828;
	Wed,  8 Nov 2023 13:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7488C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699445918;
	bh=7V/UrnIoKR1hXQNmM3fHYk4TXHGghxFBDI9RetIrR3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mYn5VO3PL/mfcN1WJ/IeqE/UfIGXxX+ZXr8qMl9m3h3bjkfKgudRYJNN8bP1BeEgd
	 Sy4me9ipyo2kc75qSk+ywOKjY0PY62iomHIfrohIlaAP1JkrksrQecPM8Y/jJDWY33
	 UpZp2/KiBhAFSIkMJECBbuOpjmDoSt+vFt0nFA58=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B031EF80557; Wed,  8 Nov 2023 13:17:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E2C3F80169;
	Wed,  8 Nov 2023 13:17:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD22F8016D; Wed,  8 Nov 2023 13:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDE35F800ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 13:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE35F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lTnF/3Eu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DFD1CE1037;
	Wed,  8 Nov 2023 12:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A168C433C8;
	Wed,  8 Nov 2023 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699445843;
	bh=7V/UrnIoKR1hXQNmM3fHYk4TXHGghxFBDI9RetIrR3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTnF/3EunAy/n/EtkQHaJx3vItL4cSDVDLs/F9tkv5i7pc0qpx9Ljy0DdpI9RNMUj
	 y+4ePbrg5HnrgO1qS6jnxhqG7uAnuxEN5M85JJg+3cO6OIM0QseItr2gK/riow4nYO
	 GtyTOe6EKUEw+3c0A2sGr6ANhuzP9MDpdxttFp07scZCfMVYn7V81E9oUMoD9asPJZ
	 LE5BxKejmYHkTjJ1BSpXqScS1UW/gu9/YXbBr4KN4f7QHEHq8PYzAE7tUw40KifrKV
	 loQGxwzW062JR+Bic9nBu+j+mvNX/LyMtwzCcdQbvRmGB29igTeQJ2q5BRz+CpznHE
	 ckiETsNNJvO5Q==
Date: Wed, 8 Nov 2023 12:17:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ryan Lee <ryans.lee@analog.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's node
 name in examples
Message-ID: <20231108-outback-composed-c620cd86c234@spud>
References: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6PrPU5pOkEEUIIG5"
Content-Disposition: inline
In-Reply-To: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 2DEQWUZBGQQVKTCBJRFUFO2OLLWNPLQR
X-Message-ID-Hash: 2DEQWUZBGQQVKTCBJRFUFO2OLLWNPLQR
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DEQWUZBGQQVKTCBJRFUFO2OLLWNPLQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6PrPU5pOkEEUIIG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:16:10AM +0100, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire".  Correct examples, so the incorrect
> code will not be re-used.
>=20
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

FWIW, there are a few instances of "soundwire-controller" in qcom
devicetrees that you might also want to change.

> ---
>  Documentation/devicetree/bindings/sound/adi,max98363.yaml | 2 +-
>  Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 2 +-
>  Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/=
Documentation/devicetree/bindings/sound/adi,max98363.yaml
> index a844b63f3930..c388cda56011 100644
> --- a/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> +++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> @@ -39,7 +39,7 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> -    soundwire-controller@3250000 {
> +    soundwire@3250000 {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
>          reg =3D <0x3250000 0x2000>;
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/=
Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> index ba572a7f4f3c..8e462cdf0018 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> @@ -52,7 +52,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> =20
> -    soundwire-controller@3250000 {
> +    soundwire@3250000 {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
>          reg =3D <0x3250000 0x2000>;
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/=
Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> index e6723c9e312a..d717017b0fdb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> @@ -48,7 +48,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> =20
> -    soundwire-controller {
> +    soundwire {
>          #address-cells =3D <2>;
>          #size-cells =3D <0>;
> =20
> --=20
> 2.34.1
>=20

--6PrPU5pOkEEUIIG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt8TAAKCRB4tDGHoIJi
0jpSAP48y9NqKH1qbbnEmCHyS9qNSJNgiOaoUevxsgcpPscGzwEAqFquFreorzyT
zAoJ1HXSZDG4PAhSwyJDUwtZ/wPGhQE=
=CPNX
-----END PGP SIGNATURE-----

--6PrPU5pOkEEUIIG5--
