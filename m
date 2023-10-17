Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928B7CC10E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 12:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430391DA;
	Tue, 17 Oct 2023 12:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430391DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697539911;
	bh=NBELIU9z6fKP618YgdgGGrhepP3TPqeWVx6XGPhGX5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fmEI0/wzA6eGkZ6sr93ABF/qoGtgIST1RVcJHRs4RR8/cYtzlnhIoejnCeqrG1BaC
	 xsoB9uC7Q6RoFbuiJkbW2GD4ImWy/vWMsF1evZsR7Fd/ylntw8UuX4uYy7/O755OZ7
	 fKJpCcas6k/o4Y/mUeRQK9L6ltBpqWe/6zEQQxug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C15AF80552; Tue, 17 Oct 2023 12:51:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3AF4F8024E;
	Tue, 17 Oct 2023 12:50:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87797F8025F; Tue, 17 Oct 2023 12:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88AEEF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 12:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88AEEF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mm8Z5V0K
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F215361353;
	Tue, 17 Oct 2023 10:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B60C433C7;
	Tue, 17 Oct 2023 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697539846;
	bh=NBELIU9z6fKP618YgdgGGrhepP3TPqeWVx6XGPhGX5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mm8Z5V0KH1hwDvZFYpv+Ys3I2IW2+5A4lAXvPqyj9l9IOZIBR+hjFi3u9DPjRZpL9
	 jRL2mCDvS349NfbJX2CRsfAU7iOTQRqGa3dq02fmq3IVa9AfvT8Swa+c2eO88Jr6b8
	 /2LCm3veEjFqVScUlrzSObyaKGz7LBCd5tjFe7CSER/DSQ8SayiOQAQygOrJiBz1uI
	 7a5lCcwoFTc0B1Tg1gw1ZfWOzsLNdtLQXnWM/7SeJNPKSNP1S3iHpldgWCAIx4MVTK
	 rN89kmUEPbBDjoHr5fln/ZY3lamJhqnBQDCVskuEPDV/Sh7i+sCk2I68lqpe7p+yoR
	 Hn8sRHzlxfbLQ==
Date: Tue, 17 Oct 2023 11:50:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: tas5805m: Disallow undefined
 properties
Message-ID: <20231017-blinking-barricade-9e068a5fc602@spud>
References: <20231016155547.2973853-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3VQsOoHMH3HTVwq6"
Content-Disposition: inline
In-Reply-To: <20231016155547.2973853-1-robh@kernel.org>
Message-ID-Hash: CFMVQPCO5IHVWM6RP4OFSXVVF2XHE5FY
X-Message-ID-Hash: CFMVQPCO5IHVWM6RP4OFSXVVF2XHE5FY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFMVQPCO5IHVWM6RP4OFSXVVF2XHE5FY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3VQsOoHMH3HTVwq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 10:55:47AM -0500, Rob Herring wrote:
> Device specific bindings should not allow undefined properties. This is
> accomplished in json-schema with 'additionalProperties: false'.
>=20
> Examples should be last in the schema, so move additionalProperties up
> while we're here.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/sound/tas5805m.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/tas5805m.yaml b/Docu=
mentation/devicetree/bindings/sound/tas5805m.yaml
> index 63edf52f061c..12c41974274e 100644
> --- a/Documentation/devicetree/bindings/sound/tas5805m.yaml
> +++ b/Documentation/devicetree/bindings/sound/tas5805m.yaml
> @@ -37,6 +37,8 @@ properties:
>        generated from TI's PPC3 tool.
>      $ref: /schemas/types.yaml#/definitions/string
> =20
> +additionalProperties: false
> +
>  examples:
>    - |
>      i2c {
> @@ -52,5 +54,4 @@ examples:
>                  ti,dsp-config-name =3D "mono_pbtl_48khz";
>          };
>      };
> -
> -additionalProperties: true
> +...
> --=20
> 2.42.0
>=20
>=20

--3VQsOoHMH3HTVwq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS5m/QAKCRB4tDGHoIJi
0gcEAQCmHmcARE1lTJsuZHsKJ56ZGHCns14vOpQXsWwK4mvBXQD9GYNa6EuBgPv3
bunLUdSkx2aJXu0YguhXOE/JBMSVjgs=
=PYZq
-----END PGP SIGNATURE-----

--3VQsOoHMH3HTVwq6--
