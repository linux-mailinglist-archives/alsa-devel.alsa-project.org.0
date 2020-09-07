Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D825F906
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 13:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75BC1776;
	Mon,  7 Sep 2020 13:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75BC1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599476919;
	bh=ASDavNWFz3Ru48cBueNff8IUESkv+WSF8MU9lmTCDDM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acrKIcNCa2EmF3uSLHGNA0CdxHXNN92hqGcs4a23ZlG9uIuw8abGs/MBWnoDZ1NT/
	 Vi5QiIX307mmw0rAxVDp18xMrcMLljLAEbyS74CActNaKiZSBvspCvlyc5luOgV1Ky
	 jX2puvfce++DVrQrsfmEWDngymTD5ZIA0RwWjfco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2348F8021C;
	Mon,  7 Sep 2020 13:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E08A3F80227; Mon,  7 Sep 2020 13:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CDDCF800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 13:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CDDCF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uizH5gSg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27918215A4;
 Mon,  7 Sep 2020 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599476805;
 bh=ASDavNWFz3Ru48cBueNff8IUESkv+WSF8MU9lmTCDDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uizH5gSgQY51RFhQPtobIYQvnQMwEBDfIS1Pk252+RUx7HShA+bOPvpLPoldlaj+n
 rgmiUppSDhdoQrrkxSWP/uOUd1vp80WvfrYpIHJOrJtcyY/dyu7AZLzzkoeIJaoAIG
 uTmLbQhAAMZTRBZJPLle4RUGpWBdWTqFSPtlnM5U=
Date: Mon, 7 Sep 2020 12:06:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: rt5682: Have global name clock option for parent clk
Message-ID: <20200907110601.GC4907@sirena.org.uk>
References: <20200907040038.3124-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <20200907040038.3124-1-akshu.agrawal@amd.com>
X-Cookie: Elevators smell different to midgets.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 derek.fang@realtek.com
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


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2020 at 09:30:37AM +0530, Akshu Agrawal wrote:
> When adding parent clk(mclk) to wclk, this adds fallback option
> for the case where global clk name is used.

> @@ -2780,6 +2780,7 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
>  			if (rt5682->mclk) {
>  				init.parent_data = &(struct clk_parent_data){
>  					.fw_name = "mclk",
> +					.name = __clk_get_name(rt5682->mclk),
>  				};
>  				init.num_parents = 1;
>  			}

I don't understand this change - we clearly already have the clock so
why can't we just use whatever we used when we originally looked it up
here?

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9WFBkACgkQJNaLcl1U
h9BDVgf/TzUykCu0F6H22up3PWm1DPnZbDx/M60THNm08kFwphVcM57B4Jls3/U1
QLLodHKZreIHEu3+WcNDrZdWezwElxhBTfb3PL15lsJbsfQr7v0awbLUO7beDrpB
tHznqF+INvVCU1xHDxUXIvmOp6ftsl+ltLw1I4Va3yIpkM3uFhwJMnZJAJkWj2+9
RPnFT6Ru9Bb7r9F9QghpW4y5rf662w/ugJRNy+1dCGm91GfN0UbbnB7HKPIBXN+2
qsWtFP8Tjk1HBcC+o4Bi9FqF7C0JVVrR0K1dxs2TQWkItdz56TP288gVpVtHDyAm
v/zO5tqxlx4K6u1vbPUAdM3dlMoyjQ==
=yIiR
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
