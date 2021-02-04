Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3530FD23
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 20:44:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35371662;
	Thu,  4 Feb 2021 20:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35371662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612467886;
	bh=K6zzFQwByG159V3DD7+Xq+g4YvUvY6Eq5d6htqC0DaQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVxYCooSrMg5sLWcSeZmIwtllHEqqMG7EpIuDboM7MtPTRhcWe4fOH/fzQs2u9p6p
	 ojqSUbilzGo8umJJZeDYkQDFKvABpLdBhfsnXziSc7hkoTn9EU4o58sOFLtFpFRF77
	 uwK6Yzv+d2Jb2cG94aE+PfmvH2pYRxdF1xvIJL8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3940DF80154;
	Thu,  4 Feb 2021 20:43:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FEC3F80171; Thu,  4 Feb 2021 20:43:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FF9AF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 20:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF9AF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UR9y/wGN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A56CF60235;
 Thu,  4 Feb 2021 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612467783;
 bh=K6zzFQwByG159V3DD7+Xq+g4YvUvY6Eq5d6htqC0DaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UR9y/wGNg6qFrctsqJzWp0yItbg7LYRFeabLTW34G4Lk0lws4oPB76lP9q9sc1XxP
 YG9B0NfveXLxAPtewkuquu0YB3CQ6+/yp8fHMlAP2eeCZvNTQ3GMVIbxD8HeTgDQNK
 anZ3PUQqG2xuNVhZEy3Q9lkMtTgYbrEximNvHqZ0iGV6AiK9k/OIlSWs+jPUz7vmD0
 jmr2/a9od5U2al36S8A1yyU4qX+P5evJapi4EE0HER9B/SoioAXDSvBfw6F8ncvo2V
 f6jyW3NUkgDn/xJaN6Ge82vWQ5wDav3IRuM+XjDa8CN2MVItUg1UGGKt8bjEc48Wcj
 M+uXGeSRm9PLA==
Date: Thu, 4 Feb 2021 19:42:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210204194213.GG4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
 <20210204151139.GE4288@sirena.org.uk>
 <20210204154058.GP2789116@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RDS4xtyBfx+7DiaI"
Content-Disposition: inline
In-Reply-To: <20210204154058.GP2789116@dell>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--RDS4xtyBfx+7DiaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 03:40:58PM +0000, Lee Jones wrote:
> On Thu, 04 Feb 2021, Mark Brown wrote:
> > On Thu, Feb 04, 2021 at 03:04:56PM +0000, Lee Jones wrote:

> > > This set has all the Acks we need to proceed.  What's blocking?

> > There's the subsystem maintainer...

> I assume that was a question and you meant "where's"?

> Pierre is listed as the Maintainer.

I'm fairly sure you can see what I meant here and why there might be a
concern.

--RDS4xtyBfx+7DiaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAcThQACgkQJNaLcl1U
h9B1Ywf9E/3EKLtrge4u3ytiqPKWEIZ68r8kgrzF9eK/ble/g5DnM9lohh5782WZ
Ddf1o8ZIqYQ1qH16DOdHmnLUNPsKfpVZ04iTzvsKhmuqr8RH4Iijg2BRws62403e
IL0/xf4YcPOAew+cq0HCPj9b9cNwxz/m6CV9iSh1X/yHzmCDm1DJ9thnsKCq6aXD
KPhEzfhXzpVOdis10EzO0fulu9RKIKcDjqbbBfYQOGXXo6+rhZp5wCRj4zThN+Dp
UGusn39LEfPICkgySk0N6/S7utZRKcEw5GAazb3ILg4x1AUJOpHZ8KeCPEREurZK
B0IqsY2iHC+EUW8QXgW1TOKPqjQF1A==
=4Db8
-----END PGP SIGNATURE-----

--RDS4xtyBfx+7DiaI--
