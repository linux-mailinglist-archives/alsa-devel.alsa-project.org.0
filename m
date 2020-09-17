Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E766B26DC79
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D8B1680;
	Thu, 17 Sep 2020 15:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D8B1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600348109;
	bh=2GaO8I4uz+EWH//jb2ZCePQfos4/jPwrU/2o7jLxtWc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pXE06nGhwiFAcIY8Js9Xz/UxBnpLpt9o/YLvGhhYMarm997feJg5bQrVCGqoeJlZs
	 ChUIVvS+tG5ods0aP6lPHitKrnHcLAAJ+USwLX2llgrvbs4pAXosKP55ZPDiXngZbM
	 KHSnRgKej2f1ACbgW+i+oP0+0Iu2ZBKCRWTUL2yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD21F8025E;
	Thu, 17 Sep 2020 15:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A61DF801EC; Thu, 17 Sep 2020 15:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FADBF800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FADBF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MaECPRMO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4005121582;
 Thu, 17 Sep 2020 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600348048;
 bh=2GaO8I4uz+EWH//jb2ZCePQfos4/jPwrU/2o7jLxtWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MaECPRMOMQhY04KJ52KmiaY5p4yxNb4jQXaLUsSCxrs8HxNRMi5O5kS4Q2dm3q2ji
 vJr3tKx4CcNIz/EDQmjUNsFvSyW/CCa037HH9pUsDKbtVxqdS+tzyzI/yp5UZzjdjh
 Miifl/SfKcETxUEhiY/qYNobjfapjY89BmsHxQj4=
Date: Thu, 17 Sep 2020 14:06:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt715: Add module parameter to fix dmic pop sound
 issue.
Message-ID: <20200917130638.GE4755@sirena.org.uk>
References: <20200916204758.53651-1-pierre-louis.bossart@linux.intel.com>
 <20200917112547.GC4755@sirena.org.uk>
 <9cbc7629-f28e-461c-1787-da5280269f99@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline
In-Reply-To: <9cbc7629-f28e-461c-1787-da5280269f99@linux.intel.com>
X-Cookie: If you fail to plan, plan to fail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org, tiwai@suse.de,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 08:00:39AM -0500, Pierre-Louis Bossart wrote:
> On 9/17/20 6:25 AM, Mark Brown wrote:

> > Normally we would just add a delay in the driver unconditionally, why
> > make this a module paramter?  If there are board variations then we
> > should be getting them from board data, not forcing individual users to
> > bodge things with a module parameter.

> that wasn't the intent. 400ms is the recommended value, but the parameter
> provides a way to experiment without having to recompile during
> integration/debug stages.

> It was my recommendation to add this parameter, I don't mind removing it if
> you prefer it that way. Or I can respin the commit message and comments to
> make it clearer what the intended use was.

It'd be better to just remove it.  If you want a facility to experiment
for testing debugfs is a better fit I think, unless this is a delay that
only gets done once during probe of course in which case that wouldn't
work.

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9jX14ACgkQJNaLcl1U
h9A8nwf+IjdaWAaFc5oFKSC2RaXc7nWBIfNS1iRg77hkKDjxQh9qa9JSo4FOHfkb
cdK3d/61wdhbUclof+vmbzp/ka2Y8eqIPQJsN3Q9khjHQeHWKwpARC1HVaCBGyDg
JlSRG0oPDBOw1J8XFUHr0vE9wGGXTPdoEsQ7jAxNfi6dTi2IOTl+TykKvT2kXqIw
yVZo7paITYsJDwyeTzbs4FHOfbrXatd5iVYbw9HsjfVuFSY0le1UmYF+D3aRlIZU
AUNmhFrKxiOI4aw9GOo8Yj24fa3HvzdgY4a20IVbECNlLBJaYxqs817d5e3IaDpc
hO0apnc0tcfr79mdBYo4GFWxO10YKA==
=AZeR
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
