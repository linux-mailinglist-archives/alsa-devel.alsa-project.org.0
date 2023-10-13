Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D97C86B6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 15:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 225E083E;
	Fri, 13 Oct 2023 15:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 225E083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697203442;
	bh=0VLSmUiBT4OXSKoUDLazEOxnT0ZGOzCtUjBBnsTitwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dl/pvmDWPx0i0ofNBhNMGU2QWa/P/5CgsVj+SvdloW3LcK8cWBJ8GA4hZrWhBi3SI
	 FDPIOpGlfzpMssTtmhWDGHjI9UkkmmrPXh1p7dhXYjbnjY6e28Wb7AQDruXcsJOqOV
	 rvqhdt9+L7X5i4ScUB/s11WMeeq+K5M8ZpOp4zsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 643DFF80558; Fri, 13 Oct 2023 15:23:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D062AF802BE;
	Fri, 13 Oct 2023 15:23:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53B13F802BE; Fri, 13 Oct 2023 15:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B9E2F80536
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 15:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B9E2F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FCNmsHwY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EB006207B;
	Fri, 13 Oct 2023 13:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F36C433C7;
	Fri, 13 Oct 2023 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203277;
	bh=0VLSmUiBT4OXSKoUDLazEOxnT0ZGOzCtUjBBnsTitwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCNmsHwYJDmN5iKapkMHyrE6IvjJehLUtF23l9lcZRkuXgX9C4vGhRXlUJnuLZHKC
	 r1BfmIkhWnnKwt7JBe6RIFm4sAbdwqfzn472ct1nN9o4Jh627dKLX+7mI1RiVkaTFA
	 0QMZk3rZbth7fy+Jm9AZOC87fIq4wdRah9E2HMwKxQQmZI0CyYvGvLwGvaC9hageEq
	 xzljsZRXZK8b/bN/XwiXVLrPkNJMfUn8+71BzNDU0toxYPQpgWz7U09RMlFxK+se26
	 +Wa7xV8ZB1sypDRyE263R3NYJrszF/YuFfq6fAhcoOH5U2VT4RaGWKVCRyg/u9HYXg
	 2Rec5SLOYS76g==
Date: Fri, 13 Oct 2023 14:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v6 04/11] ASoC: fsl_asrc: register m2m platform device
Message-ID: <ZSlERK8gRFUOusqf@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wC1z3YN8nkgTz/wR"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-5-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: FZEZV3E52YKSS65PZN7TKY2IDUCCU4QB
X-Message-ID-Hash: FZEZV3E52YKSS65PZN7TKY2IDUCCU4QB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZEZV3E52YKSS65PZN7TKY2IDUCCU4QB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wC1z3YN8nkgTz/wR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 04:30:58PM +0800, Shengjiu Wang wrote:
> Register m2m platform device, that user can
> use M2M feature.
>=20
> Defined platform data structure and platform
> driver name.

Acked-by: Mark Brown <broonie@kernel.org>

--wC1z3YN8nkgTz/wR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpREMACgkQJNaLcl1U
h9B0vgf+NIJEhKtL7g30+vSPZtbkBvnhTzPAcFV3zcMUZxT5QqDaOUcJVcQhn8fG
JRFW4lt71Z8bMABFCkoA/YghAFfzI5wLaxkzZgJT5B62Txw5tI9m8U4G2/LZt7y3
MM9ZP6KAzESEb3Xzc5I6DNPcXP13RiAijK4UzIvFmZZvn1htGzK3Fw0Lw9I5JIAT
oIIVQ8xaI107q2cuzxoBQ0bORi3UUCHL1f4g/YHxt7LHcdaXyZN6QoJ4jk4C2Qwi
5OtfvG14FnnM110KqTRVL7X9ZDeDq5d9EhhAgTqrzUDmvb2Pv0JY4mUbONiG63JU
nhIyQqDJ8Ri8cgDk2OVf/sXHx8XT+g==
=zNQc
-----END PGP SIGNATURE-----

--wC1z3YN8nkgTz/wR--
