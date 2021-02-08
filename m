Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C343138F4
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:11:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F121676;
	Mon,  8 Feb 2021 17:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F121676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612800664;
	bh=0r7EFWA3/TE6ZV9vLRgre43wSwtaomAWRjcEc4vmFu0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZxwDr8+/wVCCxrAUdDuVP0KwCjoO7DFKW408GPtYHO+uNze6TavK8firRjQSNhaj
	 t2V2xb+SU3jir2wsz4wWkpbM9ZDyf/VduwmzYehFZ4HGOTOK51tmGo2gwZ2hg+sZBn
	 sJGe3j7+YKLUqz2LySzd9NfD3E7ZmdQDtckw+lKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1FE0F8022D;
	Mon,  8 Feb 2021 17:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C75CF8022B; Mon,  8 Feb 2021 17:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C10F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C10F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DOvsbfwF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D07B464DF0;
 Mon,  8 Feb 2021 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612800562;
 bh=0r7EFWA3/TE6ZV9vLRgre43wSwtaomAWRjcEc4vmFu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOvsbfwF4KSVBmzD/1qj4FjM38TK1t5Mvh9JUpyQ8/rWuP4AbY9ZQ234D9hMWuxPi
 ZQDRRW3D0YqpDvdEu9pyPdr8yi7M5E965qVK6m/xw10VroMsJHINt+phllwzSbabAZ
 ZG5XHx1V2KDv3iwXStGR1mW4kj/9jpVnl6yrskiwJu7TgbBYnyaSjKbiCj/Ti+UcHw
 UYlDmkR1+og0vCa8oJFfFSToxWLUihPaeSCmkU01Me5b6FPAdPJc7eJ6wOrDVKSdEL
 9c0HPaCdP/TiW7R49Xqyh+tyF1/Na2v9at03ihoek+vHRa4hYENnfs5yBKVpbRe4je
 VKa6dUO99bQug==
Date: Mon, 8 Feb 2021 16:08:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/7] ASoC: codec: lpass-rx-macro: add support for
 lpass rx macro
Message-ID: <20210208160830.GI8645@sirena.org.uk>
References: <20210208141719.23305-1-srinivas.kandagatla@linaro.org>
 <20210208141719.23305-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline
In-Reply-To: <20210208141719.23305-3-srinivas.kandagatla@linaro.org>
X-Cookie: You will triumph over your enemy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2021 at 02:17:14PM +0000, Srinivas Kandagatla wrote:

> +	SOC_SINGLE_EXT("RX_Softclip Enable", SND_SOC_NOPM, 0, 1, 0,
> +		     rx_macro_soft_clip_enable_get,
> +		     rx_macro_soft_clip_enable_put),
> +	SOC_SINGLE_EXT("AUX_HPF Enable", SND_SOC_NOPM, 0, 1, 0,
> +			rx_macro_aux_hpf_mode_get,
> +			rx_macro_aux_hpf_mode_put),

These are simple on/off controls so should end in Switch AFAICT.
Otherwise this looks good.

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAhYf4ACgkQJNaLcl1U
h9C62gf/diIBpdPwSy/dQ9FyjTxlRvQ8YgXHyIgxJph8g1/PS6SiP9o8g6UWFbtM
8ZVD5mqT1L+WiczOlCGy+uQwgXLL2y5GvtzcuaogTizMvjf3Vm0Qcv1CLAgxw3bj
U/PIbxNxDuAF2v8wp6GIrtrHGYQ4oPoSWv4nq5joooXiKB+77i+XjQu2/nYsnqEy
gBDDCYetYYdhekoQZu5E1B9neZWC3svCFG0h8lgfYnZ/WwMDc72Ix99Cvr/bW5yC
VDHX/qrExutLOlXY3d2SWOfGgQG56p+zof74szk2A8we1LHEOfFBzN33sYBS8xyA
jpu0IqyQTDgLc/3Huy7tCeQxaPPdvw==
=IuI7
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
