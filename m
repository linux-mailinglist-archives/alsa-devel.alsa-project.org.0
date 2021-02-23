Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C10D323125
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 20:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B2F1684;
	Tue, 23 Feb 2021 20:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B2F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614107201;
	bh=YdKDpv5otmfNga4OxvhkU5/c1NPbxlVwlJ2ZLTpjUB8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRD5OIigk5lAXUZkX9ITEyNkw/bDRF79P8W5ql6rceIwWNotC9pSBQplTVC5EkIiX
	 DuG3DWkv8kOq69/4+Z0RNrsCgmxxf4mWbHpD4h2FnMsYLE4Jt/7UV6GZcaQB9pdn0U
	 HIx9JfF8eYA2RNI6EDN7kOBGD1f4NAwthcsm3IAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A357F80169;
	Tue, 23 Feb 2021 20:05:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD524F8016A; Tue, 23 Feb 2021 20:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F2D6F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 20:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F2D6F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMLr62LK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 786F864E31;
 Tue, 23 Feb 2021 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614107142;
 bh=YdKDpv5otmfNga4OxvhkU5/c1NPbxlVwlJ2ZLTpjUB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMLr62LKO4GFD5ZcPOMm0T0P8W72kEDd9kZZCvxuT1yaIeTb3SDyw8Eb0d47I7Pk2
 OSPKjJP9ShQMU8fkgHf+9VG+m1m7ImWt71/vxichDOTIRxf2fKbacr1s+eKucadvyJ
 ChgzlH415BCyqno9pELx+2wl/NmxJh6vWxl2JIV8X265koEVKIPWUfFcttEozJXL6x
 2IVJFWCXh7phqC0qv22w7a5otxq8ksQgpalkCBz8IitPe2m9iiBQYs1iZ+Vrf2p+mt
 rRdX6S2aa6jVY78R+nUFqIxBoXsxQoHa+GRjMs0LGQco/7dH/nyvVVEmkIB5KrBzBg
 ky+DM2COHQxLQ==
Date: Tue, 23 Feb 2021 19:04:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Subject: Re: [PATCH] ASoC: rt5682: remove jack detect delay
Message-ID: <20210223190439.GL5116@sirena.org.uk>
References: <20210217214914.700751-1-cujomalainey@chromium.org>
 <5b90530b77744937b87bbbd35901e320@realtek.com>
 <s5hr1ld22a9.wl-tiwai@suse.de>
 <CAOReqxibmAQNQe8PuHkUSW5Kb2L986X9DDqia-aN=ZrS8VJysA@mail.gmail.com>
 <20210222134551.GC6127@sirena.org.uk>
 <CAOReqxhRi9n-vxayVDNp-9R65s79OAqX8=YweCddFHTDJbbjGw@mail.gmail.com>
 <20210223124230.GA5116@sirena.org.uk>
 <CAOReqxjhWD5V7UtH5-fYpiK-h5cF7fC2WqmtnYz1qdn3yt7+LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bX/mw5riLlTkt+Gv"
Content-Disposition: inline
In-Reply-To: <CAOReqxjhWD5V7UtH5-fYpiK-h5cF7fC2WqmtnYz1qdn3yt7+LQ@mail.gmail.com>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--bX/mw5riLlTkt+Gv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2021 at 10:50:18AM -0800, Curtis Malainey wrote:

> > Are you sure that *zero* debounce is needed for the button presses?
> > 250ms does look like a lot of time but zero might be going from one
> > extreme to the other.

> Fair point, I was looking at some other codecs and why they respond so
> quickly, it appears they have no fixed delay and just call schedule
> work. That being said, I can easily double tap <100ms. So Ideally i
> would like to keep this on the order of ~50ms at most. I am guessing
> Realtek will want to keep the 250ms for jack detect still.

Those feel like plausible numbers to me assuming there's no hardware
debounce.

> Would queueing two separate jobs with two different delays be the
> simple way to go? Realtek does this sound fine to you?

Possibly just queuing the same job with different timeouts?  I don't
have particularly strong feelings assuming the resulting code make
sense.

--bX/mw5riLlTkt+Gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1UccACgkQJNaLcl1U
h9CytwgAg4UYOjRnxPahCdO4psMGJn1niME/ODAEyMZCB4RgqRrm0PbwWty1wbv5
7sc5N+RYdA/awxJsa6vfE1qV5FXVwxIMLm/QRM5YlLQa+tekKUXCdi3qFZ321hVF
J/PwaItgNgnMSBGG78g1YlYZsLIzPPmtBihHhOWt0/ZZVF3uSzQVIWBGaNBvTRGf
hHoUjYTpXiKekqwvk76wdNTiTZG5c0VNATjWM2TnK1wmc+VLDWkB5i4LYqnPKfHy
VtXVPzdjayxm+4yF+aM9qrM1Pw001k7Ub6y0t/NQI1hxB85cDqV0GzSRgQl1KWMW
E16Octt1z+COhdDNA4cS1eEqXoZ0uw==
=EZ1y
-----END PGP SIGNATURE-----

--bX/mw5riLlTkt+Gv--
