Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93149CFEE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 17:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2AA1EF5;
	Wed, 26 Jan 2022 17:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2AA1EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643215543;
	bh=usfOM9nUwC1SkrwY7bR2+GQN0nN9zOejd7nMDfiUXR8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQ8+toi1CiyvgC/om/8zOh9gjxabeVbYQa9IgEX9TJ3g12T2vdDoeDKMlEu3nAMRC
	 yPO07nGKHXgzAyiAnZKbWM75DOZ8ai+V97vPmT6uUeAXbDqGCE9ScbWRID6lHxtwIV
	 JTzjSxiy0MJZE2hlOafLW4uun4CInJAuUWL/gaQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20382F804BC;
	Wed, 26 Jan 2022 17:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03372F8049C; Wed, 26 Jan 2022 17:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BD66F80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 17:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD66F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JJolxd/C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E66261A8D;
 Wed, 26 Jan 2022 16:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836E0C340F1;
 Wed, 26 Jan 2022 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643215468;
 bh=usfOM9nUwC1SkrwY7bR2+GQN0nN9zOejd7nMDfiUXR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJolxd/CAAxZiSYsSdmWMsgzTduJqHiplWqhNDUxeGiP+xj/EGlzsZK812aCdJQwT
 t335egLfixUjnCPUa/oLWSLRfblu4JNGvZG+GUcE7vHhH9p+HmH6XqCzGxD1K2Fm6T
 FNWoYXJ93ulpwqw+rM6xmRH2JNJl45OoBllq7iV2bX3v/ViCutuqb8Ja//JwONfc3v
 rePtNfJX9IXMS8DcHHOH86tfpTBgcMi4oD9gbqANVSwQdpD3XhejKPsHe2pMHnOzPy
 9triPkiu5AqsHgQ8Ap/bXu1s7myz/SXccaO6PesPlsmDsYIcL7u7IILZatWnaFa8nr
 PUfGCuVcQWA/A==
Date: Wed, 26 Jan 2022 16:44:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Joerg Schambacher <joerg@hifiberry.com>
Subject: Re: [PATCH v2] sound/soc: adds TAS5754M digital input amplifier
 component driver
Message-ID: <YfF6aGOSo10jOIj8@sirena.org.uk>
References: <20211029095414.29131-1-joerg@hifiberry.com>
 <20220119125033.GA2144@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wUouFNF7pV0nCdcq"
Content-Disposition: inline
In-Reply-To: <20220119125033.GA2144@ubuntu>
X-Cookie: Use only in a well-ventilated area.
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org
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


--wUouFNF7pV0nCdcq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 19, 2022 at 01:50:33PM +0100, Joerg Schambacher wrote:

> Thanks for your useful feedback. I guess my comments on my first reply got lost somewhere on the way ....

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> On Wed, Nov 17, 2021 at 03:13:47PM +0000, Mark Brown wrote:
> > On Fri, Oct 29, 2021 at 11:57:30AM +0200, Joerg Schambacher wrote:

> > > +	mclk = clk_get_rate(tas5754m->sclk);
> > > +	bclk = sample_len * 2 * params_rate(params);

> > snd_soc_params_to_bclk().

> snd_soc_params_to_bclk() does not always gives the necessary value

In what way does it not give the needed value, and is that perhaps a
symptom of the constraints not being accurate?

> > > +	if (mute) {
> > > +		snd_soc_component_write(component, TAS5754M_MUTE, 0x11);
> > > +	} else {
> > > +		usleep_range(1000, 2000);
> > > +		snd_soc_component_write(component, TAS5754M_MUTE, 0x00);

> > Why the sleep here?

> Wait for settling of the clocks before unmute

Why would you need to wait for the clocks (which clocks?) to settle
before the unmute, this sounds like something that needs to be addressed
in whatever is providing the clocks.

> > If the register map can be copied can't the two drivers be combined?

> The TI apps team recommended to write a separate driver as there are some differences. I have also aligned some names to the TAS575xM spec in the next patch

What concrete differences are there here?  "The TI apps team said so"
isn't really upstream discussion or review...

> > > +#define TAS5754M_VIRT_BASE 0x000
> > > +#define TAS5754M_PAGE_LEN  0x80
> > > +#define TAS5754M_PAGE_BASE(n)  (TAS5754M_VIRT_BASE + (TAS5754M_PAGE_LEN * n))

> > > +#define TAS5754M_PAGE              0

> > There's no mention of paging in the regmap description for the driver
> > which feels like it's asking for problems.

> I think, it's defined in the correct way. Where/when exactly do you see a problem?

If there is paging going on and the regmap code doesn't know about it
then that makes it seem likely that the regmap code is going to get
confused about what's going on with the device.  What makes you say that
"it's defined in the correct way" if there's no mention of paging in the
regmap config?

--wUouFNF7pV0nCdcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHxemcACgkQJNaLcl1U
h9C3kAf8C4UbuUwdIrGqsWbJ9L5qnOAVICkHiH0z5yVwKUO4tUNNYSvF8/t4dBoE
ZDooivEeza5q9yimlSC/GAm5wBnBsy5V59DIKvIu7F7FW4D2T30x7xzq2pKq0k1E
VfxpeeK2ZoM1yjoYNmB2PNRfZq4a17Qed690/KUqHPwcSgYSQjzaCqnMXZg/4ZNw
RpGzcOtJMualZ2Sb7QSXdIPg0Wumj65N3+On5dno8CB/Tb7KoqrLyRMqDimKJbni
sC5744LN+waZ2NVq3KnzCIVnANYSwVP8B+5ka6w1sATLsha/TCiZkyPv8RiQhpDR
DB+vixm8yGZ6SCf9Ogn+LgWHkACcqQ==
=Je6j
-----END PGP SIGNATURE-----

--wUouFNF7pV0nCdcq--
