Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C00293AFE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 14:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7409816F4;
	Tue, 20 Oct 2020 14:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7409816F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603195868;
	bh=4/3/j1X+HxF5TIAc9Jw+DDBWcs8mdMd4kGFiBBRXV8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFKBOxyS+RmH+0+Cp3Ct7KG+W3Q5EU4Zw9HsOvwQgV2eGuFibgIuIZc2WU5TVQsZ1
	 HLMtvgD3fmTEIwTokW/bsnv4D7UqjDMeLNRerGhQAGPOoGZfp3VdUuELWKjtmsYRTi
	 aZZLjYpyRv6KD4MEp34TzxjGPyxlb8yDmuNv12gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD45F80216;
	Tue, 20 Oct 2020 14:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23BEF801F2; Tue, 20 Oct 2020 14:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D63E3F8011E
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 14:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D63E3F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kfBjEuTX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE17020770;
 Tue, 20 Oct 2020 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603195757;
 bh=4/3/j1X+HxF5TIAc9Jw+DDBWcs8mdMd4kGFiBBRXV8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kfBjEuTXT/Veas2iJXptvvPkDccXBi1xh0CacqvsIl0K2EJMPIlxx8Tj9mHWuqCjl
 udfZ/pFjkwirD2vFFokKJTBR8DpjN98Zvv5jq4SikIS7cjf9ZdnMyH/2WUMQ98Qvxu
 Q9HEVMMneL+R7RpTEjUbUQB2afc3Bv8dWajRBiPo=
Date: Tue, 20 Oct 2020 13:09:05 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l3x: Use neutral language in amp drivers
Message-ID: <20201020120905.GA9448@sirena.org.uk>
References: <20201019224427.1700003-1-david.rhodes@cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20201019224427.1700003-1-david.rhodes@cirrus.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 brian.austin@cirrus.com, james.schulman@cirrus.com
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


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2020 at 05:44:27PM -0500, David Rhodes wrote:

> -		/* Only certain ratios are supported in I2S Slave Mode */
> -		if (cs35l35->slave_mode) {
> +		/* Only certain ratios are supported in I2S Device Mode */
> +		if (cs35l35->clock_mode) {

> -			/* Only certain ratios supported in I2S MASTER Mode */
> +			/* Only certain ratios supported in I2S Controller Mode */

Your renaming moves this to a boolean variable called clock mode which
maps onto device and controller.  I am not sure people are going to be
able to follow that.  Perhaps clock_source or something?

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+O02EACgkQJNaLcl1U
h9AkfAf/X11XolemwAELfdSwjc83ATXZ4SvX3yeNGlcNpzdA8Qqxo0EgS+hq3a4r
9HvE/Eh00X2c2gBatS7/v8/TBseKKqmO3TlAtCUhYpfbN2EFwSpE10FWY0ABF0Qp
DLlUibIdoFRTyhqxplE0tWvqHTQgxskn2xJ/SC0LpKVHtlcLact4LmZvPQEoaz7i
ZUJsUmp3fs8WtA+MCmGVxtG2n+CuFru9BaUHIqd3Sy/XVb6wz2VQzdZve0aWviT0
sCSN9gMoOz7EnQ8wZwhjR47HmGrrm/XoNE4FDW5gV7/5q/6vmdYdnuBa6xg4IR6c
EmFQvbEQv+heE11VM7T6DN/ADAKndg==
=RTWm
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
