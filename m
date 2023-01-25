Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67267B1F5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:49:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DABE87;
	Wed, 25 Jan 2023 12:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DABE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647362;
	bh=x6UX1wSdESJcjeykeYC59RFbaCKILiZkDXM3rO0CLaY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MWsp0c55nOELVb9wWXzQvj0k8YiAZm1Ek+XH1sTPtgzwnW4fW8m5NHjN6DIifdKi7
	 IOx44/fNdUiqyGo6R+cMwrN0qQXPdTEWZpX9ikaNYXGv2TBpeuUBuO+395gfKw6FrG
	 vLvDv/NvxeqnIXdBLFDqfA9VmuApIxeAa3R9zNnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E5CF8057C;
	Wed, 25 Jan 2023 12:46:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E75FF80557; Wed, 25 Jan 2023 12:46:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 757B5F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757B5F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bb1btFzL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DA54614BC;
 Wed, 25 Jan 2023 11:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837D5C433D2;
 Wed, 25 Jan 2023 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674647179;
 bh=x6UX1wSdESJcjeykeYC59RFbaCKILiZkDXM3rO0CLaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bb1btFzLKSSMUBrUoVDiH+mZHcVNy/qdiYsRRUNSvyD9KfqPDZchnVxTvoaujxK3l
 Zk94H1Hk6danqaHqtzjffazynU6p8BdmHcv7ozIp0YXu1kubgR2xjdzoTiKpH15HW9
 Kk5cqLUNB34ebSSk4nCOEsUbW/dpGRLpa7fqeaOLQO2dwZqFyZ0sdxOq6SiG7sfMem
 FUJdzk3nQSfLURtRpMMcJpk7vUVTFo1NbnXKT2CqiNLqc9gubDzHmBTutsJmsroJPF
 lZRYjfkrtlb/fhXem8IbI0DEPD02n1Hty6Q7dGvh78OSXSQsVC3FqGPUPv8qbNyCzN
 EZ9wEnwGxTqNg==
Date: Wed, 25 Jan 2023 11:46:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Message-ID: <Y9EWif///aqn6MiS@sirena.org.uk>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
 <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y8konjHXimUfm4NH@sirena.org.uk>
 <SLXP216MB007747CCA6C43D139712535C8CCE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9AsDwl+85pnkdmtn"
Content-Disposition: inline
In-Reply-To: <SLXP216MB007747CCA6C43D139712535C8CCE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Serving suggestion.
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--9AsDwl+85pnkdmtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:12:58AM +0000, Ki-Seok Jo wrote:
> On Thu, Jan 19, 2023 at 08:16:52AM +0000, Ki-Seok Jo wrote:

> > > > > +	cancel_delayed_work_sync(&sma1303->check_fault_work);

> > > > > +	msleep(55);

> > > > That sleep looks odd - what are we delaying after? =20

> > > It need for IC(Amp) issue.

> > Right, but what is the issue?  It's not clear what event
> > we're delaying for so it's not clear it'll work properly.

> This device requires a delay from mute to power off. If it is
> turned off while the signal is coming out, it takes some time
> to become muted. (need to about 50ms). So, this delay is
> required to turn off the power after completely muting. If the
> time is too long, we can reduce the delay a bit.

This at the very least needs a comment since it's not clear how
someone would work that out from the code, there's no connection
here to the mute operation so someone might just remove the
delay.  It may even be that this is happening well over 55ms
after the mute happened.  The ideal thing would be to track the
time from the last mute, the regulator core does something along
those lines with off_on_delay.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--9AsDwl+85pnkdmtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFokACgkQJNaLcl1U
h9AN8Af/a0QueeKBu0CELz1mqeKMuOpUYfhO0ZDl+ovYbfI9x6F2+AnxINXCjK3e
ClLpSYqp59bP2mx9C2JcMhKmPVGqr9gpSivA89feNLfB3/tMIS4R59ioAExLG2+I
1VTzy7qMWHKDnBgnQCTKA6ESb04Pe2uhMpHZpeq62SjqWrq4rhX8TUn69aB8+hcy
6Xs69qqD9q0oEacfxpp5h0ndNemHb0N24sAvf9nVcgK7P7yVE+oQszLuvjpAhxab
MtAJzHSXVCS2vVsmDrKBWlNZjRrF5MZMGepDg6dQGNo469J04sX0Nvv7v+E0NzH3
xw6sth7APGvh0GZi/VxY/V2Oz5iYNg==
=ftvS
-----END PGP SIGNATURE-----

--9AsDwl+85pnkdmtn--
