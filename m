Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F235E252B43
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 12:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C68E1715;
	Wed, 26 Aug 2020 12:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C68E1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598437144;
	bh=5tJW1RUehpS5WybOA0ZAprsp+YpJ4fCRYflUkMT9GYI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTpLkv2d2ROkIK/OeIFu5t7KfmgeuD6d36e3W6LrR4lSx0tuxRSiWRpX+W65UHtrW
	 milpIkX16vBHBv7/TsbsefzqoMDBdfMjLkWmNZn8UiiP8/Ek2kfCCLgPH8NCG4ST2c
	 1aKcvVaMEX/OW3nvNqB7J3j2FXBCDrV050/53VE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF53AF8016F;
	Wed, 26 Aug 2020 12:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38475F801D9; Wed, 26 Aug 2020 12:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C28B1F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 12:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28B1F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ggqjLcsW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEF1E20786;
 Wed, 26 Aug 2020 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598437033;
 bh=5tJW1RUehpS5WybOA0ZAprsp+YpJ4fCRYflUkMT9GYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggqjLcsW5r39HmxmZeRwkMMcMvMbzKBucECTKjbLUEN9lPyFhb6B1Wb/65ghmw0qo
 e1etyh5xkqZkG81NZsilBAgDxjMI+QBJIeT9f/qFH4PGjteBTD6/LK13ufuwQx+Kdj
 MajUluJpge6kI0aZyWFntKE2M0iUAamBbiDY3Oyo=
Date: Wed, 26 Aug 2020 11:16:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
Message-ID: <20200826101637.GC4965@sirena.org.uk>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline
In-Reply-To: <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
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


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 12:16:56PM -0500, Pierre-Louis Bossart wrote:

> One possible objection is that this code could have been handled with
> regmap-sdw.c. However this is a new spec addition not handled by every
> SoundWire 1.1 and non-SDCA device, so there's no reason to load code
> that will never be used.

> Also in practice it's extremely unlikely that CONFIG_REGMAP would not
> be selected with CONFIG_REGMAP_MBQ selected. However there's no
> functional dependency between the two modules so they can be selected
> separately.

The other thing I'm wondering here is about compatibility - is this
something we can enumerate at runtime and if so couldn't this be done
more like how we handle the various I2C and SMBus variants so the driver
just says it wants a SoundWire regmap and then based on the capabilities
of the device and the controller the regmap decides if it can use MBQ or
not on the current system?

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GNoQACgkQJNaLcl1U
h9CrSQf/WFN5slGq6hYdSlbxY9S5fg1zC1mvg9ty1w/5Mz/65Q//rzJpHBd+tYKc
HZLr2kEjM7nBO1Zm3fngADbUmKwlCRFnWwEuzcCibOQbgopTmhVg1MIQOcg32RcU
w2D7/0oZWoPul9tO3UR/cf3I5FgBkuRZfBayFeFb6FbwZVgb4F8BDA8Xobt215Zb
mRVFxChQ7/0IDT6ju1CqDEk6zr1h5zIhqgVXO8YOkvOXh6ObxL1jXvrSMtOVZ2Ki
Kqpf6i6sJxNwu7PF4f6EdhrDKQKLLncW/qrh6Phx383RkfHhdCqGwPAB4H8Vjb15
j70LoMEibs5FCPo/+fD8AGxDkrOU4Q==
=f/l0
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
