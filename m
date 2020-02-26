Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DB16FD70
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 12:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9429168B;
	Wed, 26 Feb 2020 12:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9429168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582716340;
	bh=hPQSI2mhEwSPq3W2NAxngWnT/c3bgReeK3fd/TfuSWo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFGBenlX0T0AGBXt/sh9bt5HSPSE/gQ9/7zirYhu9NHXJmnZrgkNDlWJ7SQ7vt42C
	 mv+fi8FGvB4Ki22/NsDhUWnRbOlKha0VC5ohZmm2kT4MiKrnCxoOcgMoJJ5/C0oxlO
	 IW9J2wBnM7jXp7U2Lp854cGWlAznva5BepfiDxoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEEAAF800E8;
	Wed, 26 Feb 2020 12:23:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D1BF8014E; Wed, 26 Feb 2020 12:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 033E4F80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 12:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033E4F80089
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10E51FB;
 Wed, 26 Feb 2020 03:23:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74E273FA00;
 Wed, 26 Feb 2020 03:23:48 -0800 (PST)
Date: Wed, 26 Feb 2020 11:23:47 +0000
From: Mark Brown <broonie@kernel.org>
To: "Agrawal, Akshu" <aagrawal2@amd.com>
Subject: Re: [PATCH] ASoC: amd: Add machine driver for Raven based platform
Message-ID: <20200226112347.GB4136@sirena.org.uk>
References: <20200217050515.3847-1-akshu.agrawal@amd.com>
 <d436063d-098b-f49c-c387-abc13bf3b570@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <d436063d-098b-f49c-c387-abc13bf3b570@amd.com>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Akshu Agrawal <akshu.agrawal@amd.com>,
 open list <linux-kernel@vger.kernel.org>
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


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 12:52:08PM +0530, Agrawal, Akshu wrote:
> On 2/17/2020 10:35 AM, Akshu Agrawal wrote:
> > Add machine driver for Raven based platform using
> > RT5682 + MAX9836 + CROS_EC codecs
> >=20
> > Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> > ---
> > This patch is dependent on https://patchwork.kernel.org/patch/11381839/

> We can take this patch for review now as the patch it was dependent is
> merged.

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

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5WVUIACgkQJNaLcl1U
h9Aiwgf+MwWFsDp/SpGestLnyB4u39j7wugEM/Vp/YFOYOJvAaI1oD6AilRN7dnB
VZbn+9+PEuFX8InCL2QjkHk6oYJHdbaDo81x2nmKB3W3vLu/Bf3hDfePKHihW9Iv
Ai+S+SAeGiSteLO7W37lNqIRZ1006XKQbISB+p3irPTqjeUTJYcA2QFtzZh/30zJ
Z9ufz1wEF8311klqfVYFFZqZGk6rSxDJDonJ0xSvlAMxk9j8F7PUtg2x/JpeNaCP
+RpLDHt5q5zLfY5W11ipPPYsjFxjHj+qV7mNV4vGJ/BCVXsSpa5PtC6NUv8DeBOW
ZtY/Crb7H0W0G6iKmFfET8XIn7NmFA==
=h+wH
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
