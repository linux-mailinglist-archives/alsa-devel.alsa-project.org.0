Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABC426E18
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 17:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7551664;
	Fri,  8 Oct 2021 17:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7551664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633708237;
	bh=/BWvwFJBk02IyYT4262J5SuP0J4qDObIlYIfzXpw7wg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uLdKoz0zyDQykoCt2rbekEPu58oF3pT/q53/zBypRZzNh896b2Ge8XKF6DEXNjBAw
	 zbK4lzC0lVrBcbpoxjZhaCM1AbI09Je2iuarujxThsJoPOzrRYDJS3XyLZCJzGu74D
	 m26CQ8/w2oer8GJfQFe3HagySQCJX9LRecFqBJRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D1FF80124;
	Fri,  8 Oct 2021 17:49:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C87AF80246; Fri,  8 Oct 2021 17:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4EBDF80124
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 17:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EBDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y2rf9snc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCE7760FD7;
 Fri,  8 Oct 2021 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633708150;
 bh=/BWvwFJBk02IyYT4262J5SuP0J4qDObIlYIfzXpw7wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y2rf9sncPPkWVFgqI0XksyVPXiOpu1Cvv/mtxkYfXKDSxuCP6X/mVinFwoir5dzhj
 6EBoD2ERe6yn2O0A7wMwWxRfme26f02xbHjeqg/BFOCCJHUTkxxfnoIYjNQU+xOruT
 +u+kUE7A4HwQSbRT0qsKZleSqv7/Y4q7uPwkn4OqtlNospI4TTqa6+C0bw38i76Mvx
 QxImAtBSi/7EawGLC3Xhd3KGDTW5k++8gifRFKf1yGSpQV0c1rxYTFyXaaXBiFxp2+
 z+RZzAWCSo2g8VOeJKLeosJTwB/if2LXf0rZwM8lJ1EXFHvhCBfL/mvDustGk4iA4D
 7o2HmKRXnvBYg==
Date: Fri, 8 Oct 2021 16:49:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH 4/8] ASoC: amd: acp: Add generic machine driver support
 for ACP cards
Message-ID: <YWBoc4LJPUS733ee@sirena.org.uk>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
 <20210930132418.14077-5-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4nUCpXPQrhPMEzCJ"
Content-Disposition: inline
In-Reply-To: <20210930132418.14077-5-AjitKumar.Pandey@amd.com>
X-Cookie: When your memory goes, forget it!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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


--4nUCpXPQrhPMEzCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 06:54:14PM +0530, Ajit Kumar Pandey wrote:

A couple of things here, most of these are probably fine for now
other than the EXPORT_SYMBOL but I think you're likely to run
into issues going forward and need to refactor.

> +	switch (drvdata->hs_codec_id) {
> +	case RT5682:
> +		pll_id = RT5682_PLL2;
> +		pll_src = RT5682_PLL2_S_MCLK;
> +		freq_in = PCO_PLAT_CLK;
> +		freq_out = RT5682_PLL_FREQ;
> +		clk_id = RT5682_SCLK_S_PLL2;
> +		clk_freq = RT5682_PLL_FREQ;
> +		wclk_name = "rt5682-dai-wclk";
> +		bclk_name = "rt5682-dai-bclk";
> +		drvdata->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
> +				   | SND_SOC_DAIFMT_CBP_CFP;
> +		snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
> +		break;

It feels like this is going to run into scaling issues going
forward and you're likely to need separate operations for
different CODECs rather than just different IDs.  Similar issues
apply for the amps, it feels like you want to be passing separate
ops in rather than having these switch statements.

> +	/* Do nothing for dummy codec */
> +	if (!drvdata->hs_codec_id && drvdata->amp_codec_id)
> +		return;

Wha the test seems to say is do nothing if there's no CODEC but
there is an amp...

> +
> +	clk_disable_unprepare(drvdata->wclk);
> +}

...though I'd expect that given that the clock API accepts NULL
clocks you could just remove these checks and unconditionally use
the clocks.

> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(acp_legacy_dai_links_create, SND_SOC_AMD_MACH);

EXPORT_SYMBOL_GPL_NS() - ASoC is all EXPORT_SYMBOL_GPL.

--4nUCpXPQrhPMEzCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgaHIACgkQJNaLcl1U
h9DvhQf+IOm3hXd04jlzfQK2KY/bL8yi9esENe/eVjl0zZg4Re4CVTsYhPByNqOs
qQbYRy8TyP5bMkWAQqWC0nKu5tGvL09xMR+BqL84sDILqbbw8tBCu4s7Zmzh2uiw
09tsecfH3hFdh7yM+pJ0RkUasiOI1bZff3itFq3dge6/vGqd9ouywOpgkkNdgERl
WXBxAQrnBV57V8NZkS4s7kDhfGvML4+Sl2JbSMfgSFXp3XbZ5DwXqAOGxxcXS4UJ
VcrFq73m/QR/Qz1oKgOWu5x3Sx0jcTD87QGxXfiKYNyUEaX8FNOin+Z1c2pqf9BG
dJsvXR0OTldnefxpDBLOZkjXSnKXXA==
=4/jO
-----END PGP SIGNATURE-----

--4nUCpXPQrhPMEzCJ--
