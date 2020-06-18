Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F02091FF027
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF37175A;
	Thu, 18 Jun 2020 13:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF37175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478174;
	bh=QvA8no1TpMEdmiZ/sm5KuNeLuojuw47r6rENr5Cw9+8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hx5M9kthaBWfuRR4Bw99I/6hZXQZnHQRZ5EQjrnWHA0lcmrCNIfCSP8Z9qCUvEbes
	 VpGLjYIyHbFjhQUx8zpLSGs/0QcvEKb0ZNSxXyExJ+loTduYaWrqqfsXx/cW8YimdI
	 v+6WcYugQm2SWdh92umhBRt3ewk15P9Q0qQENh24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 505B0F80171;
	Thu, 18 Jun 2020 13:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3BCF80162; Thu, 18 Jun 2020 13:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17727F800D1
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17727F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pcuC0TFl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFBEB204EA;
 Thu, 18 Jun 2020 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592478025;
 bh=QvA8no1TpMEdmiZ/sm5KuNeLuojuw47r6rENr5Cw9+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcuC0TFlvq8aKx88UCMeFc3rKXzUVLLNyBEvCpsWnqZeoA1M8YmOjb/tXZIE0izgP
 nXXIl4qYKqeyLcjaCCuRVrpejc1Hm/59ui99dtK2/Fy9lk6DD7UfE7UsFFf/h2oKmb
 TwksHOd8UsbZNWik6LpYRpAobmBjx6J5USfHZ4tw=
Date: Thu, 18 Jun 2020 12:00:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200618110023.GB5789@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20200618010805.600873-4-sashal@kernel.org>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
>=20
> The microphone-jack state needs to be masked in a case of a 4-pin jack
> when microphone and ground pins are shorted. Presence of nvidia,headset
> tells that WM8903 CODEC driver should mask microphone's status if short
> circuit is detected, i.e headphones are inserted.

This is a new feature not a bugfix.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rSUYACgkQJNaLcl1U
h9A3vQf/WXhR7I7AHZ2vrSHUiTEBwIC375nL3wtLMM3A9X0B0jomIhmyFDZxYaNS
dw633sHw9HlgWyTTyx07S1iNlk2hHjOGMi/HzrTbSyK9zivf9QN6K8CIfNFzQn52
ynhCFORe0eQEP5gGqZF3bghKDzGSLwzYDq12GzJJPgibuoUk/nEq3hQblqQZj5ZZ
abqeBpm2aI5QAesPDCqYIFfqxo2pdhc39lSgHAw23df1mtuaKGn5MDPU6B/VDCiG
oHrUfwTkTc4HM06aKEUYnkkoY/y/2fxbI/wRmpHauweXn0PiWmUYeDtr8DrNJINh
uTQy4zb22IVORBEEJd7xHQg7TsL+Ug==
=2QST
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
