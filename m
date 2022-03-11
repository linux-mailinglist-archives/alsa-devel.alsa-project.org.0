Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85294D627E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 14:37:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9581832;
	Fri, 11 Mar 2022 14:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9581832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647005826;
	bh=3w2+xqDZNMpp9s+ES1A/ibvQ0ZTOcFvQcvIC2U+pkTY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smfj1TzCs40Tepmmy8AQGUVcNLOuIHEmhqpJ9JDmO5QsVjJzpoyHbfloyU1iCTih2
	 SaHil39VxXAVVl/GPT5lxhjdUUGLE9kXRXzzjJNLvLU2VL8BvqKY1sTh2FHk1GFpbY
	 +7R2t+815GLTwnW1QAG+AJdkIUP9cG3Azx5m5hIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5F2F80238;
	Fri, 11 Mar 2022 14:35:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D94F80238; Fri, 11 Mar 2022 14:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A73F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 14:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A73F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hp2HvGHu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 434CAB82B6E;
 Fri, 11 Mar 2022 13:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F8CC340E9;
 Fri, 11 Mar 2022 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647005748;
 bh=3w2+xqDZNMpp9s+ES1A/ibvQ0ZTOcFvQcvIC2U+pkTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hp2HvGHue01M9aAI1AxfZ8iSyByzPEJMMH69/eiSZQ1gxGmBjT/9ceFjWWhG6KW4w
 Z8UdBgEOoVqPWhoeFgxpL7nXn9BMqlKSpZjXo/mW2fjKAqGgmX9k2DVYLRDP2sS8uB
 TcEz8GEIv1/kE3LT1pADonrblWxdE9CyaZebS+RZDsGsin5WneJulkgdv3tDux7VNT
 RseO0gptnxh/xccN3xR7rtUGEVvJMBc2I+WF5Lb9gWsucvDmlO8Zur9rvayM/u8nI6
 f2Tx/rIArXFDCpNFPvhbOSfXzKVDhjSweB/7tYJ4qszlBAwJ2QXSQszYM1CBTIgKr+
 Ik/qGjLQOo2fw==
Date: Fri, 11 Mar 2022 13:35:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RFC PATCH 2/3] ASoC: rt5659: Expose internal clock relationships
Message-ID: <YitQLsUAEHM7gXEG@sirena.org.uk>
References: <5c531e7c-58e4-2c55-57cb-85eff68b0927@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8wZvnWaTLkzb2sYl"
Content-Disposition: inline
In-Reply-To: <5c531e7c-58e4-2c55-57cb-85eff68b0927@nvidia.com>
X-Cookie: A fool and his money are soon popular.
Cc: oder_chiou@realtek.com, robh@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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


--8wZvnWaTLkzb2sYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 10, 2022 at 08:29:26PM +0530, Sameer Pujar wrote:

> Yes, it would be required and I will include it in v2. In this series, I
> wanted to get some initial feedback if the idea is right.

It looks plausible.

--8wZvnWaTLkzb2sYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIrUC0ACgkQJNaLcl1U
h9CiCAf9E0eqTsp3uhv/jiRjqxZnSq6Jy4IVm/W/bCSx1hf9JQr7YPQOE1LAQF42
LTlskNZzOyyOPckwauOS4rLiD0mn5Ht8wsEi7PikMpYDa18l0h9j17MLxGCHTtrm
YAdUR1hcXhMGEXZeICyOc9lFL5+Y2pUEgxThXnRvo4VWCJwegyTm0rw05cAzVe+U
FPdXhB/R+TtcHbGB4a+cHbUs/PsmFyS/Tps0IQZXSzyB3hFEwlTFAs7/czml3HPO
x4cBwLRDFyIB+1OTaF6vyfH28gYyJYO8elFHKBbLKBS/m3Kf60Th04c7142gE939
YlkFwkK8LWMXUkwFQ1QAYaxhNuV9DQ==
=iCaa
-----END PGP SIGNATURE-----

--8wZvnWaTLkzb2sYl--
