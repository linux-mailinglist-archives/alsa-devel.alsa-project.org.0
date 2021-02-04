Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC330F490
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 15:06:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F371701;
	Thu,  4 Feb 2021 15:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F371701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612447597;
	bh=T9Wjfp0nkMYzfgwxsEYPdGsTSxUKhcebtGuX0N3yML8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNm7hiVqMjqJZc2pOFfYhNBNsET25oRrn6CnPMSbiGI7S5w+WxH/rmCiMT6I9Jiy8
	 L8aL3ohnYZ23Cu5TxyPiExUfFEvL5ofrRZVarvHjJVLHPi3ID45JZ/IFiTSIGiI9qq
	 Qq5G6SG+xqZT/EFUJXsysGyfgImEU4SkybKyOaOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84D47F80155;
	Thu,  4 Feb 2021 15:05:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC2FF80155; Thu,  4 Feb 2021 15:05:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96226F80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 15:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96226F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O0l7NrF+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8353864E41;
 Thu,  4 Feb 2021 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612447499;
 bh=T9Wjfp0nkMYzfgwxsEYPdGsTSxUKhcebtGuX0N3yML8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0l7NrF+NqT/pgu8V6fdXC7kjVgYP/AzQIwHu7Yvp8lsRLuXP0wYVb7G+5KzNlQpp
 ncIZMZknnuuxfr/OU3JhK1s+itMDr05kVTWIqnE0EH5oC2IoxU+MI9xaITeIjBIgLD
 tFTIpMgtP2CyHg/M4M2DLWxAzp3EEnWDGJVpSnMdTLVcKxpNU6F4mn3iUgxYDgi4/K
 MQ490+ojomi0F2wOk75rTy18vQEx9HSQ62lV762/GNhDBC8/sCWmily1vjmXo7Yt3t
 OimwgMYaroduyjOBlYYAbS8VL9ml/5YqVcG34qFPaVTDcmvagmuZUa/fFrEmzBHSFW
 W57uM5kNJC77Q==
Date: Thu, 4 Feb 2021 14:04:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204140410.GB4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
 <20210204124335.GA4288@sirena.org.uk>
 <e646cd26-f61c-8414-c3ae-15fb5d5cc21d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <e646cd26-f61c-8414-c3ae-15fb5d5cc21d@redhat.com>
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 02:18:54PM +0100, Hans de Goede wrote:
> On 2/4/21 1:43 PM, Mark Brown wrote:

> > The usual pattern here is that the MFD patches get merged and then I
> > pull a shared branch in for any dependencies - at this point the series
> > is now on the backlog of serieses where I'm waiting for the MFD to sort
> > itself out before I really look at it again.

> I understand. But this series is somewhat special, if you also take
> the follow-up series into account:

> "[PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect support"

> That again has some MFD bits, and some extcon patches and ASoC patches
> which depend on the extcon bits and this series.

That series is drifting along in the same way AFAICT, and it's also got
the extcon dependency so it'll need to leave it a bit longer for extcon
review (unless some happens sooner).

> So it is really hard to merge all the bits through there separate trees
> and just merging it all through one tree and then pulling in the end-result
> as a shared branch would IMHO be easier.

Most of this for me is just about not wanting to have to repeatedly look
at the same series as it goes through small changes due to changes in
the dependencies.

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAb/tkACgkQJNaLcl1U
h9AbXQf+IJXwgL9aqdbY7YPKi9HW6BlM45qGQPYXshOPD3G4m5KThMbpwP9+xGth
PotG/vJy6aMyrfA19UQeZkmgIuOCOiqEfpaZZIn0EgAxkNq67io33zYcn2gf8kdl
niWKxu9rjM16bvt54XYL+qYkZcKr79UBfJ3a+hKIg11KGIHtCjYfqXnLrkc8I7sN
bKT33ehRSjUvEvWlIMPKJRaaMFiX+eZ4D2I73/BRH4bL6RwuiDnbUmAJI5V+1CQ3
p6C31kc3mUiP/bwGUT0SVltxqHSSB9LzeeQZUIuu9NvyPof7C2RuSzXUrmFC2JD3
7VbIH/BjxYNzvIAB+LL16h+2JVNTbA==
=/cMg
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
