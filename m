Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77844310D33
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:36:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED941678;
	Fri,  5 Feb 2021 16:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED941678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612539367;
	bh=MH7HER6PDYJ8JoYrgdtxHVW7qruJH6JUPYjuTg7pwEs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QKsflQ2xk4Zy6WrOYeUEr4y0LXiT3YCYIPL9q6J7Z4AlfSb5x+Xig7mFxkmo70QAV
	 DjtODnPKItsg5hHGEn2MwQ+R4P/pgC2FGPvhh/VjUHZC+LAjZi7L8Y58M5ObCaHxb1
	 0lht3B5cnsgM5vIFMhVpGdWrO2Q3BqcweJLY/bIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B972F80139;
	Fri,  5 Feb 2021 16:34:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD70FF8015A; Fri,  5 Feb 2021 16:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C469F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 16:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C469F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="He9HDG8+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1221650ED;
 Fri,  5 Feb 2021 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612539266;
 bh=MH7HER6PDYJ8JoYrgdtxHVW7qruJH6JUPYjuTg7pwEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=He9HDG8+UbuMeqaJuWMeKrofXu1JjdYfOcLVyyklPihKWeObloClfnxd5tIhMMIWq
 lCXxtgNEu5Ko7TtlwHCRqm8+++hoqYYtb1sXZYQkBij8bto5jS+JkcaTLiXFaPAACb
 1pJeYH/B3yH2o0Ks5LlZKBozb9xbUDA8VJPaO640rjD5T5kyr2BOzakY5BMqM8o+5B
 mob1BR7+P/uxcemeHgk7n2URLBlwlqWTWIyOuwx/x58vqwErut43llVVmAIGE1KLpj
 DM+T/+oGLaE8amdyeWGAuuERcZ7aKsGguoETd2rKGUuxoiFhcGLvQzfOKEWcfhbp7j
 5o6sZzwsAvsYg==
Date: Fri, 5 Feb 2021 15:33:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 14/14] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC
 number is overridden
Message-ID: <20210205153336.GE4720@sirena.org.uk>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
 <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 vkoul@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 02:33:12PM -0600, Pierre-Louis Bossart wrote:

>  	/* allow for module parameter override */
> -	if (hda_dmic_num != -1)
> +	if (hda_dmic_num != -1) {

This is breaking in an x86 allmodconfig build due to:

/mnt/kernel/sound/soc/sof/intel/hda.c: In function 'dmic_topology_fixup':
/mnt/kernel/sound/soc/sof/intel/hda.c:615:6: error: 'hda_dmic_num' undeclared (first use in this function); did you mean 'dmic_num'?
  if (hda_dmic_num != -1) {
      ^~~~~~~~~~~~
      dmic_num
/mnt/kernel/sound/soc/sof/intel/hda.c:615:6: note: each undeclared identifier is reported only once for each function it appears in

which will actually be triggered by one of the earlier patches in the
series (my script is going through things in reverse order), that
variable is only defined for CONFIG_SOC_SOF_HDA.

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdZU8ACgkQJNaLcl1U
h9Dg0wf/dUJP9q+onLFVQyeEUVoqAG7m5KWHF0+AOUx8e4yrQVlPKomE5fLtQWiB
25HR1qqW8TWKVRctJO3dJofSRbFWs3+br6AVZxh0qu4Mz7YlB9THOXqdfAcieTIW
mNU0AnqdgZu3ti2LeLKCjjN1QZaofARVFO1UOeEDTd2+zG1lnwmnpZFAWZraBoa1
/wClgd9yyXcIv9KZwdHSvE1ys/7GTy6fZJd4gRLecfhINjZA8QpZalPVAEoqhTo1
Agg+x7RHtn+hu5qbBJw/safm7ERwHCkGTu5PcUMAFWrCXVALReC9QdWvNNjVDW3g
UdJohQu/yAxxqzAKJKsiLJW5Sg6z3w==
=3cY7
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
