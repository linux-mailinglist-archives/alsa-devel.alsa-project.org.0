Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A61E2B6B93
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 18:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0F9016F8;
	Tue, 17 Nov 2020 18:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0F9016F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605633644;
	bh=eR7SydTr/893wsEjK68DTHvGkl0x2Hy3c7YY0aSWAcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JAp9iwvO5i3t+yFkWJ+vSEnsGjbsVThVRIUQWayiE/3RNDVhNuneSLH3mEY0kxtUs
	 HurTLMKndL5Mh6KEKMNRyMAgcSebCSyqVGkf7chvSAISmkVLwdGdWxONiadoqY5AQt
	 xhyWP1Pm/cUwW/R19naaZhH8v1I+MMHhKutlUXDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6369CF801F9;
	Tue, 17 Nov 2020 18:19:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCABCF801F5; Tue, 17 Nov 2020 18:19:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43814F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 18:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43814F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D53JJ89F"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A556B238E6;
 Tue, 17 Nov 2020 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605633542;
 bh=eR7SydTr/893wsEjK68DTHvGkl0x2Hy3c7YY0aSWAcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D53JJ89Fovxkz+KTB7kg2wHB6BfzUyD5kSGFLy4RL7pr+RQCEMQdA1qPa6ggZZALh
 5/wVQ2gN17a+V6BB6pspIGSoqf/D+G7qxP5xFVe21gZSWo9IHVMilGrAMdkAejKJIl
 2nOQBpcOadEfDZ+2LtDLGhgzBIgYEYokdWy4AcPQ=
Date: Tue, 17 Nov 2020 17:18:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: Intel: byt/cht: set pm ops dynamically
Message-ID: <20201117171842.GF5142@sirena.org.uk>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <20201112223825.39765-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline
In-Reply-To: <20201112223825.39765-7-pierre-louis.bossart@linux.intel.com>
X-Cookie: Pause for storage relocation.
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


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 04:38:17PM -0600, Pierre-Louis Bossart wrote:

> +	/* set pm ops */
> +	if (sof_parent)
> +		pdev->dev.driver->pm = &snd_soc_pm_ops;

This might need revisiting in future since we should be able to have the
driver PM ops be static const and hence unwritable but that's more of a
robustness thing for the time being given that only a limited set of
systems have this hardware and we know that there can't be multiple
devices.

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+0BfEACgkQJNaLcl1U
h9CrWwf/QkamX1Ht3Av0fuyl+N9t6ZmyS0Yz/iXQJDTnR9sTSzDEPuYXUZEGxml/
movQRwJeD3CvZ1k7wU4k3J3+RsWv1XVdgAy+APY07aTfe7UnF+Bg49NyEhOaG1OC
BBRPgDtuXyGK/3hnKqdysd/rBhbBKE0IU5+bxtNBaVXH6aNe6/u4B6iEAJUCwrHS
iWbRPS8atYjBdM0J9ex+qZTU2UET0IDsfCbbfr1Y11HauLqKPMsIBnyLmR2j6NpC
RaQv9Pp38WrjKXEFUSOWuuCHBDgtP0IRkaunVP+yejt1sERDb+cJOQN8/SRR2wJ5
sApHh3Eu/Qz2dWOV0M6ngDqX6Yr0UA==
=aySr
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--
