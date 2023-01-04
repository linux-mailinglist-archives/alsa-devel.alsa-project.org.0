Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D492D65DA5D
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 17:43:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2626BCD5;
	Wed,  4 Jan 2023 17:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2626BCD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672850627;
	bh=tawCq5rDNts+pHcVIk1xFpMG4ptIp8MdqNAWL9sUCKk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sg8Eai4fpx6YHTImOM5YpmefVyZ0y1dLh+gcarRHXXW7UvtGcQXFEg/0Ig6TZOLxU
	 QsoLqA7yH2f6DwCOzLXDjaZ+RsMDnntderG1lMcAUO7VrQzxAR4qViwYkGhGtWX9n5
	 c9u4L/iAOs5kJ7XbJ2tUIvq6oTOJrfPbsl2L/Zbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34CFF800C0;
	Wed,  4 Jan 2023 17:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 825B8F80240; Wed,  4 Jan 2023 17:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11223F800C0
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 17:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11223F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TpxET4oV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE43E617A8;
 Wed,  4 Jan 2023 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F00FC433EF;
 Wed,  4 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672850561;
 bh=tawCq5rDNts+pHcVIk1xFpMG4ptIp8MdqNAWL9sUCKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TpxET4oVPdaev6BWt/DzVoqIPC7DPZGDZ2jVQkbiTKqqCPIqA9jkcJRcgK+Et5n1Q
 9zVJQpC+v+Jh6kTrLqnGWXOUXATlsVrh/ajomkJUCo2TAUJWfmiCyfGSN/ib7GskH/
 HV197Q1A6Zx9wqvkWsuFLb02UcWhJCZcft413EjTzjA1S979VviYyAvrcb3joC3bwr
 QC8dCbgWt01L6T9jC1N4uW6lERAD+XAQkW6tvSmzhCRloOK1HxgRrn+tx7KMdT+mZV
 Tyg+M2tHesqSaoEafgDVQz4If7CN5Q1ZoKqjZjdRhuOw/cIRedhAgelLGGmFxqc+Vl
 sEIqAdfJ3HgbA==
Date: Wed, 4 Jan 2023 16:42:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7WsdF1rK/JmS01W@sirena.org.uk>
References: <20230102203037.16120-1-andriy.shevchenko@linux.intel.com>
 <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
 <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
 <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="600BhCXh/yAphDa9"
Content-Disposition: inline
In-Reply-To: <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
X-Cookie: Stay away from hurricanes for a while.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--600BhCXh/yAphDa9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 08:15:27AM -0600, Pierre-Louis Bossart wrote:

> For this series

> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

According to b4 you've only acked the first patch here because Andy
doesn't send cover letters :/

--600BhCXh/yAphDa9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO1rHMACgkQJNaLcl1U
h9ABhQf/XFeIxOWyHgbkfokMWdWoAi7UA8p0E70CSx2GVz+PkIITj4yDCJ1eVvE2
ZkGD4qu7K8mTd7VqHIuv6GDsaoU9ombbBEpr+uAIhx3Gu8frwPrbvJLH5/QaKfDa
hZ8zsW9r4AoxrzJi9e0b0VKWQIb0IOYRCs19QBnCxe6w2/mU/cvcSSeumIaT2KD+
f8Zr+MpOq3w7XfoITNPnpjkyJ3eVmWTDFB9OiqbzQrysi5yAOlnap28n7NJTt+da
eflpwmr9HAStbMbzURV2JWlrcioumyfgsPp7GUTfh1U7JWomSRvUk0dK3x9sWou0
iz4/5dGRm/DGOgbd44tPvbf/asPV4w==
=fAp8
-----END PGP SIGNATURE-----

--600BhCXh/yAphDa9--
