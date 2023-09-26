Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401647AEDB4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461E19F6;
	Tue, 26 Sep 2023 15:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461E19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695733746;
	bh=nj7Pno7gxKRpYeFnO5r1L7tRE2na9od26GJPA9cmoRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rsik/u1wDDKu34zWiiLinX9OOFCVWP6tdQRkrssI687g+0DpSl8m35re0HtpCr0wR
	 51ayqZS2QU/QwUWw7RpfNDZVm1nH/vhsgssgWQqgB73eyyd0UqWR3pE7Aer7w9Uwnz
	 TCwJQoTxh/o3lz7uKvg0FLypzIu19CTnlV22f2HE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66148F80570; Tue, 26 Sep 2023 15:07:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB3AF80567;
	Tue, 26 Sep 2023 15:07:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2E09F801D5; Tue, 26 Sep 2023 15:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FBEAF800AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBEAF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LsTkHnL+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94D4761491;
	Tue, 26 Sep 2023 13:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05736C433C8;
	Tue, 26 Sep 2023 13:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695733591;
	bh=nj7Pno7gxKRpYeFnO5r1L7tRE2na9od26GJPA9cmoRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsTkHnL+6Gku6jK1CrWtDSHYgBlZFoUkeW85VJlnCA2VJfgl+VdLRc1KdBwA3ddze
	 GnvDYhB+gobdJsh2F9tLYu6jFTKL4t9FvI+d2NuWIJNOj4OeMtD0FfPIoQRCm4PY7l
	 AeNDe2d/BANbs941hh7vjo32zrGFxelZzKkzbUlnVQyD8FJt641HPC441YFKrF9A7K
	 c0EeNsL7xLQG6A72wQ2zRk3ujrUCH86Tv2yw0GQ2OmJKXKe9DiAZMz6RcSkO5HAhfV
	 s7wOluArGcS6ljG5riOpXja14UG0qj2MQTQPlq1Oi02n+8xZkVUlKVQky0P4UnSz/B
	 baLx3rZxaRD0w==
Date: Tue, 26 Sep 2023 14:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] ASoC: dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20230926-freewill-treachery-81fb636e537e@spud>
References: <20230925220947.2031536-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pRkokaTksUJ87J4L"
Content-Disposition: inline
In-Reply-To: <20230925220947.2031536-1-robh@kernel.org>
Message-ID-Hash: GMEGNBGKXEQG7RXVLXARE6PUTYDXIFO3
X-Message-ID-Hash: GMEGNBGKXEQG7RXVLXARE6PUTYDXIFO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMEGNBGKXEQG7RXVLXARE6PUTYDXIFO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pRkokaTksUJ87J4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 05:09:28PM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 1 +
>  Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml | 1 +
>  Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml   | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b=
/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> index eb7d219e2c86..19137abdba3e 100644
> --- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -89,6 +89,7 @@ properties:
> =20
>    da7219_aad:
>      type: object
> +    additionalProperties: false
>      description:
>        Configuration of advanced accessory detection.
>      properties:
> diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b=
/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> index ff5cd9241941..b522ed7dcc51 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> @@ -33,6 +33,7 @@ patternProperties:
>      description:
>        A DAI managed by this controller
>      type: object
> +    additionalProperties: false
> =20
>      properties:
>        reg:
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/D=
ocumentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> index b6a4360ab845..0b4f003989a4 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> @@ -60,6 +60,7 @@ properties:
> =20
>    ports:
>      $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
>      properties:
>        port@0:
>          $ref: audio-graph-port.yaml#
> --=20
> 2.40.1
>=20

--pRkokaTksUJ87J4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRLXUQAKCRB4tDGHoIJi
0pghAP9+4AC2NOyTDvOOxue9O55ySqsVJ7XyGO5vj0hDxz+4vAD+JR0pthP9HqDu
s11/vLsHj4O2ke1qIBfFm69Uq5wWhgo=
=vDBg
-----END PGP SIGNATURE-----

--pRkokaTksUJ87J4L--
