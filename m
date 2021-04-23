Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094C3699D4
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0BC5171E;
	Fri, 23 Apr 2021 20:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0BC5171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619203034;
	bh=sqqvW/KiY0UjOtZtN03sRH2dM0JO0woe6C8wL34S+Gk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYZvbQ1ssZ81PxbPkn+Dp/a8uFz3xY3Y+JBjNc+iCfzXXXNhKqkO64juoKB3YNxXR
	 sbgxizazGS3dvK1rjasJLnjFkxuz1qlU7gkX4mAwBxdb8PaihMn+EMyog9OdDqgORW
	 psNZUemdXtHiHr9BekDpgQwwkEThDCrDdMv3dOMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4E0F80117;
	Fri, 23 Apr 2021 20:35:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B622FF8019B; Fri, 23 Apr 2021 20:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828ECF800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828ECF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IGPefZse"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 021D7613D8;
 Fri, 23 Apr 2021 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619202936;
 bh=sqqvW/KiY0UjOtZtN03sRH2dM0JO0woe6C8wL34S+Gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IGPefZsewDiOftVqab41HMHo1nOk4hFpkKSPZE5YpoiRV1/fIMkwDvsroiO6A4kal
 Dw9Ht9eJSZqQ0eHi1Sb0WylnCG9wElbDSN3xSR9h+iNgNN4Lk19q/w8p17fdPLMFGf
 pSqklkg0Q0EjMgx0JijK/RMtMpg7DymZKTQydz3/E1vlONMYkpxXwQgjOj3adso0tZ
 taZPsBYe58KTNUD9/QQAJQpddhbwPpMx9skx2SLtZ+YQ61pxXv1kheDxxrjvnYdrwI
 D89oO8n431/pl+edPTyhKZZhn2hg/HR77z/b7YB6zwP4BFFuxLl4b8VOC7sSqsKrs9
 aIsqnCxFJxpQg==
Date: Fri, 23 Apr 2021 19:35:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/7] ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
Message-ID: <20210423183503.GK5507@sirena.org.uk>
References: <871rb3hypy.wl-kuninori.morimoto.gx@renesas.com>
 <87y2dbgk47.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GvuyDaC2GNSBQusT"
Content-Disposition: inline
In-Reply-To: <87y2dbgk47.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 10:53:44AM +0900, Kuninori Morimoto wrote:

> +/* Describes the possible PCM format */
> +#define SND_SOC_POSSIBLE_DAIFMT_FORMAT_SHIFT	0
> +#define SND_SOC_POSSIBLE_DAIFMT_FORMAT_MASK	(0xFFFF << SND_SOC_POSSIBLE_DAIFMT_FORMAT_SHIFT)
> +#define SND_SOC_POSSIBLE_DAIFMT_I2S		(1 << SND_SOC_DAI_FORMAT_I2S)
> +#define SND_SOC_POSSIBLE_DAIFMT_RIGHT_J		(1 << SND_SOC_DAI_FORMAT_RIGHT_J)
> +#define SND_SOC_POSSIBLE_DAIFMT_LEFT_J		(1 << SND_SOC_DAI_FORMAT_LEFT_J)
> +#define SND_SOC_POSSIBLE_DAIFMT_DSP_A		(1 << SND_SOC_DAI_FORMAT_DSP_A)
> +#define SND_SOC_POSSIBLE_DAIFMT_DSP_B		(1 << SND_SOC_DAI_FORMAT_DSP_B)
> +#define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
> +#define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)

I'm not 100% sure I get why we have the separate _POSSIBLE_ macros here?
One thing we'll have to take account of is that there's some DAIs that
have some restrictions on what options they can combine - for example
only doing I2S with one format of clock but allowing clock inversion in
DSP mode.  It might be safer (if tedious for driver authors without some
help...) to just have arrays of fully specified daifmt values.

>  /* Digital Audio interface formatting */
> +u64 snd_soc_dai_get_fmt(struct snd_soc_dai *dai);

Like I said on the cover letter I think we need to be able to specify at
least two levels of preference here.  How about

	int snd_soc_dai_get_fmt(struct snd_soc_dai *dai,
				u64 *preferred, u64 *supported);

or something?  Just thinking off the top of my head, that's a bit ugly
and doesn't scale to multiple levels so I don't know if I'm *super*
happy with that interface.  But we might be better off using just arrays
of daifmt values like I say, if we do that perhaps just one array but
sorting it might do?

> +	/* use original dai_fmt if sound card specify */
> +	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
> +		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
> +	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
> +		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
> +	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_INV_MASK))
> +		mask |= SND_SOC_DAIFMT_INV_MASK;
> +	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK))
> +		mask |= SND_SOC_DAIFMT_MASTER_MASK;
> +
> +	dai_link->dai_fmt =	dai_link->dai_fmt | (dai_fmt & mask);

If the sound card specifies something why not just use it verbatim
instead of trying to merge?

--GvuyDaC2GNSBQusT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCDE1YACgkQJNaLcl1U
h9A57Qf7BfSE8CXstoLh1f/lGpmb3RW8+aZ+bfVDnDDfZlWkKZ+ZV2LhGcsLljUC
jXBoA2EmSUieYDuOrQD2NUHmlM+rKQDuSiDmHw8wrMe1ys448obO+hkrWS21TChd
KDBveDad0crQlMJ+pcNIvo2W+7suf/uPH1MnLfCwd0YdoIYyjv5VHmJCjN8pSnj8
gtmmnKbxHE3frcaW6+Bkomv6uh59y+pfRwaBFwGGpsZgvsyilyug1lqVOFreXIsC
rhomSLdEfoAOCN3K3iDU7FYCTBrpxciyo9LAi6+kNX9duQurKjWnfyXwq2rRls6V
FqC8cxCxUJ64I416twQ1qbdWjRSd/Q==
=xXxb
-----END PGP SIGNATURE-----

--GvuyDaC2GNSBQusT--
