Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91A59C54F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 19:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE3F836;
	Mon, 22 Aug 2022 19:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE3F836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661190397;
	bh=11zZAIvln2KnjZa+NDc5/38WwFHC5uUCvQwpMLeQgKA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZE3TLTXH4anjxqiDgalELiLtxvndW5Iud1LSzMUZbeaqe2VUu2TVxJmQtF89XUye
	 xmnoQ/bMYQMdQ74NzzYkmdn7c3fONxbqIHiN6TdCYVT/SuPzSKsoMa5N80Sx/JFRaz
	 d8cqg+LKdh680T38DEZUcUPXOzTZa6ksBT/+K6Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2205F8026D;
	Mon, 22 Aug 2022 19:45:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA8DBF80152; Mon, 22 Aug 2022 19:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56171F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 19:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56171F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WUaaP22a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06EC961263;
 Mon, 22 Aug 2022 17:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8238C433D6;
 Mon, 22 Aug 2022 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661190331;
 bh=11zZAIvln2KnjZa+NDc5/38WwFHC5uUCvQwpMLeQgKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUaaP22a5zZsy9GiQ8bCYSYGvAqnmUz0lvNXrBFoireqXcRCibtu479FOC+3OkX2r
 e2MXqPuhICJICWMcFq+cVclfSrp9Yi5KZ6heB9sJ7ulJWRej4BJKMeYR6TeKSefDuY
 EWBFPfQJtR6EOnJhiXOQTvHYQndzw6XMoJ05CjJUhx+NJnt6hPAiy3su+CrfKUZv1Q
 KWKG4oBd/cEdIAo+XLWWd5mMcY6ofQKtMBQXCJAp1C83qba9TnZLHu3WtqqF/YbwEx
 kqZ9A4hnf3PmxuvVL6byKPK1o7+90m0+Va1F1kj46jLjh7yVuu0W0pGxixRT78FDOf
 akf/B/448h0mw==
Date: Mon, 22 Aug 2022 18:45:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH v2 4/4] ASoC: apple: mca: Add locks on foreign cluster
 access
Message-ID: <YwPAtY1kp5tU/isF@sirena.org.uk>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-5-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7TCI7W6orlvhYY9k"
Content-Disposition: inline
In-Reply-To: <20220819125430.4920-5-povik+lin@cutebit.org>
X-Cookie: Do not write in this space.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


--7TCI7W6orlvhYY9k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 02:54:30PM +0200, Martin Povi=C5=A1er wrote:
> In DAI ops, accesses to the native cluster (of the DAI), and to data of
> clusters related to it by a DPCM frontend-backend link, should have
> been synchronized by the 'pcm_mutex' lock at ASoC level.
>=20
> What is not covered are the 'port_driver' accesses on foreign clusters
> to which the current cluster has no a priori relation, so fill in
> locking for that. (This should only matter in bizarre configurations of
> sharing one MCA peripheral between ASoC cards.)

This also looks good.

--7TCI7W6orlvhYY9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDwLQACgkQJNaLcl1U
h9Dvagf/TRY4LCW2H+nmGAoKwC6tDc1DZpexBXRhpqOhlBQD7h3NJbtNN6uIJwK6
E7n1ORFmQFe7fIgSz9vOQmTFBEGg+wYh/RqvEOZhTC0QpdXYe0l4H9yUMCEabiJg
Ngf6f0m08vBex9X2NDr+B/wq4xbXbMVlbSuMdNDgIqPqyczuuGFdBbrGuiOQFtFk
SlCQoiQXWW/OLTcSMok2d7To4zbfON7eaZBZTza8b3XeI5y0vnWyix67qAuhPCMY
i0SGbf2U8gbnEJzlkUDRpsWNH77Qie7c+VzagvzQvefKZd6Ww+ShI1fYq8CVtf+Q
BXIFo1OuoozZ7yTj2FWGC/dn2PuSSQ==
=7Lok
-----END PGP SIGNATURE-----

--7TCI7W6orlvhYY9k--
