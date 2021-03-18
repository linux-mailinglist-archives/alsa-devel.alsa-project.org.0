Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5503D34063A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 14:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1B91699;
	Thu, 18 Mar 2021 14:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1B91699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616072525;
	bh=qiLGY8HKokEXMDj9gmWP7GdBd9E0/I3VxuXUFnw4L4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkdknD4rybwEMcLhnoopQEmax6KLCrlxhAwFmTOLCTWCn3zlbrLx3f7udnzDlyjiN
	 4WbHgWR1eN3SN4f82ormL1D9el+jOcQ6pvYa8z0O963G+JMQM/QEJT/jJZionyxegu
	 Uw+IiqIkvLwAsiHLfuKbWpwAGig7s3ZlZxjRd24I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C45A2F80171;
	Thu, 18 Mar 2021 14:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33562F80165; Thu, 18 Mar 2021 14:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E828F80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 14:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E828F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JF6SY/cs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6BEB64DFB;
 Thu, 18 Mar 2021 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616072423;
 bh=qiLGY8HKokEXMDj9gmWP7GdBd9E0/I3VxuXUFnw4L4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JF6SY/csVQv0pg+Gd1+TcERHzfl+AMRRfa+cnAtakWdGQVzQ/GQu1si2wPKv0cxRV
 ZCX32ZPvXYuAi/xwzKgpM4efzek1g6nDXaAkuxvXFSDVn9SOUkOrnXTJVZxDy0o1U/
 FKeDK9CruE+rnFXJQCb3BRQTEtnkpa9/uK+sM4l+VWLmtq9KW6xsSdOey2Uw1UgT5h
 rLaj811weo4yy/XDyJdyPL/G4jq3KOwvGGtIPVtL+UZrmm+olCB1GQyOg3QuUSyLCo
 9/U9Yo6vAwzxjA+D5PI6s9oz0BPJ78+Xh8B7O/gb6m1xE9Tevr0OxNat0dfQv5WmsR
 5TN0oedTGC1Rw==
Date: Thu, 18 Mar 2021 13:00:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v4 1/2] ASoC: amd: Add support for RT5682 codec in
 machine driver
Message-ID: <20210318130020.GD5469@sirena.org.uk>
References: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
In-Reply-To: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander.Deucher@amd.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 02:03:46AM +0530, Vijendar Mukunda wrote:
> +++ b/sound/soc/amd/acp-da7219-max98357a.c
> @@ -1,27 +1,8 @@
> -/*
> - * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec
> - *
> - * Copyright 2017 Advanced Micro Devices, Inc.

The conversion to SPDX really feels like it should at least be called
out in the changelog, and probably a separate change.

> +	/*
> +	 * Set wclk to 48000 because the rate constraint of this driver is
> +	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
> +	 * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
> +	 * source so for all codecs we have to limit bclk to 64X lrclk.
> +	 */
> +	clk_set_rate(rt5682_dai_wclk, 48000);
> +	clk_set_rate(rt5682_dai_bclk, 48000 * 64);

The driver should really check the return value of clk_set_rate(), it
can fail.

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTTuMACgkQJNaLcl1U
h9DN0wf+NKVDPN2KDugCF3BfHq/kxUZElE/b5zMal0As5PwF39C8vSdRLZrIlNAc
yUUKO253/08URkdQcn6YySagM3E0xhITI2q4QFukAbIfhVWNb0HsJ4HuN3PLN+cR
FFB5RGdTW3ZmKOtjyvN09BZBbRemWqc+ppXvrIvi44XW5jvxIEGKrppDqGPGGX38
VjivFZg05OEk0eL52pZNlHf9FQVVKQ/I9+Y+uboyccbd+vApRuy4oXXxjyUsQZYq
b3FONTatPOutdnGp7aYSuo+aN1OOgE6/G2u6/qaIXHQJ4bmJq4LyAiebevNaYL5H
3E34/fGw7sNYA6VDfdBHaz9yR4E/dw==
=g1k8
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
