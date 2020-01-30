Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1B14DD69
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 15:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23BCD1673;
	Thu, 30 Jan 2020 15:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23BCD1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580396259;
	bh=BH9Qu+8fsNgf2D3/3yfkSD7WPHM5bY91k4jv4Qiiw3o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwtOj7ocF4OFC4fpgNG6GwCkxQU3funjZXij25zhTpGtmy9J+HUXWZ6/TeHUXjwFW
	 UI2GFgXxCpmvl1kWe2n8oOSfNkfqxyTVDBH6/4ZEa0QvgS761eJ3gb8SWdut91CFYo
	 RbGmVv4tdTEQP/98MI5BtctucB1cl/uN7ocjKiuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CD3F800F1;
	Thu, 30 Jan 2020 15:55:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76093F80150; Thu, 30 Jan 2020 15:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 96E71F800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 15:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E71F800F1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C81F31B;
 Thu, 30 Jan 2020 06:55:50 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F42A3F68E;
 Thu, 30 Jan 2020 06:55:49 -0800 (PST)
Date: Thu, 30 Jan 2020 14:55:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200130145548.GE6682@sirena.org.uk>
References: <20200129223603.2569-1-pierre-louis.bossart@linux.intel.com>
 <20200129223603.2569-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200129223603.2569-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Positively no smoking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof_pcm512x: add support
 for SOF platforms with pcm512x
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
Content-Type: multipart/mixed; boundary="===============0933446837228380972=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0933446837228380972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6e7ZaeXHKrTJCxdu"
Content-Disposition: inline


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 29, 2020 at 04:36:01PM -0600, Pierre-Louis Bossart wrote:

> +static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_component *codec = rtd->codec_dai->component;
> +
> +	snd_soc_component_update_bits(codec, PCM512x_GPIO_EN, 0x08, 0x08);
> +	snd_soc_component_update_bits(codec, PCM512x_GPIO_OUTPUT_4, 0x0f, 0x02);
> +	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
> +				      0x08, 0x08);

These look like they might be a DAPM widget of some kind?

--6e7ZaeXHKrTJCxdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y7nMACgkQJNaLcl1U
h9BCPwf/RSPtA6f6N+XUAXvj0VTh+RlgvZU8JHOH0QmuE3AwtzphoMXnSbyuVDqB
n3FQtpZ27mUnm4duPOHmHCPgNBIBQSmGa0VoFI2yojF2M1foLANcvpypSHYYYtwC
8c4VuRcJcy89ccBhkJJXNig3sYTQp4UPU8yBHdoL6gHgpuSum2pmLbXlseCkW9OU
pMDXL26pFnufnhW3bUA2S+ebVRamNOYik4iNmzzDo8/gn3aSy+27vD4bx0iMLSdA
8JMSFmGmRaldGZxj5V+EYHNMlhxrOlzrrgM7IlZh8t2cm6ABgG0upIuhisMGxqO/
zECxIyLajqCeA4QjwUpJ+z+NblIawQ==
=MUP/
-----END PGP SIGNATURE-----

--6e7ZaeXHKrTJCxdu--

--===============0933446837228380972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0933446837228380972==--
