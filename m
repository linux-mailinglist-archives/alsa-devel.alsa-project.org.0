Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97673228C1A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 00:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6391666;
	Wed, 22 Jul 2020 00:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6391666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595371392;
	bh=BotUQxfjVA9emKtHJ7bK7WZE9k8SVjbJ8o4YzULBYuc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vulJx06zCnQVMw7rQobk54Ev+ns7xRadMnTTEOSh9znqWULfc2hUZVWs70qP9lLeH
	 cEwlCFnvD43AHmSniMyY/DvAWueeUxNncGDWkBCJqr9kOQT5I3pk0bc2aYUZ8HFGto
	 r8Ipfkl4kK24dN0Ki2S6UDCiSIM8cFndUaFbsLME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7B7F80087;
	Wed, 22 Jul 2020 00:41:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C8C8F8024A; Wed, 22 Jul 2020 00:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC6CF80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 00:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC6CF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LnjHqe5d"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC9432073A;
 Tue, 21 Jul 2020 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595371281;
 bh=BotUQxfjVA9emKtHJ7bK7WZE9k8SVjbJ8o4YzULBYuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LnjHqe5dFaJAjU1mdmhbOGRtUe+nabCriuQ3qMWXn72psho8i/zd9ytwmpXX+YKMH
 YaZlT7XLJ2B3bNzZAYwO5QTAIFshoo3WHyBtYoqrrIKkpQlb2jfRsXjmQT6uVQlq4C
 AOXemd3CRqZxUO8Zia8mhaBEgJGGmhl1tMrTQ7vE=
Date: Tue, 21 Jul 2020 23:41:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v5 00/11] Add ASoC AHUB components for Tegra210 and later
Message-ID: <20200721224108.GG4845@sirena.org.uk>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <159525589435.6792.708136378511410418.b4-ty@kernel.org>
 <72d45476-7050-187b-19d6-2ddb9b0ba97a@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline
In-Reply-To: <72d45476-7050-187b-19d6-2ddb9b0ba97a@nvidia.com>
X-Cookie: I'm also against BODY-SURFING!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, viswanathl@nvidia.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, sharadg@nvidia.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 05:22:35PM +0530, Sameer Pujar wrote:

> I see that "[PATCH v5 07/11] ASoC: tegra: Add Tegra210 based ADMAIF driver"
> is not applied as part of this. I wanted to understand if this is because
> some more review comments are expected or there are other reasons?

I just hadn't got that far through the patch series yet, looks fine.

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8XbwMACgkQJNaLcl1U
h9DtvQf/e8yERKcTlsxgN756R8KDhLh+qzlkWNW3GPS8vrJKP0kOaysI2CDcHvhS
Z4dtbFFRCgzRhb+m7k42pnnjZ+kEggR2iBeof1kXKLzBybxcaujyULGvI6jtfYVd
Nvo3rNBhwseVrVNWgS6HURCkfp2aDTDqnXZIQpXrd/eaPwZMajW5vsgkO4vucjRe
bVopPMTErkT99QWK5XxSj1ZdOFUdbzqQawZvDF75+gh1ZWDp8M64GSttm96zS/rL
AiiPPVTv1F8c4nxlotfQQ59P/MyW9G5pBYdon3plnVyqYI08k6bUZYMLcHwiFYLu
HykGGaZPPnMO3stUy64AKKNZmZBxyA==
=mT4+
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--
