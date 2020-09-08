Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E526134B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 17:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E34D17B6;
	Tue,  8 Sep 2020 17:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E34D17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599578206;
	bh=tJsIwenxLQUdiskJ5RPhYYEEkBlmKh/SwM1IpIoH9Rw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhshWbH2XHlXzQIPgNfGCL9iP743/b9D3ADRYZMV9Abn9a22E3ro9jVHKbNFdJj7D
	 XqIW60pVC9mEmzPDwHMo2n0YnxvgyL9dTPCDRgE/f6h/Ocnr1ZwUrJ7+AyQJXrfMAl
	 kprhEwB5hIWIwVV9qnMyEMJitxefZvLxVcwNZ7bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 822B7F800FD;
	Tue,  8 Sep 2020 17:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95104F80264; Tue,  8 Sep 2020 17:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39D61F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 17:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D61F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GCAc21pv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB5F922283;
 Tue,  8 Sep 2020 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599578097;
 bh=tJsIwenxLQUdiskJ5RPhYYEEkBlmKh/SwM1IpIoH9Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GCAc21pvEnm1zOz0iewDMkO+bBetG4dCzIos6oEczR8k7J6FkTt1P7c29Rt382CDj
 0zggzJktRU/QgFKmSdQWSDqj/1qfKzh1LYeYfjnFRuv4Guoq4A/5MEJG4mfR7kZpw6
 OxiaFvMnWuue0njCUYTx26Dd/9chG0gDOQTFqfwY=
Date: Tue, 8 Sep 2020 16:14:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Message-ID: <20200908151412.GE5551@sirena.org.uk>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
 <20200908121133.GA5551@sirena.org.uk>
 <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
 <20200908143312.GC5551@sirena.org.uk>
 <ce68a159-de6d-2d8a-c8a2-3e527cb1239e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline
In-Reply-To: <ce68a159-de6d-2d8a-c8a2-3e527cb1239e@linux.intel.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Vinod Koul <vkoul@kernel.org>, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 09:47:13AM -0500, Pierre-Louis Bossart wrote:
> On 9/8/20 9:33 AM, Mark Brown wrote:
> > On Tue, Sep 08, 2020 at 02:28:48PM +0200, Jaroslav Kysela wrote:
> > > Dne 08. 09. 20 v 14:11 Mark Brown napsal(a):

> > > > I don't have this patch and since I seem to get copied on quite a lot of
> > > > soundwire only serieses I just delete them unread mostly.

> We now try to use the ASoC/SoundWire prefix for cover letters to highlight
> that a patchset changes things across two trees, does this help or do we
> need a different way of flagging these patches?

I think the issue is mainly where the patch itself touches both, if some
of the patches mention ASoC I'll generally notice them but Soundwire is
one of these things I get so many random CCs for I just zone it out so
highlighting the individual patches would help.

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Xn8MACgkQJNaLcl1U
h9CUUAf+K13VelraWrtnNDSK36472Led55+P+yEMDNm8qcIyEGWD5AbiP5aY2ZSz
S+nwGtGVoamZZpea1eV0bT6KA8iDP0iaQzwd8TiuYYrQs5jcgvs8/HaNKcpr/QcU
mGstshh8rzw7j7aVLJiYULVfljZH7EGZvLubAWhYsTPfFkOBx5uVv3UttaMYdDOv
y4vF26WCaA1lQ7Cf0Uhnqvmm9EGBRShE90plEabxVHA2ny7D6r+n6BZLJYeMojJi
EWJTVtV9Te0dcb5duOSRMOWTEpv1Lj06qU7TrJ9LvKRIbbO64kcY3/h2Rkh4VIH2
buWiqehTcS/h6UufwJb6pHLVAtNdcA==
=FI6R
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--
