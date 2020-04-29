Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A001BDCEC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 15:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862C5168A;
	Wed, 29 Apr 2020 14:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862C5168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588165235;
	bh=li6Xj3PSlgcABYGV0eO2IHr8jMH0aES6+8vgJv4vSkI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRia0jNPudqUuzxYOYxrhSWRDKGBgZjpUuvsu/EpLA9iyCB7PbnaczaLkClhRXL2I
	 Sm1uj2oNhs00p6fKNzIkgDOjOxYiGs87Ynwvpgu6WfsrgCfktwwVwx/muwBO8OPO7k
	 4hDQ8pa/K5qs8BPX2yTBf37UW6yy7kGtyPLCJRSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3130F80232;
	Wed, 29 Apr 2020 14:58:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C11F1F8022B; Wed, 29 Apr 2020 14:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EA0DF800D2;
 Wed, 29 Apr 2020 14:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EA0DF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gKeaL7cu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BECFE208FE;
 Wed, 29 Apr 2020 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588165123;
 bh=li6Xj3PSlgcABYGV0eO2IHr8jMH0aES6+8vgJv4vSkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKeaL7cuw9y28v4bTwmHN6XU7HARFAAxv4aps3Yd06f8jH0/Y+RsPKEBJCJBMjhpX
 VRkS2NDskyNYR6JPa/7nlbQSFeslZelyy7YN8eFeF4pQ7oZ1GRxuNzeGSfqmRz41hY
 rV2l4ace0KSWvUGU3dxPnu7Z8/Nc6BW7vgTVST4I=
Date: Wed, 29 Apr 2020 13:58:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
Message-ID: <20200429125840.GK4201@sirena.org.uk>
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
 <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
 <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
 <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
 <CAK8P3a3vri_-tdEy3x6tRGUjb_k-+Mc+Jt9bQpgFvqm2RN+cJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HTLCc13+3hfAZ6SL"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3vri_-tdEy3x6tRGUjb_k-+Mc+Jt9bQpgFvqm2RN+cJA@mail.gmail.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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


--HTLCc13+3hfAZ6SL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 10:24:45AM +0200, Arnd Bergmann wrote:

> I looked at the bigger picture again and found that the more fundamental
> problem is the dependency reversal in sound/soc/sof/sof-of-dev.c, where
> you have common code that knows about and links against a hardware
> specific driver. This is something we try hard do avoid in general in the
> kernel, as it causes all kinds of problems:

This is a legacy of this being factored out of the x86 code, since ACPI
is not really fit for purpose when used to describe at least the audio
hardware on modern laptops essentially all the enumeration is quirk
based.  It really needs cleaning up for the non-x86 SOF users.

--HTLCc13+3hfAZ6SL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pef8ACgkQJNaLcl1U
h9DFqgf7Bk+odcTlRMvglULBd8JVvvVNug3HsTUJZY0nAIJ8yvEYcing+rV9QnY6
WwoxEdaADURcX9ZNcW/nwguxgd87xkc2rLeasBXq5aJTtTQlfRkym+rc6ws53+7v
BD6eD5RXHgYz8tTAiPKQZg1pS2mgneX0Akpg5Txl7UGKaffA32meh9iz3f6JvGPe
OUg6IYwkMHEz/2x8Wd46205Ygp0R96/FuUMo3Io6TgJOX9L9lf/2flb+B3yyeHpG
lPtFxgiPutWxduMDbxiAHJL1xgzL1GQScnfQWOgho9egVaaYrW1q7VGRNrBLwHr1
uhwjh/jEoitjH3YvQCM4wI4gOvLmyw==
=qi/x
-----END PGP SIGNATURE-----

--HTLCc13+3hfAZ6SL--
