Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776777D0E4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 19:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F787741;
	Tue, 15 Aug 2023 19:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F787741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692120154;
	bh=Il2uMTP6lG0+AKxD0SbiK86g8kR0jT68a3j1liMLNMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q1CoX8RtAHLZ4byM37re+PRfhbYwJifOOLzMlUiraiH2cbz0i1emuV+VMbDpaJGSp
	 bi3kkBu07FUOEf9WiNWfWyho01VVY+OmF9ZF469IgCQewReO+r4l1NsbAnZggxMolj
	 ra0GZPPQNw46n2q8ku1QXBO4f3JUP+bt4mwmliaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6437EF80549; Tue, 15 Aug 2023 19:21:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A546AF8016A;
	Tue, 15 Aug 2023 19:21:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D66F8016D; Tue, 15 Aug 2023 19:21:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90C4FF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 19:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C4FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D6xYkDOY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50B5C617ED;
	Tue, 15 Aug 2023 17:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373CAC433C7;
	Tue, 15 Aug 2023 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692120090;
	bh=Il2uMTP6lG0+AKxD0SbiK86g8kR0jT68a3j1liMLNMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6xYkDOYe5/F6UacYnRo1uoKHSOBsQRSc2QXAihpKH0Uq7deScby6MYrJPS2gbi2E
	 tW6WPOz8AvWPP7hc9aEXDIgbAYBm2Marpg5AcTU1j2NfC9lgdQ5+VT1GpSj3TPYVWQ
	 o74MeGNE75lUwAIriAeD2At3m83zqvvC3BEyF3Kj3rjxRZRdW6kEErc4q/M8AnTpky
	 HrUgUtVGNsWLIAOTUvooDhSHkwzDzEFnDgJGXJLmkH+VdzZuKL8VAbrGjxhLRCNBO5
	 F61htQhvvC8JMPEor3x5Fk8LRA/1GNmK/xsXNQ9AjMJ+CVznXqVvjnzI7Zh2uGbyDC
	 DLSynANZNTbzg==
Date: Tue, 15 Aug 2023 18:21:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"xc-racer2@live.ca" <xc-racer2@live.ca>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"cychiang@chromium.org" <cychiang@chromium.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"judyhsiao@chromium.org" <judyhsiao@chromium.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"srivasam@codeaurora.org" <srivasam@codeaurora.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"quic_rohkumar@quicinc.com" <quic_rohkumar@quicinc.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Message-ID: <052ba5ef-e689-498c-9283-95482acfadcc@sirena.org.uk>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
 <234edb7c2002106dee41d558481b4baf904208ab.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZn0hmd24oe3x4bQ"
Content-Disposition: inline
In-Reply-To: <234edb7c2002106dee41d558481b4baf904208ab.camel@mediatek.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
Message-ID-Hash: WFPTIWCEVZ4TTMATZQYCYM6YREMED4VD
X-Message-ID-Hash: WFPTIWCEVZ4TTMATZQYCYM6YREMED4VD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFPTIWCEVZ4TTMATZQYCYM6YREMED4VD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mZn0hmd24oe3x4bQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 01:57:51AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> On Thu, 2023-08-10 at 08:32 +0200, Krzysztof Kozlowski wrote:
>=20
> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
>=20
> "model" property, so binding was incomplete.  Reference the common sound
>=20
> card properties to fix that which also allows to remove duplicated
>=20
> property definitions.  Leave the relevant parts of "audio-routing"
>=20
> description.
>=20
>=20
> Reviewed-by: Rob Herring <robh@kernel.org<mailto:robh@kernel.org>>

Something's really wrecked the formatting of this mail...

--mZn0hmd24oe3x4bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTbtBEACgkQJNaLcl1U
h9AkVQf+LCyv4Rxv2WwJ4vwg9gYMeT9mlq2c9+h5yXrqF3W3m4rwBxpVYqN2Ez5V
VgEsH3D9dGm4h9LsqFw5IPnK25riu5Bb1Oj2JwigyD1wRnjimBC2C9zwa5IuzS6P
/6EmFdMiTrtbxM1cNjA/kPbxnxIsrqCD5Carl/ubZ6qcq/au08dFZA37AMRSpozs
DkiU38lOyP/SV6DW2jlJHV9BbIcxPmmrAl7Rw+9WcOhJqCg/TEFVSodXzX9PXx9z
AfR6BqxbB/mfqQ8R47vePrcpNZbJ3qrmW+psqxeroNx7kE4pyc8Zzsnhdb+PMn2o
bs8U5uonjNv62gLDqi2Sn/2f5Qrcag==
=9W3r
-----END PGP SIGNATURE-----

--mZn0hmd24oe3x4bQ--
