Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73F23A2E2
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 12:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F310F1668;
	Mon,  3 Aug 2020 12:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F310F1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596451594;
	bh=z9/LeLLQ5s5md3V7lPjMYCDuIIO9eX/08LfUzJiXogM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BdSFW0BbjcDX8QWu72E49/DYZYwbPSjvyPJeLWsKBGayYAwjpg+LQ5rZKd2P/3xmV
	 RfWBkCcNyhZ0+mPPXdJwm81dMZhv3Y39tUaN2v7v4KFFTeH+6e6xioQ780MW9m9uc9
	 yb7lNLk85KuqO0+axXIqPWN0faw9Tm3/I80hBXPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29351F80234;
	Mon,  3 Aug 2020 12:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BA8F80218; Mon,  3 Aug 2020 12:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C9CEF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 12:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C9CEF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XlBPj667"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C4E720738;
 Mon,  3 Aug 2020 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596451477;
 bh=z9/LeLLQ5s5md3V7lPjMYCDuIIO9eX/08LfUzJiXogM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XlBPj667FSEY/eT5CX0hbbR1cAUTa2CmFIZr12Oe+Wz1mCsGtprcjuJb6Qm4l9uMS
 m0zGA+6l7panrLavb5Bt5U+IKRNRcCPQVkdbsAsb9dHQCa/PcYVq5fZ85cPNqgq+Ca
 xj4E7x4/ge2kXbq+BCkonDDlt0Gc1Jmg5eV7VIAU=
Date: Mon, 3 Aug 2020 11:44:16 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Message-ID: <20200803104416.GA4502@sirena.org.uk>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
 <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
 <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
 <BYAPR11MB30468CC46295BBA5BEF0FB0C9D710@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200730123353.GC5055@sirena.org.uk>
 <BYAPR11MB3046A6AB5E7E1A2E2795DD329D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3046A6AB5E7E1A2E2795DD329D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
X-Cookie: They just buzzed and buzzed...buzzed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "a-estrada@ti.com" <a-estrada@ti.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "zakkaye@ti.com" <zakkaye@ti.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>
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


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2020 at 01:54:06AM +0000, Sit, Michael Wei Hong wrote:

> This code patch is created based on the kernel version 5.8-rc4.
> The register reading and writing are copied from the function aic32x4_component_probe.
> May I know the version of the kernel you are applying the patch on?

The trees for each subsystem are listed in MAINTAINERS, or you can look
and see the trees that linux-next is pulling from.  In the case of ASoC

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8n6oAACgkQJNaLcl1U
h9CD8Qf3UaWxmp0H2nDTK3BbTL+i3AcGzpSok6UthoK5fOGz1vIPHm/RA/pPX4q2
BZLGIbBPQ30qlcOHSekwnF5qjs0PuL6c/gOr2wdZG5GN0R0ZeT5VVI0tgxRY4K/K
Izn5YUvR6u6nF2Dg2RMX3Jxo/sYu65Mz9EVgVVywteQ2x6ehi6JRkXUsHFjzCR9z
yA57/3ysvqkQcYyAAuN+Q01uGyJl1XuTuFkFQMwGYM7882ZkJrjHV9IZWH1n0fyR
n44O7fF/HQZHiPAAi2LD9psosdeY6OLgyJaJcWBfBq93KWanRN1/AbPH7cD/X0hP
oqtZ0+RKQRZKyKlB7J6/UHxu5eG0
=W8Ao
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
