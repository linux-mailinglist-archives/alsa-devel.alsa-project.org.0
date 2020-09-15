Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C426A6DF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 16:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8C11675;
	Tue, 15 Sep 2020 16:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8C11675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600179177;
	bh=C8NUJYTq4dRNf2aWP/bdW7G4qRZkHBy24HW9OqWLbTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UQLQtoTyCYlSdcb0SrdkZRIubKrQGSbZB3qECGD/K6O1ZEzqnSmHSCKXMuHvghqKy
	 94wpHEKNz5l288omAw/eUochMa7suN0rDPzgKraY3oE80ekqAp7ZeNRDuR3SIGtnJj
	 E3zdwgk40W2xX4fHHFCGiucpGu+vZKH0apd1WCn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CFCF800F1;
	Tue, 15 Sep 2020 16:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95F1F80159; Tue, 15 Sep 2020 16:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_25,PRX_BODY_59,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C5C9F80159
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 16:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5C9F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a8qs7HAN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72E5F206B5;
 Tue, 15 Sep 2020 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600179075;
 bh=C8NUJYTq4dRNf2aWP/bdW7G4qRZkHBy24HW9OqWLbTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8qs7HANo70P1A8ZGn+5EbMUwqH0CRWb7Xt0tMyvpAwF05F4GcrimKpnmJFjDCO7M
 iApHQWdgWs7rz1G9vFr6cEwDWvj0vq5NMNZZraMoftu9h84ujcqL9LJnOKKE/uWLDW
 VX0rhD2KPGyWeEYSwO9nkmIA2q4dnz2+Vd1MeBfs=
Date: Tue, 15 Sep 2020 15:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Enable fast charge
Message-ID: <20200915141025.GB4913@sirena.org.uk>
References: <20200911173140.29984-1-miquel.raynal@bootlin.com>
 <20200911173140.29984-4-miquel.raynal@bootlin.com>
 <20200915082602.GH4230@piout.net>
 <20200915115034.GA5576@sirena.org.uk>
 <20200915130207.GA9675@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <20200915130207.GA9675@piout.net>
X-Cookie: Linux is obsolete
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
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


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 03:02:07PM +0200, Alexandre Belloni wrote:
> On 15/09/2020 12:50:34+0100, Mark Brown wrote:
> > On Tue, Sep 15, 2020 at 10:26:02AM +0200, Alexandre Belloni wrote:
> > > On 11/09/2020 19:31:40+0200, Miquel Raynal wrote:

> > > > +	/*
> > > > +	 * Enable the fast charging feature and ensure the needed 40ms el=
lapsed
> > > > +	 * before using the analog circuits.
> > > > +	 */
> > > > +	snd_soc_component_write(component, AIC32X4_REFPOWERUP,
> > > > +				AIC32X4_REFPOWERUP_40MS);
> > > > +	msleep(40);
> > > > +

> > > Maybe the actual REFPOWERUP value could be exposed as a control so
> > > userspace has a way to set the policy?=20

> > We very rarely do this, there's not usially anything=20

> Could you suggest something then? This mainly changes the power
> codec power consumption. I guess people will want to trade latency
> for less consumption.

Is it increasing steady state power consumption or is it just drawing
more power during the ramp (ie, peak current consumption is bigger)?
Usually this is trading off clean ramps for fast ramps rather than
affecting steady state.  If it's affecting steady state a control seems
sensible.

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9gy1AACgkQJNaLcl1U
h9BXxAf7BnvnW/6Pgxw267h47TcBP7P0aIa2v2dsSOqZeya3Ofc0ZQC1rRsF0dRw
wbpMXxACb8GVNQp2KkdtT2mxV/CDanhKyoZ38iiTTYPjAms5K9Cyf2XxASPvLgXy
wR0B3yMJCBayYHanJajwSHu4uF8IVj0aXlHvgSeyiObN//cXYf17IC15DmUAhFZv
hQMh4ux/JslYg18NsrAvfTdynEJ850tfAAI9VnkYLyF+fte/9LJSYSn7o3QJ9O1Z
5l9qhrBr7ktL96LzzQ/C70uPhPflXdqSx2JlQY/hQaoj4RUxOT7acnCJobERs2D5
vx3wXK4kcyJQzjT0PWOrsocyhCU6GQ==
=6cJo
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
