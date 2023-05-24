Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D841170FF41
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 22:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53D31F9;
	Wed, 24 May 2023 22:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53D31F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684960272;
	bh=Re1wX3W69i3ZIaz/pAHTYuHqgqHaZa0o99T50sYnC2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AocNjVv8tCB8bhOhhhDrZiM0O61LeJtMN4f63zIfLtByjF96vUtc5hNyZ3EFCipRv
	 xTq5LN0f47p9XeyZYl66YZ8Friw6J/BVY82t3n3a2swuYvLVTG0DF+fYlgn+Qsj86H
	 qW0QUA8nTTXWirv0w63W/ZXEOuXpykMOkXQ7umw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D4D2F8053D; Wed, 24 May 2023 22:30:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1104F8016A;
	Wed, 24 May 2023 22:30:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC66DF80249; Wed, 24 May 2023 22:30:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 29536F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 22:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29536F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mg4kwL3o
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F06C6358F;
	Wed, 24 May 2023 20:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A08C433EF;
	Wed, 24 May 2023 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684960209;
	bh=Re1wX3W69i3ZIaz/pAHTYuHqgqHaZa0o99T50sYnC2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg4kwL3o57bXoA1rQ6/zA/RBTwv5ThG2jMwI463FUwVvKyBs091tMNv4sMhxeJY1u
	 gHphGhu0tmAB5HNCImzeX/QjK/QwDQUBX1uiVwGgvGBtmoRuBi8hpF4QymkFEMjbLN
	 vRuBLhHE1DDMsxM84S8Tc42oc5OHmAJ1rxSKGTlKUmSbniVaUuxw2VN8t96jS2+AsB
	 9Dt+Uo4O/ihAA9+EkCUIA4gFbMhPopJrMGHVfmTxvLqQciciTWlVoXjVc+xeJ9+POS
	 62p4oiXW+4rd0YJjyW91Oay1ixSDJNcIBhuof97KLE7Av1Vsyc27aGzg4/mMCS35G5
	 XOVCyPevoI5rQ==
Date: Wed, 24 May 2023 21:30:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, heiko@sntech.de,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: vendor-prefixes: add Indiedroid
Message-ID: <20230524-extrovert-unhidden-35e289c28bc4@spud>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JhSCHFoVTqpyyaDA"
Content-Disposition: inline
In-Reply-To: <20230523213825.120077-5-macroalpha82@gmail.com>
Message-ID-Hash: AURGHEEO2QAJBQEMKHZ4TALG2LANDAAN
X-Message-ID-Hash: AURGHEEO2QAJBQEMKHZ4TALG2LANDAAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AURGHEEO2QAJBQEMKHZ4TALG2LANDAAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JhSCHFoVTqpyyaDA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 04:38:23PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Indiedroid is a sub-brand of Ameridroid for their line of single board
> computers.
> https://indiedroid.us/
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 82d39ab0231b..632662be6e65 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -655,6 +655,8 @@ patternProperties:
>      description: Iron Device Corporation
>    "^isee,.*":
>      description: ISEE 2007 S.L.
> +  "^indiedroid,.*":
> +    description: Indiedroid

Can you add this in alphabetical order please?

Thanks,
Conor.

>    "^isil,.*":
>      description: Intersil
>    "^issi,.*":
> --=20
> 2.34.1
>=20

--JhSCHFoVTqpyyaDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5zywAKCRB4tDGHoIJi
0rCyAQC6g1aHwj9B2sWQaarQoBN801M7WnTwLfkYIxU09ubawgD9Ff4oypI/ENYj
QNlwt1Ep76ScIy+5QNgO5eQo4By9kww=
=CwXw
-----END PGP SIGNATURE-----

--JhSCHFoVTqpyyaDA--
