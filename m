Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59991333F66
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:38:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD52816C8;
	Wed, 10 Mar 2021 14:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD52816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615383516;
	bh=/qvD9d3Yt6mfuCTPcp4UZO2U5EnDzRCNvDKcb6MmsJ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhY1TNZpmkDnNuvfP9Bac9BFZxvP6/8GLT7vifJf62Biz/PhN4BD9fSYX7AqckBFd
	 uFTlV7oSw9e8AKMCtkS7sp/3yp2ysOnc2cZYvgNAs9uTCGHgqYWARFamMNpluI+TYj
	 ALrWVdvAd+8HzD8kPLUOikumfuu0DMyWQ65xCTmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4ADCF801ED;
	Wed, 10 Mar 2021 14:37:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A440F8020D; Wed, 10 Mar 2021 14:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5829F8016C
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5829F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fXkTwOG7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF1464FD6;
 Wed, 10 Mar 2021 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615383406;
 bh=/qvD9d3Yt6mfuCTPcp4UZO2U5EnDzRCNvDKcb6MmsJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fXkTwOG7pbmDGBbDKSu+3o811aK9eFGLJzWdPfdV7IhuvVV2m3Nk/c4z9Li2QpgZq
 JR5lFEpfU5x63QLFZC/Dg5+8+rA7Qy6i+bmi9WzXRbLRQ9uuLEpqqTPivY7IFzeayg
 mzUQ1q78M6bMSFonfRUBBV3sSsGBjGfHvBIOyAoFB/+nGnPxHilxCy4AegMTxyxkqn
 VjCUKcE1gHCAhPSvx/fugTqtMd/AwCxEl52l1MXY0/0FP1VAKrekT+ZcP+nH+lYrtB
 xdfomGcbcJbdQXlOiQDFTC2QmRVFoe6Sbf/xhWZFNbZhyi3bAQoNn8f7QcqAOFdP+8
 92FFehlbjeg4Q==
Date: Wed, 10 Mar 2021 13:35:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310133534.GD4746@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Content-Disposition: inline
In-Reply-To: <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 01:41:45PM -0600, Pierre-Louis Bossart wrote:

> The problem is that the cards are platform devices created by the parent
> (which itself may be a PCI or ACPI device) and have nothing to do with ACPI.

> Could we flip the logic and instead explicitly detect OF devices? That
> restores functionality for us.

Just change it to a system level check for ACPI, checking for OF would
leave problems for board files or any other alternative firmware
interfaces.

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBIyyUACgkQJNaLcl1U
h9AD0wf/Zbl1pfIcOCJxOTd8jWQgWmUT9U/NLT5bHSI+QKZCQ8TdhAJx5nbTYpsA
EIfYRfIOyNbC+orOg933wQsEzmrhboS/ZfORAvfUKtlTHA7hmWO+qIserBNczgEE
2L0pCqzopDnuD9IVNNzQr5CmEgunXIxShFGiJy2rkqHavvpZPwllhH9qpfQ3bwEO
HTFhidXy7irpPJrZq1zenN70VzExNcqMUe19mz4M4g0imcyrGmfGOqWUj9c+7ZoY
VNHHGINTIfh086c3T4PNKpK/pcmyhdsBXdJR3RewnPdMy72VzsAApz3XudGwcAqL
aH9twLn24x911JXToXymhg7uqhlwuQ==
=CPbE
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
