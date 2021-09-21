Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C278841324D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 13:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28DCF1607;
	Tue, 21 Sep 2021 13:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28DCF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632222820;
	bh=yyXhUn58lpN8Nc0YGD1K+xedQdRickg/qG3CoTgTXjU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkGO1uxPJJ0d1PivU9D8pkMdOMKa7MsHUP6mFTbiYJGihkFVHGzGF+U1GmYt4fxPi
	 cs+MsFfbZb+BpMlV32EQQC7YGL9x8VO0aBN08t7McJIm1rddfold8sl2R6MkbNHzHS
	 wlJB/u9kmTcyK+F+1v809C/plIV8cL93RpMRasKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD26F8026A;
	Tue, 21 Sep 2021 13:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E702FF80268; Tue, 21 Sep 2021 13:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504BAF8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 13:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504BAF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nBLlbnAS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06D6F60EC0;
 Tue, 21 Sep 2021 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632222732;
 bh=yyXhUn58lpN8Nc0YGD1K+xedQdRickg/qG3CoTgTXjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nBLlbnASKOEDfs+fPWH1yuBYrswejvtWMO/OWVRyY+UubhdPyN6vh0rYJJDYjxPeP
 UmE91P2HcZM3n1Lzw4W4YlgjuRN1v0osSiSpP1MBqDjnR/X1y96/b8J2V8CrsIRJen
 bJYYFDkI4rkv1yTkV4bwDk2nHOCLOBCclcAXOgH6GAuXyIQCZc1NDfCddZ2dEwDo8C
 bGzz5ejsuwpAeHYqowsr2UHJ4VxNFf6r/hcHXi6GwWUoy4eTFyxBHcGbe6Lc34/5fu
 lmnftTtUc51J2xA7qlp3uL33Lg8d32dFqmc+XsdlWr4cBrr94ogeiVubcI1PuPmLke
 PDgHXOzmAhIWQ==
Date: Tue, 21 Sep 2021 12:11:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
Message-ID: <20210921111128.GA4203@sirena.org.uk>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <YUj9LqNTH6A4CQcj@sirena.org.uk>
 <8ee31fd2-3fbe-f5da-a030-c6b677c7f398@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <8ee31fd2-3fbe-f5da-a030-c6b677c7f398@axentia.se>
X-Cookie: Quack!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
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


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2021 at 08:37:28AM +0200, Peter Rosin wrote:

> I expected it to just work to mark the register as readable and do
> without the default value (i.e. the way it was before my patch). What
> I don't understand is why regmap returns -EBUSY in that case. That
> doesn't make sense to me. Perhaps that -EBUSY is propagated from the
> I2C layer, but in that case, why is it then ok to do a write to
> another register at the same spot in the code? So, why -EBUSY?

Actually one thing that can trigger this now I think about it is
attempting to access a volatile register when the device is in cache
only mode for power management reasons - if the device is in cache only
mode then you can't do a hardware read so volatile registers become
inaccessible.

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFJvd8ACgkQJNaLcl1U
h9CJKQf+OegzluneiRTJmiVh6LiL5bpcPOvlcoNyjQ9V7XuKD3L0HAt3Us2w4Uz1
zf61Wc7v3L50DjZ/bcEvPceanzWn2NjRwQCxHX9PTskwEAMGig5ydmm4rMBfWk6F
hZFCefunu2I5armlczsLCuvPPmvIeE0fOk1/t4Ha92c4ifxyFWoB2uoe/bxLNxzH
KhhHYssXI1D142G5khsfTMkzWNOIOIecjUuaQsTCO/AgdxO5K120c81ZzFJlVcKu
GG2UcJSi3Qt4XAmfDqRgpO3r2E4DiI/8ZwPW/LZkZHkBwXvBYaOqM0ueYDTSF+Ny
sam8UqO9TDsZC674q0fTaBS5mj+xoQ==
=ztW7
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
