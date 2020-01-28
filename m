Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07314BCD0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 16:27:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5FC1674;
	Tue, 28 Jan 2020 16:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5FC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580225277;
	bh=kvF7D1f9F2oPK1+e2+IWViSudWuKZeE09urBLxszWmk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jX3pxMUhlOWuUJXqyzwlQfBCeD+e12lmTXaDwmb8a9Qd3YwJMuCFRytUk04uGSJ/V
	 yPtSDJxf09Nt5Ss9nyhPfW1P7Sy6LIXuSYRVGGj1kThzK+yrSR/2tjDhJ4Em6se10j
	 CBj8+l8F4k7+2Gj1tjvYUAv7Od6nlxHIhsO21fXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A90AF800FF;
	Tue, 28 Jan 2020 16:26:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62AFF801F7; Tue, 28 Jan 2020 16:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODYSUB_1, PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CFCDEF80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 16:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCDEF80123
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A370531B;
 Tue, 28 Jan 2020 07:26:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22D7C3F68E;
 Tue, 28 Jan 2020 07:26:33 -0800 (PST)
Date: Tue, 28 Jan 2020 15:26:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20200128152632.GF4689@sirena.org.uk>
References: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
X-Cookie: Doing gets it done.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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
Content-Type: multipart/mixed; boundary="===============7767548676949520402=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7767548676949520402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 01:19:17PM +0000, Jon Hunter wrote:
> On 28/01/2020 08:59, Ben Dooks wrote:
> > On 27/01/2020 19:23, Dmitry Osipenko wrote:
> >> 27.01.2020 22:20, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>
> >>>> On 23/01/2020 19:38, Ben Dooks wrote:
> >>>>> On 07/01/2020 01:39, Dmitry Osipenko wrote:
> >>>>>> 06.01.2020 22:00, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>> On 05/01/2020 10:53, Ben Dooks wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> >> I also suspect that s32 may need some extra patches and thus could be
> >> worthwhile to stop advertising it as well.

> > As far as I am aware that works and we can hit the audio rates for it.

> I ran a test on Tegra124 Jetson-TK1 and 24-bit playback seems to work as
> Ben has indicated. So I don't think it is broken.

> Can you try Ben's testcase on Tegra30 (ie. generate a tone using sox and
> use aplay to play)?

Another test application that's quite useful for this sort of stuff is
speaker-test, it generates audio data directly in arbatrary formats and
it's part of alsa-utils so if you've got aplay and friends you may
already have it already installed.

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4wUqcACgkQJNaLcl1U
h9B6zwf/bk3qZHsSK2RLEgZKCG2/3BpReS1NgtJgzDzuTw0u3kGyEKE9Q0j3VCfH
B9C4tiFnJuE2wA8p/AvUQJgN3QfJ0HRkNSJJ2hmYYVoIb8TfSSo/YGOjw/heTKNH
ZS+BixlzZq9j8NueNO/IvR5iC6l1llkzVk/qWmVKL5nJ2KQXbQ8vc4PA/8kZONgj
ANqDiMzgz/Blsh6HS0sZG9eq2i631rqNdtHUo53ik2KpAF860XiUWtWirTqwpBZ3
ID1PjemWQ1qcivZql2rhDT2ZiQ7gcqSk/oZT+dZnhwUIDXRYtrv52tp0gLRcME2w
ljW6U5CNV6GT5egrDAU5mKLeG0J8lg==
=sDvO
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--

--===============7767548676949520402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7767548676949520402==--
