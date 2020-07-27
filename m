Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652922F464
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 18:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC04A16A3;
	Mon, 27 Jul 2020 18:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC04A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595866315;
	bh=w72uQXMP5YHY08KIGqAqx53HT7rk/vkevwYe+3HCPz0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F1V7AZTZvnL4shhhEdhRKF0JAZccoVeERi5EsnH+8I5esp2U5fdVAb+Fm48tpzdzR
	 mCV3km7g+dUiR5UmQVkhDdXYe+M3E257KXiTWC0x92mQpzgvUVbzhCA+8yniAdGdt+
	 0zVGYxW6eAkv5N1v99eWfKEBXG5HMT8yQgT+zj2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E2DF800DE;
	Mon, 27 Jul 2020 18:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E50F80171; Mon, 27 Jul 2020 18:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B269F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 18:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B269F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p4Sucanw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A9322075A;
 Mon, 27 Jul 2020 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595866198;
 bh=w72uQXMP5YHY08KIGqAqx53HT7rk/vkevwYe+3HCPz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4Sucanw2Q6ekKNN4eVTk3rhHV7r7potA+wJqIcZMTxM0W1czFkkL48Ahjiu5agax
 G41HUN2vdItQkhfi2Si1Ju6gXOTwCVoyNZvW0ezCJnkO7maTJiEPG6Os/m4RYd/dFv
 yZWvqZAIURw993uSvhhqaRrwut4LtHEdjhd4sxl8=
Date: Mon, 27 Jul 2020 17:09:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Message-ID: <20200727160941.GE6275@sirena.org.uk>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200727145840.25142-3-Vishnuvardhanrao.Ravulapati@amd.com>
 <c467e2ee-727d-4bf5-8ceb-90c784245a43@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline
In-Reply-To: <c467e2ee-727d-4bf5-8ceb-90c784245a43@linux.intel.com>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Alexander.Deucher@amd.com, Akshu Agrawal <akshu.agrawal@amd.com>
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


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2020 at 10:31:24AM -0500, Pierre-Louis Bossart wrote:
> On 7/27/20 9:58 AM, Ravulapati Vishnu vardhan rao wrote:

> > changing SND_SOC_RT5682_I2C to SND_SOC_RT5682 because,
> > This flag which was previously set as SND_SOC_RT5682
> > used to build rt5682 codec driver but by changing into
> > SND_SOC_RT5682_I2C is preventing to build rt5682 codec
> > driver and machine driver fails to probe.So Reverting the changes.

> The split between I2C and SoundWire means you have to choose the I2C or SDW
> mode. Selecting the common part looks very strange.

Right, and I can't understand the commit message at all.  What's the
actual issue here and how could this fix it - in what situation wouldn't
you need one of the bus modules?

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8e/EQACgkQJNaLcl1U
h9CKXgf6AvYkL/VifAwuI6fufCCqohAgwDo9/Sn+16ySmm6jOodTnLwgOBpZdbe9
bVop3W0j0q+YF3H8fkqlaxWM29d/LRRRj8mjqZ8MfMwOIieCFsGcnsMtlQjx1a/w
l564OVBpTazkcHPBeQv/B3czqvKGqi69b4UEm0YkiNtzpY1VFakDkiBFp5Vk0wEE
OqUIzNxL4GyW5GGX7XMxIpDlYAd3XwLDUlzy2q/6nqbpINwTPRLx9iG/NHCCa8sD
Cdkev+6SsslKfKcni65VGqacIutXl5ynN1WDsFhLylWSl6YnD1HEti9t14j6YQP3
fwLkcF533X5G/OLy2KmhiWxvB14zkw==
=4bQQ
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
