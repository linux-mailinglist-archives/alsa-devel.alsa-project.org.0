Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07921AD9E2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA8D1686;
	Fri, 17 Apr 2020 11:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA8D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115740;
	bh=CXmBfQvsodcCUZWfS7NlUYpehH2AUIcAlT1z9LtCy/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssmqp2pkQ6WMQ8dObCuOLzPsOv47sOOkD5KHLHCbeHmxaidzOiEkPKa88y3lvrmXC
	 7l5faqn/Olpoe32TI4XavTmkew5BcYdj0R43GvV0Oj8TYfwk1X0nkiKBW/DtwOlpHz
	 qRaV+2jKbuTpUbA4v+1xD04ZtnUI4RdPC5Pu086M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD389F80266;
	Fri, 17 Apr 2020 11:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A221F80229; Fri, 17 Apr 2020 11:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08EA0F8025F
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 11:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08EA0F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DoZKo+M6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AB6E2137B;
 Fri, 17 Apr 2020 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587115049;
 bh=CXmBfQvsodcCUZWfS7NlUYpehH2AUIcAlT1z9LtCy/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DoZKo+M6IUaPgtMZe40tqCchHaoSvHMYUkuc9exHwfw414FRoEdfpGpX69t3dYuWb
 /UWSbl4od2U2NWiUexI7r8g269ZYOTEGsg5vF0G10QA2vFa9uammqkqdmWR/xewR0U
 cpcIOS4YWOg27a5gJ/kXF1JH7A6RBo0xGCAlTbKw=
Date: Fri, 17 Apr 2020 10:17:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: dpcm: Only allow playback/capture if
 supported
Message-ID: <20200417091727.GB5315@sirena.org.uk>
References: <20200415104928.86091-1-stephan@gerhold.net>
 <61ccf27d-a511-b3a4-2da7-56edb01b24c6@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <61ccf27d-a511-b3a4-2da7-56edb01b24c6@linux.intel.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephan Gerhold <stephan@gerhold.net>,
 ~postmarketos/upstreaming@lists.sr.ht
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


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2020 at 03:51:23PM -0500, Pierre-Louis Bossart wrote:

> Mark, this commit is on your for-5.7 branch but not on for-next? Not sure
> which SHA1 to use for the Fixes: tag

The commit you're fixing should be the commit you're fixing regardless
of which branch it is on.

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ZdCYACgkQJNaLcl1U
h9DNWAf9GUlGAEjVS8lWXhtQgsrMoWhPU/ixNFWFbvFMAkL9Ws5eGSURpaVEU9St
2ALYSZUDxbcpb1RfMOGdgoEryQATloXkdj5BDc1DhqaKF5raCZnnOV8h66qoUJ8M
azMjZ8FhtIJwk/nMnwvFqpyl6Y8fLk3E7UNy4tNHWWMY/uO1XPsN6ds8v1sxJBKN
RsC0QtSu8KXp9vTQYbXvV1/GujNM/DoSKLcGyENPYv/udDH85pXvZYMA3L4mk0bh
dbTseDvXVPPGQA6q4pUireMUkTAWoD2y+CbW441qELilDshqdPHj40i28yB0LLh3
Hn38lPczZyxJ3YbcE++VJwLc7vMw9g==
=4Soz
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
