Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD893FF023
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 17:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285881746;
	Thu,  2 Sep 2021 17:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285881746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630596375;
	bh=5xHwpTyrJz/V1ecWOpG2oVcDhIQ65r7ovJhDHEp+hFg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=se5K9WRSmv8zOiSB5VvL8lOWlOtvpuPt14wb3YwlIAliXLZA6+dGteAUPZwnrz1oY
	 IxpH3N85oxEiQMQm/0vHbkbfKkRcG10kQ+OJzHD44Aa8DV4ytR96umRbB9bOPfJGlt
	 SYHE/ep9VRHtnlP3LYk0gSQygl35HjcIIClzHVjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75AACF804B3;
	Thu,  2 Sep 2021 17:24:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B11C1F80290; Thu,  2 Sep 2021 17:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F4F5F800AF
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 17:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F4F5F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FUqArlOm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3187360F4B;
 Thu,  2 Sep 2021 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630596284;
 bh=5xHwpTyrJz/V1ecWOpG2oVcDhIQ65r7ovJhDHEp+hFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUqArlOmcFL226oWhkLx8xHTMVV1zWf5cDzsmYYuqROLrebShV/2ogjHbCLfVspMd
 pTzMmBb2rQMwx6StXCtSmKXbyixRiEl3izZ+FVeKV5p7cjGUDIgQIYD+lmFuXvuW8R
 p4XSGqm/ONRbDGtZ6gZZnwsg6Nqu+H8+ywij6bYUA00H+mThqKlHKoFysbB+AVZdVN
 2cb0/jKB3ZhvxffGmQOp6E1B4shOEfZUTJSLwhbi4ch7h+Ct/b/mB4Hwn0UvbFn6IH
 Vy0+yavTirOEweqG1Qkkb4aM/0r6W/O+u+X1nBMk1QE1WOXlc7NVcHwZLS22H39QNg
 edCe0fRUj0iXw==
Date: Thu, 2 Sep 2021 16:24:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: boards: Fix CONFIG_SND_SOC_SDW_MOCKUP
 select
Message-ID: <20210902152412.GF11164@sirena.org.uk>
References: <20210802190351.3201677-1-nathan@kernel.org>
 <20210802212409.3207648-1-nathan@kernel.org>
 <da246896-fbd3-be8d-355f-3c0a83e7d4eb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <da246896-fbd3-be8d-355f-3c0a83e7d4eb@linux.intel.com>
X-Cookie: Famous last words:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
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


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 02, 2021 at 10:02:18AM -0500, Pierre-Louis Bossart wrote:
> On 8/2/21 4:24 PM, Nathan Chancellor wrote:
> > When CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH is enabled without
> > CONFIG_EXPERT, there is a Kconfig warning about unmet dependencies:

> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>

> This patch was missed, maybe because I didn't provide a formal ack on my
> own suggestion, so here goes:

> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

It looks like this was sent in reply to an old thread so got deleted
along with the old thread.  In any case I don't have it any more...

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEw7JsACgkQJNaLcl1U
h9C2Kwf/VIq50TNTUN4NObepN1GojSmpDkg+Cd9qAYJ9R9hHuZ0m5S8MJQsnv0ws
Jct981brHL3nh6HjM2oG6/t7oLaRvuc5TQCrH5rQKQcIooXJJ8f86WmjZreJp3SR
ZLdchWIHuF1a5dwx+gKWXTpxVBAC7vaiBxGGQJwLjoOlhFBvkkCMi67SgWvnddk6
ouM+jUhfmNU+L1yL2KsgCUpa1yzRuMqoCEklFgtTGvLqtkwU/q+SckMR09X3PlvM
twzFq/8xEvsVnzzA9uhxlcXSdez1mP8HgmJwdhCpRkwsjr8Hgof0NAmRgt4uxfSi
D5NBEI/o+aB/HoyctOXVmPRSHBd4Cw==
=vJrj
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
