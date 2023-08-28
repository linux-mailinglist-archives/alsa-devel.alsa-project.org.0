Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A45B78B39B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 16:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51BD0DF6;
	Mon, 28 Aug 2023 16:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51BD0DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693234297;
	bh=34yp27rYKvE/hUOVmC1Zol2MDhT09rk+E53maKuPAvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iAKcjzcVms5Sm60vlTl+6nj+m7NBuz/Hgqc+eXtrDXWDeiQVS5lEITOXvq5k3pWYF
	 Ory36fg0pAz73NR9a6QR68/ES1D2okKpLrf5WU/0ljKSHDPs0+nFoHkMXnBCYTsPEg
	 TYmdifs/8giPn7w5fCG3gLh7tSowMsGKqbMZ+Cw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD712F80236; Mon, 28 Aug 2023 16:50:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49FA5F80155;
	Mon, 28 Aug 2023 16:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A793EF80236; Mon, 28 Aug 2023 16:50:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95B43F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 16:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95B43F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m+twr0lO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A197633CC;
	Mon, 28 Aug 2023 14:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F4AC433C7;
	Mon, 28 Aug 2023 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693234223;
	bh=34yp27rYKvE/hUOVmC1Zol2MDhT09rk+E53maKuPAvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+twr0lOA9U3QZMha4v4fLg6myPj7pqXT5SpkFUeVsY5qfbOn8bQvNxY/uMTK4ao0
	 PPXAOtyTdjwHE495CVPzwpKcYui1TT0LyrKp2F595tH6ZWm1ypGDVfMlR+p7AOyDC1
	 BdYCQSNGbk4YvQtMrvKbjaVz8JFwqOQc8Xeq3+fn1kE09Y/LzLO472dChs/NMcIeZ0
	 bP/V4sn/8/I+H8MGFDGd6JNrZc4AX0gE2jUHAqhuctf7B8piJmdtl4V7OlMUdx6wG7
	 sfolmM87O6XZdrQQFLNg17ISFJPpx93EqlKNb68pK7pl3JOcpYlQ32Ds5CQP8nh44w
	 x7caKrgJnLw0g==
Date: Mon, 28 Aug 2023 15:50:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: dwc: i2s: Fix unused functions
Message-ID: <ZOy0KQ6RjhJoOtNs@finisterre.sirena.org.uk>
References: <20230828113537.27600-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LgBkvyvyhcSVKzda"
Content-Disposition: inline
In-Reply-To: <20230828113537.27600-1-tiwai@suse.de>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: 4DCCKQWHTQR5XMFRFVTLBD2IO2I27SJF
X-Message-ID-Hash: 4DCCKQWHTQR5XMFRFVTLBD2IO2I27SJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DCCKQWHTQR5XMFRFVTLBD2IO2I27SJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LgBkvyvyhcSVKzda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 01:35:37PM +0200, Takashi Iwai wrote:
> A few newly added functions aren't built unless CONFIG_OF is set,
> which result in the build failure due to defined-but-not-used errors.
>=20
> Put "#ifdef CONFIG_OF" around those functions to suppress the build
> error.

Acked-by: Mark Brown <broonie@kernel.org>

--LgBkvyvyhcSVKzda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTstCgACgkQJNaLcl1U
h9CPuQf+KC2RRU+6gBPpCkFEZO2kqUYvkLPT+8QTgEXlXMbjWlNsVuhgq9CJsnfA
nNtEw8AkwzX2j1TSuTwdXlsWgptDcpLNygMjatu6LRDR9LmiRJ8iXokS8mCi+bkx
bnsTyU5HFYzrW2/a7qwkVlO7ubdWJzGyzGWi8L0Gs2BUCTGkF7or3e4HKz+dWqMp
Lj1QYtyXoPP6PhNVLSIrEzHl9BGyv5P4qywyS+xjzP+8sGOTgh93863CnyNv2QbP
3IIe02eehefMZOzCesPw/EnpTHxQhRZrmRJKHO9VZgGSIwPmhN+ofHXuPPrwhXE0
YRlB19iGwTRQnLryBW1TYh39Xd1j0g==
=wHp1
-----END PGP SIGNATURE-----

--LgBkvyvyhcSVKzda--
