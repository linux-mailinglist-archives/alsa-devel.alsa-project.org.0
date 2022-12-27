Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E500656B32
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 14:06:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B657423;
	Tue, 27 Dec 2022 14:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B657423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672146366;
	bh=vwTxEmWywJfahw5LbUuZn51ESYRdcfZxVfhaPmBHhOw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gOx7IvzN6XCml/f/Blb3iP9cRiQMw9Rj5WH9MKwOQbRbxEJHeOzO7LTQUIyxZtSNC
	 e8ocDSPDVJVXmEUFbiQXPsWEOhglrpwoR4dUD/jSU1tPm7jyDbNkKbHIh6/4l4Nwbx
	 Ln6zvottS9jfJXgfK0c9X0rTy5+Tq3P2qy16JbkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62EA6F804B4;
	Tue, 27 Dec 2022 14:05:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C840F8027B; Tue, 27 Dec 2022 14:05:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80420F8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 14:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80420F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JyDJl2Dd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF2261149;
 Tue, 27 Dec 2022 13:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84638C433D2;
 Tue, 27 Dec 2022 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672146302;
 bh=vwTxEmWywJfahw5LbUuZn51ESYRdcfZxVfhaPmBHhOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JyDJl2DdlRkMbWBtXGU8iVomIt/1HSy9522SBbj4G7D5kGJi/ad/TcpFZ/nvQ01UE
 PO95jbfg+dIJCVfvkyCVDhKQzgCtQBV8MeaDmPsP95JUmdE96E7i8wLXIIXi+bwd7k
 XjD5ltD5k4xBZflMzGcf4uZLW4wKK8WKKH+V9i1TcSmayQNjEDkKWNYLofWspacv0L
 npZz8bL6zbtRlUuMu1C3bt+SYC9JOwTtaOSlRwDNoBD+nF+8rdEIm2F7dzDktbKAsL
 PiXEr4OXhwjydYvuKqjate9JFr2ek3tA0S5hU9G3fschIg6QqdWSkkMoYA5Bp7qDTU
 epr57fCnIMPyw==
Date: Tue, 27 Dec 2022 13:04:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Message-ID: <Y6rtdy4NPfi/KOqd@sirena.org.uk>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
 <Y6bAQ8hDLkvrvjQQ@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zr2rHEGqLJMRmKJ6"
Content-Disposition: inline
In-Reply-To: <Y6bAQ8hDLkvrvjQQ@kroah.com>
X-Cookie: If it heals good, say it.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Zr2rHEGqLJMRmKJ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 24, 2022 at 10:02:59AM +0100, Greg KH wrote:
> On Fri, Dec 23, 2022 at 03:31:49PM -0800, Wesley Cheng wrote:

> > + * struct q6usb_offload
> > + * @dev - dev handle to usb be

> "be"?  What is that?

Back end.  This is a concept in DPCM which should be reasonably
discoverable to people working on the audio portions of this code.

> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.

> All of the code in this patch series is older than 2022 as I know it has
> been in shipping devices for many years.  Please use the proper
> copyright year to make your lawyers happy...

Are you *positive* about this.  Based on some preparatory discussions
the Qualcomm people had with Takashi and I it seemed like this was a new
version of existing concepts.  I'm sure they had something already but
it's not obvious to me that they're just posting the same code.

> > +static const struct snd_soc_dapm_route q6usb_dapm_routes[] = {
> > +	{"USB Playback", NULL, "USB_RX_BE"},
> > +};

> No terminating entry?  How does this not break?  Why do you need to
> specify the size of the array, that feels like a design bug somewhere.

It's how the interface works, the number of entries is passed in when
adding routes.

--Zr2rHEGqLJMRmKJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOq7XYACgkQJNaLcl1U
h9CIXQf+NY4WahBGVa1iM4YmLUiFB3BREEf7qYR7ISMwWzS7oXc0jYFhfCLrz+tN
ZWQ22VePJY2Pfw6WA94IHsogW9sLLcdPFy5yEupL66jAAGqK6XdViOE9TFu8KDF+
KvAsZsgQPvubruTmt9u2gWQjbSOuSts2dwUN+mHwp73FQAA5jCZMCXEcrAZ27uDi
PHP5l8dkmHFLukFJUb4wGee/qebPwdDna8CWDXwvwrGOHLKKgtDQ/ZKFLJNhcJ1D
3cB9MT2mfY01zTF9wk9J6GmD/nggoM0xFCu/7lX98wA7rMRK1PmvbQEAHCsagvVQ
aiONQx4/PqiG0djaCq8bzmyyIVI8tw==
=pPnA
-----END PGP SIGNATURE-----

--Zr2rHEGqLJMRmKJ6--
