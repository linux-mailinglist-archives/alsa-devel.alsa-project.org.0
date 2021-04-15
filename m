Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AF360FD1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89AFE9F6;
	Thu, 15 Apr 2021 18:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89AFE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618502769;
	bh=VhD6RKqtsu7rzG1GFxVGJoN3lqK7UBy9qUrvzK2nO10=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+hejSeM5mdfryu4oonfy4C3vY72BaOpwPd8EZFNFybU2S9rOtNbDmdmGfhVH1wbE
	 2pEH1HQZH2iL4vWhZ/j7uTUFDSGkxZXrsOjHkq6AjUykfZfCOOuwH/tYOQaNLzx7kP
	 4QrJxds+Dy8qrgxesUM+1Tr8ZT36Rdl8MI4dad0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2F9F800ED;
	Thu, 15 Apr 2021 18:04:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B553F8022B; Thu, 15 Apr 2021 18:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 978FBF80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 978FBF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yfgvs1iS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB74161152;
 Thu, 15 Apr 2021 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618502673;
 bh=VhD6RKqtsu7rzG1GFxVGJoN3lqK7UBy9qUrvzK2nO10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yfgvs1iSpGPuFXEGSt2UOVvJObvxY/+g6TkEbBKUcdgcCfuk2Bmb82MG/ofYQ6Man
 MsOxF3a3ci1Yd5hQrmMOqzTMBDUXONX1Ac6pGjNYsavrBoTJzp82sN7mCP2umafjVX
 z8+ikszUDa3cKzml3wp7OchGD9IipoC4S4pOvynmCJJieodU5xhUl05ZbCs4sYqQN2
 b1gF4/mW4N8zO6suLzcufVsIFqV6tA3eM/UPLesZ3kW6m9De21OquoxLwof646ijXz
 gEyiMQHN/H472b9/8+jZdHLaEKxLLIIiWhk3VA9MRCxgHyyt0saasSkx8YLyQd97RI
 V9mbGSsLXSKqA==
Date: Thu, 15 Apr 2021 17:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: Re: [RFC PATCH 2/2] ASoC: da732x: simplify code
Message-ID: <20210415160410.GF5514@sirena.org.uk>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
 <20210326221619.949961-3-pierre-louis.bossart@linux.intel.com>
 <PR3PR10MB4142E8DBB9313E751DA52DD0804D9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ULyIDA2m8JTe+TiX"
Content-Disposition: inline
In-Reply-To: <PR3PR10MB4142E8DBB9313E751DA52DD0804D9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--ULyIDA2m8JTe+TiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 04:00:48PM +0000, Adam Thomson wrote:
> On 26 March 2021 22:16, Pierre-Louis Bossart wrote:

> Apologies for the delay in getting to this. The change looks fine to me,
> although this part was EOL some time back, and I find it hard to believe anyone
> out there has a board with this on. Wondering if it would make sense to remove
> the driver permanently?

Unless it's actually getting in the way it's generally easier to just
leave the driver than try to figure out if anyone is updating a system
that uses it.

--ULyIDA2m8JTe+TiX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4Y/kACgkQJNaLcl1U
h9A/eQf/a+AuW/wdA7h1NEPo7bdjlp1RtuPF+QM8UnlWMLsXDYWN8pPMCeDIf5X2
lQvH9kzTWD2tGg70PPgkQXDY0rljNHYrMZVU2yktmuSlmJHJraw7SuTCWAk28ujx
QQuKNwIfFu0P95DHCLHODG6sGXuT8asRlB2jS1UJJVgSaWJkSPPeB1jdrA/6F9Fs
uDF6gVvNYpt91x53I7le86YVD7iZfqqxSSKLdGIUejiV9ozhCUkwt8yXDEKRdlOq
4O8wOiJ+409SuWfwEZDX8WA+6pMvo+9wvROWvsRn4tumMtMKp0a2x8DDBl/h6Cbi
+YpcN0/zwJeye7ecVmj1sE26WqcW5g==
=jQj2
-----END PGP SIGNATURE-----

--ULyIDA2m8JTe+TiX--
