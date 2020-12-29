Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F345E2E719A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 16:10:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D14917FA;
	Tue, 29 Dec 2020 16:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D14917FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609254616;
	bh=qBCnqgfbAFbo0kfsHjsHUPPZWLpRyZyx+XwoPwWNgmU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/ztSIfJxK5SNW/KNyOcrlu/B+xENjfjXQmA6MO3C/rMlf6Hi+3coO146VnDUNqCi
	 I4GGQJBv0NQq3c0JnBm09y9+2+VTwdlEOly2DVBheSf90RlZFDSBcCpJJKCbiIvVnk
	 TYfkV7vsD1ilGx1niqOickgRoKCMPDGsojWrks6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5F4F8022D;
	Tue, 29 Dec 2020 16:08:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B8EF8022D; Tue, 29 Dec 2020 16:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C54AF80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 16:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C54AF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QvzDHuW9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7C8220867;
 Tue, 29 Dec 2020 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609254508;
 bh=qBCnqgfbAFbo0kfsHjsHUPPZWLpRyZyx+XwoPwWNgmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvzDHuW9IuIgIeEwaiaof2VigNtCnTzkIJbZrbKGg6WPE7hrH6VB8wl4mN2o2t6PC
 bZ/yyaGtnSPDomerH/RjgI0yZgX9A/qWWCzx2Zxo1dRyy/WPf7fG8xszjq3ZTsGVMs
 VUBj+akEmSAng7zQVRMpsPl3wbNTIO9dMEcKhWhQsFiLbnObWWndrTLpF9feljcDgt
 8K7Si1bwyTfP12tLPTkpGOkXZnLprcM/fhdSYr7XI2Hd+gX5TLYO5j/laigMOAamjO
 2qR5d14xYm8suTrV/tY8EyvpxE+ImskNBPmBaqPP0FJCkBGMEh+m+5Bv0ApGHsqgAB
 XiwbE4Q/8MjjQ==
Date: Tue, 29 Dec 2020 15:08:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201229150807.GF4786@sirena.org.uk>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ls2Gy6y7jbHLe9Od"
Content-Disposition: inline
In-Reply-To: <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
X-Cookie: Mother Earth is not flat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
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


--Ls2Gy6y7jbHLe9Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 29, 2020 at 02:57:38PM +0100, Hans de Goede wrote:
> On 12/29/20 2:06 PM, Charles Keepax wrote:

> > I would agree with Mark though that if extcon exists for external
> > connectors it seems odd that audio jacks would have their own
> > special way rather than just using the connector stuff.

> Well as I said above in me experience the extcon code is (was) mostly
> meant for kernel internal use. The sysfs API is more of a debugging
> tool then anything else (IMHO).

No, that's not the case.  extcon is a port of an Android custom API that
looks very similar to what ended up in mainline, it was also a
combination of sysfs and uevents but a bit less generic.  It mainly
existed to provide information to userspace about what was plugged into
the various ports on devices, things like headphone jacks and the
pre-USB C multifunction connectors you used to get on phones.  In kernel
use wasn't really a thing for that as far as I can remember.  It's
become a bit less of a pressing concern for Android with the move to USB
C and the deprecation of headphone jacks in favour of a combination of
USB C and Bluetooth but the use case is still there and it's clear that
none of the audio stuff is currently exactly designed.

The issues I'm seeing are more to do with nobody working on things, I
guess mainly due to the change in priorities for Android systems and in
my case a job change.

> Also the kernel has support for a lot of sound devices, including
> many with jack-detection support. Yet a grep for EXTCON_JACK_HEADPHONE
> over the entire mainline kernel tree shows that only extcon-arizona.c
> is using it. So given that we have dozens of drivers providing jack
> functionality through the sound/core/jack.c core and only 1 driver
> using the extcon interface I believe that the ship on how to export
> this to userspace has long sailed, since most userspace code will
> clearly expect the sound/core/jack.c way of doing things to be used.

The whole purpose of creating sound/core/jack.c is to abstract away the
userspace interfaces from the drivers, most audio devices shouldn't be
working with extcon directly just as they shouldn't be creating input
devices or ALSA controls directly.  The missing bit there is to add
extcon into jack.c.

BTW note that the existing arizona extcon driver does provide an input
device so I'm guesing that whatever userspace you're concerned about is
one that uses only the ALSA controls for jack detection.

> Arguably we should/could maybe even drop the extcon part of extcon-arizona.c
> but I did not do that as I did not want to regress existing userspace
> code which may depend on this (on specific embedded/android devices).

I do think pushing things over to extcon is a useful goal, the existing
interfaces have fairly clear issues that it does actually address.

--Ls2Gy6y7jbHLe9Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/rRlYACgkQJNaLcl1U
h9CmrQf+KczNR72kmDzv/wsP0MtRJXjVpI1zsAU2XWl2wd1p/NkAjS7wWDsM+WyQ
LXSssRyt6Z5g+mVUOZLu+W/LwNGa2sCxaP4NE5XNdohTwV43YaFCtojA1O5IvooZ
dPJ9y0qm5aeVrVc30SXiPO4EgUCGHvaEUQ8NoamvsAjio56fQhuOVd934ga0L9ln
gVmwilPmxH5MvSyVkNtHXC1ycHJB5Wc6h2Hnk69MKa55aknl11CiMYFzgSxGik23
PLgecOQ1LTtJmJ5Jmy15ZFLM5B1qqhv3uwRE2l6hPzl7+YgGGZ50yEu6cH3bTIIn
NearEyg9UT1lu8vV7OqvdqB+z1tpgw==
=SJ5p
-----END PGP SIGNATURE-----

--Ls2Gy6y7jbHLe9Od--
