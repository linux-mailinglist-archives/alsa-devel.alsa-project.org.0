Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E24CFEFB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A72B16CA;
	Mon,  7 Mar 2022 13:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A72B16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646656894;
	bh=7b1ai/DLaoMwWypU8/jHGkgvIV0Cz5+Yuo+N0X/U11Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwxE1pmikjmUxOgk3+xBj6+4ZWW/kLO5DTjnXFVK4Q3KtUYmbvRocr+DWHq30LuYV
	 gyqHyO7Dz/8td2mwhl/yoTS7Akp9tH3FmaWG80Z8Q8Z3/hJ+ZihCBV47zH0yCGT/hs
	 u07+ghc09enqPNS6SoZcNdkceXr87Q3rpzWvk8zY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A4F80159;
	Mon,  7 Mar 2022 13:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F540F8013F; Mon,  7 Mar 2022 13:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A9B2F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A9B2F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SlNQh+jB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5ED261169;
 Mon,  7 Mar 2022 12:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A12C340F3;
 Mon,  7 Mar 2022 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646656819;
 bh=7b1ai/DLaoMwWypU8/jHGkgvIV0Cz5+Yuo+N0X/U11Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlNQh+jBd/QVag3+y5/nDYbxuAOc8AgW3WHCDAo0wlwLeJjdMJfFv6h4bixOEF+sV
 Y4QfKCvJwIjxcLMRu4DU7GasEtSXuriu8RrK5rRl6jzm/MScW5NXjW4zgUx7ClJ4s/
 Q72SXBIK2rqI0b7DmzAHEYr3RjW4UEF6P4zierWHBZzlX38vgO1IB9rL47xpfymf0g
 OzzD0px6U01YA89igIipbc9YbSme3QQwa3Ky5vzhHVQLxTOXvTDZLt1enNDfohOlWX
 Ih1XlU6hDv4fwSJUSaHRRB3zr4ubHqJJBp1rita+5qjbdAxDf1hvW79nx/5oR+7UFs
 PMF6ZrN2ex58Q==
Date: Mon, 7 Mar 2022 12:40:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/4] ASoC: amd: vg: fix signedness bug in
 acp5x_audio_probe()
Message-ID: <YiX9Kp9AFYNiqJcL@sirena.org.uk>
References: <20220304131256.GA28739@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Czo/FV3lhKwL15bG"
Content-Disposition: inline
In-Reply-To: <20220304131256.GA28739@kili>
X-Cookie: Whatever became of eternal truth?
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Meng Tang <tangmeng@uniontech.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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


--Czo/FV3lhKwL15bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2022 at 04:12:56PM +0300, Dan Carpenter wrote:
> The "adata->i2s_irq" variable is unsigned so the error handling
> will not work.

This series has a 1/4 and a 1/3 but no 3/4.

--Czo/FV3lhKwL15bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIl/SkACgkQJNaLcl1U
h9Dk8Qf/b60qYtpv/9beRu/xqunawztZFok9vyGOKB0Yr4shMKqB6xPbozNFZ32p
/uFfcCSuL+7eExwYpzWeCOMzt215eTGTdKu0is9CHRyjOGI1YX1DEbaT5Ph3418l
c6VbA0aeSSxCA/mIYSSZjP3KH6f6t+O8qbEKczr8gkCzTRny6oXc7IkO21AICYex
FPFEDbvlY2JfT7VJjL7dDRZQZW3a03ciP6Cr1frN5Swniqn7kZ8sMO90xtlIcMJz
keodhwXvmXXuxpD9OR4MBQNKXc7uGQEr+BaJnvsR3yiUVp3Nu5v+N6pnWISCX0zu
8UjMu8p5q1DkydOKoSdByy8wADqDYA==
=zG8U
-----END PGP SIGNATURE-----

--Czo/FV3lhKwL15bG--
