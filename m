Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C63A7E3D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DE116A0;
	Tue, 15 Jun 2021 14:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DE116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623760334;
	bh=Lb24lKt6MXXaaV3uULc+nVP704h2xY9cjKIbyq5ydTU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0Q0Q3QWZmq+5Mq2XgIRcl0d5GJ6t5mUCY7ZdS+ymR2XGmpxkpONYt12tAmfnKJg1
	 aG5nw0DbU9qrzWLEO5mhOHX7Jn2hCOuz6lwSogbs2Np22SerM8J9P5vRH6qsRB5utY
	 8bR+bJwF6XlBX9vT9jyHpYhr84OkHdBW1Pj+o+KI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7C3F8025A;
	Tue, 15 Jun 2021 14:30:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29324F80171; Tue, 15 Jun 2021 14:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6B88F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 14:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6B88F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GtyeMzNj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A92A061420;
 Tue, 15 Jun 2021 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623760229;
 bh=Lb24lKt6MXXaaV3uULc+nVP704h2xY9cjKIbyq5ydTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtyeMzNjz9CHBPSCN2x9G3vn4txUnkQNsgXngp3iCbAOwwUcflMpOYcoRSsKpPkLL
 yX7/nwlWOT1M1FhN4SqHvYug2wAiciiNLjRU4Ts1NbrpSmiGfpCU9mcihq6p2SNkW6
 5OVbvRhNoGJSRDvCxEeTzeRd/UfkTnQyaZx1ibrXXCdfrwMrgFW2r4f1vVKBe5NuzB
 d+Y4uXzvZQfnL1QTOQsBy3/w4uJWKV/urP2IXs+E8A1kphGhhWu9f06Quv9TBEd4Td
 rtvd1YzZCygTFZiHbxbrzZ48i6ojA2In932FqDbH0dqzbLgzzLvN/FT87F441v36GD
 CMeb4CQTGIhjQ==
Date: Tue, 15 Jun 2021 13:30:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudius Heine <ch@denx.de>
Subject: Re: [PATCH 1/3] ASoC: tlv320aic32x4: prepare driver for different
 device variants
Message-ID: <20210615123008.GF5149@sirena.org.uk>
References: <20210615094933.3076392-1-ch@denx.de>
 <20210615094933.3076392-2-ch@denx.de>
 <20210615115438.GD5149@sirena.org.uk>
 <32b82dae-45ea-c6d4-77b7-c8a234cbf803@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <32b82dae-45ea-c6d4-77b7-c8a234cbf803@denx.de>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 02:06:30PM +0200, Claudius Heine wrote:
> On 2021-06-15 13:54, Mark Brown wrote:
> > On Tue, Jun 15, 2021 at 11:49:30AM +0200, Claudius Heine wrote:

> > > With this change it will be possible to add different code paths for
> > > similar devices.

> > > -	{ "tlv320aic32x4", 0 },
> > > -	{ "tlv320aic32x6", 1 },
> > > +	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
> > > +	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
> > >   	{ /* sentinel */ }

> > It appears that the device already supports multiple variants?

> Those values aren't used anywhere as far as I can see.

The point here is that you need a better changelog, the driver clearly
already supports multiple devices so we need a few more words to explain
what this is doing.

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDInVAACgkQJNaLcl1U
h9Dp4gf/ZQ2xpw5GNRXy86pCeJSO0K6PI3Zc3o8poYFgEjZfhzK7YQU789f9J8rf
F/jcfgL0+w9jWwjTFv3kyyPJUUdxPB29u6n5pwleWkGEHQWxwn44slqR+9FQS8B9
8VT+Pu89UkfTgGQWAnOnaUom4VabbzDZivhyvk7EWL57gL/nqUF1q69AwR4AMaNj
Ppb6Y/f0s252hjPX26WjP9Ni5F2lleiumxgFvW3WRmpY3U/nJ4gvB3Nbzq3vcgsz
ICQ3wmyoK3OsouT+lAGa5hjsa12kTmQNf1vBkN58hz8eZj8i17O5brxZmv6JBPDB
TNk/VD/CS0KENTEccw40Vqe/8UCwxQ==
=JB4d
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
