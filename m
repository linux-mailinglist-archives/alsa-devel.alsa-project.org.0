Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76300599A1D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 12:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9864EAE9;
	Fri, 19 Aug 2022 12:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9864EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660906345;
	bh=nX+wpzz52PCLNX9F8IQQbzAoFFoiLltf9HzoZBUYRKY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpvZGdhsENXR4MZlnvt8MaJeSv5gZWbmE+XFxuQCCwnWE5QOe25PFBWOuQjW4iv/E
	 TYWml2gd+qtp8XRhGk64kH2dj5pptoy+5EEIF3TPelhY7Z3jakzCJnnNMCZXx0kPmv
	 ILJcqGZaqz+/EgvM3bzv37Au0yvVLqwghUuIJCXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7052F800B5;
	Fri, 19 Aug 2022 12:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA43FF801F7; Fri, 19 Aug 2022 12:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3255F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 12:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3255F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SrJbrcLE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6F00B8264E;
 Fri, 19 Aug 2022 10:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF97C433C1;
 Fri, 19 Aug 2022 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660906278;
 bh=nX+wpzz52PCLNX9F8IQQbzAoFFoiLltf9HzoZBUYRKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrJbrcLEcwKa9UR8OXzPh5NUxJ3JHEOlXPaY30ZTqwgKTOkhJvJQZ3/wIrP3/2Otw
 Ibn4wAf+ODS51XgCfrZtcvltxNQBrzB7+584wMm/dt1lnmSUrEgeALIGfuKsC+CeEZ
 Rth9ntgKmW1QDKOY++8xCRkaDue+ZRF+FEwpXYyNNwSiMn7qJTivpwdBSWtuKdXpA8
 gaobfr/+mpOLp+FVKkM6kvLT0oL7mVGqhqbf1uLVhHq9x2x13yi+oFSzC1nt8cp/fH
 Z23N1kvmBQ20Yq2xzSjUgjPU66ddzyTHmFArhHg4XLnUMpTjXVXAgy4cXlio1KIBfJ
 wthpsFbfG3Dmw==
Date: Fri, 19 Aug 2022 11:51:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: qcom: sm8250: move some code to common
Message-ID: <Yv9rIGE+GNEzzizz@sirena.org.uk>
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
 <20220818135817.10142-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jrntzq7HWj3xMCPD"
Content-Disposition: inline
In-Reply-To: <20220818135817.10142-3-srinivas.kandagatla@linaro.org>
X-Cookie: Price does not include taxes.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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


--jrntzq7HWj3xMCPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 18, 2022 at 02:58:16PM +0100, Srinivas Kandagatla wrote:

> +	}
> +	*stream_prepared  = true;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_snd_sdw_prepare);

The ASoC framework is all EXPORT_SYMBOL_GPL(), things that depend
directly on it should be too.

--jrntzq7HWj3xMCPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL/ax8ACgkQJNaLcl1U
h9Ax5gf8C1poXrMNlinxwQ+Bq6QSKD91O3BR4rTm8vj2gncSQp2y7+H4HY+T+tbP
WGLHZHiGtb+fVqRFr2zzATokVvbJ9ceQ8N0T4be7Ggjd3tLcJcuuXM26BUwr3u4N
0H6ocIUsZP7z949gOSW3V0d7CH6Z7gfBmVq9ytsXvyapjoMOlxPPc8OyL64NL/1o
HkfoKIq43c2gvF6AWK06VBmGv8vaw0Sxy5DPIVoHlBeK44xmYNV91s8LMw2VqYiB
nM2iNfQd4OC476R0bc+BG8NgJltT6j9c8KaaBh6tioASQmMm4uaMRoxAg1RhJcd/
UvE/Novy91JE54HT1FvQxA6vhFKPpg==
=HP4+
-----END PGP SIGNATURE-----

--jrntzq7HWj3xMCPD--
