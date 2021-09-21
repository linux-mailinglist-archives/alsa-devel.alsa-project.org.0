Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C8413C5F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A381681;
	Tue, 21 Sep 2021 23:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A381681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259617;
	bh=Sd4owLoxY2SXeScmXL031r167IKcOSlruUI1WJVREdM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NM0T1eIPWzfL5PBw15Fu/L/FbIprrtqntZkFadgPdm3WlE7CjrY0NnCYoAH2N9rnA
	 zO+eefabCzzDuqXQsgc7M8o3hoVsp3ECjs2Hip/kOtI4PQtbXqFTblZgbuo+JY8xfv
	 QWCeTg8XCyT8BrtvFVEPNaUCBwByl5IaaG71A0k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1C3F80124;
	Tue, 21 Sep 2021 23:25:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C963F80268; Tue, 21 Sep 2021 23:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1712BF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1712BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LIdq/Eld"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE456109E;
 Tue, 21 Sep 2021 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632259534;
 bh=Sd4owLoxY2SXeScmXL031r167IKcOSlruUI1WJVREdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIdq/EldCS/1/dkYa01W0kqrcD2y21SMrFUClPtb9Lj9Ghg1ZZSxt6SvnlycPOsPC
 eHkeNxnBDhZ/MngkhMpaA2x3RQaR7FkTj1eBbIrONmXYPuq3TYEVHNLhIttqdsYnDj
 /HjY12weTQKSWrvyHSeVYd7cryzNy7HOEuMfYF8MiISIirzoNPV4nkMvUiQOghAP7v
 pfOOlE6HuVES7Iy3bqnjs9v/UF+l+yiKNHl8wRes6zqf6C3SFWRSOTDHcOYDeX0BYC
 VgFsjGDhlBFtWigvAiRH5YSJBOQU29X9UdZq5yVAlOxlPY3CwuQyr8Sgi3HBlirdXG
 we7vH6DTeOgmw==
Date: Tue, 21 Sep 2021 22:24:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
Message-ID: <20210921212450.GD9990@sirena.org.uk>
References: <20210921211040.11624-1-broonie@kernel.org>
 <20210921211040.11624-3-broonie@kernel.org>
 <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline
In-Reply-To: <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
X-Cookie: Will it improve my CASH FLOW?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2021 at 06:22:51PM -0300, Fabio Estevam wrote:
> On Tue, Sep 21, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:

> > -       /* For playback the AUDMIX is slave, and for record is master */

> > +       /* For playback the AUDMIX is provider, and for record is consumer */

> I think the comment should be the other way around:

>        /* For playback the AUDMIX is consumer, and for record is provider */

> Other than that, the series looks good.

Right, yes.

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFKTaEACgkQJNaLcl1U
h9B8BQf/Srs0pCdiYXC9ufUvd9fHTDaruAvSv6R9Q+X3nA7SQZ/EGOL12yp4JmVO
UfzrCjspO9dVdVk4Y1Dht3JvjlXMdU1kcscxtmEMSvMw2axNZmLSwwSiMEzHO5LC
ylqr0A1OnFxzcoYmBhqXJ6N6wbzDtoo3C0wTQjHeVZ2DSsF2rI5NIXKohikd0XDB
EKaxfD//lf5jNtOfhCVyzBAxZuGX21q4jHPG3+Flj+AdfJJgqkjFhv7EJfIWSzQA
ZXM1nPIUvSWfFRu/zEgPTUfKDaErhT2JGkHtQySkgLMaoNKnJW1KtMm8/dxu4ux9
r1wJPl01vFD0FBiYDxcMcNTyiPsO7Q==
=Z2Ng
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
