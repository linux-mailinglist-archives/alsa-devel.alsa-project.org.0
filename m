Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE339DCA0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 14:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7F31675;
	Mon,  7 Jun 2021 14:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7F31675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623069478;
	bh=G5r7/ECXjjJODsldtglcEX396NyWKuO1n0kOyfzMiQI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3CEWY7VbwVeK3mv16tsZkMem489OSoS4FGM5KFF6QUco6Udpx1cN1o2tvo9Sj/Vt
	 natmOxWCLnvcgMN93MCEbAvj1n/TRfrPr7+GhYI3ntI+5p2m0qMVcLDsPjQE5OoHpz
	 AQgbXOJjhvQnL8DX3GzjjZidTHkT4nVQ3/QQf6Rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F295F8026C;
	Mon,  7 Jun 2021 14:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB2E1F80212; Mon,  7 Jun 2021 14:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D83F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 14:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D83F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OunTk1cw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2C3E61057;
 Mon,  7 Jun 2021 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623069371;
 bh=G5r7/ECXjjJODsldtglcEX396NyWKuO1n0kOyfzMiQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OunTk1cwhfgW+JmTvEjvowO4FGu0riA85b8yO/86G2m/9RVn391gxsNSFGDBOnjfB
 M3aSJGdMTT85Oc0dbtQ/SVSQgscnVYOtQpY4CnVoYSq0Z/nHqLyYBo9k0vXdYKtkKS
 jLBlPKfiRHbAXNA7nhopMpeyGYuzqfGhfKcVWw8km2HBloVAOhdxuBVTuepnlovT5e
 4VH4gmGLR38hzarCSFaeMTWpK0ZZ7MWhy6ULWUE4Ns2RrRLWoboJzxWd1ruYkF8uaY
 nIqwMnv1Kn7US0qQu0vN68xeX1jhXsIwnVYQeiQBGVUlRyaNQye2X5cp/imOdFw7N3
 iiXacjoUBY0pQ==
Date: Mon, 7 Jun 2021 13:35:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiabing Wan <wanjiabing@vivo.com>
Subject: Re: Re: [PATCH] ASoC: Remove unneeded semicolon in rk817_codec.c
Message-ID: <20210607123556.GA10625@sirena.org.uk>
References: <20210604142652.GA915@sirena.org.uk>
 <ACAAVAAeDkjqA4*JP7kOYqp2.3.1622854711099.Hmail.wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <ACAAVAAeDkjqA4*JP7kOYqp2.3.1622854711099.Hmail.wanjiabing@vivo.com>
X-Cookie: I never did it that way before.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee.jones@linaro.org>
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


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 05, 2021 at 08:58:31AM +0800, Jiabing Wan wrote:
> >On Fri, Jun 04, 2021 at 11:00:23AM +0800, Wan Jiabing wrote:
> >> Fix following coccicheck warning:
> >> ./sound/soc/codecs/rk817_codec.c:49:2-3: Unneeded semicolon
> >
> >This doesn't apply against current code, please check and resend.

> I fixed this based on next-20210603.
> And this also applies against next-20210604.

> It might be my fault that I didn't decribe the version clearly.

> Should I write some description at subject line when working on ASoC of  linux-next?

I tried to apply this against my current -next targetted code, it's
possible some change happened since the last time -next was built.

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC+EqsACgkQJNaLcl1U
h9CopQf/bjZfndyShnvT4WyLhTOoK0SUwQh7QykPAKEeE7ejDFja2feDqST5eXLf
8Ocu7uQby9WmuhCEj5IyC8Ld1c/tzyUrC0mv9oZEzylpGFOybcc57WUfV/aIQOeW
Q5cypacayvQiZPnqEWnQRylg49Va/rOW1J267xhzSQy+lR4TpLjMAp2YaTXKdl3D
0+MK2/YBmyXzKS1hUlb8oxfoQ632ey1NVPf9X/q4sJRQJme4E6A9v88d9jNDRdxH
JIMY/yOXGH5vs4l32ba+vNCbisD+Nm/OGxVmgmluiDpL4YqTwOaRPfQTyHK8U1eY
SdvYrgK8b6TP8cxRhezY7c7PWey6Yw==
=qVoD
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
