Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB022430D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 20:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7478D1661;
	Fri, 17 Jul 2020 20:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7478D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595010090;
	bh=RCgNr3/xeYA3Haxzprr03CsH12nqDhWVlciVt75a4Y8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CpfEiclxxf4kuw4bshKBjtWNVMElmiOcFoeyeBCHpw16pHP6YBTuvc/5gTS1b2ZUg
	 grC1gdK+qCw0zfdBSvQGTIUYuJISs78j22q0GXihArcaN/yagSrDXLRj3uoQn9E2Lk
	 p73sPv3VJ3JzWuaS1f8MjF3vXK7OEiSEE3BChsP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F71DF8014E;
	Fri, 17 Jul 2020 20:19:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93035F80217; Fri, 17 Jul 2020 20:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1500F8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 20:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1500F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sGJTHFHR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2802206F4;
 Fri, 17 Jul 2020 18:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595009924;
 bh=RCgNr3/xeYA3Haxzprr03CsH12nqDhWVlciVt75a4Y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sGJTHFHRCR6dQ9fHmqmDfeRj+S7nxaNqEMRM0R4kbaxlIFmm0Pn2iv9ijfghlRiMw
 oh6A+55xXJ2epmsbBAIAYXZ9uZf05TpgBQOaTOpa6xyn7uNkDU9fhBIf1b8lgj4TO7
 jQFC85r6EMaUT31YZiso2+Ushj+jcBP4rzyPbemg=
Date: Fri, 17 Jul 2020 19:18:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200717181833.GC905@sirena.org.uk>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net>
 <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616164255.GR4447@sirena.org.uk>
 <1j1rla9s22.fsf@starbuckisacylon.baylibre.com>
 <8693bcb6-4c90-036d-79f0-87516e47f41b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <8693bcb6-4c90-036d-79f0-87516e47f41b@linux.intel.com>
X-Cookie: Haste makes waste.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 12:13:14PM -0500, Pierre-Louis Bossart wrote:

> > IMO, on a Multi-CPU/Multi-Codec link, we should allow the direction as
> > long as at least one CPU and one Codec on the link are capable of
> > handling the direction (not all of them, as it seems to be set now)

...

> If this was a feature and not a bug to have different capabilities on the
> same link so be it. Mark, do you concur?

Yes.

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8R63gACgkQJNaLcl1U
h9D9rwf/T9lEXq9hsZ9ypWSChVcC9LzV+oob3xYsZ1nzF5SopS/YmHyXJpFQLXQy
Q4HhydXUZT7foCvcbJpmjBLC3hWIBAm8BCXIve3H71s79nNZOPl5KEKTOA8kadWv
EkV9wqNybqYSLuow4Hu8wAoMRU5JTWehX97CqL9UjjE3JHdOcQey7QTJd1mZq5ZF
/lIXs1CCZUENq7CeNBEmsQ/g3Tp0jnAiaRF3+bG38ojXVv7cdcRfu2lhQYuXVF4Q
C/IPgJ55S/ajipyiRRd0xp/xOe2wRFq+DV5U/p6TelE1ViOxn9NbUlvcegID9tS5
G/brES7wVpKsaGOUWcbzNszA174NKw==
=geoK
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
