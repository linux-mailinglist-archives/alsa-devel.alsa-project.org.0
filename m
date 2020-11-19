Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AF2B9415
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 15:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B0216B0;
	Thu, 19 Nov 2020 15:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B0216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605794941;
	bh=uQ6teYR9vspp8StdJCOXuthZfraug1u+981umxtMgag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpAcmSdwffDBRPtj7Fnix2kKkS57wTmKMcRfqc83Ih3HlVfyUe5/nO4Hcp1EnFp4J
	 ARLlJ/NOH1aeyjnhIWbQ8kNMsFTUCDoA9Z8N1ulFMKSGGFRsJn4rwXREqYniDfGUXp
	 +aUZ49p9eGhsDOC+t66bj6Tep/Sp8RDogtcoJmJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96635F801F5;
	Thu, 19 Nov 2020 15:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE07F801ED; Thu, 19 Nov 2020 15:07:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C62F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 15:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C62F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZbPRAWit"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 179C424698;
 Thu, 19 Nov 2020 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605794830;
 bh=uQ6teYR9vspp8StdJCOXuthZfraug1u+981umxtMgag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbPRAWitZWE2naNo39MTHB2j8fYiXFybjJZvfwaR6CY1HfOQr+m8T1V8ZDd84eD+t
 nR+df6ISvbcp0zJWyFk8Zr4Oe9wWpQ74naHB8FnxSSKRL1SFcUyJmB4dw+DDf3kLE5
 gc6wQgpJZB5aQGmLfLXhYGslMXAxPUzllLeHgxVU=
Date: Thu, 19 Nov 2020 14:06:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 13/14] ASoC: SOF: Intel: allow for coexistence between
 SOF and catpt drivers
Message-ID: <20201119140650.GA37066@sirena.org.uk>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <20201112223825.39765-14-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <20201112223825.39765-14-pierre-louis.bossart@linux.intel.com>
X-Cookie: panic: kernel trap (ignored)
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rander Wang <rander.wang@linux.intel.com>
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


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 04:38:24PM -0600, Pierre-Louis Bossart wrote:
> Now that we have all the support needed for coexistence between ACPI
> drivers for Broadwell, remove mutual exclusion in the Kconfig
> file. The selection is done by playing with the snd_intel_dspcfg
> module 'dsp_driver' parameter.

This breaks x86 allmodconfig builds for me:

/mnt/kernel/sound/soc/intel/atom/sst/sst_acpi.c: In function 'sst_acpi_probe':
/mnt/kernel/sound/soc/intel/atom/sst/sst_acpi.c:251:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
  ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        snd_intel_dsp_driver_probe
/mnt/kernel/sound/soc/intel/catpt/device.c: In function 'catpt_acpi_probe':
/mnt/kernel/sound/soc/intel/catpt/device.c:251:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
  ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        snd_intel_dsp_driver_probe
/mnt/kernel/sound/soc/sof/sof-acpi-dev.c: In function 'sof_acpi_probe':
/mnt/kernel/sound/soc/sof/sof-acpi-dev.c:134:8: error: implicit declaration of function 'snd_intel_acpi_dsp_driver_probe'; did you mean 'snd_intel_dsp_driver_probe'? [-Werror=implicit-function-declaration]
  ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        snd_intel_dsp_driver_probe


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+2e/kACgkQJNaLcl1U
h9B/DAf8CxqHHcD5zX6w6gyuWyact8/nGu/3R0zMz3c47oxIJ1GB5K9FjYayz8Up
qHWZkhA+7NyVel/I7ztns8Ml4qMR/Ra6RzDczZU5NNJuMrcl0G2u7YRXeZd7EyWc
0EKa7oUE0Qug1TvfZa/rpj6gJUT9JA0+AmrqKUiqp9ngUhc55tFdDyVL+9ls5EaC
Gskxr9oZHJUM/LojCrEtRosIcxNLA8wUW7nBS+0GmCGOHkm56GA1+26w6ipMjrpU
jHQwYkn8hja9iXbGXCrbuxIpu/rhz+e122c/dTvb0khGlej3d7sLy4QH8FviYwJU
wBHA4PZlesmeaxeZF/Locmpn5gFrsg==
=lc6r
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
