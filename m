Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE643F0366
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 14:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AFCF1607;
	Wed, 18 Aug 2021 14:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AFCF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629288534;
	bh=6PiupebDXSJROvJfhgJanrhOdurpeH4omGhk2uoLVmo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYdkpGq1V8/GLPtphH4afMVrieSS4KLvcNIZOGVIss4Qlt+z50tHf6MjC7YNpVC7r
	 LZMr0ZiAu6tKBxdvEQF/AF82ZcTsYODBNs7BtA1/CJ9Cyj+IR6kbLZv9GAFWmxHgfB
	 WuYviSc2E/rMsj1skMuCkxKF6FHJPlB8yXuJtxS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D9EF80246;
	Wed, 18 Aug 2021 14:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B8AF80249; Wed, 18 Aug 2021 14:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A51EF80163;
 Wed, 18 Aug 2021 14:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A51EF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BnjVsNFB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 539A160F58;
 Wed, 18 Aug 2021 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629288443;
 bh=6PiupebDXSJROvJfhgJanrhOdurpeH4omGhk2uoLVmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BnjVsNFB/vyNS5JJ2Vxi7yBLVPp730FtDqtNUCEZwQf3V3is0+w5TIZDcxwnD6wU8
 MQcdDtCKuzvByhw5W9nrnrRXYPGIYxQQEt3xAlNF8UXQsD3kyR3W02v1psSHef3TFP
 NY8gHSDa3Dj2N9QOBo5J8e8DuYSaWPQy+YO5M5DChB8LvQ2Eib+UW8oRp7OnRdjHyW
 3mGpG4mqCvtHdTvlTwJFSn/gvauS9Qqbtxmq+kbqh1SJQWeN5NNWGQa7RiVOIKCPrj
 Ohe61T+omTzdomT6WbKNRYU1C4cM8SWxupJzo2FcMLBjoXWvnX9yOo01su20wazPBk
 yBIQY5tsf5uUg==
Date: Wed, 18 Aug 2021 13:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/2] ASoC: SOF: trigger re-probing of deferred
 devices from workqueue
Message-ID: <20210818120700.GB4177@sirena.org.uk>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <20210817190057.255264-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: She sells cshs by the cshore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:00:57PM -0500, Pierre-Louis Bossart wrote:

> +++ b/sound/soc/sof/core.c
> @@ -251,6 +251,9 @@ static int sof_probe_continue(struct snd_sof_dev *sde=
v)
> =20
>  	sdev->probe_completed =3D true;
> =20
> +	/* kick-off re-probing of deferred devices */
> +	driver_deferred_probe_trigger();
> +

I think we should move this into snd_soc_register_component() - the same
issue could occur with any other component, the only other thing I can
see kicking in here is the machine driver registration but that ought to
kick probe itself anyway.  Or is there some other case here?

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEc9+MACgkQJNaLcl1U
h9Cr2wf/S8qlM4N0JWIvZi7CnLhjjIa1inDcejhDhF6aDSXP6gDFHmGDK4OhxQlK
DEUOhSBihTPTAXLvenYyDTli/yFrIgBTOo/t+w0to519OkfZG6/81SAkYhABSUau
y7J4dhO4eek/QqkG5vBywhtHBIRwV3SfVludEZGjxp8TZ+jqXgsZffAt7Wv3TOF1
L4g+Ska/mS6uRNZBiK/Vhdrh16i1QHMF3RGITcV7tkNao2apxdmy6kfqgoOZjYqy
QvkfkRJVrsDAgz+MkqPCr5L1LzkdDvfd1eprBtJ34Qdz/++Cp98XdC6xkBo7d7yh
XAuqs55hifZNeYfaKq7a0X1ZSjaeQQ==
=1j3q
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
