Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03373878F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 12:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151DF851;
	Fri,  7 Jun 2019 12:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151DF851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559901696;
	bh=oyn/hWPIDKsAasywji8vXMrEBRFy+YKRmKy6CavWQqQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cvE+GbVORZRayW0prL0hsoekuJ+EO6663KT1HQjF/yh8R84Jxj1edhKvSfb6WeLxp
	 MDLbnFM5yW6u1nLoSBOvjRTumvkeY8ufszM926izU3Ttyr43fBnReJwDZMCkobn3xs
	 lLSFUG96v+J1enxH/wf7OZF6ALy1FrkpVCKFiZYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82EF3F896ED;
	Fri,  7 Jun 2019 11:59:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2AE1F896DD; Fri,  7 Jun 2019 11:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B262F80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 11:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B262F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sP95+4rD"
Received: from localhost (unknown [106.200.230.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B8BE20B7C;
 Fri,  7 Jun 2019 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559901582;
 bh=KtZJiwrTnr8HqgHUPpXqaq/pK8GwQ/s1P9eWhMw3ldM=;
 h=Date:From:To:Cc:Subject:From;
 b=sP95+4rDoRTO0EdI/x0CzxSVMxN4gkvyi2PJy2gmXZ2lYMKPVm/KJNaa+P8YigeCp
 BGRvVxo04FooUbYkt+c45TgKb+9Huz3LEuMJ74Mm441NoFjkoXgs/7GvZdKf5v68Kb
 IFHWz0bJhBZ0snQgHqTs5pRJyQzOQNEaMEVFYNKc=
Date: Fri, 7 Jun 2019 15:26:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190607095633.GD9160@vkoul-mobl.Dlink>
MIME-Version: 1.0
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [GIT PULL]: soundwire fixes for v5.2-rc4
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
Content-Type: multipart/mixed; boundary="===============2124165675361225435=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2124165675361225435==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Greg,

Please consider pull to receive fixes for soundwire for 5.2. We have 3
fixes done by Srini and all are in linux-next

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.2-rc4

for you to fetch changes up to 39194128701bf2af9bbc420ffe6e3cb5d2c16061:

  soundwire: intel: set dai min and max channels correctly (2019-06-06 22:4=
8:41 +0530)

----------------------------------------------------------------
soundwire fixes for v5.2-rc4

Srinivas Kandagatla fixed by bunch of issues, two in core for locking
and out of bound access and one in intel driver copy-paste

----------------------------------------------------------------
Srinivas Kandagatla (3):
      soundwire: stream: fix out of boundary access on port properties
      soundwire: stream: fix bad unlock balance
      soundwire: intel: set dai min and max channels correctly

 drivers/soundwire/intel.c  | 4 ++--
 drivers/soundwire/stream.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

Thanks
--=20
~Vinod

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJc+jTRAAoJEHwUBw8lI4NHiP0P/0ioLKYuP0ZZHXsXXxztXkH4
LIlxpYk4GXX8F/VDaDlqdbDfZJvtrmc1uUIA77BquFxCLRMk5W7uEvFZBzlMVWbm
HMZcSNN+6Gz4VkvA8oIRs0iNB7ix2NNLKW5GinZ7ipXbqdwdAutcBarlfO/bGWQA
WryHbzRcUjYqkTmN2nFEM7tU8ynITbaMDJgl1++xv3MJ86gUor4AJD5C4qyvJSC3
YGLNJdGBh4F8ZP7rlBn+s7JFotz8kth6SirCCsxpQBPbYKBn0SxHV233H8thzqqP
rETBWzeELKdABzsxtJgM9wZXmXIoKeTyr6FjfiEn3TleUKUlEooMuXLO4lIKJGS8
iBHVSmpFyEI69CfkXprVezU6eEipr5d7F9mz1HgLxTtUQXZkw8C4gl+gqpfrT1j9
nbzt9C+pgAqYxLT+QyvkffjTumi6/Re4AReRUqAHfPgELrHS4R9pppVQCJi4olVM
R+JoQUEzMJd7fpPELfY1juybShTRneZLmWzPHv5bL4MxrMmx6jvXAK0k4yVpYyzk
209u36b/dJdsHFLCU91E3wldrOXazt/vPoKnKXEdXmLPYv92z8UY+SnDGPhqjGNf
0KPPdXQW2LZW69+RieBDvuCGkmTNU8+dgjwcCrMXh972cc6drp+jxhvPuzT0B4Y/
Fdb4J2UijDZLy5H4Alxm
=/nxH
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--===============2124165675361225435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2124165675361225435==--
