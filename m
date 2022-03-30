Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C44EC67A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 16:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67911A8E;
	Wed, 30 Mar 2022 16:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67911A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648650333;
	bh=8mGhUsP282BlInxzYzns/CDUIBuGHFUwBxqH317vbiI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOfkyM+vKcKvYqjM3p8NHrc4xEaDUvxepH6yfsjn060XUga6PfNiLuSiv/wgEmqXe
	 qUs1gKcxT+lL4/+KdMa1UQ45h3tzVEcQAsQBh5FapH2QFE3Cx27P6AB6ck6GBpuIGK
	 N1l3dx60gdtdh0RPfJO891YhGAnsjl/ewMNC9Dfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E839F800B8;
	Wed, 30 Mar 2022 16:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA37F80254; Wed, 30 Mar 2022 16:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C448F80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 16:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C448F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aQkJxwf6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A7DB61450;
 Wed, 30 Mar 2022 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F97DC340EE;
 Wed, 30 Mar 2022 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648650258;
 bh=8mGhUsP282BlInxzYzns/CDUIBuGHFUwBxqH317vbiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQkJxwf6qzT0NoAl/UXsj4Hc+5tHiEnQ52giQEXLKNANq8yCfIyEpxPSrkZx5UlhX
 kME5m6BljI6TEs5IcgxKa/AB7DOGHrCWPlahmcE8cUuW40U+zkdmI65Avc8jWV6Q7M
 UBzP4RRsJlEF+dKKHEXwIfGnmAVhjRRfJTi9YJ8LSM4ZvHAV/BNoDumoK7SHaa8r6H
 AFwSkLy+uUkmeU8HFYbTVWaPefLN1A65DhfqTJjQVuKghpq1Awj2I4yZvNhH/wiOIV
 vMbzyqLs6Zc8BOB8iLN+CWMCsxD/2M3qpxVOocVXf3b8zkjb4gPvAzqxN3YU4ZJsUk
 cyMELuCjDI3dg==
Date: Wed, 30 Mar 2022 15:24:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YkRoC30JLDMeVi1B@sirena.org.uk>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <YkRNSoBKFvYYyZLu@sirena.org.uk>
 <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GNUxLScWaSBFpiDm"
Content-Disposition: inline
In-Reply-To: <61e9fb59448837cfc8e3ec862b711294bcb68872.camel@mediatek.com>
X-Cookie: Two is company, three is an orgy.
Cc: devicetree@vger.kernel.org, linmq006@gmail.com,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--GNUxLScWaSBFpiDm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 10:06:24PM +0800, Jiaxin Yu wrote:
> On Wed, 2022-03-30 at 13:30 +0100, Mark Brown wrote:

> > Making a previously optional property required means that systems
> > that
> > previously worked may stop working unless they update their DT, DTs
> > may
> > be distributed separately to the kernel and perhaps even baked into
> > firmware or similar.

> Thank you for your detailed answer. I should keep the driver's behavior
> consistent with the description of dt-bindings. The "mediatek,hdmi-
> codec" needs to be set as the required property. Is my understanding
> right?

The binding document and code should match so if one is changed the
other needs to be changed too.

In theory we should never change a previously optional property to
required which would mean that the code should be updated to reflect the
binding document, however sometimes the DT isn't actually used as a
stable intereface by anything for a given property or device type so we
can get away with changing things.

--GNUxLScWaSBFpiDm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJEaAoACgkQJNaLcl1U
h9AhxQf+PZuCmGnFAmuUHNlVpmiRjr++vB0m1T22WhLGrda5HR7LQ87SMHwwffi9
xnkVrr30xgbSxZy7Sn5nfjPAo7EfnomIxlDu50xmlNM5nXoIchxDl83NiGRcHoWT
RfiId1J9P5ztudpTLcVLbj+uN5rLunutEkcHBWBxKymDy8wLA0nIX9fsER8xk8Zo
L40Yv45UohIvFclHx21U+eBGenN5kJKih02NQTvbcoy2Cjh/iMCWPprQLpjpY5s8
s/8dnyUGWx9SUBPfJJdtecq3riFE8MbQQrRLi1P+CaOfIonzYv1L0yEe5+7kBQHR
WZaz1EZs9fORae+t52imAuWFVCd0kQ==
=UCGf
-----END PGP SIGNATURE-----

--GNUxLScWaSBFpiDm--
