Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DB554569
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 12:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC701674;
	Wed, 22 Jun 2022 12:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC701674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655895218;
	bh=rwk8hgLhyEq75QrfTeWAqx8ejeRm0e1M99H+oLicMnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Srcz5Q/Rmk0bP7JvNhKDfi7lJ9K8RYgVnibG1zDmeHyLgxEi8aUhqMXb+IhtLZuU0
	 hB4AyMXG1agyRdoBx2Lb4rXYbHv4xE9sfcyxu1xpkth3T7aX64Rw4pLkh9aCgugNaR
	 tS8wp7Dd493QciPNZKkYni03AuInhuPOymQuXf+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDCA3F800CB;
	Wed, 22 Jun 2022 12:52:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C6C2F802D2; Wed, 22 Jun 2022 12:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34B32F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 12:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34B32F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nX24UuZL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE73261158;
 Wed, 22 Jun 2022 10:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBDEC34114;
 Wed, 22 Jun 2022 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655895148;
 bh=rwk8hgLhyEq75QrfTeWAqx8ejeRm0e1M99H+oLicMnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nX24UuZL9S4TE9/a6fogP5oLkCv/s7fHSepSKb2LVz54fUPotYpsmnEIhfOKUIaCq
 qImBTvDQ9ZRzZ0YJSI7gJA5n5i6tXJRCUO5IYQh4dWAfJ2N18IwNsGrAH+vlykRvre
 5WryU7ziTXzslzbjqacGzayPAum1ExcBrGnfiRuJSiOozRlQjrOQKTP50n3uYaGp+E
 YD7kLVD/9z0b92Q3Y+1iN0M1GpCDKbge6YO59HMXf7zjVX0fLvUuWuJnuamRPwrNBg
 XVBtKySVNv8jAklhn3X1YwYfz1TCMGwJWXkePEN1WRpMbjWn1J4eJI14QZghK8FoaC
 r89fOCTTbgktQ==
Date: Wed, 22 Jun 2022 11:52:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH v4 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <YrL0ZkIKF1U2OWNp@sirena.org.uk>
References: <20220619095324.492678-1-judyhsiao@chromium.org>
 <20220619095324.492678-2-judyhsiao@chromium.org>
 <CAGb2v64WsRV_pPsD4BQOjtFXOwca5xVkrXRxyxz2OLvQqKifPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BIVYhsqQd7Iog8ZD"
Content-Disposition: inline
In-Reply-To: <CAGb2v64WsRV_pPsD4BQOjtFXOwca5xVkrXRxyxz2OLvQqKifPg@mail.gmail.com>
X-Cookie: Truckers welcome.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--BIVYhsqQd7Iog8ZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 02:02:41AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Sun, Jun 19, 2022 at 5:54 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> >
> > We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
> > may cause the speaker melting issue. Removing LRCLK while BCLK
> > is present can cause unexpected output behavior including a large
> > DC output voltage as described in the Max98357a datasheet.
> >
> > In order to:
> >   1. prevent BCLK from turning on by other component.
> >   2. keep BCLK and LRCLK being present at the same time
> >
> > This patch switches BCLK to GPIO func before LRCLK output, and

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--BIVYhsqQd7Iog8ZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKy9GUACgkQJNaLcl1U
h9A7MQf7BlCSyORrbv1Z1U1fwvocqMOp/zQ3ScF3gRjRuDSNSrc3rkFkEHkeviE/
1LpuBEcnpUIETJy3OltG1wNBZDQwx7lvGEhCEqn8JWCmdX9njKXd4tdU9Zs6/37v
nTJwRCJajfq+qlLJZIMjdycECSojoUe2VSQwwe+recGeE+glYfFMLD1JuWsHU/IO
LhhFX7Xt9gtFPjZ+lavlytNdY+r9F7kttndFGKy9gcEIw4u23tNIde48Fu0Fr5JA
9fAMlQB8BV4bgAwet7As6wudbSaK7xbmUPAxnK9bX1P44XO5VmmuCbtzZM0J09Gs
Y0IzBvxAq8WKbOfhZzfTE9g4wYjzDA==
=VY9T
-----END PGP SIGNATURE-----

--BIVYhsqQd7Iog8ZD--
