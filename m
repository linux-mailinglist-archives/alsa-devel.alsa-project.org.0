Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0C262DC3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 13:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CBB16F4;
	Wed,  9 Sep 2020 13:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CBB16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599650725;
	bh=LkadiQCgclxrhojlBp3ZXM5AWwkkDe239xMCm7eedRk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jkc3D05rmAWohYYyc2Dpkspnvu0CIKSt2Ix0wJQXyPnlHTmSpl252NNlMqSbM8GoE
	 Rsg8yg1Cci4WxjtcbULFqHFXAYjls6xk8xSQzei74Wv/cse4fLjuOE6CU9dCOi/mDv
	 tE2Jh8zW4OxcMbKLQWQRP5vAeIDYw53LqS/GStZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B81F80240;
	Wed,  9 Sep 2020 13:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB63F800E9; Wed,  9 Sep 2020 13:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44872F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 13:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44872F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UrrGsOcT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24C7221582;
 Wed,  9 Sep 2020 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599650582;
 bh=LkadiQCgclxrhojlBp3ZXM5AWwkkDe239xMCm7eedRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UrrGsOcTrWGEPvnUvln7SG7bMJdZ8HTJlYOThf6sAUD4Tsyc62iZhuN4/kAh2Zodw
 6l6UYCdDFnpiAt9e7kHXzKb1ps6JA3d4pmwjio2Yzbtz0FIfh8vjs3UJXhbNa8/cPw
 r1AD8bDOoFfbRIIic8PEdNoQl6PYUrAmdxQPEjCE=
Date: Wed, 9 Sep 2020 12:22:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Camel Guo <camelg@axis.com>
Subject: Re: [PATCH 1/2] ASoC: tlv320adcx140: Avoid accessing invalid
 gpio_reset
Message-ID: <20200909112216.GB4926@sirena.org.uk>
References: <20200908083521.14105-1-camel.guo@axis.com>
 <159958562064.16576.7853800514030717096.b4-ty@kernel.org>
 <1e17f203-7b60-bf97-4515-937e722f5ef7@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <1e17f203-7b60-bf97-4515-937e722f5ef7@axis.com>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 kernel <kernel@axis.com>, "dmurphy@ti.com" <dmurphy@ti.com>,
 Camel Guo <Camel.Guo@axis.com>
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


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 12:06:45PM +0200, Camel Guo wrote:
> On 9/8/20 7:20 PM, Mark Brown wrote:

> > Applied to

> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-n=
ext

> I think it is "ASoC: tlv320adcx140: Wake up codec before register setting"
> that is applied to for next not this one.

As the mail says:

> > [1/1] ASoC: tlv320adcx140: Wake up codec before accessing register
> >  =A0=A0=A0=A0=A0 commit: 1a5ce48fd667128e369fdc7fb87e21539aed21b5

You didn't send a cover letter.

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9YuugACgkQJNaLcl1U
h9BzRAf/eej3UqPw1MAjqnCxeGC25+X4SQHNNj9q/MDJxHNi4cmZhw1xymwlhMvH
LzzZuVLNsf+iBGnr+Pb1bFs+gbXPK4R2mes/HOAnfrBtTmQaaVdz7gI6GauLubZl
UhK+XUiP6nLgOw/hQcF0dc9mJzZcL74wixT1Qb4nADxZMIS9NvWsNb9IX7/S4Zi6
6u6In1DZFzMICqDVirAmTNXwDkEuoK+SuFzQqibMIQ/KOKrNuyevcuFbfEETzeNP
lCdyuMyDzJp2oAVSRoos9OUQ9K+9szg74RzZ98yjDwBE/sX17iVPO1exFaNS1IG7
g+jkoNwl+SVDGWK9ouoSKgmmzTUDcQ==
=hYvu
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
