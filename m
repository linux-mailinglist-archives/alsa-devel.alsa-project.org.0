Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E34225CA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 13:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3441675;
	Tue,  5 Oct 2021 13:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3441675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633434952;
	bh=+2OSnE0Kr91GcrXvhuQjMdAzGdAq6B3bBRFlwkKTpOg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCR5vSXSH7L8S4f/2ALYDl4CYgCMph1ZrqfybmrE0q7DuLzoLwErqchxmfBy+55rM
	 LIjgmSBFM2cwE2WLId6+qvJOn4exzC8M5HrY/soHCCGv8qP9Ys6aZTMKhpAVJt3pOA
	 twRZBI90EIkqERBCz5juMqHGFgSASPPSswCWvdNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9463F8010B;
	Tue,  5 Oct 2021 13:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A74FF8027D; Tue,  5 Oct 2021 13:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3104F80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 13:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3104F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jpd+EsT6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AAAB613AC;
 Tue,  5 Oct 2021 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633434864;
 bh=+2OSnE0Kr91GcrXvhuQjMdAzGdAq6B3bBRFlwkKTpOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jpd+EsT6P9uNMlqfEruWHWhA9La0/5UFlz2V48k4grtIEctzN/oyscT/AVoC+ZUKN
 aBHnBVWc8xyIjklYuznB+unbARUB8tLkgkoHW/SterEG3mVnbKemhXilt14Jn+E62z
 tf7m1q/Z6fhuYQZ2nmiOP8SXzVqFE5chdAbelqRYN7Y57L91TN1EbX/GD1chv4YF64
 OqqbcOMUonBky7WEj/LAdnb4NjkWHDMh+3Me6O4kEGrwsJVxILnRRVs+2fKQbp7vtG
 DMZhg2wUio0M9ilwqO4aztu/Bbhn3aD/OXcupfknfqCNmP6PJbZOJWbDAUtfKi352h
 QZr87f4JiORuQ==
Date: Tue, 5 Oct 2021 12:54:22 +0100
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rt9120: Add rt9210 audio amplifier support
Message-ID: <YVw87lc4uXSvCiyC@sirena.org.uk>
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
 <1633396615-14043-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ouBpf3Mq+3kYb9Jg"
Content-Disposition: inline
In-Reply-To: <1633396615-14043-2-git-send-email-u0084500@gmail.com>
X-Cookie: A is for Apple.
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, cy_huang@richtek.com, robh+dt@kernel.org,
 allen_lin@richtek.com
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


--ouBpf3Mq+3kYb9Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 09:16:55AM +0800, cy_huang wrote:

> +static const char * const sdo_select_text[] = {
> +	"NONE", "INTF", "FINAL", "RMS Detect"
> +};

Why not None and Final?

> +	if (event == SND_SOC_DAPM_PRE_PMU)
> +		snd_soc_component_write(comp, RT9120_REG_ERRRPT, 0);
> +	else if (event == SND_SOC_DAPM_POST_PMU)
> +		msleep(RT9120_AMPON_WAITMS);
> +	else if (event == SND_SOC_DAPM_POST_PMD)
> +		msleep(RT9120_AMPOFF_WAITMS);

This should be a switch statement, it'd be clearer.

> +	/* Default config volume to 0dB */
> +	snd_soc_component_write(comp, RT9120_REG_MSVOL, 0x180);
> +	/* Mute by default */
> +	snd_soc_component_update_bits(comp, RT9120_REG_VOLRAMP,
> +				      RT9120_MUTE_MASK, RT9120_MUTE_MASK);

As ever you should leave the defaults at whatever the hardware defaults
to, the defaults for one machine may not be suitable for another so we
shouldn't be trying to do that in software.

--ouBpf3Mq+3kYb9Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFcPO0ACgkQJNaLcl1U
h9Dw3Qf/SX+lIekuho/ixTdkaTjTJBjrs2hjM66+6dC7EoRZkCReeR/Vf/bfoBkB
MN6oEMFVxp33H0v6yDnE2LmIHY28R+arRVfH+Rx9JGjwKvwas6HoyOi3pgTaywsv
tgJiH06/876Tvd0LxMpsdpUlPZygTQWJli5C1Vw6/UTtOAshot/CnUbR2SkcvcWS
MbkyBaJ9VQsZCibDZO0oZyj9iFU3ENFUwdzRkB+rWaxcG3g3373OxtQNqZqdmR+T
s73E2hTKN49GeG3K/Uv4RrzOi4D8adbMQViKx0X927aDadVv+dRusbwPvKwv94jP
Vv98XzywFxKbNP473nHdYzEMcqcXtQ==
=QGV+
-----END PGP SIGNATURE-----

--ouBpf3Mq+3kYb9Jg--
