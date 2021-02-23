Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F522322BF7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E0610E;
	Tue, 23 Feb 2021 15:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E0610E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614089530;
	bh=keUhSFq83Pofq+6bbEs/WcQkNq42OhRKzDZETl3TYqQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tG+EpuI0jjMZDo3N5wE3jeSLVwM9R3svn5bwVFAYu5vp1XmZnDPfwSvTbva3vwXKT
	 89su3sgyWiaz4a6/RgeN3ctJJvcJu6M9uNWpwWQjr8w4o/3c6SFN6e0C5vPoUpG+U/
	 33Tlr8qd7DugL4LpLIiSEwKeXskWQYBw7JCtGzpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66DA9F8016D;
	Tue, 23 Feb 2021 15:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADAC8F80169; Tue, 23 Feb 2021 15:10:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B04FF80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 15:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B04FF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LBIBg1wp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A663264DE7;
 Tue, 23 Feb 2021 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614089432;
 bh=keUhSFq83Pofq+6bbEs/WcQkNq42OhRKzDZETl3TYqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBIBg1wpHZj/7q/7aEsf1kk3SSAV7eVtf7AEo0C8YugLGDUyYzmdonZzRtHQ2ZwwZ
 6NePfTZO43XKpm/W16qhiAuUVpZtfiZDfxw4EUfKc9g9OcCxbUsVqwWXuXNtZ/2TQ2
 5bTpJE8Fn/mvqLXpyn+VA2NCxWQMatt5FSyfZ/mEIJbuSWHHUovO6y5q4D8KFbbotU
 fib8xB+rwTByBv8uxU5ZRuu5gdzxLAwylx1L6tREewwEpZs3UgUjvi5X14kjmNXpVj
 3qjB1+7DqTpjTzU1OzUIJouhAaaT+ygh01SFWvjffWJ/LCYFBgPL8Rvn19W4IiUcl9
 OVl7/Y3uVjRaQ==
Date: Tue, 23 Feb 2021 14:09:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210223140930.GH5116@sirena.org.uk>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
Content-Disposition: inline
In-Reply-To: <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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


--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 02:59:17PM +0100, Hans de Goede wrote:
> On 2/23/21 2:45 PM, Mark Brown wrote:
> > On Mon, Feb 15, 2021 at 03:24:19PM +0100, Hans de Goede wrote:

> > Why just these particular controls - what if a system has separate mutes
> > for speakers or something?

> These are the main volume controls, which are always in the output / input
> path independent on if we are outputting to e.g. speakers or the headphon=
es.

> We want to use the main volume control for this, because there always is
> only 1 output mute LED and 1 input mute LED. Well at least that is the as=
sumption
> the current ledtrig-audio.c code has.

> The idea is to only turn the single LED on if we are sure there will be n=
ot
> sound output on any of the outputs, which is why we tie the LED to the
> mute switch on the main volume control.

Right, so that might work well on your particular system with your
particular configuration but will it work well on other systems with
different hardware?  It's not clear to me that it makes sense to go
through all the drivers picking controls that might be used for this
purpose - it seems both time consuming and error prone.  Consider a
mostly digital device which has an ADC/DAC per input/output rather than
a central ADC/DAC with analogue muxing for example, or a system with
multiple DACs available for mixing together or analogue bypassess. =20

--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1DJkACgkQJNaLcl1U
h9CsEwf9HLUg51//3aLHr6LEUkFRw96OyXYHUuUREk7b/Y8iHMPQF0I4STOoCp6C
p0BhHzB/lJwxZ3R71n7EMlkb5STgMUCsmtMkP8GfT1/sAnACUkq1ucM4nkQ5f6dR
pIRvrMQNmULtGT3TfgGy41sbg9NCn5k1Qrmldl01YDXrWaiyAQUdGXDoPgEcJNw9
HMZLbcXOsDk6B5jEGRKLIC2qaf1Y6+bxqX8zKiSfGyhkYQ+JBLfjFliIfRLyEiHG
ufvHsX0VWYbyvYcz09Jj9LxQ+9zkweCjjw3xAL1k9lMfcB6412WhyiSC7Yth6c4p
sJvLgoK2TO3dedLKZDjVWL4BV7sazg==
=5YNV
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--
