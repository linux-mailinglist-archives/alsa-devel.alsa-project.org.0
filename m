Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496D70E810
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 937BB209;
	Tue, 23 May 2023 23:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 937BB209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878807;
	bh=Q7Cfr0P4JrgFbeW6Lss/x27KCWc3NQnkwpmV1bMsJko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wb6l08h5iF1Tbh+BtUmotb8X2RdYKqE5rQWBXJTo1IKgaxQV1aG5abvL9t/lu2fqY
	 xr16VmHUujxAX3hRAtaST1Ti1jVa8/BraTT0h21VXeyHhWoqOZxHlzkt88je05hh6e
	 tjfxbCi9ryYhctoZ0UpC0gJw0pLx+8KUW4f29VHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE14DF8024E; Tue, 23 May 2023 23:52:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7420DF80249;
	Tue, 23 May 2023 23:52:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E63E6F8024E; Tue, 23 May 2023 23:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DDB7F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDB7F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BhgpD96f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C7A963661;
	Tue, 23 May 2023 21:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524C3C433EF;
	Tue, 23 May 2023 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684878725;
	bh=Q7Cfr0P4JrgFbeW6Lss/x27KCWc3NQnkwpmV1bMsJko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhgpD96fUG6XX5nLgvCkOJqbrtkEXkh9ZWfhRo6SaGPraqQ4um5v/iQJ9cigo9D71
	 LMFq1CH09FvTqUpbRdjWer1gOveDipuZ+KciU7Se9VKTCyw3MwmoV2xkhqKIpKLsVv
	 3NJa0sZ7Ra0CiJMsg6C2i2RUNWKVRsuxPHwXwWZXgJOH+tTvvnAFAVIyw8MKZCKg8d
	 nl74Q+CFewYespiRJyLQfJJvxT8879v/zogt9/N5juU2gRlemaDSx+zERHT1g+2MCh
	 azlcDBLIVAbucxT9skYHlqDiVOlGRbHK4Iwm3zpDKzxe17dZO2ZaHxEm+zKYwLIkfI
	 yQ2KOXJvwmUDQ==
Date: Tue, 23 May 2023 22:51:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, heiko@sntech.de, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/6] ASoC: es8328: Enabling support for 12Mhz sysclk
Message-ID: <b64c91e0-1dab-4ae1-8fcc-512da08856bc@sirena.org.uk>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MEioEb2XHIcEnWAi"
Content-Disposition: inline
In-Reply-To: <20230523213825.120077-2-macroalpha82@gmail.com>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: KNH6PWUASNPP3OAFTRYASSICSSQEKKCZ
X-Message-ID-Hash: KNH6PWUASNPP3OAFTRYASSICSSQEKKCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNH6PWUASNPP3OAFTRYASSICSSQEKKCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MEioEb2XHIcEnWAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 04:38:20PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Enable support for 12Mhz sysclk on es8328. This sysclk value is used on
> the Indiedroid Nova rk3588s based single board computer.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>

If you're sending the patch your signoff should be last in the list.

--MEioEb2XHIcEnWAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRtNX4ACgkQJNaLcl1U
h9DKXAf+PmCPuedgkWKSejXYwuSyAr/YT9+cJ/FMkwbGhCdYTQkQGbX//jFXuj4r
fajuP100UTTCcpLlkb0QiIaIC0rNeLTvxgxKErj0W/PN3GGnzQXWCiOmADPhUwqS
pgmOnVv7DDojIAHgC2eWC3dItIl8tDDhhHunyoTJhQU46ghg8X6ewltUfwwwaJER
J+kESa5vrYFY+1FMHSARmoIiT1iXNC4b0zX3Ahtmf1i2u8dgI3pJHC+R7r41Ohpx
J+XydzeMne5mle8InUeIR3VIyY8sjxwyuA8sNekXtzsEj8YUix0PEbGb4ScxroT3
QIx0zUt71BJZhow4qXkmRS0jnKSA0Q==
=zOUN
-----END PGP SIGNATURE-----

--MEioEb2XHIcEnWAi--
