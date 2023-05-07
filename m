Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9166F9BBA
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 23:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF664142F;
	Sun,  7 May 2023 23:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF664142F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683493988;
	bh=uB1YV5e0TwjlCZdNCyk4txuy5nrf5p+7tv0Q3h3jj9o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pgv36/7lKRGU3b8Rfva/yGNhekNpGAHxX2eBad9dECYXLBnmMl72wV/fMHeiKyC0K
	 FV3KJzpynElcepbBWPYW3ASK0vPNdadEKeWWkOxk9qwX2PuPRyeCkpVcP6XxR1aSSd
	 SC3MyRFrxa+uwfmJQ0bXsMgjNc0/ebnLlCR2VJOc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A25AF80310;
	Sun,  7 May 2023 23:12:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C75F8032D; Sun,  7 May 2023 23:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65A48F80087
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 23:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A48F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WoWsSgNF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD71D6111D;
	Sun,  7 May 2023 21:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2357AC433EF;
	Sun,  7 May 2023 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683493919;
	bh=uB1YV5e0TwjlCZdNCyk4txuy5nrf5p+7tv0Q3h3jj9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WoWsSgNFjTGLSZfqQO1t7BqZwz15rno9RiSEUDDLKRMC6S658wOyImAhejMNJi2gI
	 JrwhJjI2a4rUIdraFpCIn5xbPiWWGLk7U+Izuk2pkNThF5adxdT33sPwiYpE08U8w+
	 FcEnaaeg4RDBhPHZE1wanY9lVLX6ezZXpieiSzYOcJt/CfNaTbZyXaPEwmCWgr1BCM
	 fpQCB3OdQv2lOrU0blTw+D5XVvTg5XKbYcGJPUp/Gf/gRIWye261Rbqa0H0gCIW2SR
	 8nhhL45IKBPy8ndCaL1Vqgn1YNdnAQ6DE3IL0S0qSP5poyL/PnLmOpibbE4Piwt/+q
	 nEVZhcsPSjqDA==
Date: Sun, 7 May 2023 22:11:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: google,sc7180-trogdor: allow up to
 four codec DAIs
Message-ID: <20230507-traffic-gravity-6120b5413006@spud>
References: <20230507174543.264987-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zt/fYW6iUhOMSVfq"
Content-Disposition: inline
In-Reply-To: <20230507174543.264987-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: R2OS4XVZHBSBUM5DSCAF75HWDZMNOETG
X-Message-ID-Hash: R2OS4XVZHBSBUM5DSCAF75HWDZMNOETG
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2OS4XVZHBSBUM5DSCAF75HWDZMNOETG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Zt/fYW6iUhOMSVfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 07, 2023 at 07:45:43PM +0200, Krzysztof Kozlowski wrote:
> SC7180 Trogdor sound cards come with multiple audio amplifiers, so allow
> up to four of them to fix dtbs_check warnings like:
>=20
>   sc7180-trogdor-homestar-r3.dtb: sound: dai-link@1:codec:sound-dai: [[27=
5], [276], [277], [278]] is too long
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Given Rob is on leave & the sender of this patch...
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdo=
r.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index 67ccddd44489..666a95ac22c8 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -74,7 +74,8 @@ patternProperties:
> =20
>          properties:
>            sound-dai:
> -            maxItems: 1
> +            minItems: 1
> +            maxItems: 4
> =20
>      required:
>        - link-name
> --=20
> 2.34.1
>=20

--Zt/fYW6iUhOMSVfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgUGgAKCRB4tDGHoIJi
0uMUAP43pG/k+CSvRLwMJoAKa1mMnlV48KhkscnFgz3qVAHAiwEAk1xoWFrAS8vt
ohIKQBrAKiqvBNbeUwcervAogC01pgE=
=pMFN
-----END PGP SIGNATURE-----

--Zt/fYW6iUhOMSVfq--
