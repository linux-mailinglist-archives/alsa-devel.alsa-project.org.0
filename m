Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B7351C0C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 20:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B71716B5;
	Thu,  1 Apr 2021 20:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B71716B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617302086;
	bh=iUFPguOX7QBJZZ8oaYo5Mvrb7d8n05AHwmIeAzyt/og=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtUqXhhCcvrOd1Kf1izdGE3jThE4RKs1GrVB9gcg5ZPVqkVtuIn1DK/AaI4A/p3gl
	 31ngRRQf17zGwVjZ8ueDZYeyTIekbesc1hn63uCORdd/Us4IeSi6+oNRBVSf8JXGVn
	 cB54tKQPiUxDclhSFxqbHrXdIA3KHwbuOTZEO3PU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B9CF80240;
	Thu,  1 Apr 2021 20:33:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD5CF8026B; Thu,  1 Apr 2021 20:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1F0FF8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 20:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F0FF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R0YGV5WV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B91ED60FD9;
 Thu,  1 Apr 2021 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617301992;
 bh=iUFPguOX7QBJZZ8oaYo5Mvrb7d8n05AHwmIeAzyt/og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0YGV5WVt118/boGi7KBagA+N82/Au1MqgFGsFOpWuL9lFIp+zPCZKR1oszzJieW4
 Rup7kyCG7mQCdc72S8tW7U5R3v9HV2WvRfJb6wSeHQ/5dzYxk/vzTsx86Y4iD11ZcT
 sxa1bY7KTZerAj9Wq8xs2cMDb41Vjaul3SfFwQuP/XFYaMb8/Z9pEYgsHjsPPgE+L7
 4U1pYX+dzxBEF5QruzpHp96Jhd1BRKxAJnR3/n/VGo0ekgDzymLSmHMC/0UNj9LgtO
 w12GagBXRrAWJmG2kgIjl1OFSt2XFF2HuYpTcWveJl2pkzD/lFjmDJVoBGXipGuOlv
 caIP0nz0MtIfg==
Date: Thu, 1 Apr 2021 19:32:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v5 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210401183258.GP4758@sirena.org.uk>
References: <20210319191337.9414-1-macromorgan@hotmail.com>
 <SN6PR06MB534258C507ADE505523E146BA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nLMor0SRtNCuLS/8"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534258C507ADE505523E146BA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: You can't take damsel here now.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, heiko@sntech.de,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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


--nLMor0SRtNCuLS/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 19, 2021 at 02:13:35PM -0500, Chris Morgan wrote:
> Add support for the Rockchip rk817 audio codec integrated into the
> rk817 PMIC. This is based on the sources provided by Rockchip from
> their BSP kernel.

Reviewed-by: Mark Brown <broonie@kernel.org>

> Changes from v4:
> Switched to using parent regmap instead of private regmap.

This should go after the --- as per submitting-patches.rst.

--nLMor0SRtNCuLS/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBmEdoACgkQJNaLcl1U
h9Dy8Af/RRAmA1LQ4lVeh2xcYDLu79CXrNXNaL7BSfGBVD36HbwOErqHeWIOJ3Ah
VLI/DTuiFsl2o5cZV+tIk1SY8DygoCrqyNtbvIoC2rMhFiSI4+f6B4svXEWpuuI8
7pD1PN3xRFu8BSsGqxUr1MbTOD6j/euYWXFigH/q+vXtrigdz+IAu53U5mApFwbe
LBm/CTDxoq/2CbEnNU0jMmb5VuLPPvygGF8UNCA1uDUIBAH6D6YG92i43YSvg0Ps
fGqG36Ul0uqWA6xEqygo6vYC04ZGybiGVX3ET/o2s6974/lc+SnBnJ+l3KZhGhB4
l9OC3qscR6UJlvvwJWPTbR0sjWAGZQ==
=TIh8
-----END PGP SIGNATURE-----

--nLMor0SRtNCuLS/8--
