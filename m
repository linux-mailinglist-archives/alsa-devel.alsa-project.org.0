Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F074D0426
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:29:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6992F1733;
	Mon,  7 Mar 2022 17:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6992F1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646670560;
	bh=64oNNmTtWsxUxeaKawvUIWDixHMJvkFSVykLx6hxC70=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8NTTcvnGuB1eXdSesCxJvbS+uhNeK1FTAE0hdtmee2i8SyTNvt2RAXRnyTGM1RIY
	 tc5fXxFZnLYkxe3brZLflNSV9jEO/QP23qN2RFm9Bi9YOvbbEbIEkOy70cfYZvR9uC
	 hQoQ9Q1AaLyt4K/dpN8jvO7aSyrxB8OfUQpLgseQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7912F800E9;
	Mon,  7 Mar 2022 17:28:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01823F8013F; Mon,  7 Mar 2022 17:28:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CFCF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CFCF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G82FpeRU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B6A3B8162E;
 Mon,  7 Mar 2022 16:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E948C340E9;
 Mon,  7 Mar 2022 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646670481;
 bh=64oNNmTtWsxUxeaKawvUIWDixHMJvkFSVykLx6hxC70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G82FpeRU/RnFOrLaYMthW0VcknwxZiLtJ3XSuLnjjgndDCMXeViuKQgMuIg0CDOv7
 zeEH8h2TTfcPU7S4iunbQ8mIiE0OFeIte5wI0FuT0qH0LytIzikNVFwSqsvKoA/Ipi
 2r5D9ZkK8X5QTKYYnaJ7wWVkMWrg5lF/Cv9k4ER9wOcfC/2aba+Fkg451vwQ4MWQVx
 Ki+GbWF0cJ3YUGbSeZEsKCJ7Zm7LAhWYhA583FMsZf2ToEmPUo074Zg4X/DAAAJsfY
 23l2Ro+fT+lDsFcVv38XtW00uNRvKlZ0X1NWH7pTKpeU2kOiT3/MBNIM/KOUZoHPR7
 ryiJHFsbUb3Gw==
Date: Mon, 7 Mar 2022 16:27:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/4] ASoC: amd: vg: fix signedness bug in
 acp5x_audio_probe()
Message-ID: <YiYyi/3BZekjTcrC@sirena.org.uk>
References: <20220304131256.GA28739@kili> <YiX9Kp9AFYNiqJcL@sirena.org.uk>
 <20220307124152.GB3315@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NPfp81odsDC3ClI1"
Content-Disposition: inline
In-Reply-To: <20220307124152.GB3315@kadam>
X-Cookie: Whatever became of eternal truth?
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Meng Tang <tangmeng@uniontech.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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


--NPfp81odsDC3ClI1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 03:41:52PM +0300, Dan Carpenter wrote:

> Oops.  Sorry about that.  The 1/3 was intended to be 3/4.  Do you need
> me to resend it?

I think I worked around it but please check what gets applied and resend
anything that got dropped.

--NPfp81odsDC3ClI1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImMosACgkQJNaLcl1U
h9Bppwf/eC/6CIIkse3i6pE3QPuWCDquC7sogKJQYHGLRbVf4m2/sJRdONv5gDW/
Mjr57Bx8iuZ20tuoNgZ5ek3V1XoF1csY6XTejWiIx+XQ6gu3wRcZMQ3fdHIvIxPg
8hAabf2HO4hbF0CgxdWXZZPpO71CUCGMVr1tdMlsc8Dd8CStF7QOWuUQujkplZ01
dwoqTRaH9jiZr6osDUAq/CGyCtf2JVyRxDlCSIX1n1pkiUCRucYiMtrrSNFGYazw
z9GXJ88nCywGzeMInlxQdm3WaztZwY1B7GXUXR+T0lhCabo/7/j+Cd5b8l5srdLW
JSdBARVJbY7iuqmkTZ8gTufbYnY5Ag==
=Enlb
-----END PGP SIGNATURE-----

--NPfp81odsDC3ClI1--
