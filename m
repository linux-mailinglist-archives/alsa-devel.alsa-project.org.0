Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD51B59B5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 12:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D27169B;
	Thu, 23 Apr 2020 12:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D27169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587639308;
	bh=RjwnHTP2eva16wVTq1KWCo6EOtNgpvCv7s8zsms1nJw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFDW42ivrslF9l8mIDM0Q1+A08rQIDUH3KbfmyBaTSbDu02hGFt7+jMdx93/NUtKi
	 Q/e8wLLdev71ja+e/96XzksQ+3GbKQaqhTaKwz+QIaPTKHl38TPuyPHYR/gSYvWjnz
	 fSgAthu3nru3MmYxnVvwfLfhHf9vQpse/9kzLkQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 857D5F801ED;
	Thu, 23 Apr 2020 12:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88264F801EC; Thu, 23 Apr 2020 12:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C094BF800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 12:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C094BF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mkAUwcab"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 679782084D;
 Thu, 23 Apr 2020 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587639200;
 bh=RjwnHTP2eva16wVTq1KWCo6EOtNgpvCv7s8zsms1nJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkAUwcab26oFt2hNW27sDJNILiBQyTNneBROjROOu6MrPN+9Ue90Xf06bn7/4sBro
 dQ6wB4yiELfVhIgTGHNS7r5SfK5Di2qBsbwu1j00ro7eZkozm6+z8RblOPr+qSxRxr
 jAj6PRaCpCth8Detqa5YBRTPTYU8IC78y9smt6bA=
Date: Thu, 23 Apr 2020 11:53:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC:: don't use snd_soc_rtdcom_lookup()
Message-ID: <20200423105317.GE4808@sirena.org.uk>
References: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
 <d20cc18d0fa10b52437e0ac29ea98792e0a3d45d.camel@linux.intel.com>
 <874ktbuq4j.wl-kuninori.morimoto.gx@renesas.com>
 <ebe305743178c4548b779f25e6400863094ef5a9.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline
In-Reply-To: <ebe305743178c4548b779f25e6400863094ef5a9.camel@linux.intel.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Shunli Wang <shunli.wang@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-mediatek@lists.infradead.org,
 Eason Yen <eason.yen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
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


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 03:39:58PM -0700, Ranjani Sridharan wrote:
> On Thu, 2020-04-23 at 07:12 +0900, Kuninori Morimoto wrote:

> > I'm thinking removing lookup function is nice idea,
> > but don't feel pressure to it.
> > "Now you know it" is very enough for me.

> I am having a hard time visualizing a scenario where we would have more
> than one platform component. And even if we did, I'd think that the
> driver registering these components would make sure to not duplicate
> the driver names. Of course, we dont really check if thats really the
> case.=20

The only use case I can think of is a link where there's a CPU on both
ends for some reason.

> Do you think it makes sense to add that check when registering a
> component? If we do that, then keeping snd_soc_rtdcom_lookup() might
> not be such a bad idea.=20

Yeah.

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hc5wACgkQJNaLcl1U
h9Cu8Qf/cq9pFoV56i2+DRs+jmMJicnREMu0OSge/i/ggbrKqjQfW0sQhCxMsp+x
qbe1NP5lu+wveiQR7uwLVFWSDCwp2aYKsu77bQ32anHS5v6CssSflkOaCGYp802q
g3tYpyR2vndnG0zwa3SZHn71Qz50l84H9rPJScjwipjpK1PkImOng/M8BMsC4pOe
vhgo+0xa4mW98nTdrAruuoE4Ij6AHkYRr1LDoAaVn3X37lgpdenxFTLJLouhARSl
PFnem/27PssfsAWoMHMS++QjB+Tf+UdZHi0yzpHpWRVqQhUpisV4uMdsv5yS//uN
P/wwtqV9ta83VVcMYs3bMxa64vsNsg==
=8wH0
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
