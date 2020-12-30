Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B022E79BB
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 14:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2651843;
	Wed, 30 Dec 2020 14:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2651843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609335610;
	bh=UhBLZgCv7mN/iqwzx3ww+VJRza+85Eznm3Wt4zyJh8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avfDriUlbnvkzEv4X5l9vCmkAVlBMOg0xUQh2GH2kRqXlFVfnvUaBz3kxhea9PEk4
	 z7OenwPs6jqWkLmLJR2LtdeFLaimyTxoANxJxkeCnCnoP4kkj8WdERiHpgUDgK8zZC
	 tka++BEzHC8FtfDa/KruQZkp8oNKg5K0KdjT2uuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0255FF80141;
	Wed, 30 Dec 2020 14:38:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63D92F801F5; Wed, 30 Dec 2020 14:38:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48CA9F80132
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 14:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48CA9F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q6Lrdv6h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C74B206A5;
 Wed, 30 Dec 2020 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609335505;
 bh=UhBLZgCv7mN/iqwzx3ww+VJRza+85Eznm3Wt4zyJh8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6Lrdv6hskLKz83zqSey1QQir6lMnlJHTbjT6oewDWiAV0l3vD1yxe7icuEi+YPHa
 PwDq0WcpAOM8ecRzuplBpsJp3HVLwWBwIAQmwz5J5g79hY2vBfK1m3nL16a10VM9wS
 rMUppXa0YTgYgLZj4BbtF5Hw9dWvIFx9iPiSj+m3cRTHl+Qax7Xy4hbD1bjveYheVs
 a+ElD5AQa2qmIcCiOZFFD2eK/Xf1lq1JPmfifdXPaJCs+vfKGMddX2odab0wQwdcy5
 oJyuf3U79jEd3np2MjJ3wdF6uhPcTKB9j0+enlbVwl1fwhN9VZxNEFaj/LA0A43LOG
 wMgdXJlTkKnXQ==
Date: Wed, 30 Dec 2020 13:38:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201230133803.GC4428@sirena.org.uk>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150807.GF4786@sirena.org.uk>
 <07037a8a-1d35-362e-1b82-b73b81f7c6ac@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <07037a8a-1d35-362e-1b82-b73b81f7c6ac@redhat.com>
X-Cookie: Above all things, reverence yourself.
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


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 29, 2020 at 04:33:09PM +0100, Hans de Goede wrote:
> On 12/29/20 4:08 PM, Mark Brown wrote:

> > No, that's not the case.  extcon is a port of an Android custom API that
> > looks very similar to what ended up in mainline, it was also a
> > combination of sysfs and uevents but a bit less generic.  It mainly
> > existed to provide information to userspace about what was plugged into
> > the various ports on devices, things like headphone jacks and the
> > pre-USB C multifunction connectors you used to get on phones.

> Interesting, I have close to 0 experience with Android userspace
> (something which I would like to change one of these days). But I have
> encountered a bunch of in-kernel use of extcon on Intel's Android X86
> port for Bay and Cherry Trail devices (which I've ported to the mainline)
> where extcon was e.g. used with a generic extcon-gpio like driver monitoring
> the ID pin and then used by the USB code to detect (through monitoring the
> extcon) if the USB port was in host or device/gadget mode.

> So it seems that extcon has many different uses by different people...

It was extended as part of getting it merged into mainline, there was
some thought about what people could need to do with jacks at the time.

> > The whole purpose of creating sound/core/jack.c is to abstract away the
> > userspace interfaces from the drivers, most audio devices shouldn't be
> > working with extcon directly just as they shouldn't be creating input
> > devices or ALSA controls directly.  The missing bit there is to add
> > extcon into jack.c.

> So what you are suggesting is making sound/core/jack.c register the
> extcon device and then have arizona-extcon.c talk to sound/core/jack.c
> and no longer do any extcon stuff itself.

Yes.

> So we already export 2 userspace-APIs for this IMHO adding a 3th one is not
> really a good idea unless it offers significant benifits which I don't
> really see. The input_dev API is simple enough to use that extcon does
> not really offer any significant benefits.

Quite apart from anything else the reason the switch API was created was
AIUI that the Android people couldn't figure out how to do jack
detection on Linux - the current APIs are not terribly discoverable.
There's also issues with extensibility and applicability to non-audio
use csaes with the existing APIs.

> My current solution to have the machine-driver register a jack and
> then share that with the extcon-arizona.c code still seems like the
> best/simplest solution to me here.

Bodging it at the driver level gets in the way of improving the generic
code.

> Unless we go with your plan to make sound/core/jack.c export
> an extcon device for all sound-devs registering a jack, and then move
> extcon-arizona.c over to using sound/core/jack.c without it doing any
> extcon stuff itself. But as discussed I'm really not a fan of exporting
> a 3th uAPI for jack-detection for all sound-cards with jack-detect
> capability.

That *is* the plan, though clearly it's not exactly been backed by work.
extcon already exists and supports reporting jacks.

> > I do think pushing things over to extcon is a useful goal, the existing
> > interfaces have fairly clear issues that it does actually address.

> I don't really see any "fairly clear issues" with the input-device uAPI,
> I agree that the ALSA controls can be hard to use, but that is not the
> case for the input-device uAPI (*). What are your objections against using
> the input-device uAPI ?

Like I say it's discoverabiity and extensibility in a range of axes.
Other examples of thing that'd be good to have that we don't really have
with the input API are things like saying things like "the red jack on
the front panel".

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/sgroACgkQJNaLcl1U
h9CMlgf/SjdInnQRauNcJW8jl/PnrIjRn+DFyB3a6HsFOzAzc2NJY7WK66gaLKD0
f+hya/I42j27ZqUiZU8JxRM7GO1tTSoLTAYNNvSavG4yac1CcqNmGcFRc1Wbu5xR
+PeTo/90KPTYL7ZRgX9w/ly0brbGTkQhSRhYPrU7wKitPQUylvTkglIYYjKDurys
rLmZOGlRMmMvwCqSmpqn7x147t9ic17lFlutmPRqIklmEPJb8nqBiNfWCgQQfKQ/
yTm/uZvAFTDwnsA5Minuzq5bHBr9WNOLxGgWz7qhZIOS2LVEn0wwICDSJrbwkCio
qvIkPSHs2rRitl+GKjHJ+I/fdS2ljw==
=awoV
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
