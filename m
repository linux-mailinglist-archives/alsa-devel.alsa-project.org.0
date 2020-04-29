Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 190531BE081
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 16:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFD5168E;
	Wed, 29 Apr 2020 16:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFD5168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588169804;
	bh=43u72/t/ee5ojO4oVLnLby9cPaSn1J3/cJbGM3NvKqA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otZN/rnY53DZnBwJ/JT79zWEnItTI82aRc+Cxd0w/EGwCjdHFp51OHfrFMTHicIQQ
	 FFWh8zbFlyu0wDKOjg/VLUylzGwKtpPQDbbfdFUkYQVRuA04w20F4IsOBhd2C8+gy2
	 KFSxVtkHe0RMpSeeAG5LVLMnKGUY3I53IEmKkC84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036B6F8022B;
	Wed, 29 Apr 2020 16:15:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4382AF8022B; Wed, 29 Apr 2020 16:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D5A0F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 16:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5A0F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q/DOOSTb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D77BE206B8;
 Wed, 29 Apr 2020 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588169690;
 bh=43u72/t/ee5ojO4oVLnLby9cPaSn1J3/cJbGM3NvKqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/DOOSTbPKc+xKJLH+AfDJ9GyvLsoxLf4W6Jh5vUtR2dTsdFlyiiyHaTTW5M4I3Md
 7K9pEv5tgIEftLbJ7Mv7ISf68HCuyKQWOewny9CHLhftj2OT2aG9GFwjcAJnljkrWw
 86L3hTwWlwWuHU7sQrn2k7Fq5hB2tRfxGeej34a8=
Date: Wed, 29 Apr 2020 15:14:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: Check NULL pinter before dereference
Message-ID: <20200429141447.GA7115@sirena.org.uk>
References: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Colors may fade in time.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
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


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 08:30:04PM +0800, Shengjiu Wang wrote:
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:

This doesn't apply against current code, please check and resend.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pi9cACgkQJNaLcl1U
h9ABhgf/Uk314RG7VeGN0KlDEV4ZB3mUNgKCSP9bX8M2Qvz69PM7MUKLD3rRJf0m
vlTonmGIhCOWSdlO2wv3hGVZpvGBVGEZqVAvhNjR6FhYKGkxwRtorX2ST1YVJtOQ
EwhPHr8mLG9PEpgqKI6AP04IWYb4oMjSnBENXghM5OsN8yo6kcTXGKmghbArxlIN
KXafD8ZgEy+U2roducwWjOZeSfIj9agN5F+so91mH883uymDWGAiWQ/g4AkxdJRx
Qdl0xw10BAwSKTZ+Nc2aJTHEs+ZzCLfxq+d4X7aGSJ4wBk/7ZdtmGsw+yxxFux/L
9HFw4EnfuD5Imx5whPbJd6WJ7yIkzg==
=X07d
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
