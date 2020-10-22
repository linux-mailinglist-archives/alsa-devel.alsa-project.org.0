Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A390429606C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 15:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F7117E7;
	Thu, 22 Oct 2020 15:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F7117E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603374767;
	bh=FMBUOMBhj2bHvXWwbhpY2/I5JZIS5H8lhCJdsmME7m4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4m6J8bmydqnyiVoCP1qbuOczNsv6fsIN+ibWX4QTK0zMJhmHTaynNAgs4jaD5lVo
	 fmVqq25hsT7dfgMz4V+pNrBxRUkY94iojPuMYhwN/ABD+u+kMMap0ddWGbW5g5Ye8P
	 aLpU/cfMM/CChuter8FSgros4N508xZXdaTmXvG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F863F8025A;
	Thu, 22 Oct 2020 15:51:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E572AF804A9; Thu, 22 Oct 2020 15:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF639F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 15:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF639F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ARFKFl11"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 124A921D43;
 Thu, 22 Oct 2020 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603374665;
 bh=FMBUOMBhj2bHvXWwbhpY2/I5JZIS5H8lhCJdsmME7m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARFKFl11lu3S/EB1h+81jludIC0YHswdCCkdjvg48PkanhyvwBzw8DochJBLiUs1C
 zZOd1/cY1Khh3DplqjRMSz+li+sASq9CDLbu1eDCKrUn2JgjGR2N0gENxratM5sbKA
 sKrUd+VtpGeE6AgJsQNGr3josASCMelFCvw4mBQk=
Date: Thu, 22 Oct 2020 14:50:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Context expectations in ALSA
Message-ID: <20201022135053.GB4826@sirena.org.uk>
References: <20201022095041.44jytaelnlako54w@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <20201022095041.44jytaelnlako54w@gilmour.lan>
X-Cookie: Some settling may occur.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2020 at 11:50:41AM +0200, Maxime Ripard wrote:

> This is caused by the HDMI driver polling some status bit that reports
> that the infoframes have been properly sent, and calling usleep_range
> between each iteration[1], and that is done in our trigger callback that
> seems to be run with a spinlock taken and the interrupt disabled
> (snd_pcm_action_lock_irq) as part of snd_pcm_start_lock_irq. This is the
> entire stack trace:

That doesn't sound like something I would expect you do be doing in the
trigger callback TBH - it feels like if this is something that could
block then the setup should have been done during parameter
configuration or something rather than in trigger.

> It looks like the snd_soc_dai_link structure has a nonatomic flag that
> seems to be made to address more or less that issue, taking a mutex
> instead of a spinlock. However setting that flag results in another
> lockdep issue, since the dmaengine controller doing the DMA transfer
> would call snd_pcm_period_elapsed on completion, in a tasklet, this time
> taking a mutex in an atomic context which is just as bad as the initial
> issue. This is the stacktrace this time:

Like Jaroslav says you could punt to a workqueue here.  I'd be more
inclined to move the sleeping stuff out of the trigger operations but
that'd avoid the issue too.  There are some drivers doing this already
IIRC.

> So, I'm not really sure what I'm supposed to do here. The drivers
> involved don't appear to be doing anything extraordinary, but the issues
> lockdep report are definitely valid too. What are the expectations in
> terms of context from ALSA when running the callbacks, and how can we
> fix it?

To me having something in the trigger that needs waiting for is the bit
that feels the most awkward fit here, trigger is supposed to run very
quickly.

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Rjj0ACgkQJNaLcl1U
h9BMKgf+OmxlYVeRiaWoVuqLzW0RkFEqg3gdo4tCH7AWBWr1/fM/ZgSWGi3t3/wQ
e3ZmLa/iG8v+/m44FRY4eYzrDjIQrp6JGViQKjYqIAw/rvS9IXwbBmChRUkP99WI
NGNLcugo+5YNkFNAfPxRpy1sD27KSG0yaZzlt4RfGhwWuEF6bT0QnzZ+O4ClVMzE
cBs8QHmqkQj5wRtkvwCk6imE4nDTvwBMAESADkA0a8guJJjvsFzEiPikEAKJaS5a
2ZfkLPhxoyCJWvJ9CxP37WK3uJcjmZXKkXX8Im7KSvvxrqx0H4aOXyYUUYlOEAuy
7vfZkmC7DsUGs8w9lTqKn6cOcq4oFg==
=hlNw
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
