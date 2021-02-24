Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D395323C8E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 14:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 486821699;
	Wed, 24 Feb 2021 14:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 486821699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171792;
	bh=urkvPaO8f7nDAp0+0HIB7pG415kjfix4qSRKWzytmI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MW+ns7n2DMjvTWBjoLh1Ss1spuvA9CKV/FmqMsNhbc1FKHGB4ZspuRl3eIioIT4MS
	 i3L28yZPnOuUY/5TqIlIG98dOV5E1tgsAN3jnx4UGL3v9Z6okfU/qrEzPVYRCDZ3rW
	 hC35INHIWOUryCweOsYEvMcCAd3bGF6BeYYSFjQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70908F800F2;
	Wed, 24 Feb 2021 14:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B972F800F2; Wed, 24 Feb 2021 14:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A445F80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 14:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A445F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QMf5xU6g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5EAC64E6C;
 Wed, 24 Feb 2021 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171630;
 bh=urkvPaO8f7nDAp0+0HIB7pG415kjfix4qSRKWzytmI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QMf5xU6g1A4jo+4KBcMxdghmK70SYEPtsYJq5cmqB8dbjT5jYHFEGJXuo1hmqtEYP
 iU1WIxVKDKFycxFw4DYo2LTlgtKRLEmaBeB27IgaTz5QS9oGr0KDMIH72XHUWYsGyq
 EPSoEBfnQV2fElLzpciplwHqaGBavHLXd6062lDz0Bt77mqNF/Ppd2yXzK1kN7XT5V
 0q51nfFMUjXsZeYaNlUbN5O9dpDrFgb5UGTBvVy8jercfLQSEfjnj35kOlVKXKr4B9
 6jAcQ3jt+YICQW6N1jYHj8pbC2vLmp5PEQ7AyNxYSnsCdfwwNvuSQ+iK34ApZeSTVe
 E02hej5urnGMw==
Date: Wed, 24 Feb 2021 12:59:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210224125927.GB4504@sirena.org.uk>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk>
 <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
X-Cookie: He's dead, Jim.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 23, 2021 at 08:03:58PM +0100, Hans de Goede wrote:
> On 2/23/21 6:20 PM, Mark Brown wrote:

> > We already need ACPI and DMI quirks in the CODEC drivers anyway due to
> > the limitations of ACPI so it wouldn't be particularly surprising to
> > have stuff there.  OTOH this would fix things per machine while with
> > fancier hardware things might easily be flexible enough that there's
> > multiple choices that could be made depending on use case.

> I have a feeling from the discussion here that you would prefer this
> per model/machine option over the current patch which unconditionally
> sets the SNDRV_CTL_ELEM_ACCESS_SPK/MIC_LED flag on the main DAC/ADC
> mute controls ?

> So I believe that it would be best for me to respin this patch
> series moving to making this a per model/machine thing, correct?

Yes, we at least need to be able to do that even if we end up hard
coding it in some CODEC drivers as the device is inflexible.  There are
devices where the concept of "main DAC/ADC" just doesn't apply.

> > I'd be a lot more comfortable with ASoC having some runtime control for
> > overriding which controls get mapped, even if we try to pick defaults
> > with quirks.

> The drivers in question already allow overriding their quirks bitmap
> via a module-parameter.  If we are going to enable the mixer-element

I'm not a big fan of module parameters TBH, it's not great for
usability.

> And then the user can always override the settings using the quirk
> module parameter. This is not exactly runtime control, but IMHO it
> is close enough and anything else will just overcomplicate things.
> I'm aware of only 3 model 2-in-1s which need this and on those
> 3 the implementation is very straight forward.

The problem I was thinking of is the situation where there are multiple
options for the mute control in the hardware and it's a configuration
decision which one to use.

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA2Ta4ACgkQJNaLcl1U
h9CuRwf/b0ZWjO8gbf2fpTOz9dyyJpetTB+O0cKSUgRYyHgyoQZPHi7qAH+b/cjF
1CuZqY7IxLI6d2tFmUo9HbVPqOlxQD4qUkbRK3fQSR/nBKdVSlAiMfp8ZXv7e5iV
KPGES+psNwb74Jj2egmDZUQyzJTqA0wdnz9BRTf5ZjwBr45w/LL1msEUXWTw7+1R
uECRwJkHrOxZ1aHnqKJGYneRYNOpQD9QeJMuUPo4TBbosDwwictbAbJZZAXuDfwV
aWd1p1xjLOhzEkEhpHc2xCaR/fzqyxhBM/V6yQJtbkJz9RrJoL0/tk8Af9eptIo9
iO9TdQFuxkEVgX09c1acNboAgGsbsA==
=rYXx
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
