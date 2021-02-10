Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79234316A64
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 16:40:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AEA16D3;
	Wed, 10 Feb 2021 16:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AEA16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612971646;
	bh=UmFQ9LVN1sbDvFGlexMO9nwDPmQ4xxV03atwcYGV+pw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Id+Ksv8Cvx7WuWx0iNFJAC4K1NS7FSQyybFfI2FBukwWS6xuDX82wGDG6ho9pAFpc
	 zQ3sKOxWLQ7yUkxUVD+qvfpCWWPnuS1yW8Y0rfhjUFkGUN2K/AFmCjTGBgzLnm2pQZ
	 gL7tnT3mbJ/oUAKkDUZGTnnxzSp69tRfz/QlqMzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65779F80169;
	Wed, 10 Feb 2021 16:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 773A7F8022B; Wed, 10 Feb 2021 16:39:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45176F80165
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 16:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45176F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NzWmVUto"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47C2764DA5;
 Wed, 10 Feb 2021 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612971540;
 bh=UmFQ9LVN1sbDvFGlexMO9nwDPmQ4xxV03atwcYGV+pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NzWmVUtoGG76LVFlqhysU3JpLDxUvQBi6njFUh6JGOkt6CbjseqgqzAqS+HaHdmfk
 T1XuWkdk5zPEx/9xLQaTza0Y/MeMuhnXGQ4ZsJ1nrkY6ndPKGqYONNd+4tyv0TPcbp
 cbTzyicTC7YJi5IoUYNq2rNOYtPl7ZEzN0Q5t4ehLU+WA4UMrHzZqJmn9pA3a2U+9H
 NBhxOfNGPwfhxZ/Ib+CGKBuIqxeO//97USv+mY2rIxCb/00SToRpINZm6S17fFaTU+
 v8WCV+RHf2qZ5VNRVkQKCHeHDm0eiJO/6xl+e0xoybXefr16H/iFnlXkR/9geyt2Xr
 kUKg94zDyIa6w==
Date: Wed, 10 Feb 2021 15:38:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio
 base on rpmsg
Message-ID: <20210210153808.GB4748@sirena.org.uk>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
 <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
X-Cookie: Are we live or on tape?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 02:35:29PM +0800, Shengjiu Wang wrote:
> On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:

> > Like I say I'd actually recommend moving this control to DAPM.

> I may understand your point, you suggest to use the .set_bias_level
> interface. But in my case I need to enable the clock in earlier stage
> and keep the clock on when system go to suspend.

The device can be kept alive over system suspend if that's needed, or
possibly it sounds like runtime PM is a better fit?  There's callbacks
in the core to keep the device runtime PM enabled while it's open which
is probably about the time range you're looking for.

> I am not sure .set_bias_level can met my requirement. we start
> the Chinese new year holiday now, so currently I can't do test for this
> recommendation.


> Maybe we can keep current implementation, can we?
> Later after I do the test, I can submit another patch for it.

Well, the current version is clearly going to leak clock enables with
valid userspace so=20

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAj/d8ACgkQJNaLcl1U
h9DudQf/TaziP/3fIA/+VtOM1vmRz+Y+qg+fko13UVOigl8UEJA/n+4WEegQRoJG
uDTO557iKp/JwY4o5tXxXQxGZhGMhhDg3MDhWbWx0QJ9y/bMhD4R+sZ421eYHwLI
0cjTI9P2I+EiYtMsTICqZgFmEtR+wJHwtJyXTWaIXDPtJYCJuxGBK4mIxn+2YO72
yXEhmkzRVFDFSMhOR0aPUfAD7yMMvRP8UM0R7VBtwXavEtV9ZHrMqxkibnoMt8oX
ONd0cWMywupFjGVZQalfZJyHmnawloUrOg6V5NU5pS7dvIyMgUCgqcwg+8STUDRF
/ynzOHGXxgiNb5x9zte6dG9YVbs3vw==
=A1BK
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
