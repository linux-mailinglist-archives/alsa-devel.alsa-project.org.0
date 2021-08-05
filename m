Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE73E1742
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 16:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7DF1682;
	Thu,  5 Aug 2021 16:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7DF1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628174807;
	bh=TvLn9ZuasSfXRw3iZBv/5f7AAqvlN30bFTdP484ThlA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/Ciyi0F/UsmD/he7iVmWleWUrcuXOk8Ohf4CJNXTG75XEcrrP8BGAcniR9/LftM/
	 dE1NjpRCU5UQIj3PYp0YvEV3sRm/++557YhRTlO6ez0Oulpy9MlsvPXgDouHPw7vAs
	 oX9ljd9bBfqbDOWRmViTIsO+h4VqBuCEAjbR74G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F25E9F8016D;
	Thu,  5 Aug 2021 16:45:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7183F802E8; Thu,  5 Aug 2021 16:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B193F8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 16:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B193F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CwCI7/3y"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97E9F61102;
 Thu,  5 Aug 2021 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628174708;
 bh=TvLn9ZuasSfXRw3iZBv/5f7AAqvlN30bFTdP484ThlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwCI7/3yyamkLk1Nfdrgve1VCG4NNGFzIItPKXBVZf1Fo6DGgUdGnLAlVY/8ogIWE
 szZKJ0/FUc4uYAI6yW9V72CC3WkUjt/oXS1vP4nAHwMtMzCaYvdT6bM+8ipDVx9UNt
 MhvSoQyUY5PWvweN3mEB5/V7WHSVO247OvCAyAH4t3x/+l0Cq4uHUfj96hGCaC0fDb
 4DkomK+cu1m4HF711LHdNFKaceX90k6yVZIkYcVplPdyxYm3i8NV16fLM413XbxAqL
 jzBUAHaqqyO4++4ijNralFJjKwev0qZ6NhJMc0qwS3GMoWXhtu101spK1VeUuwgx69
 YZKMIy3ZHWA/A==
Date: Thu, 5 Aug 2021 15:44:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/3] Add RZ/G2L Sound support
Message-ID: <20210805144452.GP26252@sirena.org.uk>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dT+85zccSFkyJC53"
Content-Disposition: inline
In-Reply-To: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das@bp.renesas.com>
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


--dT+85zccSFkyJC53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2021 at 06:23:08PM +0100, Biju Das wrote:

> Biju Das (3):
>   ASoC: dt-bindings: Document RZ/G2L bindings
>   sound: soc: sh: Add RZ/G2L SSIF-2 driver
>   sound: sh: rz-ssi: Add SSI DMAC support

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dT+85zccSFkyJC53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEL+WMACgkQJNaLcl1U
h9DS/gf/SEn8sYZfcSYAo2NGTHR61NlHi3R1HIpFNOtn5bqM3XcXgM/jGJLFYQpp
avDf0natT/t1I0H/JCeWASeYYiAR9p5eLwsu7TiXahOKxOv4OwZrCrnKeW021Zve
h7q9AQDHZNvY8xvhmSVo0Ni8wM2+MAvxmCQTl7iDxOAmspFN464GhKhV7LmwSrab
8rfmmIWnc1B5Kvsbu4KFlP2e2X2qsTFh7aob5Nx4kAJTqnxU9XQBIPFgZxHXf8fW
g4NxUdztmehIMenvS7DC0dnYeg1FZWPSTF5dfgARWM6rP1xLVV5d1Syoe/nkR1Ap
tEaDkRtYL3Qdam0fVomHh1ZQXUWsLA==
=8gjn
-----END PGP SIGNATURE-----

--dT+85zccSFkyJC53--
