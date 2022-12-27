Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73207656C58
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 16:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B155E756E;
	Tue, 27 Dec 2022 16:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B155E756E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672153954;
	bh=vJFbSuGYShvkxrhsg3x4ZX9c59Djy1db+HUXeEPs4Jc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=apBeKuE9mZxQKKFUQuYALInDC58hUl5Kf3X95kJavuHWjSLYW2BuP+8/3ocNLghzP
	 Z2FAB3CLWB7zGltPdq8cEMYhS2PHyHE8iA0Niw/H6/l4vyL5OjqR5Rj8uE0zJswUXg
	 ZQLZGPD7sqWx1cwME6LetJjNOmkEBmSAErcqMrfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C2CF804E7;
	Tue, 27 Dec 2022 16:11:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B91F804B0; Tue, 27 Dec 2022 16:11:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5750F8023B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 16:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5750F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z+YTTVJV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C69CD61170;
 Tue, 27 Dec 2022 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D01C433D2;
 Tue, 27 Dec 2022 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672153895;
 bh=vJFbSuGYShvkxrhsg3x4ZX9c59Djy1db+HUXeEPs4Jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z+YTTVJVpNMmLoJLD77Wx0lLkd46IABLuElsajSxMkkYxSejLQdPAjr5hKlwHKdEV
 7/b+eTuRi9//jPc/DoaT/pFksIFrRKJ8KETWR0ozYQQEJVlPmBZcMnUCwK+aJiJy5i
 MWnguaAaX0l18HHwFPn9alVuyUbwTDTeI3c8j2367T2o4Ju2xOcQNWZcBdLQPOOlP3
 uz2tpG6YsyQl+RTfGFsLQIvUs2CVKdvW1e7wjq4fL4rh3xlcWPOk22rUDXa/6rAbwA
 AdfV78bE3VsjQrHYKsndJQkrNEL/5okmk1X9KUtYpzZObnbjGTcAWetjNgNIX7tl3C
 YEyZhh9IlawsA==
Date: Tue, 27 Dec 2022 15:11:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Message-ID: <Y6sLH+8nVFImL0Oo@sirena.org.uk>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
 <Y6bAQ8hDLkvrvjQQ@kroah.com> <Y6rtdy4NPfi/KOqd@sirena.org.uk>
 <Y6r26VfIfpE8zpPY@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bScRnfjqovRwO9fK"
Content-Disposition: inline
In-Reply-To: <Y6r26VfIfpE8zpPY@kroah.com>
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


--bScRnfjqovRwO9fK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 27, 2022 at 02:45:13PM +0100, Greg KH wrote:
> On Tue, Dec 27, 2022 at 01:04:55PM +0000, Mark Brown wrote:
> > On Sat, Dec 24, 2022 at 10:02:59AM +0100, Greg KH wrote:

> > > > + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.

> > > All of the code in this patch series is older than 2022 as I know it has
> > > been in shipping devices for many years.  Please use the proper
> > > copyright year to make your lawyers happy...

> > Are you *positive* about this.  Based on some preparatory discussions
> > the Qualcomm people had with Takashi and I it seemed like this was a new
> > version of existing concepts.  I'm sure they had something already but
> > it's not obvious to me that they're just posting the same code.

> I thought that this same code has been shipping in devices for a few
> years now in the last few Samsung phone models.  Is this not the same
> code that is in those devices?

> If not, why not, what happened to that codebase that makes it not worthy
> of being submitted upstream?

I don't specifically know anything about that code but I'd expect that
for out of tree code breaking new ground like this there'd be a strong
likelyhood that there'd be design level issues and that's what the pre
submission discussions were all about - how to fit the concept into the
kernel subsystems in a way that might be maintainable.  There's also
been the whole transition to their new DSP firmware going on.  It's
possible that what was shipped was implemented in the same way with the
same code but I'd not assume that this is the case without actually
comparing the two.

--bScRnfjqovRwO9fK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOrCx8ACgkQJNaLcl1U
h9CnuAf+MGvd+7W+bQWW+xi1CuE7tof8WZ9OioNEjvAye+7vSMT+3xz69FpZCsDj
qjLn5KpAJ0d+8GmyK2A7q7G0mq7m86Vfy32SL0CJ85glIwXsle7Et1qMjHlChD3a
Z5W81ijSkUe8OJVIvYBgsUKOdpLiJLtrhRype+FPWs8jU5FPpS42j5PNC0U9XNkP
jJJmYssHD+Hu2jzMljinkqK6yD97EQ7QlKHUDf3Y4CzpnIx3JBhkGszFGzNHHxp+
qtkKie0btBhrJzPDM5nrRn8ugSehraG7r0RRTv/d4IsIgoQkrnwtS2e36SP7WVTz
N6aswJRsm0m/Qxjwxgx5P8lS6k6JnQ==
=AYE8
-----END PGP SIGNATURE-----

--bScRnfjqovRwO9fK--
