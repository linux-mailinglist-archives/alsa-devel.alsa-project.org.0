Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD45203E9B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 20:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD49851;
	Mon, 22 Jun 2020 20:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD49851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592848873;
	bh=6dCK9DzfZgFydlzh6Jy+FIkFpt1Gd4f4rU7VW1IR+YA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzY8BcvpDOj8ra+uZhoSGn+SAPkH+a8x9zCdJKMWv1sdheFEynT84wF1kIsaklokF
	 uBY2S+XrMHC87BoChbK3/N7h7FSE/QRccDmrCt8pSiu4CtxweKhIJBZcK249OtqCka
	 /2KYKmImQuS2+NYPGdaK8tYf1fOvBD+nYI3vF6hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C2A7F8015A;
	Mon, 22 Jun 2020 19:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7DB9F8015B; Mon, 22 Jun 2020 19:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92F68F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 19:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F68F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oijtiEOf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93EF720738;
 Mon, 22 Jun 2020 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592848766;
 bh=6dCK9DzfZgFydlzh6Jy+FIkFpt1Gd4f4rU7VW1IR+YA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oijtiEOf1GF6w3Hq2d+oANQfRlAOd+DgeStto6Vd0u+RodCO8SwrtyoFfPNqALjEX
 C1AMTBunKUmffJUGIHiT9RmYuvWUSUkx3AaLfAEn5RSJwCPm/KADw0UIQiWExL8OVp
 GpapQDQwpN52R6nqmlzavZHpoIzHembcY3p/5qIw=
Date: Mon, 22 Jun 2020 18:59:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200622175923.GQ4560@sirena.org.uk>
References: <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616155544.GA8891@gerhold.net>
 <7cbc9233-e5f2-03e0-5659-cf22dea75e53@linux.intel.com>
 <45d43cc9-be22-a7d2-1628-3fb30232bd7c@linux.intel.com>
 <20200617090112.GA38317@gerhold.net>
 <62ccb59f-9d08-c241-952b-bb7af8311618@linux.intel.com>
 <20200617174635.GA40060@gerhold.net>
 <20200618150143.GJ5789@sirena.org.uk>
 <145da893-5cb4-63fc-b988-c048ee839785@linux.intel.com>
 <20200622175423.GA8907@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R4+lwT0Y15rLnKR0"
Content-Disposition: inline
In-Reply-To: <20200622175423.GA8907@gerhold.net>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--R4+lwT0Y15rLnKR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2020 at 07:54:23PM +0200, Stephan Gerhold wrote:

> If we end up simplifying those flags, and eventually removing
> dpcm_playback/capture entirely, wouldn't it be the easiest solution to
> just relax the error checks for 5.8? (Like the diff I suggested?)

> Pierre's diff to set dpcm_playback/capture correctly for
> simple-audio-card etc would work too, but I'm not sure if this is worth
> it if we end up removing those anyway.

Yeah, if we're removing them anyway then taking something that just
ignores them as a fix seems reasonable.

--R4+lwT0Y15rLnKR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7w8XsACgkQJNaLcl1U
h9C06Af+JFOKtPK+X29/Wb28o4FjWW1Vi9zPp+RnnDPheQx5w41v/J/IsPulsR8M
Oh2I5vSaQeVdJGhS+jLLvLLfLcqE65bnGRkBmE33g0tImc0feSFcCBe0tA8mLxSa
3IEz/cTFgvVLtllJepAFJMzntG9j77IOcHYx1JRu2uLUHlLa2XO9nP0K1KzlvhmR
c0Ig87ddOZK+lW9MMi6ljGG0PLgdHaWCjYR7vkrlI2ejvXYsdxfT1TpQAGaIg49n
en+NQw4KzngkUTu7kORnk5rUVJwPwh0JtBaYHHZpGil/73p86TgcHIUvC4ChTSje
6iMcC28e9+mE/FsrQDIjVV/nIHVd5Q==
=166a
-----END PGP SIGNATURE-----

--R4+lwT0Y15rLnKR0--
