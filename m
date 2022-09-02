Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 615505AAC42
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 12:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13F8163D;
	Fri,  2 Sep 2022 12:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13F8163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662114062;
	bh=CQFx9BBIPV7rdst2Un3d9cttBBfsNAdm1vSROFPyvS8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUuAcb8GyBI/kQhfvXYQ4Kc7GhAaeEBEgvN6eh62TWct8dnQ5GjsKR1P87xjBTuKv
	 znWTDtG9qx0J+ndQCYsSYIjOOO0iCcNZoSDMlHkBR9q4Y6QG5Nyw/iYVh+ojZ7E30X
	 fitYPZHDOFKCYWBQNLwkii6TzNc3ihiY9jeS3uIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CEBAF8030F;
	Fri,  2 Sep 2022 12:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F796F8027B; Fri,  2 Sep 2022 12:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD84CF80154;
 Fri,  2 Sep 2022 12:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD84CF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Af1FAASI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66F0B61A14;
 Fri,  2 Sep 2022 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE557C433C1;
 Fri,  2 Sep 2022 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662113984;
 bh=CQFx9BBIPV7rdst2Un3d9cttBBfsNAdm1vSROFPyvS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Af1FAASI/LcZV3vInAumEI3Ik4yHBJdqHINEcBAVU3Rk3bK+6Yi0dEhhDNXTLh9Yt
 oyH0YoYmxz2+Qo8yEEeeD3SIOUGi7KpqWLaDObeKUu5sCfsEGRswNuNZeLVn7X4z1c
 yViv5D5x8PKeeAZY6kAw4dEVkwaRe/bPopwcO9TFCPpusAy2YwVr0UYoz0I1W7UhUj
 qhbxO9wnqIqoZ4JYv+3QBn/0WsnWFtiiv3YBDw3cJnARowVQSgTgR6cyww/8UUqOvY
 nbX8d/iSAhiqOgT0dwgV0QNEfiEavxzE/T267GI+0CkDrR126t/DKzkKSbqtAzwzRn
 IjkqJIeAeOVMQ==
Date: Fri, 2 Sep 2022 11:19:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
Message-ID: <YxHYusRPbwO2ZcAt@sirena.org.uk>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
 <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
 <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U0OKg5qn858JZiGC"
Content-Disposition: inline
In-Reply-To: <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
X-Cookie: I doubt, therefore I might be.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 peter.ujfalusi@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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


--U0OKg5qn858JZiGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 11:57:51AM +0800, chunxu.li wrote:
> On Tue, 2022-08-23 at 19:50 +0100, Mark Brown wrote:

> > If any updates are required or you are submitting further changes
> > they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> It looks like the patch didn't applied success.

> The patch link is=20
> https://patchwork.kernel.org/project/alsa-devel/patch/20220805070449.6611=
-2-chunxu.li@mediatek.com/

> the merged link is=20
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3D6ace85b9838dc0162b474dbbbb6b388e7561f6a7

As covered above please send incremental patches fixing any issues.

--U0OKg5qn858JZiGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMR2LkACgkQJNaLcl1U
h9Ay6Qf9H/ErQa/tLh9xUc0xSn/fYKkv8V8kj14lZGVScxHAlQKI4cFqYZ/dRVIH
/QTdDm4kJ/W9ObW78riLSTYjbYeWHBjcBTsiYjOdFURI7LV5qjCl769st4JkYLpB
au8x+0B8e/Sv4BLY64KeRBsaQ22JwVrZT6wf9L4WhTwwDA/QpKSLR9nMsB2pwc26
TGe2wjhXZeu7b9d16wQLQZWZJ2uv0CjWgzcvuloIfTmsG16M5vf9AjCvjjVQ2Si+
fRNS59ViX8C5SYuY11b55QGMti1+iA0R73lt7tnqeqgKg23pDheUvo2Q4jNx3Lrz
ZGvqUaJwA69z7a5nAj5Fg2KC0i8btA==
=/dmj
-----END PGP SIGNATURE-----

--U0OKg5qn858JZiGC--
