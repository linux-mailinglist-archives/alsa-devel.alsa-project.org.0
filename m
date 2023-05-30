Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AC716A8A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 19:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558FB3E7;
	Tue, 30 May 2023 19:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558FB3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685466759;
	bh=N6T7E2wPg+ksFvC4zTDbs7YVrQwcgW2P2fcGeKZjY20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXA60V9IrmDLS1ginFKBhtGga5UPd3xxVDPhcgIyo4Ab5xSuts5u5isz9R+4DGLcp
	 Pc/H6U6lQPBGdpf9uXhzuM6JXlvTsegPeZHK32Re7WK6ExqLEk8FmSqz37+Encb3Lh
	 CrxyX12IEwO0OyQxIMsRtkbbjeEU8Ptphcn3uMr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF35F8026A; Tue, 30 May 2023 19:11:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57EADF8026A;
	Tue, 30 May 2023 19:11:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7408BF8042F; Tue, 30 May 2023 19:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 586D9F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 19:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586D9F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CFXovLHe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65E9761403;
	Tue, 30 May 2023 17:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A19C4339C;
	Tue, 30 May 2023 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685466673;
	bh=N6T7E2wPg+ksFvC4zTDbs7YVrQwcgW2P2fcGeKZjY20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFXovLHe2oCMksV5jMa1XRicI4ibzn2nGkPyGMPtRnC/y08Yp1GJGpfGxkDMnPjUD
	 qZYV3T982TxPaZJbNLbkVlsLxnwdoXIr1gMYRSbBBtmyb38QYNiI0vOaHqIPHSYlny
	 f7aHQpTFYKWKABhjocGyZKtjbwZx021cztTm/1LP472sZoPdfbJIF+fQowxr3luvtO
	 vFKZWc7TtHmcGsP8e7FivPGzTjYgomj+DAEhRquGGK4SNsoZI20AB0mYJmViyDGojr
	 OgochEVNk8ky0h6j2vMHGI169NU7lgIPPHKOPvuG8aH5roBKLrYsul0Y30Tl0lzs3E
	 vdCGDlBy+9FxQ==
Date: Tue, 30 May 2023 18:11:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH 0/7] dt-bindings: restrict node name suffixes
Message-ID: <20230530-banister-luxurious-d33a5d289749@spud>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3drXRST+roPPVcQt"
Content-Disposition: inline
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 7Z64YEQ6LXHYU5YFOTAEWKNDNS45I7Q4
X-Message-ID-Hash: 7Z64YEQ6LXHYU5YFOTAEWKNDNS45I7Q4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Z64YEQ6LXHYU5YFOTAEWKNDNS45I7Q4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3drXRST+roPPVcQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 04:48:44PM +0200, Krzysztof Kozlowski wrote:
> Hi,
>=20
> Tree-wide cleanup of DTS node name suffixes "-N", e.g. "pwm-5", so we all=
ow
> only decimal numbers.  In few cases narrow the pattern to also disallow
> multiple suffixes, e.g. "pwm-5-5".

I figure there'll be quite a bit of stuff to fix up afterwards?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> No dependencies, can be applied by individual subsystems.
>=20
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
>=20
> Link: https://lore.kernel.org/all/20221127182232.GA128974-robh@kernel.org/
>=20
> Best regards,
> Krzysztof
>=20
> Krzysztof Kozlowski (7):
>   dt-bindings: phy: intel,combo-phy: restrict node name suffixes
>   dt-bindings: pwm: restrict node name suffixes
>   dt-bindings: rtc: restrict node name suffixes
>   dt-bindings: slimbus: restrict node name suffixes
>   spi: dt-bindings: restrict node name suffixes
>   dt-bindings: timestamp: restrict node name suffixes
>   dt-bindings: watchdog: restrict node name suffixes
>=20
>  Documentation/devicetree/bindings/phy/intel,combo-phy.yaml    | 2 +-
>  Documentation/devicetree/bindings/pwm/pwm.yaml                | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
>  Documentation/devicetree/bindings/slimbus/slimbus.yaml        | 2 +-
>  Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
>  .../bindings/timestamp/hardware-timestamps-common.yaml        | 2 +-
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 4 ++--
>  7 files changed, 8 insertions(+), 8 deletions(-)
>=20
> --=20
> 2.34.1
>=20

--3drXRST+roPPVcQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYuKgAKCRB4tDGHoIJi
0nXKAQDamcvDwarCjeG65qUN+fBYxaI+//cyJEQB1SuuBpUTGgEAy0ivPKjui6wX
d/shbUIhWWfohF1w8yRNuYfQATp+AAQ=
=EmEg
-----END PGP SIGNATURE-----

--3drXRST+roPPVcQt--
