Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280B4F101A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 09:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A85416F5;
	Mon,  4 Apr 2022 09:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A85416F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649058149;
	bh=SFEBOkVBt2v7eUVd6t7tUEMAgkCh+TwoOUWan0N1Hos=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjVUGIqaxLh0ERtcVjzExzj52CtQSfpCdTym+2j2GOImalC0tiq0Y5NEUx2ddYTS+
	 sw4Vv+Lqnr4v/hXBCnkQ7u7tT/ZdIS/0xhKkfHLhJZ7b2D309If7rz8Q+sw5uowL6D
	 RXGbogUUdb8h5paUSweifycBd+aPsHyf2FGPwX4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D36AF80100;
	Mon,  4 Apr 2022 09:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF3A6F80162; Mon,  4 Apr 2022 09:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78734F80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 09:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78734F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k35KrcyP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79D7561249;
 Mon,  4 Apr 2022 07:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298C9C2BBE4;
 Mon,  4 Apr 2022 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649058081;
 bh=SFEBOkVBt2v7eUVd6t7tUEMAgkCh+TwoOUWan0N1Hos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k35KrcyPmVFXi+Gy2GWiGVFUahIER0Mp79Rv4sRPCzurenul1pPyA3KyvosugQcTS
 1+U+my+IW7vsGQkB101wUgRGopoe3W6hwqsnlrk+cyQ0w1KWqrapbpTXU9huTNI55l
 5+j4pPfyXEhouT+Tug+qkeZfesxoQXOvH69b/TkD6SsQTst/lkSYrIeHQDZ+wTWV8I
 BT4L/ZteXWbk7077YCQcQDJZG8kvn5viavEgZlv894QuZU470ZY90w9wuEItr4SU9B
 XWIJrmDy6A+DkA2+ho3qluOUaZJrVaqoCHTVOB53PzqkSYJtAk7C1hgtQZlvsQvq95
 M6mphAauWj74Q==
Date: Mon, 4 Apr 2022 08:41:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH v2] ASoC: amd: Fix an ignored error return from
 platform_get_irq_byname()
Message-ID: <YkqhHLwwhlJxqgmJ@sirena.org.uk>
References: <20220304004543.11797-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZxoYiHOv0fHvjypM"
Content-Disposition: inline
In-Reply-To: <20220304004543.11797-1-yang.lee@linux.alibaba.com>
X-Cookie: A rolling disk gathers no MOS.
Cc: alsa-devel@alsa-project.org, tangmeng@uniontech.com,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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


--ZxoYiHOv0fHvjypM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2022 at 08:45:43AM +0800, Yang Li wrote:
> The return from the call to platform_get_irq_byname() is int, it can be
> a negative error code, however this is being assigned to an unsigned
> int variable 'adata->i2s_irq', so assign the value to 'ret' concurrently
> to solve this problem without affecting other functions.

This doesn't apply against current code, please check and resend.

--ZxoYiHOv0fHvjypM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJKoRsACgkQJNaLcl1U
h9BT8gf8CSb8vfR5YFVec3em+YC6KNuko+8bu/rJE2FhxYDaW0+TitAAQbNhfhR+
/2NrU8KwenZTLE32B0MAOFYEPpXCITV+6ObDeXiDRQ773oBso8cMdEt87sh+nQNj
16ld/gg6nGG5Eym/8gwsMZ0tOkOAlLMwW3ZTeSnspZNFykPne0/8UPC+rpigHY2o
Nk1Jg1/XlihxB9I1yzvZQDTZKErxmVxsKWiYzVDyxQrB7/rroV/TfARFipOOcsPy
mOiuj+jtbl/lIRToLcravIOG8qRNCZaO5Eaqc9GtfAV1B7FZAAGBAC6bxHq5tbwy
xCj2phXjjXH0PqU8sAm4Mu2THhCsHA==
=mzRX
-----END PGP SIGNATURE-----

--ZxoYiHOv0fHvjypM--
