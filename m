Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E356527D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 12:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124AE16FA;
	Mon,  4 Jul 2022 12:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124AE16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656931085;
	bh=Qq1JrTSyeyHN7jB4kr9gC8LUi3N7kme7MIzEtdrfGOc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdLdbPhJPFzdFoMwCXiS/5fCfrvUXQteJ/L1wJIoXH2ldobOXoz1yfHt8ZnEH5/ek
	 KRfOx+tJzptIlOhhfASr174z1FJ2m1vrOrbWd56HAGj4LQdXQQjLifXZ0PnkpSoFEZ
	 TEputzIZQFwmHTN2wDi4xNpdlPNkdpHzFVjW2Dq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFA9F800ED;
	Mon,  4 Jul 2022 12:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2F1F8014E; Mon,  4 Jul 2022 12:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C805F800ED
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 12:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C805F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k9EO4dsX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 659B8B80E58;
 Mon,  4 Jul 2022 10:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DA5C341CA;
 Mon,  4 Jul 2022 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656931015;
 bh=Qq1JrTSyeyHN7jB4kr9gC8LUi3N7kme7MIzEtdrfGOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k9EO4dsX7kHM5vq2KL1tkT50/dQLRYttAzLWj+H6q6h22dyqvRYD6/rHdqkLwgsza
 UXv91gBFepnyXLr1cxQ1v4IIIADh2001ld0rnwoukgUCBytPfLP7qAv6qZgFFLQiP2
 IO9JcDVk7yQB1J3GXTkzP9FMfXQsgXNFpbR8r+ho8U2FIdS1gxj1CrfCW83NZ6/99w
 7eUuGkrhT4kufCwF9mrX02KknO1pp2IEpWgLNQ0u3YS5YseVU/6fAecsshNU8+5g5c
 PsLg8qfyvhQ9l6iRGPVYjdXDb+4sOxt+ut5qKo20wfeVAHY2ohOriXF5dXftpVb36g
 CjFlDLhnfldWQ==
Date: Mon, 4 Jul 2022 11:36:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <YsLCwQM0gbhFhSke@sirena.org.uk>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
 <YsG3kKwmoqF2MxU2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c3hlYmSpRpSU1SsL"
Content-Disposition: inline
In-Reply-To: <YsG3kKwmoqF2MxU2@smile.fi.intel.com>
X-Cookie: MERYL STREEP is my obstetrician!
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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


--c3hlYmSpRpSU1SsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2022 at 06:36:48PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 06, 2022 at 10:29:59AM +0100, Richard Fitzgerald wrote:
> > On 03/06/2022 18:07, Andy Shevchenko wrote:

> > > When kernel.h is used in the headers it adds a lot into dependency he=
ll,
> > > especially when there are circular dependencies are involved.

> > > Replace kernel.h inclusion with the list of what is really being used.

> > Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

> Thanks!

> It's a month passed without any other news about this patch.
> Is this a problem in the MAINTAINERS database?

> Who should take this?

> +Cc: Liam, Mark

If you needed to add me to the CC I've not seen the patch...

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--c3hlYmSpRpSU1SsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLCwsEACgkQJNaLcl1U
h9BsAQf+Iv3swaQi4a4ah1bIH55nv4+CwJnivwhKG5PjzrP08QJbqkXUWXLI/6xK
NErjMQNu+dHhQgRMRleMNxnGpcOi9PPz8v5cV5e0Dvn6ZWhEtSFcKXbdR/mXU0/Y
DJ5gGardEiZOUGwLqFsso8qn90xhuVw+gdWUaUzDL5lzcceN9yVxLO7HEGX52NBK
DLN7LdqgyA2r7URJffUsJkvatDTHfG2S8J5rkl+eUFa/Kj+cujGbO22N7qkkAh72
CuKEGMlos5V58rwsuevxjgOeFRsPdOeqRD+z2JQDpfZWqJMi7cq23mXFfcFg4Uwd
be3jwUK6iNYHfmLFhYUfH3ijLBGiqw==
=4nSa
-----END PGP SIGNATURE-----

--c3hlYmSpRpSU1SsL--
