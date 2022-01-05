Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD548548F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 15:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54D11920;
	Wed,  5 Jan 2022 15:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54D11920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641393107;
	bh=6d8twl2Ithwse23RilrTiQxZKRiwCYnGTEdXxVjL6Jk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9XGytvAvPtvWRX/Q1XF5k0a/LTY0rkZDaBuX9opSiIp5bxbNdupLcKt45bp4Cdev
	 D7l8FGXLLJ0xVbv9XxgByPp46c18/gQ+sWuziXY6Xr/RnZxMFAbVRwtxtpNnZ2h7gk
	 oD6S58Z7hRCWy0ep9odj2eSlxtD5PeK1Dkt0QBLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6382F80089;
	Wed,  5 Jan 2022 15:30:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939C1F801D8; Wed,  5 Jan 2022 15:30:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24085F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 15:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24085F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rkZ9+qoW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 319AFB81A62;
 Wed,  5 Jan 2022 14:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B4C36AE0;
 Wed,  5 Jan 2022 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641393034;
 bh=6d8twl2Ithwse23RilrTiQxZKRiwCYnGTEdXxVjL6Jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkZ9+qoWQjQMxJCn6Ez0mBUMe/f6jyXbh9NP+9qGBl0iZMPn1ozSh1CNHak+xTsnn
 12Jam1MZ4wmYjftwMEYI0OhK3OcDrXx63+a5AU9nglDShv1DDMx6Pqd1kpPBMDO6v4
 bJrVwoV/WL0c62GWNtR9vDl9KyvNeT04H3KtKYZetXtCni/YVMUFXAnCyMzjiChlU0
 jNoJvBaRfpr2OgiEYWkMZAGWd0MXAZ96fdrYhar58bF9v9Labp4/ibO6RoLflQ5Xln
 e3hjmIrHDybyG2G1MBpof5hgnXAH0HIq/zB8XFYeXqOVHb0U6uHP2CeiXz7+4lIK1m
 1Kl8qYXqKkTiA==
Date: Wed, 5 Jan 2022 14:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/8] Add low power hibernation support to cs35l41
Message-ID: <YdWrhS557UTykPY9@sirena.org.uk>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pNCWwa4mnb6J1Rb8"
Content-Disposition: inline
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
X-Cookie: Byte your tongue.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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


--pNCWwa4mnb6J1Rb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 11:30:18AM +0000, Charles Keepax wrote:

> Patches 7,8 specifically will cause some very minor conflicts with
> Lucas's currently outstanding work on the HDA version of cs35l41.
> Whilst things will still build, this patch adds a test key function

No they won't, an x86 allmodconfig gives this:

ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-i2c.ko] undefined!
ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "cs35l41_test_key_lock" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "cs35l41_test_key_unlock" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!

--pNCWwa4mnb6J1Rb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHVq4QACgkQJNaLcl1U
h9BWEAf+JVrjzT2N7eKkghcNgJ3gtpNkrntl+tdY2P+puMF3BajueZcAB1OCVg1c
zGfY6v/aSJLeRBrJugE/cC66hnGBJ/54w7wcPBda041DfncIsmDOxeklmO8bf401
4ZD3UnQPVuahY0Yd8meO0JHz9GHVS/npZAZF1T1nSJyQjHmwi3BkdPjuelhYZNGJ
aom6xYXnAlTSJQHpId2QnB7rZWz2NAeqCqq+rUFdH72q+3+GFnfwTlhJN0BvNhSk
4vK1BQfT2eauXs85qQDvg3VciDlLQk8gzVEchwVv9mvFkH8e5emOtKVekBD6nmbs
wQKxyvQkLVq4H5qzSZUE++XX/UdSJA==
=QM87
-----END PGP SIGNATURE-----

--pNCWwa4mnb6J1Rb8--
