Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF011A4A8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08251669;
	Wed, 11 Dec 2019 07:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08251669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046581;
	bh=Ejr8O/1+mOgV447H2wg8t+C7b/UsmzPupplOqLBF1QI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umd+0VAPIkXz9a3ZMBzjgBxIgZL0gJ1oNMRioex9p/2vO9RIhJ6on7L2ZpE53fIsR
	 g3nT84ptB3BM3/Z2X6G9h3XuTN6+MlA8StdBbOdA+kyPLkG6BUmtyKkKaDIRhiZ2B6
	 tg/oQYNHp3BIlHi2PP1qsjNmCwHnu/rIjS4XZwBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA205F80276;
	Wed, 11 Dec 2019 07:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C136F8020C; Tue, 10 Dec 2019 19:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E8220F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 19:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8220F800F3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C4C328;
 Tue, 10 Dec 2019 10:59:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8A9D3F6CF;
 Tue, 10 Dec 2019 10:59:34 -0800 (PST)
Date: Tue, 10 Dec 2019 18:59:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191210185933.GJ6110@sirena.org.uk>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
 <20191209204735.GK5483@sirena.org.uk>
 <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, spujar@nvidia.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for
	audio mclk
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
Content-Type: multipart/mixed; boundary="===============6415233393863852165=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6415233393863852165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XigHxYirkHk2Kxsx"
Content-Disposition: inline


--XigHxYirkHk2Kxsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 09:24:43PM +0300, Dmitry Osipenko wrote:

> In some cases it could be painful to maintain device-tree compatibility
> for platforms like NVIDIA Tegra SoCs because hardware wasn't modeled
> correctly from the start.

> I agree that people should use relevant device-trees. It's quite a lot
> of hassle to care about compatibility for platforms that are permanently
> in a development state. It could be more reasonable to go through the
> pain if kernel required a full-featured device tree for every SoC from
> the start.

We absolutely should support the newer kernel with older device tree
case, what's less clear to me is the new device tree with old kernel
which is applying LTS updates case.  That does seem incredibly
specialist - I'd honestly never heard of people doing that before this
thread.

--XigHxYirkHk2Kxsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3v6xQACgkQJNaLcl1U
h9DaRQf/a3YemFgucFyV5HfTaJz5xFhKVR+h6YPRh1yMll+FZbh9bfsgwoQ0yWWe
pu3FNb2UWObN6Yd0c6nIxiIJAqyvPridz15jnQ8mfGSTehSRsbHf6YkTUsDeSpik
LZTQ4pCWNtrA5vJuFJ3i9DMNfOFTQjBOTwnFM0JcecBddROFtPhAG5CseblR7BlT
hBvipkmnrquc66L0hFpbqBoBN4RvHAaYBa+t8GZntPUqrQyN1XxtjJW4Ye+IRS7u
CsSsnVe5WUhZp70+Fa2UxTXhtAnmpTl5cFixH6fq6ynxgwgueKOHDfmLNB/wSR4I
Cg0W+t7FHmBN2Wrd/7z/avBc1teFeA==
=c8lH
-----END PGP SIGNATURE-----

--XigHxYirkHk2Kxsx--

--===============6415233393863852165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6415233393863852165==--
