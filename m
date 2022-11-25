Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3402638E40
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:31:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42A3A174E;
	Fri, 25 Nov 2022 17:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42A3A174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669393865;
	bh=ZGo8VRWyz4w469FR++uCVWc048gMEPm7Jo4bwKH+7UM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OViuZigkWfmCLclNQ4v9r1EmB4kNCPiTHXg987kq6gWHb7cHfGoTNsdhkkB0bvRw0
	 s9/loxcmbIALDQbs8gcs1c/a/ERvth3EDU3oeKQTm9QuLjLTmzKgR2gmyBUHEn/R++
	 WjvwHPOHvUlV5w7QNtcoJn/Kdms5F+xUEkwXruHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3911F8047C;
	Fri, 25 Nov 2022 17:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E45C1F80236; Fri, 25 Nov 2022 17:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C50F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C50F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V31H4UHp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93CB362548;
 Fri, 25 Nov 2022 16:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6436CC433C1;
 Fri, 25 Nov 2022 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669393803;
 bh=ZGo8VRWyz4w469FR++uCVWc048gMEPm7Jo4bwKH+7UM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V31H4UHpMSKtphvxizxl96CEB7eJk6pKPHpMJeaYnW4JvEsZZG/YYm6aCAwgY0t/v
 vefzgXK92RboIwksWQNE2npKiWoLam/rKGlpNVLbX7j+nneEZ7V8LpJo8xem0w6EXa
 GYWkwjXXe2F8gZgtwzrdGKL4vANZF8VCx/66Ni38Atw6uXJ9ztI+gx4Zhyva2N59a6
 DbtO76WUsXMEFtwepT7bzat7PtbFrVo4IsUNKSfoD6sEkh7KIo5MY08QBMul5JteVG
 GFo1gvfU/FXyXHLagDueT7Fez0p+wktiXWETSGyNeO00DvwwV4tUJS/FHZYbYgtpO/
 x8C5ONi0i3dpw==
Date: Fri, 25 Nov 2022 16:29:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: ops: Correct bounds check for second channel
 on SX controls
Message-ID: <Y4DthUIxViHZnh/Q@sirena.org.uk>
References: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BHJIcNWxMsUVKlyp"
Content-Disposition: inline
In-Reply-To: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
X-Cookie: Time and tide wait for no man.
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
 james.schulman@cirrus.com
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


--BHJIcNWxMsUVKlyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 04:23:47PM +0000, Charles Keepax wrote:

> Fixes: e9b397afabb8 ("ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()")

You probably mean 97eea946b93961fffd29448dcda7398d0d51c4b2.

--BHJIcNWxMsUVKlyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOA7YUACgkQJNaLcl1U
h9D4dgf/fIzVYJqV2ym0fGeN5L7ri4cfSo9OOl6xkP54BTka9TYz2OZEo0kelJTB
GB+nQQlfOhLVb25Zr0Hp1eS0S/V1o4PXEMqLqYj/Rc5DTcxARnEredjuVyBd9z7O
HJuXCR4ephU8o/Ea6hIAeLZMP+fLfDEC1vlTnDeS0hatE6diroNSL6Xk6b2MywnI
ksLjwSbaNTgtpdihGmAG0GfY+zMOaRW9QXpe/bX5nwMmnT7v3SXAMqEAeZnA9LEB
Z35O6p+pX9XCeh4KHGrwGLmefLkxeoVvkDwhAbUmhPOpVjd9Nf0Q9y/dBEEYfq0I
ZqN3oSOpoGIX4JMoU1GfFdMBLcigVg==
=oXcl
-----END PGP SIGNATURE-----

--BHJIcNWxMsUVKlyp--
