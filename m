Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D15EF6CE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 15:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D0BBAE8;
	Thu, 29 Sep 2022 15:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D0BBAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664458944;
	bh=mxXXnA7AKPAULTlYNVPDjF57KXpljiAzFpErQ6L/1tY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNUz+xbZzAiEnVnxDROBhm5S31DKI7csFDIQRTCjJdkEfrvnL6L6xM5Ns1QHTjN1g
	 uj7HGWn4HtfVyLoTkjyE154+GYlCErVsrtS2hbnOUdxHsQz+UpQXlzOPlUPCDu4RZ8
	 ociXP1urSFKVmZpK/U+RIBueDnOgI9o1bv2hXEo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED07F803DD;
	Thu, 29 Sep 2022 15:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 017F0F8023A; Thu, 29 Sep 2022 15:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7443F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 15:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7443F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kD99SUi9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78BBE60ECB;
 Thu, 29 Sep 2022 13:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EFFC433D6;
 Thu, 29 Sep 2022 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664458880;
 bh=mxXXnA7AKPAULTlYNVPDjF57KXpljiAzFpErQ6L/1tY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kD99SUi9aD82aEpsa/ei1ebO1r29oG/ZVMDIk17nbHRVQGFi1N12sOp0DKTh0c8KA
 9G2SvprS9iyhYSZ+vDeqcHxx5odZX1HRwcCGbnI58ZvVF51Z2eJlwa0JiKoyy1HTNO
 mEj7/Vn/j+KGUuD1p+V8xQKSPgN5yY/+1vCMRAB+0S57fBePwVqLGkFfmRJTgs8bF0
 zucU8dz729hhgBqOx0xW34hWfFmMpMKgpw2XRTWUxDbRuSCWdFmLfgcFBWh9cB37U+
 iZdnhxMrK5OSmM4OTQ+VxPtvs34GHn1FZpsTw2iOB/U2rqEHvYW6OigptfWbQS9gmO
 oLUculB7hHbeg==
Date: Thu, 29 Sep 2022 14:41:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use
 pm_runtime_resume_and_get()"
Message-ID: <YzWgescSJMKzYTAo@sirena.org.uk>
References: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N7/RendiH0c6BA6h"
Content-Disposition: inline
In-Reply-To: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Last week's pet, this week's special.
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--N7/RendiH0c6BA6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2022 at 03:15:28PM +0200, Krzysztof Kozlowski wrote:

> Cc: <stable@vger.kernel.org>
> Fixes: ddea4bbf287b ("ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()")

That commit isn't in a released kernel.

--N7/RendiH0c6BA6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM1oHkACgkQJNaLcl1U
h9BOwAf9GBA+KS/sN5rGBNQyJN6J5INLcsm4sQA5Xpy6cOd6HMSadJEAsuW65BOd
v/PwcFjX0g6TQwp7nz+RIOEJbyO3gpaOVYFniPMAnEc+79UzH+G4EYhIucoLpNGt
Xz68t5S8OT5AkBKFojx0h0hqeLrWRyUGwAc4q1ZjEWKC4By7Yqu3cjWFbKhFAFKz
iFl0jqVNkwzpEe/EFTnEBpF4s49xeDBf+wQPn3Bw6nPvCGEHi/cU0dB0YA/Zeiu9
w7nqe+tkL8oBj1qcvJtpEl2VOp9tSxbr9oT6z8TYOE7umzdTIKWOzx9fgfZWH1B5
zVc0fC8MrvnzwiscC2znHB//s6BoOg==
=hpEo
-----END PGP SIGNATURE-----

--N7/RendiH0c6BA6h--
