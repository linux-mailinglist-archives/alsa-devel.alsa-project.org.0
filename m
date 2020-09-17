Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05826DC70
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421D01665;
	Thu, 17 Sep 2020 15:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421D01665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600348036;
	bh=VWZZoKhUjroNLpll2eU5vjUqNxtnR3wkR+uu5Ss0zr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETXK3SQ/EiAWNcCX3VsHYyRUMpvBLYvu1Z04hI6xqj8FFJJxYaOeeAWwAcS2qBfVV
	 ty+naJueaZruR3BSvuIUquEKtRAHkV00JgAXE0awzZowMIKv/0hZMuTOeLRRLFTwQs
	 n0tPrI1QpGLjiZj2/w/W4QcTK8ViuBiNMKcwyKSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B31F8025E;
	Thu, 17 Sep 2020 15:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86293F80212; Thu, 17 Sep 2020 15:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 160F0F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 160F0F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mi3s2YQg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52B782083B;
 Thu, 17 Sep 2020 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600347923;
 bh=VWZZoKhUjroNLpll2eU5vjUqNxtnR3wkR+uu5Ss0zr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mi3s2YQgpeZZBpneKJuKUPowYJRNqmmOg9EnsuaQ6g7HwF8jYnhjAbFZq+G1I7ATn
 qMvrjkVDAonhONz4GUA8SHPmq0sMe7Jov1R5tPypU7ue+bWqQFozkiUnzir8+uMs9H
 dLNQL6u2z+vGlf08u1vwiMKYG0Z94iXzUizJeZpM=
Date: Thu, 17 Sep 2020 14:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] fsl: imx-audmix : Replace seq_printf with seq_puts
Message-ID: <20200917130434.GD4755@sirena.org.uk>
References: <20200916061420.10403-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <20200916061420.10403-1-vulab@iscas.ac.cn>
X-Cookie: If you fail to plan, plan to fail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2020 at 06:14:20AM +0000, Xu Wang wrote:

> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

This looks fine but the subject says it's about seq_puts() not
kcalloc().

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9jXuEACgkQJNaLcl1U
h9B3BQf/VarUuMPYus5VLpA+zmE+7JqUAcO3omQ6LMqaF7VBOQhDHlE45z4cWL+z
puS/DV1XmM5bSGn+ZwcwBh6GvfamDg5oyGSTs8OkwMeWxCanjvexEE81RTAvzCgT
qkAdheP90NZtRKHJImUV6KfmiTJXB2nokridUP+vC2L98aZjAYbVFuJ5CMkEuKOk
jOzrE81vM69mIfnFnvcHRv7wH+WZszcgxc/WDTFDfYSQB5mMgBvVDT9mUPRJtjkj
NdND/4RmGRSXcQ5l7iHszGwtUBSAGVVycv45pBPcm1z1Z/XXh0R4M9SbrICmDbZM
g6zIaexA3gXNIUwR2p0czzGdbUD3ww==
=AGo/
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
