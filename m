Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B971F7B6E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EE0167D;
	Fri, 12 Jun 2020 18:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EE0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591978144;
	bh=UjJtFUryNP2TfJoK7XZIrmSz3ZmZvBDsoJb0rLk8EY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IF7SAkMIk0aluu7hSJa0ta+Hyct2jCISlxkQsKmoJI4kzQjIePuEsNx7mchEO9XS/
	 a7xzficCxOAw5wCj7t3ChKD8v3kRkcELQZEXXfTy78lMoTdIQQsc/JEWczFxAQntXT
	 m6r8Neh5VdTAzX4wPHgF0Rdl3j+nBu7vxqIX/yLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C147BF802A2;
	Fri, 12 Jun 2020 18:06:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8FAAF802A1; Fri, 12 Jun 2020 18:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092B7F80259
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092B7F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="COsDhrpN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30BB20801;
 Fri, 12 Jun 2020 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591977983;
 bh=UjJtFUryNP2TfJoK7XZIrmSz3ZmZvBDsoJb0rLk8EY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=COsDhrpNjPhRjQp1IP+GA2CNQOwVT+YkNkJkEbucvFLBWbEd+umPkJdCtPmg4IXIx
 L6MTrc18FKrFHBlDN2melT7JEU8KOAKjBDTlAD3oOJOMBgq+SJmQVfliExmxaYNMY4
 AFco7TTy/ZJDevo0PuVugBZirC6QlZ/UOdnuHDyE=
Date: Fri, 12 Jun 2020 17:06:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [PATCH v2 0/6] Enable Greybus Audio codec driver
Message-ID: <20200612160620.GK5396@sirena.org.uk>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
 <20200611082616.GA4671@sirena.org.uk>
 <20200612153722.GB26807@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Content-Disposition: inline
In-Reply-To: <20200612153722.GB26807@gmail.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
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


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 09:07:24PM +0530, Vaibhav Agarwal wrote:
> On Thu, Jun 11, 2020 at 09:26:16AM +0100, Mark Brown wrote:

> > > Kindly suggest me the preferred way to follow on this thread.=20

> > This is effectively out of tree code, until someone submits it properly
> > I'm not sure it's useful to submit incremental patches upstream.

> Thanks for the suggestion Mark. I'll create a separate patchset aligned=
=20
> to the ASoC tree in next ~2 weeks and share them separately.

Great.  If there's controversial/complicated design bits to sort out it
would probably be good to split them out so the simple stuff can go
through more easily.

--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jp/sACgkQJNaLcl1U
h9BjNwf/TxHtNpRoCQSQlm7mC4/R/p3AdvljC0eznPnwUtB6vCy/VN08DiwKL9eW
9jCL9qejGDblZC/T3PRjBcTmRDNrxME5N8LD5/bQNClC8pYTlUurvzoXOrkc768s
qxme6AYqrPgChIFm6IvfQF7Uj2LppW37d3t3F920rTkDW0LDBK23caFhLo5JNEdF
gireupD5ofMp6iIZJDYL7GE0/aKk58gqBxBTVPVy6GmfZP0P76c7DFJmPj1IPg2g
8gV7sdFA+Qaf5akbdUMYMt1YQpVZrCmeGacMSL9Qk+RL/1GTN6oa1P8+Srxuf3Qb
XZbQqZcxA1kWUIAlw2gfeBn5FBtN5w==
=Vm6h
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--
