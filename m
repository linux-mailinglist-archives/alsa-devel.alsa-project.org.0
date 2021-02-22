Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4E321906
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 14:38:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC911675;
	Mon, 22 Feb 2021 14:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC911675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614001105;
	bh=+O27eJDZwjcVdJwa5wWcdOfD0/quVptVXSXmwSEWZ+Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=blMTzvB6vF3AYk0ptLNhiYzjdCqSnUA2wuIUXz85+mfxoxJlYhrCeUTBdytZAfPud
	 m/W9XJZ3UEM5olT2aPJArp3QjTqhEUNQ7FyM4Ey677ZCl07wq+L5jodnd31JKh1vsw
	 n/TRiT4KSIAmQ/KP+TpzujaM4igHOzML1sOebeO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B38F8026F;
	Mon, 22 Feb 2021 14:36:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21014F8025E; Mon, 22 Feb 2021 14:36:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0AFF80129
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 14:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E0AFF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gqF5xZWn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8F2164E44;
 Mon, 22 Feb 2021 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614001006;
 bh=+O27eJDZwjcVdJwa5wWcdOfD0/quVptVXSXmwSEWZ+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gqF5xZWniGaLaPBAtjq+fZJpX1To+HK1o4DqoAcU2CDoVv951eS/3BDrbrS6kfflO
 yCLscR6k3ar1g283eQ2gCIVzRwN6xKBRXxvkfihfJ1RPQozVZ3yBOpeqP43aZQzeXQ
 qY/trWfOU86LAzGScOjmC2cOGmPXFKQDTz4TDaoOXBnvzH+NwbWBh0INKDtkODN/tx
 pWqfbmMhlXhDwWCgfVlDBv8LGC4U9/G28WVOuaMaLG0Pj5on7JhErdSlZY+2WnrK7a
 sttWcRMa9UcwPumtJSBGVzbslHYWCYMqqa2+AYOvHSCr8KTCcNnun1fGQin5PRLceu
 6mUL5VxaXt5NA==
Date: Mon, 22 Feb 2021 13:35:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Message-ID: <20210222133544.GA6127@sirena.org.uk>
References: <20210218091208.28734-1-shumingf@realtek.com>
 <350ee43a-af99-bb8e-60d3-2a0dc561cb45@perex.cz>
 <84ce7570-b5c7-d89d-7d65-a391c3b65f93@linux.intel.com>
 <37e136a7-01de-412a-6527-e3b6b6038de1@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <37e136a7-01de-412a-6527-e3b6b6038de1@perex.cz>
X-Cookie: A motion to adjourn is always in order.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, derek.fang@realtek.com, bard.liao@intel.com,
 shumingf@realtek.com, flove@realtek.com, pierre-louis.bossart@intel.com
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


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 06:55:06PM +0100, Jaroslav Kysela wrote:

> The problem with ASoC tree is that many of those controls are not suppose=
d to
> be configured/used by the end user, but in UCM or other higher level layer
> configuration, because they're a part of the hw/driver setup.

> I think that we should classify those controls so the standard user space
> tools can hide them, but it's another problem.

Well, as has been discussed in the past ideally ALSA would have a
mechanism for exposing topology information and userspace would have
some chance of picking which controls make sense for use on non-trivial
hardware.  The particular set of controls that it makes sense to adjust
=66rom userspace is going to vary depending on the use case, it's not
something that can be decided in the kernel.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAzszAACgkQJNaLcl1U
h9AMBQf/WGPjzaxsZPvEn8GqencTawGQftyWnpeIfFSJRVlBWily6X7w+ilVTJRR
5R3Q9V9KbfuVNB/sN20bY2rMIG8hLm/MdGuCqwT9B6u5X1oz10j1R4OTyJw90dCS
rlOyMPRYoSG85Ls0oreV5y4FhYLyxDrt4DIU7dmZ52v5DHR94xdUc1pcpG7p3+Ky
NJpdv+yh/uY6nHwpmPKt1rNq/lrxj2iA/mszphFhcJgE/hKYNtNfx8rtv0Brvd/H
1EComI/LyN31ihx4FgAl8BLc5sQoqrbHYxGFJUAMlUEe6BVRJDT91CQplWf5ZBOG
+0ADWyYANxHqykhPDgAmIT5HUlIhiw==
=7a0q
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
