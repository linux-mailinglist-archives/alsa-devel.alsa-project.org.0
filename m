Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE830F35B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 13:46:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836F516DE;
	Thu,  4 Feb 2021 13:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836F516DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612442767;
	bh=lYGILFsu+f+q0RdjIDvSHd90eLEEs8nJarEafHO9Z00=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DKC1O789LAYAczpa4xP3ih71yc8vOhx9scsYDGnHNYIH9Zkf47KWf9cYC9nnq5qQZ
	 YIp6HS1+Fmr2mELDkjsIVOQuYxv5JkdnzYdxCC8v5fjgzxbrIUc3ykD6Yyzqc26ixt
	 EKJbQY3z2yxSe2SHeKmMFj5uDoDAtWnG7RgiH6kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC425F80152;
	Thu,  4 Feb 2021 13:44:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96725F80171; Thu,  4 Feb 2021 13:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B805F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 13:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B805F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XNWa0dN7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0E7064F53;
 Thu,  4 Feb 2021 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612442664;
 bh=lYGILFsu+f+q0RdjIDvSHd90eLEEs8nJarEafHO9Z00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNWa0dN7cb86kuJ+PnpetujDkEAl8u+r8uGe9eHcfmw4j0hK5Xxg79IICZVmaw6Gb
 FTG+uocXt43p5GCDOf8t9pJPrevTPrR7TuS35rCcDeRYs30DRGiUBc05CkigzO+5J3
 oevC0LKjGIWIiv1jAqln53fjZ83aHcN27FIQgBVzu/EJxFbxUsrd+NwjsLyj9qQrP7
 BmcnvTld49fTZ4HCkjrhKAlbS/E6nyKdNVtzjbxlKTrsy3+cueq6HaXjy/xYkIXEUj
 /9lGc7H8/vHlbjLB8xKDNNw4tbuG02gMk8PeZLRUQFZhnnJQDoSaVTvO0LEHxJobwp
 2Oz2tpRhci3zw==
Date: Thu, 4 Feb 2021 12:43:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204124335.GA4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 12:07:49PM +0100, Hans de Goede wrote:
> On 2/4/21 11:57 AM, Lee Jones wrote:
> > On Thu, 04 Feb 2021, Hans de Goede wrote:

> >> series are both ready for merging. All patches have Reviewed-by and/or
> >> Acked-by tags now.

> > I don't think they do.  You're missing ASoC and Extcon Acks.

> Right, what I meant is that the patches have been reviewed by other
> stake-holders, including the follow-up series being tested by the cirrus
> codec folks (thank you Charles).

> But yes the actual subsys maintainers have not acked these yet;
> and I'm aware that you will need those for merging this through
> the MFD tree.

The usual pattern here is that the MFD patches get merged and then I
pull a shared branch in for any dependencies - at this point the series
is now on the backlog of serieses where I'm waiting for the MFD to sort
itself out before I really look at it again.

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAb6/YACgkQJNaLcl1U
h9D8Lgf+Pi3CfEF5amMyjiN4ouAm/0226P7cog22WyeZblm7uzHaMac+47A3uf1q
O3o5u6qf6R0Y+MK9KwwJPtcjjZUH9sRFAs8bP/h72z3R7bKZ8cxqeyMYf2EYaBat
ekm/tx3vOH5YuCgTwQ0zNoWQ6ruHL9PecqdOcFSzIl+rMysbEFfVpXW20AJPv2P4
WhnRrCVjB8zHnzjL2Yc/yuLnjz/Hd04bhf7qkd2Zp/VwxYhA6Gah3PMZVWoHWvKD
ob0TgT7NiI6Cj8p0AQM8QlzzSa9nUdWa7RUalfe20dd5qEB5bB/vbb37wgwWsgVm
fx+XBsqFLELGnM7ISxgqtjCTxpN8zw==
=7WEp
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
