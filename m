Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99B596E90
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 14:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23870164F;
	Wed, 17 Aug 2022 14:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23870164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660740110;
	bh=f0Oc8xOFa+rcK6EyjWVGAbQLovpcnlfo7fvFXauDoiA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxHob2vLtXDqaHhoUIt2bo+LIr3uCEtTDf6+48qRJxYVCVdHg0Gzw/VcO+8eLzftc
	 p48oTFXEBRBz8l7yyoILnQAILFJmrt0upCzc53Gp2vO1fZUQsXOGGNSfrJ5KZE8Spv
	 RZ1B7JqAfavapgm9Y87F6VIU1mQratWo0S25Ctlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA1AF802D2;
	Wed, 17 Aug 2022 14:40:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 262C5F8025C; Wed, 17 Aug 2022 14:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A077F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 14:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A077F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hXU8cirY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A62D61050;
 Wed, 17 Aug 2022 12:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9D1C433D6;
 Wed, 17 Aug 2022 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660740043;
 bh=f0Oc8xOFa+rcK6EyjWVGAbQLovpcnlfo7fvFXauDoiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hXU8cirYykqO5FqL9jfqzNfEzUIpM3VGrytLNuA2xj9p+ewdMh9R9eSkJn8vN7o9f
 DdmL6w2c18hYCAychszFzGUY9wivzy9GhIgXAtgovNgW3Z6lrkla+dMFnXAx/PeqEB
 Mg1m+fyZJPq+HbP/UOpzeVYQUC06nYtJoSTCzRFSOAwrwLttpEbrgHcIe4SYJlvaSY
 peV5BrbEvW93kaiyBb3jVbjNSb8cnLQuxbEl9J/NNmEo9AutsDYteoN8GTDdqk0xpl
 OWe3q0gZIWkMbQjTPs+DIHkT6/omLraJKh9Oet8ONH0UtwK/kxF0zzciHla9nLTaLc
 ulcTV3qVGUcOQ==
Date: Wed, 17 Aug 2022 13:40:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 2/2] ASoC: Intel: Skylake: try to get NHLT blob with PCM
 params as fallback
Message-ID: <YvzhxcyP18SYlutV@sirena.org.uk>
References: <20220725111002.143765-1-uwu@icenowy.me>
 <20220725111002.143765-2-uwu@icenowy.me>
 <4208aece-0aea-ba86-9a00-9e217546e1dd@intel.com>
 <3346b62c3cd7e07766457c9140849a31d6d8775c.camel@icenowy.me>
 <85648922-27df-051d-8ae8-d0e4e810198a@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a6fVL5w7GoNQhqFZ"
Content-Disposition: inline
In-Reply-To: <85648922-27df-051d-8ae8-d0e4e810198a@intel.com>
X-Cookie: Use extra care when cleaning on stairs.
Cc: alsa-devel@alsa-project.org, Icenowy Zheng <uwu@icenowy.me>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--a6fVL5w7GoNQhqFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 09:08:31PM +0200, Cezary Rojewski wrote:

> I know not what "speaker-test" means. Could you specify which endpoint you
> are speaking of? Providing either alsa info or at least output of 'lsmod |
> grep snd' would help. I'd like to be aware of which machine board are we
> talking about.

speaker-test is one of the standard alsa-utils apps, it plays generated
audio (sine waves, various varieties of noise, whatever) with command
line specified control of the audio parameters.

--a6fVL5w7GoNQhqFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL84cUACgkQJNaLcl1U
h9CxEAf/eQrr0qgLq085cHm7e7fvKF5p4zJ070QqYPsGtZhYdcAqCbWvLNcTUZ/b
+XloPRX+tyUyracowfpY90ODmJlxHYUgnDwsltJroDE8pUzX9Dftf81b5Rf09B9r
po2Vbd23q8X9HOy6Y7OjXQtmdV0F4sy8pjUNolV6jqkBDFguRbWxUCydK2TUkV7W
19jXsrjaqPGc5/eepoG44QPQIRKeu1khonM59Ek4+faJQO+l8ZwH9yDGeLvcz3HU
Aq028EVhlKNCTy309tUGk4TB9+pISdTfsiglPGePOtKSsVtVbwjEvLpXq/1dbbp8
XICFQ5sis57qZwkpz5ECvEt+d1+JyQ==
=YtUs
-----END PGP SIGNATURE-----

--a6fVL5w7GoNQhqFZ--
