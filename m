Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA2478993
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 12:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC3B1F48;
	Fri, 17 Dec 2021 12:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC3B1F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639739641;
	bh=RKGJPz8C0U0ZsiMre2FfG3eQ6nqVexMQpsMDBwuEE2k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqfDq4/r66wKWSRqZvy0xLJHBmaksUo++CoFLr1sPD9FCrlrqXtxesXRqWprzkSYI
	 iyJaQ1oe9u2e/HqdPXvjejPpMi1HR12uV0ZSMp7Bl6xJN2mGIwRGMhnGnea3FG+Qih
	 48m+TV53PYpd7sOUc5DRsDFCmNd483yI4+dCW6Lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D74BBF80161;
	Fri, 17 Dec 2021 12:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DFFF8014D; Fri, 17 Dec 2021 12:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9DBEF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 12:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9DBEF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jgHIs90s"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FC78B82785;
 Fri, 17 Dec 2021 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB669C36AE5;
 Fri, 17 Dec 2021 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639739560;
 bh=RKGJPz8C0U0ZsiMre2FfG3eQ6nqVexMQpsMDBwuEE2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgHIs90s3mcHXbZiOaTYVaQTBnIlBNyPYKTR2xcON3733zeL++yT/PrSQ1Iog1Pm0
 RWj5PLfDKWNYAX/D/FBArpOzUZFbf97tBlDPNQ2ySEGi7xpcbtu4TRg8nqdAHuY01S
 QK7QNVhP8vEfOjQYYMkoeNfKQegc5nCIFQN9EYVOjF0AFPkVeftTioUSW+TvCOhhm5
 fkDR8yQed3EU7OwHQhwTsacZI7jSDV/HPxZQ5DGDfXrclqZo41KJ1Yduws2Mvzy8cl
 VgPZ+3XPGfhWa48Aq5RTLXB9VEJYj31auR4usBY/hX/Rw0nz6naLwOUVU9ez0Xrrzm
 6S7/c9BaDc5Bg==
Date: Fri, 17 Dec 2021 11:12:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <Ybxwovlw2GARzqUO@sirena.org.uk>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JAZpGbY8XOTfys+K"
Content-Disposition: inline
In-Reply-To: <YbtLJeIxXlVyQhd3@orome>
X-Cookie: Pause for storage relocation.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
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


--JAZpGbY8XOTfys+K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> > Document new optional sound-dai-cells property of HDMI node. This node will
> > be used as endpoint of HDMI sound DAI graph.

> It's probably best for this to go through ASoC along with the other
> audio-related bindings.

> Alternatively, I've just sent out a patch that converts the host1x
> bindings to json-schema, so I could work this into that as well.

It doesn't apply to the ASoC tree for whatever reason so probably best
to roll it in with those JSON updates.

--JAZpGbY8XOTfys+K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8cKEACgkQJNaLcl1U
h9DhhAf/UDAiarRWxcOWMBLEJipkZDqy3MtVHPRhVBmjPClHzCw8XiqKmOxxEhqj
1Ec9I4WJ9ABw8o3OeNS+ajtkNG9QuORTVNKRcav90/uAQweEBIcoitYuGmUA+Mty
NFk7jyE+Loz2jh4Ya7TrV8l0PRK9V/jpeaXkpNlK/G1xrRpzRsnZsI2opDwXUZCm
OzafBX6UzCO+VW+zjc0PEqe4khyiGnJrTDjY5CA+pTexnjyNTyvIcCM8oFZx75vr
GIut6OfPBNFO2sPhoAx92dEmzs0jD4jyzHerrEebtxr8HjSYqR+/kHyby2+XWXlj
qKglzvyEcYihHJPF/ma0KJbHQzgapg==
=Ca/Y
-----END PGP SIGNATURE-----

--JAZpGbY8XOTfys+K--
