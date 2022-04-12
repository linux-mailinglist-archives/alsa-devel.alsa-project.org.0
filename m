Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C54FE413
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 16:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA45918B2;
	Tue, 12 Apr 2022 16:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA45918B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649774739;
	bh=YyPkSFZiPX3tnEpDjqAxgRTFOfvX9ykB7Fn4cGX0UF0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jssNmOObodjfnS9cuonA9TLr7aa3X3SFIxRLAjVD073rFvBGf3DdGtFE46ntNeEHQ
	 nigSGpQ9zrhIHANUrf/FgAdre/cJNfofGlHNNSNlu8XYvsHMOiPW7EebkZf65KGTxb
	 ncUmwJsNIQbFknxvrWoW1X3FNHa9EPi9/mW7jbdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D4C7F80245;
	Tue, 12 Apr 2022 16:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4193AF80154; Tue, 12 Apr 2022 16:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15C72F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 16:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C72F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H4CjaZCd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAB3560EC1;
 Tue, 12 Apr 2022 14:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EF7C385A5;
 Tue, 12 Apr 2022 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649774669;
 bh=YyPkSFZiPX3tnEpDjqAxgRTFOfvX9ykB7Fn4cGX0UF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4CjaZCdZr2FGW4dvCzKA6B5OoP0Bw0Y49pdxU6rDrWXooOAZTh7Lz8u1zvbVNLqt
 1GNtieW8swxtB2nS57K5wxHfV9NeIicW9+3Qa5235UU5q2+ZPyoR8xlG9C3E5EyMDm
 3VXFOAZx6xsgHOmlFpVknJrs1S7Y2WTPLywPcRGI7hy1LfryAmpPyuO79kf8qMW5Kx
 skrKovaCSHTRUzHFDH8iqcHYmKo8ujtHhW3JQPeFoKGkrbR86QKTshtwOmlSR9RQ1w
 uW7uXN92Nw4pjKmLrG3nRuIrZy6yDtREn36uycaAlQKYlZbAkcRsis2stKoMlG10R3
 xGRIEukoJO1Fw==
Date: Tue, 12 Apr 2022 15:44:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v6 15/16] ASoC: cs35l41: Document CS35l41 External Boost
Message-ID: <YlWQR2HGvNpyJ27o@sirena.org.uk>
References: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
 <20220409091315.1663410-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YyI4QGHGKlhb6Lxr"
Content-Disposition: inline
In-Reply-To: <20220409091315.1663410-16-tanureal@opensource.cirrus.com>
X-Cookie: Approved for veterans.
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Rob Herring <robh@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
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


--YyI4QGHGKlhb6Lxr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2022 at 10:13:14AM +0100, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
>=20
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad

Acked-by: Mark Brown <broonie@kernel.org>

--YyI4QGHGKlhb6Lxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJVkEYACgkQJNaLcl1U
h9APmAf+Oc6df07jMKCq7Uy9X5T/UpeuFAbNlxlJrhBs3qmc3imCjQ7IbNif7acx
1hVgpkLKcIacnvfi8enP8nOBZN37BBrSVFjl7V4NGwXRs9lSPEC78WGI8PjWkkQK
OI2TCSLtf7FaecYvZHeyyUiG4+XQewym6W5NcFExVYle96xLHSoUEz1MeMd068ge
fN9dHp0FtZeWvbFlkjEEBYO0X5o8yuGjk+D+ObxUgxW2S/IyaybfI4PgFhBWs3c2
1HVA8Ns7vb5j4D+VuRo2uK7RDX133lcJ/9kx1p1rwWS6HDMSXK2HIC76R5Zii5i2
PGWXmB57juLdVqOJgdISZ9tejXtB5w==
=3njN
-----END PGP SIGNATURE-----

--YyI4QGHGKlhb6Lxr--
