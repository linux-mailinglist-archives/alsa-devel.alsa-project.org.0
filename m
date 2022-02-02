Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00C4A72B1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 15:09:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6826172D;
	Wed,  2 Feb 2022 15:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6826172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643810948;
	bh=gHPQaa5lUIMo31tXiem0BbrRpbJt2lqVLdonVgjwhDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tiNMNN+W2XR35EzWDq2YvIg0k+pN34xeTTq8iGHAskkLPouS84rRhlHuDo5wxFWMt
	 OIaG98LOQHYTRtNu+ZlyQ2taBc7jRUFIMfIh81F/d0/cDdkcLYBXAapbmR/fBIw4i/
	 2VHiBra6tufrWGA8v6flJuQ0K844TqZeSwB3ARE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C59DF804B1;
	Wed,  2 Feb 2022 15:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C1EBF804B0; Wed,  2 Feb 2022 15:08:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E13FDF80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 15:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13FDF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cK+exRF9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A312161879;
 Wed,  2 Feb 2022 14:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC32C004E1;
 Wed,  2 Feb 2022 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643810871;
 bh=gHPQaa5lUIMo31tXiem0BbrRpbJt2lqVLdonVgjwhDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cK+exRF9NIw8faQt8Zp5rfeL8ffi/TOEstvEaea+PHYkFFY97JJQbTb5G0ex2k3LW
 69d/+pqH/v+tcmhnwA0B+jEEB55UVNJNebBtRn8hkT74Rqbhxh0UH4rNP39sVVB9t3
 23Zt8YdjXD3dBoJA/BXSXlcHRsDmqYCwmaLEZGRFwDbBEtiHHKRf3l4qDwHJJCOFBI
 IOeyYRotKcTEfNDATpX/GKJJ8H+tfsv+rFuuWhKB0KWsjY8eWEdv2xim1WtLY4ZUcE
 CNNYt52js0le0XvUbfeqNU4CKUlEEMfJCxo0M9i7fMtJK9hrYx/wnura3cg1YW4F7Y
 RR6RvKV4ADnxg==
Date: Wed, 2 Feb 2022 14:07:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Subject: Re: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
Message-ID: <YfqQMTMeAabi8m1Z@sirena.org.uk>
References: <20220129000837.6207-1-cujomalainey@chromium.org>
 <a8ffb740-9f03-340f-a7ba-5e0f1a074b22@amd.com>
 <CAGXAbSq4+YY3qNt2c8J-P278QtUMTkJAo7x3=6UvJof4bH2C2Q@mail.gmail.com>
 <Yfl+rZEucvLEmFjD@sirena.org.uk>
 <CAOReqxgK54Gzz=L78Xh1U2bY+rPacJ86h+Ssy6=x11skDevSXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qAS1ftfJQ+vX6+zr"
Content-Disposition: inline
In-Reply-To: <CAOReqxgK54Gzz=L78Xh1U2bY+rPacJ86h+Ssy6=x11skDevSXw@mail.gmail.com>
X-Cookie: Quack!
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Curtis Malainey <cujomalainey@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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


--qAS1ftfJQ+vX6+zr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2022 at 11:07:45AM -0800, Curtis Malainey wrote:
> On Tue, Feb 1, 2022 at 10:40 AM Mark Brown <broonie@kernel.org> wrote:

> > In general if there's something like a speaker amplifier that's just
> > controlled via GPIO I'd expect that to be something that's set up by the
> > machine driver.  If the CODEC is a GPIO provider then the pattern should

> Just to confirm, by provider, you mean it has on codec gpio it is
> exposing to the kernel correct? Interestingly, this appears to be
> counter to the max98357a.c driver. It has the SDMODE pin which can put
> it into a low power state. The codec driver appears to consume this
> pin from FW lookup and toggle it on trigger. I am just curious why we
> would not want the codec to handle its own pins? That way the control
> logic for the pin is collected into a non-chipset dependent location
> that is close to the internal state of the driver.

Bear in mind that I'm just reading some e-mail about a machine driver
here, the most common case for a GPIO for an amplifier is something
where there's a very simple analogue amplifier with just a GPIO to
mute it that's been attached to a CODEC or if it's something that goes
into a device that's otherwise visible to software.  I don't have
immediate visibility of the full set of machines and CODECs here.  Like
I say the state of ACPI firmware description really doesn't help here.

> The board this patch fixes is not shipping, the board it breaks is
> planned to ship from my understanding. Eric, feel free to correct me.
> We could do a partial revert and remove the _NP fields and both boards
> would work (Sujith already sent a patch for this "ASoC: amd: acp: Set
> gpio_spkr_en to None for max speaker amplifer in machine driver") but
> I think we should still consider a patch to stop hard coding the GPIO
> as it should be available via a lookup.

Are there other systems that aren't Chromebooks being covered here, and
if so what state are they in?  In any case what I'd expect to see here
is a series transitioning the existing code to use lookups from the
firmware.

--qAS1ftfJQ+vX6+zr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6kDAACgkQJNaLcl1U
h9BkzQf+Ocd6qwUzu/0Dt1tLiUSj+tcyBajGeKH1FcgPZ1qR+0ZJmZbbuCOlxEna
wUXbW7poqYb46OCwxNDSzlgntzCjm8mbVNXAGopitLzLUCIcTOppmrrweMqXZkqD
KwsQy52yxBB/WCkAafPGcUHs/SRm6RJ92fOxU9wCUol3S/LrRt95jcmUQZ4ORmCN
vcB5FS70Oz0YnMCBPD8mVh+bckNLBXXBHxIZnURBGbnIgLhoUnRLWhmtmcm2LMEy
v7M5ou2YPi0q1Gmpzh5JojTRECBPVrTU5lI11lI32VifH79SEx+XcpDmVBuXgeXf
SYPK9wNFi4BX+ROIWzyea32HWvPSSg==
=UNxo
-----END PGP SIGNATURE-----

--qAS1ftfJQ+vX6+zr--
