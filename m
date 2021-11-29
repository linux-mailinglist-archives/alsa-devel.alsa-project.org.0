Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF333461FE9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 20:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826761F2E;
	Mon, 29 Nov 2021 20:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826761F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638212984;
	bh=lsOyYHMBrlpxe+yOqHBUunxp2HVJbc4SCbYxlMO2eHU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZ+XQx0Cx/UhqHdHwqKmTILg1qCgI7387i6NTcy6TBf8h368V32eev0lVF3R6Vrn1
	 qn0JCo+sl93m6gsYEiRkQIzfBSL/jyFN8iXYrNVMVxbYVrIisgePnREFN/dA2UxXd1
	 69Fkc3coROJFenoiYDZyI0EqLfuvvefnqaoPZLlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E96D1F80084;
	Mon, 29 Nov 2021 20:08:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCACF80240; Mon, 29 Nov 2021 20:08:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46070F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 20:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46070F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b45EzunK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E922B815B1;
 Mon, 29 Nov 2021 19:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F290BC53FC7;
 Mon, 29 Nov 2021 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638212899;
 bh=lsOyYHMBrlpxe+yOqHBUunxp2HVJbc4SCbYxlMO2eHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b45EzunK8FRmC/e8IW9/UuunZW4l4v6DmdUJ3tqnKAn4QN+RTMeEc416NtcEInCQJ
 VSEkfb+oNx2Pia/CPod2G7cgE8GDcVMKOF13UjQVZ4oKDxHZL7X2pXDF5fg11cAGnG
 j14qOq8GUWQ/t7CqKE4yZfrrNwjIxabvwwkgoLk0zNyQa3Fyx+PpafRChxt91cj4vc
 4ScKGk1lHCM028Zs6qVhJ/JCt0SSHPMCR09UavqAZN93FaK4ft71XJeNVB1NCl+QU3
 /Kj1f24qbLtDmkUCvE7nzyuhtQU1dCCv71Glr3FV6U78fK25B8Hd9dHGcxdnSZxjAv
 KfivHQSCVXUnQ==
Date: Mon, 29 Nov 2021 19:08:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify
 the code
Message-ID: <YaUlHRHu4G0EMHE5@sirena.org.uk>
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
 <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
 <YaUJ2EfU6kYFfjWn@sirena.org.uk>
 <YaUjfFNA6IScPCY9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k8dI/ervwTv43JI3"
Content-Disposition: inline
In-Reply-To: <YaUjfFNA6IScPCY9@smile.fi.intel.com>
X-Cookie: Thank god!! ... It's HENNY YOUNGMAN!!
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com
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


--k8dI/ervwTv43JI3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 29, 2021 at 09:01:16PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 29, 2021 at 05:11:52PM +0000, Mark Brown wrote:

> > Zero is (or was, people were working on changing it partly due to
> > confusion and partly due to moving to newer infrastructure which
> > doesn't use it) a valid IRQ on some architectures.  x86 wasn't one of
> > those though, at least AFAIR.

> I guess it's about x86, but the API returns Linux virtual IRQ and 0 shouldn't
> be among them (hardware IRQ != Linux virtual IRQ). Legacy x86 used 1:1 mapping
> for ISA IRQs (lower 16) among which the Timer IRQ is 0. I believe that timer
> code does not use any of those APIs (it most likely and IIRC has it hardcoded).

Right, the virtual IRQs are the newer stuff.  32 bit arm was another
platform that had 0 as a valid IRQ for similar reasons, I don't know if
any of the platforms are still affected though and I'm going to go out
on a limb and say they're not using platform_irq_get_optional().

--k8dI/ervwTv43JI3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGlJR0ACgkQJNaLcl1U
h9B2PQf/WYlsV4CNaOQAoyzsD41CNi8U8xmJLZ8eWTAX5tT8wDWiaeekfJbSNMX+
Ebrezn/oQWkJWO72I8cU1ukfBoe5dZh7/UhWzWZwB4zqVdzAqEjjbluAeT3kQw1t
EoNAmG0r+yqlglNOsW6I//4X2XV5hwrxxcFNOTt1LEefeHia1sdPUtXcx5qr8j/w
PKO0jJ385qQb5MzZTemGWFPw/VXSOeA/7fPIetF6MH/nyqodaAg2XJDg/maN9drb
NNms/8YRZzWQsREsDCMLI+kBy3gMwWfMot6aAbEuf37hK1rPWTsMfkxf7OVXoreg
HRMZ/9WKuV4NM/Owm3Lbl3CDj+FqrA==
=1J2J
-----END PGP SIGNATURE-----

--k8dI/ervwTv43JI3--
