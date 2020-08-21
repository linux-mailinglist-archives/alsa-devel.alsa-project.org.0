Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B935B24E2E2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 23:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A2581688;
	Fri, 21 Aug 2020 23:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A2581688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598047098;
	bh=omGYKu4UKaBy5l/8iUmdyJvFxlVfjWz4GLF05Wo2kJ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMvjkE3wFGtDcirJCwuaVjwo1DSPyN7KfR9HeNkM1VDqw4176y8sX/s5+ePWQQpk8
	 boW8FkBpV3jUWeS9VZpnjml6G0xxgRkTVl/sBBJMkuKmLIT75pn9yRHN0GQ+3HnrxL
	 arl4+rPIvfg1GlBb6MVruTLCj//ZwWZEpYa1p6Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C9F1F800D3;
	Fri, 21 Aug 2020 23:56:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02957F80218; Fri, 21 Aug 2020 23:56:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E42BDF800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 23:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42BDF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SJLsMQ2o"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7660207CD;
 Fri, 21 Aug 2020 21:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598046984;
 bh=omGYKu4UKaBy5l/8iUmdyJvFxlVfjWz4GLF05Wo2kJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJLsMQ2oGuzSHfUbYmoNFlIbifymxPe6CaC6uh6rh5j4BfAY7VkT/bYe7fXUfm12v
 DQNLozLdt4plBt6fxGbQcSX4PH7EQTB1uG6pvScUWvx4nDNXyz8FfU2ctS8y1Va3yS
 n00gsLSs+Y4+15XCeGy2FEWJe3L77XhthcB/hWjc=
Date: Fri, 21 Aug 2020 22:55:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: Intel: tgl_max98373: fix a runtime pm issue
 in multi-thread case
Message-ID: <20200821215550.GK4870@sirena.org.uk>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
 <20200821195603.215535-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Content-Disposition: inline
In-Reply-To: <20200821195603.215535-7-pierre-louis.bossart@linux.intel.com>
X-Cookie: divorce, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 02:55:53PM -0500, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@intel.com>
>=20
> When the playback & capture streams are stopped simultaneously, the
> SOF PCI device will remain pm_runtime active. The root-cause is a race
> condition with two threads reaching the trigger function at the same
> time. They see another stream is active so the dapm pin is not
> disabled, so the codec remains active as well as the parent PCI
> device.
>=20
> For max98373, the capture stream provides feedback when playback is
> working and it is unused when playback is stopped. So the dapm pin
> should be set only when playback is active.

Should this be sent as a fix?

--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9AQuYACgkQJNaLcl1U
h9A9swf/UufkcYfWi1pRxGTH1GbKmnWZa3hcITaHZdC786VMkj7weu7pZ3VIPjrB
RypxnA+Mn5Os/edf/lGaUKbxXwFRmi5GnXiouiSKiXQ4yPWk5x4LvwiFWpAtvdT/
dkG4yLg+4+WNHeY/pO/mpz0/oedQM/7RETO94yP1P+R6Urkv3NTWIWvZkD5q2Yzp
S04d1PVYCRNnl19O5z/0fzIVQ9PcOebjrtvxEZhj01X7lJ5ikIEijMH8wI/DJfFb
+RRQ6QjVkdMe3Eyjto9F69t/pHrsVxTABhf9MlcWMWVjnu/927clZbeks9x5KCKI
jJvSIhLdNrRT8Mk7NxOaRtK41QNtPg==
=YAIy
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--
