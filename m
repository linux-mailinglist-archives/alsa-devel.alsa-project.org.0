Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC52B6BF1
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 18:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29FF61761;
	Tue, 17 Nov 2020 18:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29FF61761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605634862;
	bh=8Y298WUPfpNgU5OeSR8YjRPSwhj59gCzY0Q8Rp1JKXI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMPBxqG3ZcQxUrfuz+qtUU2CitcX4XNWOUM7oFK4Si+QoJDckpTSOc2XMxeVXb0Uu
	 IBLsoMKyZpH6P3McvCqYb240S/dbiTyRIJCopNnO/GkYItWziosLmk1Kbqs6T9fjLh
	 bZptKS2DVG8gqIgr/cjXTBenzcagFWzBPm4wY42c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C0CBF801F9;
	Tue, 17 Nov 2020 18:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B46EF801F5; Tue, 17 Nov 2020 18:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE47EF8010A
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 18:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE47EF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rh330JgB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86D9020678;
 Tue, 17 Nov 2020 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605634761;
 bh=8Y298WUPfpNgU5OeSR8YjRPSwhj59gCzY0Q8Rp1JKXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rh330JgBlRDcdmzGCbne7Zn8yPG2WKKxT0JXScM9cjXAoCaG+TubdqRJt8qQlUJYT
 3AzoaAo2/DeguxT5UkjGVaTQjpNWOyUpjxBG89w+B5mw959acewLs/kp1anEio6Lr5
 Dv+7whUB5HzgehLCesAH1smeLgkkYSrtlq1X3KMM=
Date: Tue, 17 Nov 2020 17:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Message-ID: <20201117173901.GH5142@sirena.org.uk>
References: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline
In-Reply-To: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
X-Cookie: Pause for storage relocation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Viorel Suman <viorel.suman@nxp.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
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


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 12:20:36AM +0200, Viorel Suman (OSS) wrote:

>  static void ak4458_power_off(struct ak4458_priv *ak4458)
>  {
> -	if (ak4458->reset_gpiod) {
> -		gpiod_set_value_cansleep(ak4458->reset_gpiod, 0);
> -		usleep_range(1000, 2000);
> +	if (ak4458->reset) {
> +		reset_control_assert(ak4458->reset);
> +		msleep(20);

We should really leave the support for doing this via GPIO in place for
backwards compatibility I think, we could mark it as deprecated in the
binding document.  Otherwise this makes sense to me and solves a real
problem we have with the handling of resets so we should look into doing
this for new bindings.

One thing I'm not clear on is if there's some way to ensure that we
don't have different instances of the device resetting each other
without them noticing?  Shouldn't be an issue in practice for the use
here.

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+0CrQACgkQJNaLcl1U
h9DIeAf+Mk60aGQVQY93Dm7fXGJgMzSKeAF/RY8WkFrPKQqZzaFA3OS3lpW/gij6
MwtpXcN3Cqe6CkMB8Do5x2QX9Hyen2WugykcBHZXYpYyxDTFklh0nmFepoXtQl8B
RpNC6LrJNiXgvG9wPIt0g8KhO6Ymzz7Z1ZQUQGPsCS6/4rYyHtWJ9ntXOWSbBsfx
9/7Zd0RaHGOEdP1VlCJkdUBWOaQTkwvm8bNLw3cmqfHMWyGwBw0SfLJJCVWgwDN4
Axx3ycQeNzIuh5NYfbdQ+qj9bWxXic8t4rSPpzuuFRDMYSsi5C5O3OYUaufGESWM
1pPc0lCRGEw80sjyH5pDBV+NkkiVhA==
=KK9w
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--
