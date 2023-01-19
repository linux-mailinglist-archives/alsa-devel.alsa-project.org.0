Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779D6736BE
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 12:26:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EE68009;
	Thu, 19 Jan 2023 12:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EE68009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674127584;
	bh=ucmdndhx2ldEW8Ntxz2+NaxP/d3s99VF6HcjEO5YG60=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZyRsl9CHrV+LI5T8ke+q7hWphKWB2Utg3UYrrvEMHuoa7w2d+xSMQ7ywak7CE+6ub
	 ZBd3EE2D1vUSion/LbSYVHOu65lVHBHPZeQ0i0bskLb9dh/SgMNmbuwBkY06LipNeI
	 2kJRYxC+7UBdibzVnZn9jcBMNxAbykub7jacBzyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57603F800F0;
	Thu, 19 Jan 2023 12:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03E3F8047B; Thu, 19 Jan 2023 12:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE79F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 12:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE79F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=utZMdilA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D117461AC8;
 Thu, 19 Jan 2023 11:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196A9C433F1;
 Thu, 19 Jan 2023 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674127520;
 bh=ucmdndhx2ldEW8Ntxz2+NaxP/d3s99VF6HcjEO5YG60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=utZMdilAabOCYMs988b1pmuGE9FaOXS7EUAZ3RT7a+h2i+2+135A0d57rqgqYFb7a
 W3z7pJImWfZOMkJF/bl6bE3qLGG6NMQWmrqPENQp74Cq2Nz3cKYnf+8U0zc4e+SrFk
 zom5yfnRpQHwa1JyxqDqLTHSR8DlWEBtyw8fhNqyfObQxHiIsdDac+X93bBPKNXbjw
 fkbG1QXw9ECB/cjjH2x4rgpcECyXQoPd4Ip3OOlo549yTJ8tk7w+7mySWd3t8aDSaw
 Qct4ldH2zy9zEOIZNFxFPmyu0Lt3kHH5raDLf7/4L1KDj2EuTnnb0f7FykTB8coeFW
 mVWA5FCWfPEZQ==
Date: Thu, 19 Jan 2023 11:25:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Message-ID: <Y8konjHXimUfm4NH@sirena.org.uk>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
 <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GdfkrMm9KWq8FFah"
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
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


--GdfkrMm9KWq8FFah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 08:16:52AM +0000, Ki-Seok Jo wrote:

> > > +	if (!(sma1303->amp_power_status)) {
> > > +		dev_info(component->dev, "%s : %s\n",
> > > +			__func__, "Already AMP Shutdown");
> > > +		return ret;
> > > +	}
> > > +
> > > +	cancel_delayed_work_sync(&sma1303->check_fault_work);
> > > +
> > > +	msleep(55);

> > That sleep looks odd - what are we delaying after? =20

> It need for IC(Amp) issue.

Right, but what is the issue?  It's not clear what event we're
delaying for so it's not clear it'll work properly.

> > > +static void sma1303_check_fault_worker(struct work_struct *work) {
> > > +	struct sma1303_priv *sma1303 =3D
> > > +		container_of(work, struct sma1303_priv, check_fault_work.work);
> > > +	int ret =3D 0;
> > > +	unsigned int over_temp, ocp_val, uvlo_val;
> > > +
> > > +	mutex_lock(&sma1303->lock);

> > It looks like this mutex is only taken in this function, is it needed?

> This function is in workqueue. So, I think it can be done at the same tim=
e.=20

A given work_struct should only be schedulable once.

--GdfkrMm9KWq8FFah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPJKJ0ACgkQJNaLcl1U
h9DCIQf/W7w17tZo7XnJefKxuVy0vzifo0juHeMfXtV3k2Db4zKDVPtmwK+NqDCz
1FYqmbJicOMHPuhEIf6+uWljBfc5M0oaTjM8LGB+rc7zeQeqyBknJO83po40luuo
dBS22QN1V3VxAt1Fxfm6qe72yx5UctWlDs/OQ73wcfeOilS2jpf3jaXeV2NRASVO
+q97q+oJcIrUBYckZGhr3U1rJ7YimvZjjt8JjyjmysI4jrudRONJmtpl/gVNX+Rr
wFHYpZ1T1ZCQFzzUbVJbR6qiCI0hZSs6Y5tn6BgssV9RyLYor1nmlzfh0CYsSSyI
2XQwC261vqA6p8vRDEgj3j1/ZmEBqA==
=uevX
-----END PGP SIGNATURE-----

--GdfkrMm9KWq8FFah--
