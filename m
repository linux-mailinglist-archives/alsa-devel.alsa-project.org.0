Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431017E828
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 20:20:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB8316C5;
	Mon,  9 Mar 2020 20:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB8316C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583781603;
	bh=se/d+EDwhKOuLrL9ms7Er05T5E0qGIDXciOKBgVJz5c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbRP0sWMNZSTi5sM0F5BDa/DZ+De2Aistbc66zmLm+tgXnv7lYy2qTqS+BkFznBU4
	 lIFl55V8QzhOX0by4Xot345J6waU9E6Q+SxzCh1PnQNfRFF6N7wtKB/EYc1w/JsmBL
	 cZZDT0tJRENl3KMmjxmQbSNHy/65dn1RrRs+MTSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A18EAF800DA;
	Mon,  9 Mar 2020 20:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1529F801EB; Mon,  9 Mar 2020 20:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9EF7AF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 20:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EF7AF800DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 796B01FB;
 Mon,  9 Mar 2020 12:18:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4793F67D;
 Mon,  9 Mar 2020 12:18:14 -0700 (PDT)
Date: Mon, 9 Mar 2020 19:18:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Li <kevin-ke.li@broadcom.com>
Subject: Re: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver
Message-ID: <20200309191813.GA51173@sirena.org.uk>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
 <20200309123307.GE4101@sirena.org.uk>
 <69138568e9c18afa57d5edba6be9887b@mail.gmail.com>
 <20200309175205.GJ4101@sirena.org.uk>
 <8113837129a1b41aee674c68258cd37f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <8113837129a1b41aee674c68258cd37f@mail.gmail.com>
X-Cookie: Beware of dog.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 11:14:18AM -0700, Kevin Li wrote:

Please fix your mailer, it looks like you've included some text I wrote
here:

> I can't really parse what you're talking about here (perhaps some of that
> context would have helped...) but it doesn't seem to be the clocking of
> the I2S bus which would normally be what master and slave would be talking
> about.

but it's completely indistinguishable from the new text that you've
added.

> It is the clock setting of I2S bus master or slave.
> If I am playing music only, I set TX as master. All others are slave.
> If I am recording only. I set RX as master. All others are slave.
> If I am playing and recording at same time, I set first coming stream as
> master second coming stream as slave. If I shut down first stream before
> second stream, then I will set the second stream as master, otherwise
> there will be no clock/FS signal on the I2S bus to maintain the second
> stream to its end.

This is not how any of this is supposed to work, it's unlikely to work
well with other devices.  If the device supports both master and slave
operation then you should let the machine driver pick if the SoC or the
CODEC is master via set_fmt(), randomly varying this at runtime is not
going to be helpful.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mlnQACgkQJNaLcl1U
h9DJ4gf/W/+cBKoBjZFDxUg3x8GtQhsWd7Wv5h7M1lAX2b3JG3TYTn/9KTw8pw9t
IqRQlZ5fYkIaqXjoH9c29EHV+7Oc1H7ipYTypjRpmai4D17oAixzgMg6JfsdczV0
RpmZZbDWEYfaIHAC8mAetFWYs0JAd9VLDjRUVY0ineBnXdjCrsZBc4UQsg9vYj+h
uV3z8auOgOz1dHgOk/FYdomT2aXtIJ3vxYQPzXK1Q19uhmlLcO3ELmk+I4opLVZH
CnUx839AjYN+UOsa7z5I/z3RVndp/dtPIBF6TMTLrBJmgdU6QLCPBuVgLE4gdCQ2
W4g38ZUD3DpNTiKgsPbhrXu/v7MxQg==
=Ukbe
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
