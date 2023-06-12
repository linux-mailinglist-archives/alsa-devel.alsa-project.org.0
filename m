Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AA72CC6C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 19:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026B9822;
	Mon, 12 Jun 2023 19:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026B9822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686590757;
	bh=ZviscbX9M2rOxWTwPjv7UOibrGDjoVPRxgUStOnIxnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xh69LpHkKDtThHbEvh6DpufK58ymca2L7KdEeyvdFNkQveykcXbE7XaQi14cSNBuW
	 xlv7/T4zXcfT6/z7/bubn7fEC45UoNmAs/pJ8YCKp9/Mb7Y7qxfwRsQY7s6Oh55HHl
	 FplKzKt5ux/l6Yo2Q6I/yHFrP7nZXkO20xj1TUsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E95AF80130; Mon, 12 Jun 2023 19:25:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC688F80132;
	Mon, 12 Jun 2023 19:25:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71C1DF80149; Mon, 12 Jun 2023 19:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 897D2F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 19:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897D2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uEC7H107
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81C7F62C18;
	Mon, 12 Jun 2023 17:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBDCC4339B;
	Mon, 12 Jun 2023 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590692;
	bh=ZviscbX9M2rOxWTwPjv7UOibrGDjoVPRxgUStOnIxnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEC7H107ndGmqemB+0KODTu0C4q45ijuTj7sKRu4oaSo1xO0l33rwXm2x1fe3iUK3
	 vaHfGRgRJyXWHIv2ZsCx99VhKk/6qPuoaq0GZJdnKxcyeU+YGAMNYAeuVcF7ye0PrB
	 X+VDip1uveaMXMPHC4XX3kbQMjDHVpGpoCPFGmJ+5tbz0v/0Sl3red4JJs8vZYFkXF
	 vNWje+yvpj3sCg9CPVUHqn4H8VGXYJ/B19rWgFGEyiwuD019FbQBuSzCBpw4T/Osfy
	 vsspcQdaRfJNpT/I9FmBUfVkQ62VcmYVERp0+0grmuMc4Og8MaP1IeYT52xsqyvX+S
	 0gOeZorOkFx7w==
Date: Mon, 12 Jun 2023 18:24:48 +0100
From: Conor Dooley <conor@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230612-booted-french-186dd95e78a9@spud>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6d68HPAgsdFO37XF"
Content-Disposition: inline
In-Reply-To: <20230612085614.3039498-1-mengyingkun@loongson.cn>
Message-ID-Hash: NREIPDYS7NEOCWLFXWC2RF3BVGOEJQE3
X-Message-ID-Hash: NREIPDYS7NEOCWLFXWC2RF3BVGOEJQE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NREIPDYS7NEOCWLFXWC2RF3BVGOEJQE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6d68HPAgsdFO37XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
>=20
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
>=20
> On loongson platform, the chip has only one I2S controller.
>=20
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>

I got 2 copies of this patch, but none of the rest of the series appears
to be threaded with it.

>  .../sound/loongson,ls-audio-card.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls-a=
udio-card.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audio-ca=
rd.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.ya=
ml
> new file mode 100644
> index 000000000000..61e8babed402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
> +
> +maintainers:
> +  - Yingkun Meng <mengyingkun@loongson.cn>
> +
> +description:
> +  The binding describes the sound card present in loongson
> +  7axxx/2kxxx platform. The sound card is an ASoC component
> +  which uses Loongson I2S controller to transfer the audio data.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls-audio-card

Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
the rails here, but this (and the "x"s in the description) look a bit
odd. Recently, we've noticed quite a few loongson dt-bindings attempting
to use a single compatible for many different chips.
Usually you have individual compatibles for the various SoCs with this
core, which can fall back to a generic one, rather than just adding a
generic compatible for all devices.
As far as I know, there's several SoCs fitting 2kxxx, and the format
being used elsewhere is "loongson,ls2k1000" etc.

Cheers,
Conor.


--6d68HPAgsdFO37XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIdU4AAKCRB4tDGHoIJi
0pvPAQDLOvIKZkTAaQl0HQVvqkzTD2ZIBpWC2JkPUbpettjwcwD/ScIh+4m599jA
XPMYLPRh5o1a5CxmAICrIt+p4avOIAU=
=D7u/
-----END PGP SIGNATURE-----

--6d68HPAgsdFO37XF--
