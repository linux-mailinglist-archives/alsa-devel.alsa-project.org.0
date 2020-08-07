Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C5A23EFBB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 17:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4CE1616;
	Fri,  7 Aug 2020 17:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4CE1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596812598;
	bh=nSJAVhEXQcIwyC2b7Ztly+ppwyykARBZsZnQZwKFogo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOhIdgt5EM0IKHgc3iqIaw1lY29huNjyIxLcKRczEbdp2ymoTNMD9M5H1yZnd3Sgh
	 9ZS/oynNRvjIxmhA9z11EtMl5zBX/HrikX3AIYG3iq5vtjsLeBebMZ34630D2eW+uo
	 R5BR+0Kuyvjl3S3kfbCuVeK1Cw0pu8h53qpEAzRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC56F801F7;
	Fri,  7 Aug 2020 17:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB8EF80218; Fri,  7 Aug 2020 17:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A75F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 17:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A75F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="z4nDrDr1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1D8D2075D;
 Fri,  7 Aug 2020 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596812482;
 bh=nSJAVhEXQcIwyC2b7Ztly+ppwyykARBZsZnQZwKFogo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z4nDrDr1ooYRncL/X7eOIFeVw6+km2eH5Quf81wvy6ISP6RFBBbfE44TwW8j6Og2r
 VCxeeOlo4dZbuK87HXyFhsJ2r14/q1p8iUDibuSxj7JFUtwmA6sOCnXJNrKFDHPeAv
 JL7lzm7+o1xDWAuFHOtGL7aCbGih1B/RNgUVsImA=
Date: Fri, 7 Aug 2020 16:00:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 08/13] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200807150058.GM5435@sirena.org.uk>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-9-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L/bWm/e7/ricERqM"
Content-Disposition: inline
In-Reply-To: <20200807110649.17114-9-cezary.rojewski@intel.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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


--L/bWm/e7/ricERqM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2020 at 01:06:44PM +0200, Cezary Rojewski wrote:

> +// SPDX-License-Identifier: GPL-2.0-pcm

I'm not able to find any references to what license this is - it's not
in https://spdx.org/licenses/ for example.

> +	struct catpt_fw_version version;
> +	int ret;
> +
> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret = catpt_ipc_get_fw_version(cdev, &version);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);
> +
> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +
> +	memcpy(buf, &version, count);

This will copy count bytes from version regardless of the size of
version - this allows userspace to read the stack and won't truncate the
count to the size of the data read.

--L/bWm/e7/ricERqM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tbKoACgkQJNaLcl1U
h9BrcAf/dGpVaXxyT/Y3Rsscxdk9XIYNFySPSfb/LXeGUoJ1n8H1flvIYONCFymF
3pEQGK3qRdJdnrjZMsFyblh8ypeSKGuSpLLQGWuKYHULkPtPi5cmSnWaWhvYnhhm
SpdGNdQ3WRrMd5bp//r3IVWhqcItg/8uAOpFdNy0fnGQ+gNkaPsAGF6XQXQ/O6/u
2wIgocC+BFNE94UIPEZSd3ovorhzEDxmOZASP9JMFWHFrinDGwdKZZBYFGhRvjFr
96xc5c1TM18OC6Lj9g0SVmh+BVM8g8up5vt8rrz/dZCqyiuggw16/Tp/jxM8WSyH
pnu7GVBLCJzv5o/z0k1gD2RmI3Gkiw==
=xo2v
-----END PGP SIGNATURE-----

--L/bWm/e7/ricERqM--
