Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C23DD582
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 14:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2081682;
	Mon,  2 Aug 2021 14:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2081682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627906710;
	bh=aruJN456iKjOdaui1yZ5IM6E3s2UHMeouUaIGe7Uk48=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ba+swLNfg9+lAOuXrX6eu5Glje1zsalm6jInJV5SHBRzunTeoq+KrIKdYb7xaeCyY
	 AyELAMdakKLGjjWmyU4BvjdzUUrIllSgSNCVsa/P1wm3rb8oRbyUmxkawh/7a5Gu6v
	 8NAggdd4TmSEogJvMA1LcvIFB+k/3kC8ULFvS/vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2698F80268;
	Mon,  2 Aug 2021 14:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9139BF8025F; Mon,  2 Aug 2021 14:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41BE2F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 14:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41BE2F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CwcNPb08"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8706E60F35;
 Mon,  2 Aug 2021 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627906613;
 bh=aruJN456iKjOdaui1yZ5IM6E3s2UHMeouUaIGe7Uk48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwcNPb08X0tnsznd7v0rls02wmboPUEQKxkSgqpA2/qZT0hmfOwAQMi1MpeOBzbqb
 nLgVnDZJJ2MbLLSmZ3ntK54BrA0EaAZWzDboe/hR0wgasLFftQFIYb8mrEBeUsYpei
 p7Ft2WcLuWfOay0dOQ74mPphwrcYJSO30BmHMr215jdupNzafgC67501t0XdMPqP5k
 U4HxWXtG8TbQlqci2RA0hdUbK8n8fgtbQEdds2SQ/HWXKX43k4t61U++/OvBfuJy79
 W7GBcVa8jsmsNnoTxBm2SDkTh1H+e3wQhfdJbTJgtMz5P5qcuhozUkNrXH9AjyTFe2
 8PkB/Fp3BzZuQ==
Date: Mon, 2 Aug 2021 13:16:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Message-ID: <20210802121639.GE4668@sirena.org.uk>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
 <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Biju Das <biju.das@bp.renesas.com>
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


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 30, 2021 at 07:13:24PM +0000, Prabhakar Mahadev Lad wrote:

> There is a updated version of the patch [1] which was posted yesterday
> due to change in handling DMA slave channel configuration [2]. Both
> the queued patches need to dropped.

Can you send a revert or incremental patch for this explaining the issue
please?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEH4iYACgkQJNaLcl1U
h9AmXgf/eDI3wHtrWjkrJbTZI9d/ge9btttmXn7UWAZyKt29MWnhLql0NzpASGfl
+vKH275BfwlAo9WUitiIO5oMTcpALZVYnHVKFAUXtLbgxXYGp7Um3fL7lrksUEDV
//Jnt2t+72+p22fsJbK13APhGvKzXsAgfaGBFB+1PZMnqTEtn9XrwxuUyq2d0BWM
1ZG4cQ4XcNZvrwuJAa7gtaWcIGX5TzgNJQ7C+IHHL9qxR2h0Pi365Ar2sSivRoJq
a7rJoHqVPjpI0FFs7xLUYowlKxwniR5/0cpgblvLqGMtrwO5qMwJu0rEY0llxknZ
FMRI7JEgDgLDiGUHE9qxIl2Es/q5Pg==
=zdRi
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
