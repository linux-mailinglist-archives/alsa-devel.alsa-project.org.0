Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EABF3DA1E5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 13:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A271ED9;
	Thu, 29 Jul 2021 13:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A271ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627557328;
	bh=MvtQ8xl4DaKhCl1w9NscHSGdK9FzdvJUFFdvS3LdjYQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnqh8QqtbRzkjw61xXtWSQ3sszEtzE1api/faMlk48eGJtWeUbuz5DhplN1sbh8ce
	 Mp461PPfLxYaKTpk3mDp6L/yfxuxOCR6fd/Xk6ebYhMYQpTKxxj/GMIzdkmrkmSv9R
	 Bvkht3X6jjpmBo1drElifmH6kpxPOBE9Zb7edxtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 668D8F80276;
	Thu, 29 Jul 2021 13:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A23F8026C; Thu, 29 Jul 2021 13:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 329B2F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 13:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 329B2F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kV/G5VhW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7FB160F21;
 Thu, 29 Jul 2021 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627557229;
 bh=MvtQ8xl4DaKhCl1w9NscHSGdK9FzdvJUFFdvS3LdjYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kV/G5VhWVGkbjH584vznhhDCtFnZH1shb59Sl1uSR1HK2t+HhJ2M8mUZHXf/Z6mth
 hr4am4YazksiAwy/3K+Sg6606pRurMkdi8M1G1Y0LSHBRTSmkJi9CVp0FtgyR0IhIz
 xyqzhToyB2bDOieNdmFicurwFcrk10dr7tjr4ipX3j8P+Iy06bxrLkuQmsBQzyqvA8
 36SWHlz0u0OegcnkaAZLbQVARTRKmMmTVg14UXMDLCj3AxMJGNfx4YjH2FagXsy0jn
 wDpyVBsUDltkKuaSHPBlBB7x8RQHBaBdlGvh6QU+7v7Ra6AJc6wPFyxWqhKGJseKan
 QEu3jpIZP2Mww==
Date: Thu, 29 Jul 2021 12:13:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 04/16] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
Message-ID: <20210729111338.GJ4670@sirena.org.uk>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
 <20210728173649.GA1290628@robh.at.kernel.org>
 <092018be-50ae-6dda-73cd-6c7eb002dc19@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZkK3DH7HIvxYLwhR"
Content-Disposition: inline
In-Reply-To: <092018be-50ae-6dda-73cd-6c7eb002dc19@linaro.org>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, devicetree@vger.kernel.org, tiwai@suse.de,
 lgirdwood@gmail.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--ZkK3DH7HIvxYLwhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 10:18:28AM +0100, Srinivas Kandagatla wrote:
> On 28/07/2021 18:36, Rob Herring wrote:

> > This all looks fairly similar to the prior Qcom audio binding(s). It
> > would be nice to not see this all re-invented.

> AudioReach is a new DSP signal processing framework Which is different to
> its previous DSP firmware(aka Elite).
> It makes use of ASoC Topology to load audio graphs on to the DSP which is
> then managed by APM (Audio Processing Manager) service.

> So internals are not exactly same.

> From device tree side we might end up with similar layout, but there are
> some subtle differences like clocks are managed by q6prm service instead =
of
> q6afe service in old firmware, front-end pcm dais definitions come from A=
SoC
> topology.

The software we're running on the hardware shouldn't impact how the
hardware is described, it should be posible to switch DSP frameworks on
the same hardware - look at what Intel have done with SoF.

>=20
> Are you suggesting that we should reuse the old bindings (q6afe, q6asm) by
> add new compatible strings along with differences ?
>=20
>=20
> > >=20
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   .../devicetree/bindings/sound/qcom,q6apm.yaml | 87 ++++++++++++++++=
+++
> > >   include/dt-bindings/sound/qcom,q6apm.h        |  8 ++
> > >   2 files changed, 95 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6a=
pm.yaml
> > >   create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml =
b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> > > new file mode 100644
> > > index 000000000000..6f27567523a9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/sound/qcom,q6apm.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Qualcomm Audio Process Manager binding
> > > +
> > > +maintainers:
> > > +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > +
> > > +description: |
> > > +  This binding describes the Qualcomm Audio Process Manager service =
in DSP
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,q6apm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +#APM Services
> > > +patternProperties:
> > > +  'apm@[0-9]+$':
> >=20
> > This means '.*apm' for the node name. Did you need a '^'?
> >=20
> yes we need begins with '^' , will add that in next version.
>=20
> > > +    type: object
> > > +    description:
> > > +      APM devices use subnodes for services.
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        enum:
> > > +          - qcom,q6apm-dais
> > > +          - qcom,q6apm-bedais
> > > +
> > > +      iommus:
> > > +        maxItems: 1
> > > +
> > > +      "#sound-dai-cells":
> > > +        const: 1
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - reg
> > > +      - '#sound-dai-cells'
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    gpr {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        gprservice@1 {
> > > +          compatible =3D "qcom,q6apm";
> > > +          reg =3D <1>;
> > > +
> > > +          #address-cells =3D <1>;
> > > +          #size-cells =3D <0>;
> > > +
> > > +          apm@1 {
> > > +            compatible =3D "qcom,q6apm-dais";
> > > +            #sound-dai-cells =3D <1>;
> > > +            reg =3D <1>;
> > > +          };
> > > +
> > > +          apm@2 {
> > > +            compatible =3D "qcom,q6apm-bedais";
> > > +            #sound-dai-cells =3D <1>;
> > > +            reg =3D <2>;
> > > +          };
> > > +        };
> > > +    };
> > > diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bind=
ings/sound/qcom,q6apm.h
> > > new file mode 100644
> > > index 000000000000..3c3987eb6e95
> > > --- /dev/null
> > > +++ b/include/dt-bindings/sound/qcom,q6apm.h
> > > @@ -0,0 +1,8 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef __DT_BINDINGS_Q6_APM_H__
> > > +#define __DT_BINDINGS_Q6_APM_H__
> > > +
> > > +/* Audio Process Manager (APM) virtual ports IDs */
> > > +#include <dt-bindings/sound/qcom,q6afe.h>
> >=20
> > Why add this indirection? Rename the file if you need something to cover
> > both.
>=20
> Thats a good idea,
>=20
> These are basically audio endpoint device ids which should be same across
> different audio firmwares.
>=20
> I can rename this to dt-bindings/sound/qcom,adsp-audio-ports.h or somethi=
ng
> more generic to be able to reuse.
>=20
> --srini
> >=20
> > > +
> > > +#endif /* __DT_BINDINGS_Q6_APM_H__ */
> > > --=20
> > > 2.21.0
> > >=20
> > >=20

--ZkK3DH7HIvxYLwhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmECjWEACgkQJNaLcl1U
h9C6dwf+PjJAuWxpbfcf4Wp0GacdzLYtni05DNXNG1JPg8AQQeCprQCUSRL2arDU
QAzRvpaZ2ivgCxafbpCotVqw26j1NviN+NVv+67GSKw+zUASCxEnJh7FwGV7FoSY
0GwtwNTQ2LIlt8h2OTvQvBwV4AcMLPPbblCm5E5xy4riKvFcE+kizmpBszMNmoXD
rYt+9yVoOUzi5JEgdTtCIayWucN2N3YyBBtt6iBw6ajBS0J/aJBdM/8O52CKuGdI
mbI4+LoOWK2/NKMXTjETyN+4rxyhqSLdrHfeonLL3yikKi1Be3ShHqkja+rtAxXB
27Riss9bwhhhDtgBOynO1tdrh0h33A==
=/zhk
-----END PGP SIGNATURE-----

--ZkK3DH7HIvxYLwhR--
