Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A53BEC13
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD2A83E;
	Wed,  7 Jul 2021 18:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD2A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675191;
	bh=FrZ7lnIR8kbHoEaqMeImBiQvI3K420lQpmnEhxnTXlk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0YJDb3f0jD8m691JljOg1dM15m9VfRwlgIVNx2TSamWDMW6WJfrWrttsX4vogjs+
	 LdMbYd7qhtcCcEJFDDdcwRA1VfJOJCPpQ04682uxJyORVxlvOp4/dlgtiD8cg5XBXi
	 IwTvCP2XznfO4/lQyGshqibO0ItZWgGT9ylbuRC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93219F8012A;
	Wed,  7 Jul 2021 18:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E9A5F80224; Wed,  7 Jul 2021 18:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22C19F8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C19F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OMdkB7cT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BCBD61C94;
 Wed,  7 Jul 2021 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625675097;
 bh=FrZ7lnIR8kbHoEaqMeImBiQvI3K420lQpmnEhxnTXlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMdkB7cT+9jVit2hcOQ8e7hPNknUM4xT60xfWR8SUBYDRo6K/1WD7F4QHNSF7ez3n
 QUbOcYOMsxJ9Y+gNoO/4UUw0kurIo9lCyu8Q35hSy7Zz6e+0MFkoKcsCrOydJQ+G8H
 6QATKqmoC1O3RG0cYVXJvE2qBuAlwPlex1DyAQX5m2s3yEc/2/ejHvc5vgQe2epYcL
 inphohA/+IS/1q67Q+JGkiQCccvMqeNN0CpdMnarSr2qaSFFaLwki0R0t5dDVwrkpj
 JfE72CAzgz8mKrEMKG/XGT/hV4Xe0QclqVvxqxmiBXOU33/QaJYzozKodFW1+us1PB
 yv7C+e0nkRC9Q==
Date: Wed, 7 Jul 2021 17:24:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 05/12] ASoC: amd: add ACP5x PCM platform driver
Message-ID: <20210707162420.GG4394@sirena.org.uk>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-6-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TKYYegg/GYAC5JIZ"
Content-Disposition: inline
In-Reply-To: <20210707055623.27371-6-vijendar.mukunda@amd.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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


--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 11:26:16AM +0530, Vijendar Mukunda wrote:

> +static int acp5x_audio_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Just drop this since it's empty.

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl1TQACgkQJNaLcl1U
h9Bl/wf+NASniwPTqh5edicrCqrledhvgq7OHSfBhZgkENpTfRvQXzPtY8VtGLSd
uZZVOvGkYvJ1YnkQesSJ1eqS4cyw4h89nMpkYpdSDcTUUAddx5XDzpOGaTmk5l9h
xrqiz5/8Z+5whY46ghBVeUrXGwjpTWV79VOEr7P04W0fiXptZTSr4gt3CNWQ52Pq
m16geLY7rw/pCX1CxkFUU/NbLluUXs1zOnkZ7otIpURYl3Kc+dRGL62UfR2GZGrx
uIicA++1cqgc+8EhERsf7oyUAkovp2SH3x/AEJhms5Hc8/zrGmaoH3utM4wdbADO
Pb4Nb/9NMEqLwvGBy/tjFNcALh5MlQ==
=N3r+
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
