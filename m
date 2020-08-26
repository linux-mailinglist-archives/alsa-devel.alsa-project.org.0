Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E3252B34
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 12:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8931735;
	Wed, 26 Aug 2020 12:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8931735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598436928;
	bh=7Yiotm++5mcylAUoQcmaIcIXDKlEaC2FfSyZhGHmL0Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TijVmYIbGFt1cDa/0iQp8ARU3gjOfDVjb/jFbgFWDdfO3PgtjwuK5WdNhbFEgwgcL
	 wdeR9eI26i/fxltRjo30lAXNyLNbs/ImPKV49b1b07dPIWsvxhu3PnTZGVTW5acYgL
	 kqCkBER+tQtxY/3Zrfk15NRYyL2Y3If2zPE/ih1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52578F801EC;
	Wed, 26 Aug 2020 12:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A482F801D9; Wed, 26 Aug 2020 12:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57085F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 12:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57085F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ldry5al5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ACD820786;
 Wed, 26 Aug 2020 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598436818;
 bh=7Yiotm++5mcylAUoQcmaIcIXDKlEaC2FfSyZhGHmL0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldry5al5hlgsrc2QLoUyvMu6PHQOSY4Lu+MZ+CvEQfmvK5Z+XlP02cbj4UdBANcs9
 6sPWgAHijrQ2R6p3c3Q46krm/AvaxEgr0uQqe6mqLyFJdyrXL9+lc7hC9SVb588T4L
 sqQkrkqyqGgzbpWgueQ7rpz0Q+FSACjcwxPapUgc=
Date: Wed, 26 Aug 2020 11:13:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] regmap: sdw: move to -EOPNOTSUPP
Message-ID: <20200826101301.GB4965@sirena.org.uk>
References: <20200825171656.75836-2-pierre-louis.bossart@linux.intel.com>
 <20200825214858.GK5379@sirena.org.uk>
 <6f7e5830-4dd8-1ecc-20c3-df75bc9ef265@linux.intel.com>
 <20200826095600.GA4965@sirena.org.uk>
 <s5ha6yhu3af.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline
In-Reply-To: <s5ha6yhu3af.wl-tiwai@suse.de>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 vkoul@kernel.org, srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
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


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 12:09:28PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > checkpatch is broken.

> Heh, I'm not objecting it :)

> OTOH, it's also true that ENOTSUPP is no good error code if returned
> to user-space.  Unfortunately many codes (including what I wrote) use
> this code mistakenly, and they can't be changed any longer...

It's also used internally in various places without being returned to
userspace, that's what's going on here - the regmap core has some
specific checks for -ENOTSUPP.

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GNa0ACgkQJNaLcl1U
h9AJeAf/WqsXkrP/82iF/TgEzGg4DDimkCFgDUemLmTimuMP5/11b0qeDKqL7PGl
RACeGo++H3Xr5TS2lKjFInP+zG4aCdpyLg9nxm/TnxMDCJOidLvvvsYO4AdXLNIL
BwOSBWU3o8jXAepH7w9tQ9Nqq28sJPrUrhrju+R7z7eNtmoTksiQwanXiQ9b21Gh
j4Jc3KRhKf4brtnajauLYqNx2spZEFLJ14PJnDTG3vXm8qOtxfqCM8ei+Rd5atAw
N64TV6U6mAQoFJsP4/d+GR7/90opkVVRTZVtSK+bHrH7p6iHPhliPpaPw7PMZnC7
BiZ0HypuoqdvZeQ/0f1cVjuiiGCaww==
=vOnh
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
