Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D07B261122
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A041759;
	Tue,  8 Sep 2020 14:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A041759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599567253;
	bh=1oFmjQlUgTa71eRFaKWUQb7zp5miWus6zoZgGzOe5WY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWujTlHt3vUqyXZUN9kWwy2f2XCRTh2MeZeV0v1S4nycKxrMjUpR6tJAh5JIew4h1
	 fxpSdDVJqLmle7jUQkgaR6T3chuGTWXgUaOPQ+qsNI2yBbXYOXRHNH0RzrbK1iQa3I
	 hDw1lOlN4uofxgxdgQIEw0zaBMEV7jvzObMbDnek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E928FF8026F;
	Tue,  8 Sep 2020 14:12:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B09F801F2; Tue,  8 Sep 2020 14:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE3CEF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE3CEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SsM3uXHS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC429206B8;
 Tue,  8 Sep 2020 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599567137;
 bh=1oFmjQlUgTa71eRFaKWUQb7zp5miWus6zoZgGzOe5WY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SsM3uXHS3WpdsVZYPEApclhAwZMRIwwg/+fC6ZWLMZ34+WlbTavcoPCfeKBpDrq0P
 t/NZ9W7hdsJALfCsGcktqFz0jiBd8FBhTqmVmyEsMWZOzwMo9cZ8/DONK+XaQtT8QP
 Hn/eWkEW6gDH3zz/TEaICOdklnUmvTDAnZZxSrV0=
Date: Tue, 8 Sep 2020 13:11:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Message-ID: <20200908121133.GA5551@sirena.org.uk>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Vinod Koul <vkoul@kernel.org>,
 srinivas.kandagatla@linaro.org, ranjani.sridharan@linux.intel.com,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 02:05:11PM +0200, Jaroslav Kysela wrote:
> Dne 28. 08. 20 v 8:51 Vinod Koul napsal(a):

> >>  sound/soc/codecs/rt700-sdw.c    |  4 ++++
> >>  sound/soc/codecs/rt711-sdw.c    |  4 ++++
> >>  sound/soc/codecs/rt715-sdw.c    |  4 ++++
> >>  sound/soc/codecs/wsa881x.c      |  1 +

> > This touches codecs, can you Ack it please

> Mark, could you ack the ASoC change to accept this patch via the soundwire repo?

I don't have this patch and since I seem to get copied on quite a lot of
soundwire only serieses I just delete them unread mostly.

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9XdPQACgkQJNaLcl1U
h9A5ngf+OrSLYDYVzhuanGeitM41iGcNjpTuhcMxyOTDKbQbseAq9/Ho+tDeS7by
cIPCEOX9UaRBBlqeursubOr0+EXPmtZGo5t3NqZ6MfOtpZlpcwMq4taAAokRSZBw
E6uNY6NDb2qP3RoTJ1UIR5qbz80uBgVtIRH58O4LQ3qrk1lJ3qbbi4lZCt1kwZ0p
D2au1Cuu6iUw0VJ3Or+Rt82XQvE4QesxmlfYR4yCZHw5M4y7c1jFTJa1knNvBcXe
7C5xmIG/XjqV3yzZgvyosEC1UecbE4R1ibauAx8FDPVahRRYGgeoDArzc/+64OyD
XLbOiBKLJhbWo4M1CKMEuuVWA2FzKw==
=UJFU
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
