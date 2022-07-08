Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 369AC56BE76
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 19:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B251A201;
	Fri,  8 Jul 2022 19:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B251A201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657301368;
	bh=44y+wKkHltPQm8FvqRi/mW3bA1HZFnTKDVm7qrCOkhQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDrMnf9DbaNIf1hbbfnDJaDbywLPwOcQFOJlNnYG9HZFKTT5ynq78PA6vCJdUVSBC
	 rKDD4P7EddlhakkXePTuF7NztWV1M0K4CDpmEkgSJGpvlcpHxfWJN3vIphACMV6EXy
	 WnKsffdKyHPep/guiSOJBu7wcM8JXRQ85NaxIyFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A929F80166;
	Fri,  8 Jul 2022 19:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEFACF804CF; Fri,  8 Jul 2022 19:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13131F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 19:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13131F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k8afvMu4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC631B828FF;
 Fri,  8 Jul 2022 17:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2187C341C0;
 Fri,  8 Jul 2022 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657301298;
 bh=44y+wKkHltPQm8FvqRi/mW3bA1HZFnTKDVm7qrCOkhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k8afvMu4txze6ODn4S/6bdRBkjpXczE4uMLdWRGo0b4SmNXk9YCZF3Yqkek3qv6vP
 z41h85odf+CFSa3ZwRYTF3c9+lQ+BiNM0CFlUsQiadYo33AtmUGil2focyhhl1obyJ
 UfnG2payIdzJsUQOMNqgMtAJmzMJ0D51+YYLXUxZ0/M+EDOTUH4oLZtt0kLMUqXYjL
 OfZOFSJRTR/xuM5hhclaPscAweqsujdZT25MAig38EiC37nzWw047SIKjcfVZ2Q2gr
 GMe6Tti0ELxPDr2CIWuYfjAKH2xTjcAqE9BdPtHOrOtJN4faR6PREAB9FHs2PkF06N
 hWvzgt72ulwGA==
Date: Fri, 8 Jul 2022 18:28:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 06/12] ASoC: Intel: avs: Block IPC channel on suspend
Message-ID: <YshpLSb+MltY+6eq@sirena.org.uk>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
 <20220707124153.1858249-7-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BD4CbopBGM6UXch0"
Content-Disposition: inline
In-Reply-To: <20220707124153.1858249-7-cezary.rojewski@intel.com>
X-Cookie: Baby On Board.
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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


--BD4CbopBGM6UXch0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 02:41:47PM +0200, Cezary Rojewski wrote:

>  		return AVS_IPC_RET(ret);
>  	}
> =20
> +	avs_ipc_block(adev->ipc);
>  	avs_dsp_op(adev, int_control, false);
>  	snd_hdac_ext_bus_ppcap_int_enable(bus, false);

The fact that there's no matching change to unblock is fine since
there's already code the paths starting the DSP which does that.

--BD4CbopBGM6UXch0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLIaS0ACgkQJNaLcl1U
h9DZCQf+LuC9qSOUB+bhBwNMM0/R2qWdf4AZLoG3p50uG2sqfzFPsrebsK9KUeQj
Rp1LVXe6jWUcKhIVa0vRj2AGyoEKWr+ePmxr5Hauc9wXJPIDY/+1Sd8mc5jhwe/h
1zaFxyAlMC22AlzXLM5pV0sGNgGhqdEmHDS2xu4/9n59/k27yP0CO2a03N/X+OVH
wAB/vPQC7kW9AKncNMOcTlE0ddbCTM3HXtCBrkcecTnMLMQm6hJfzs/o3SMSHtg+
nYk1nYCU/uUEOFsg6ltKh64T/br3Qt5JpdkqFdonBcFgDvUPyXVEMqlJcM2UE75Z
RVi1gIXOcXHvNSnCuyTO1yS9QqiTIA==
=n1Lm
-----END PGP SIGNATURE-----

--BD4CbopBGM6UXch0--
