Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E35690786
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220F1E87;
	Thu,  9 Feb 2023 12:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220F1E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675942277;
	bh=+7RFwa1I0v/qKrQVzAsd84ldsHARLTjT4cNOA/yPUC0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QqNqHWASmY5n9w+48j8ZBZw58u+ur2Kq6kbvIhvRaLWkzd2zRMngisiYG2zCJSP0t
	 UxubfkRlq8nfQ/bf4GIEaHoRin+PfdCoqC5IKjwsHsEL1zKKnm5tIBXcp5J1YZugho
	 pWlFLdlTE8oBXq4kujpne/EDgzSCjdWK54M1D3F8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A979CF80027;
	Thu,  9 Feb 2023 12:29:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35699F800E4; Thu,  9 Feb 2023 12:29:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7AA2F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AA2F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lLfzzJ/t
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 321EB619E8;
	Thu,  9 Feb 2023 11:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EFBC433EF;
	Thu,  9 Feb 2023 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675942182;
	bh=+7RFwa1I0v/qKrQVzAsd84ldsHARLTjT4cNOA/yPUC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLfzzJ/toiiIvdAXYMATPZYY4XGwRWvtURK9D0ck+oulllRjswUl6RY9ie4zwStdM
	 G8wBnNd1mqol/Y7wVHgWGbj/waa1/VyDHsLxsGNYl8+no9hbaBTZ2lZKHdaNSA0zjC
	 uVGdl6wAma73Iyvkh0Igqx9FWg8t+N9j+ziUrzkItsH8hT0dFOZg46AyWS3QyoKcj1
	 4Ss2uCjFD2yh/E6DXQhwl+W2iqyy/nUd9VCzFdpRzgsm6C4Ql/mJXH01+HuL3dXwgE
	 cmLqMQNifwW0R4jbMtuE8U5w47l6YckejXGofKgUynKiUDrMIgSpC5LfJ8OoXcoLm2
	 e4Nv6R4xLICpw==
Date: Thu, 9 Feb 2023 11:29:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Message-ID: <Y+TZH6qQ7Old+53F@sirena.org.uk>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wBHpl9UONE0UrCV5"
Content-Disposition: inline
In-Reply-To: <20230209084903.13000-2-kiseok.jo@irondevice.com>
X-Cookie: Anger is momentary madness.
Message-ID-Hash: VIQLHENMDKXZC6XPGXFTZIIBJOP6KNM6
X-Message-ID-Hash: VIQLHENMDKXZC6XPGXFTZIIBJOP6KNM6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIQLHENMDKXZC6XPGXFTZIIBJOP6KNM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wBHpl9UONE0UrCV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 08:49:03AM +0000, Kiseok Jo wrote:
> In SMA1303, this device does not support MCLK.
> So it need to remove sysclk setting in devicetree.
> v2: Modify the sysclk setting - using devm_clk_get for mclk.

Don't worry about it for now but the v2 above should go after the ---

>=20
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

here.  This means the tools know they can remove it from the commit when
applying things to git.  Like I say no need to worry about it for this
submission - I'll fix it up locally, no need to resend.

--wBHpl9UONE0UrCV5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPk2R4ACgkQJNaLcl1U
h9CHTAf/U4ONdeOv8dyg+zb9EsLhCd9SAg6M8ohWpb0TghO+oXLMBN+0kPU3vJvB
FGhHRGjj8bJ8kMWDgLfG5pX+edXuPBTgVYyCHUdlFHSToSw42txhGMD7ht8G9xbb
zoeWvSpWOMQrRuXxeYIAKsx3R6zazcs3Sl6yHCIwr5eZUSD0ntq/gVXWszg62rSd
wlbf508nitHgP4fNmNEoqvFpcwbihJsDeVRyBwLfXGXFmAh07I7gqnKTEew25l34
ME92dlDr/U+FsZBB8Kuk8n5Qmd63zatDGayeTMh5ZYU4FPTAIpRoz999aiPljPlO
uEjBOsdFOs7U4WtxyX9Yz2w/NEl/Vg==
=xGrV
-----END PGP SIGNATURE-----

--wBHpl9UONE0UrCV5--
