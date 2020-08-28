Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51342558DB
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8236016D9;
	Fri, 28 Aug 2020 12:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8236016D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598611731;
	bh=tt8MF935pgWSjZW0cf4zzJI7hbVdJsomM9xcAT1mgm4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kiZLeFvYzuQw3QNrLMXx2v7JCW+nHet22J1zdvd2l5XED8CIv+xvzMjNLZ5EzhdDa
	 nj8dUGRU9x3NQR638XUu2Zg3it8rggGfQoKWvIwRt3J4YBEo+zA5bZbN/7v4zD2NOt
	 S17OxRYOSULWDMRhSW8W7pPdAEzZTcG5Uh3DbABE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94899F800EB;
	Fri, 28 Aug 2020 12:47:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A7EF8016F; Fri, 28 Aug 2020 12:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2C9F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2C9F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="olxNBFus"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 917692086A;
 Fri, 28 Aug 2020 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598611620;
 bh=tt8MF935pgWSjZW0cf4zzJI7hbVdJsomM9xcAT1mgm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=olxNBFuslEexXluDdwpqUa0h6J1xoaS6MQi3/kEuynXo7N7i2aGXN7IEUf1I2lsOZ
 vNKi1OKi7rPMajX9OTxgP1p6gW6rflN/uy4Je+Kt/2g2QKxy9d78n4lkw+yrpRUGh9
 ko4IO5Cpa1hBJWOf1umJsu8WYToOoOtHxlyB7doQ=
Date: Fri, 28 Aug 2020 11:46:22 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH v2 3/3] ASoC: codecs: fix port_ready[] dynamic allocation
 in ASoC codecs
Message-ID: <20200828104622.GC5566@sirena.org.uk>
References: <20200820182639.11572-1-yung-chuan.liao@linux.intel.com>
 <20200820182639.11572-4-yung-chuan.liao@linux.intel.com>
 <DM6PR11MB40746716F856166D61EE573CFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB40746716F856166D61EE573CFF520@DM6PR11MB4074.namprd11.prod.outlook.com>
X-Cookie: Your fault -- core dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 08:24:19AM +0000, Liao, Bard wrote:

> Sorry to ping you, but the patch is really easy to be ignored since I
> forget to add ASoC prefix  in the cover letter.
> Could you Ack it if it looks good to you, please?

I don't have this patch any more, so like I always say please resend:

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9I4H0ACgkQJNaLcl1U
h9B1Pgf/XnMsFTcV918d/rXMNFkYQurZB+NWC2RyBeSc1kt+ym6gWVm0UEu4ZwQz
zqCVr2fKuTlbomNtGmNw1BrrmdaDieUtJisVI48u7EdFPg+IVR6bxfePBHlPoFcM
hgnNoVMnhenD4+rh9mEGBy/Ro9F6Cp/9bTjws56bwm7ncCShDT0+O/FgGuO9enRx
jys4MGr9NU21WWtayqjilu82knuqgzTxze54nZwRU8p5KXv+mL0Hl8i73EB7m5iq
FmlFWSGX+QbkGbZjmh0t+4Qj2343DEzdFzDz1rDzvFhcBuoap9aJqA7we7Se+Neg
B15SPTf8mqAfKYVXCKR1IxI/oyRMNQ==
=eNS/
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
