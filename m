Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BE461C8A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 18:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122E01841;
	Mon, 29 Nov 2021 18:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122E01841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638206004;
	bh=M0U/awaNrkOnKQiVPjxmOYF9AvjRVUeoKFrehE9lYmQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dioLt/qqHLNgQrCWE+N5sw90I6Y8ivOPtfHkSa6V+c3U/t9vjMMAkByQ2f+qPdTuf
	 4p6n/dd4D0UrB7DhhGS8tYRcNThNWmq4cPS6lRoeSV7hx9xK4u6tcPWhJWRH+0E4IG
	 YGFWvR56WSUFbWVtlGRBItlHW+95F5gH9j7m1bVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 692F5F80246;
	Mon, 29 Nov 2021 18:12:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C770F80240; Mon, 29 Nov 2021 18:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13C57F80084
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 18:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13C57F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HKsFDIK3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6343BB811F5;
 Mon, 29 Nov 2021 17:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9111C53FAD;
 Mon, 29 Nov 2021 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638205918;
 bh=M0U/awaNrkOnKQiVPjxmOYF9AvjRVUeoKFrehE9lYmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKsFDIK3lx6QsslUBPK9L9CAnFEapP5fhwBvkVuxd+ape7H6SSLt2AFBNdG7fzUk3
 sPrbX3p34Yt0p9d2iUbF+3t/gDoLG20iGweS781xBE1c+DYn/HhiPnSQVFfHc6F8qD
 vs2YLzfRP+lRgSFH1xTeb1bUpaxWJm0Wk/24LVYmduPCGZQdPdNjCoao2STqnZqryD
 wdEelP9I6Ux2pEBnBVbakbbsEcYfAXaW8wGO1Xrs7/cK+vEK3CZYBmq5jNQcWw1QBi
 JPVeDL5GoOysXMQ2OaNlxeacJnLPJGKiO97p43uvojZb7fwlmS0MHzoGdJU4gNYgNC
 B5MdBR+XmCNBw==
Date: Mon, 29 Nov 2021 17:11:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify
 the code
Message-ID: <YaUJ2EfU6kYFfjWn@sirena.org.uk>
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
 <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qewNUVDuLa2h8xo0"
Content-Disposition: inline
In-Reply-To: <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
X-Cookie: Thank god!! ... It's HENNY YOUNGMAN!!
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--qewNUVDuLa2h8xo0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 29, 2021 at 10:22:41AM -0600, Pierre-Louis Bossart wrote:
> On 11/25/21 1:50 AM, Tang Bin wrote:

> > In the function sst_platform_get_resources(), if platform_get_irq()
> > failed, the return should not be zero, as the example in
> > platform.c is
> >   * int irq = platform_get_irq(pdev, 0)
> >   * if (irq < 0)
> >   * return irq;
> > So remove the redundant check to simplify the code.

> Humm, it's a bit of a gray area.

> the comments for platform_get_irq and platform_get_irq_optional say:

> * Return: non-zero IRQ number on success, negative error number on failure.

> but if you look at platform_get_irq_optional, there are two references
> to zero being a possible return value:

Zero is (or was, people were working on changing it partly due to
confusion and partly due to moving to newer infrastructure which
doesn't use it) a valid IRQ on some architectures.  x86 wasn't one of
those though, at least AFAIR.

--qewNUVDuLa2h8xo0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGlCdgACgkQJNaLcl1U
h9DRYgf9FdYZMyHp6MdARstXCBHMC+FeTnYwYisfGNU79pntNgQ2+lIi6rgYFlJc
ggiE8TKUPeI2pfGazvlmq1ptjtcFQqE/RMiZIauhywsEiP7mbx5gddpzuZB56120
zqI6HdUdXg3IXeXGuFUeaN1pJ9VgT39nmHp7hxDg5ZiLRagLB+fPXOPiEhNEhI18
WZUZ1lgCuK2xAVqTryiDIE8urLdqml/2EVFic0Z245M/mNayAsdcSIwuKD55XWOa
aFp3qjc6mai7fV6W2KEF3jhWjKUOsdegXbB4HZ9m3xzmv+AoS4rqlHLYm/cuuDPD
gzogxj+NMACm5ewtJ6wo1dF5SmIzHw==
=pPkY
-----END PGP SIGNATURE-----

--qewNUVDuLa2h8xo0--
