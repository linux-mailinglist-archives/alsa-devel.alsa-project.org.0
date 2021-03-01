Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934663290F1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 21:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13481676;
	Mon,  1 Mar 2021 21:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13481676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614630131;
	bh=riNN5AkhhqpMqWWxNMDm8IlgcaChSCOJ+Em7RZPwhO8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZKNERxJumI9y7amsZSMWlPQqobD9KYxOmKlQs9QmeAh6eQRzDTCn1+pDWk0TJ4cX
	 RaHYPlgcJBrCXVJoeXc85kUHdwG+UM2TT/sTPCV6i3NzpDd4ZFuQHUcc7tDAXjbfOi
	 wN6ISC0ibH1xTzhz4+FdSK+jsk7W0HHZA8YWDoPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD3BF8026A;
	Mon,  1 Mar 2021 21:20:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC552F8025E; Mon,  1 Mar 2021 21:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11BEEF80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 21:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11BEEF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sk12AY0M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D605160235;
 Mon,  1 Mar 2021 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614630030;
 bh=riNN5AkhhqpMqWWxNMDm8IlgcaChSCOJ+Em7RZPwhO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sk12AY0McmGiDQ4KxtxagrVVCQl9lGdwCnTE2+2B9jvou6Oey+N5iCnd2CYtQv0B2
 pcHFtBf+f9G6IiySzjLFz1UHOtMlEZPJTDsxX8abcoHZTN9oitDzx4KPLWTWYfYde7
 MoRGuO5bmkjz7jY6ooIWTNmhR5vCs0KIRsJe5Icfz2pDcZqyWnU7Ja8AEZ5jfvMSWA
 +MO6DUiF3i0/f9VD3Yb654Jp1d9JlMVglPEqBNKzC7gC+GdeIcv/BroE+jxbJYmrH6
 BGPJ0aWMXIfsP3UUdsmZU8e4qJvcxiOPN8kZUOwrLYYoRcgusDIXkbV8hyL1ta0Pln
 CgghdBGiWN5eQ==
Date: Mon, 1 Mar 2021 20:19:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/5] ASoC: rt5640: Add emulated 'DAC1 Playback Switch'
 control
Message-ID: <20210301201923.GJ4628@sirena.org.uk>
References: <20210226143817.84287-1-hdegoede@redhat.com>
 <20210226143817.84287-4-hdegoede@redhat.com>
 <20210301185557.GG4628@sirena.org.uk>
 <23ef6073-ffeb-c7ea-1365-63f3e78f241d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline
In-Reply-To: <23ef6073-ffeb-c7ea-1365-63f3e78f241d@redhat.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 08:21:56PM +0100, Hans de Goede wrote:

> > This feels icky, it seems like if userspace needs to stitch together a
> > stereo mute control that doesn't already exist in the hardware

> But it does exist in the hardware the digital mixer bits around DAC1
> have some more functionality then those around DAc2, including a mixer
> directly behind the DAC1 volume-control which allows digital loopback.

Given that there's other inputs to the mixer (what with it being a mixer
and all) I'm not convinced about that?

> This is a nice hw optimization, but annoying to deal with in software,
> esp. since userspace generally expects a "Foo Playback Volume",
> "Foo Playback Switch" pair. By for the easiest way to deal with this
> is to undo the hw optimization in software and add the expected
> "Foo Playback Switch"

Eh, some userspace might have that expectation but it doesn't really map
onto general hardware designs.

> > from
> > existing mono controls then UCM ought to have support for figuring that
> > out anyway or if we *must* bodge this in the kernel there should be some
> > generic way of doing it rather than open coding in drivers.

> This is highly codec specific. So far this has not really been an
> issue because so far on asoc based systems regular Linux userspace has
> always been using software volume-control. But now that we are starting
> to use hardware volume-control it really is desirable to also have
> a hardware mute switch available.

There's a lot of things that would be desirable but aren't really
realistic...  there's a bunch of hardware that this model just plain
doesn't map onto.  I mentioned the wm5012 based systems in the other
thread - that's a fairly clear example where a singular DAC mute control
just doesn't correspond to the hardware design at all, it's got any to
any routing throughout the device with DACs at the outputs.

> > It also makes the whole mute LED thing feel a lot messier even for
> > existing systems than you seemed to be suggesting in the other thread.
> > This device has two I2S interfaces, two DACs (only one of which seems to
> > be affected by this control), and it appears that there's bypass path
> > from the ADC to DAC1 which won't be muted by the newly added mute switch
> > here so this reliable mute control won't be entirely reliable.  There
> > look to also be some analogue bypass paths, I didn't fully check.

> I don't believe that it is necessary to take bypass / loopback paths into
> account for the playback mute LED. These are normally always off and they
> don't involve the normal playback paths. So even if they are on any
> audio played from within the OS is still muted.

For me I would say that if the mute LED is on and I can hear audio
coming out of the system then there is a bug, probably also if I can
manage to record audio possibly depending on labelling.  This all very
clearly seems to be pointing towards this being a policy decision which
probably belongs in userspace.

> > One
> > could equally argue that a software defined mute control should be
> > muting all the analogue outputs, it'd certainly seem more robust.

> The mute switches in the analog output paths are part of the DAPM
> graph, which means that they will get turned off automatically to
> save power when the audio device is not playing audio (is not kept

So there's not actually any mute switches on the outputs for this
device then and it only has power controls?  In general device will
often have separate power and mute controls, especially with older VMID
based devices but that's often carried through to ground referenced
stuff.  This is yet another example of how devices may not conform to
random policy decisions userspace might want them to have.

> I honestly don't understand your objections against the current
> set of patches for dealing with the mute-led trigger. Your main
> worry seems to be that this is not flexible enough, but it currently
> is all handled inside the kernel. So if more complex cases come up
> then we can easily adjust the code to deal with this, since there
> is no userspace API part to worry about. And if these more complex
> cases do require more userspace involvement then we can worry about
> that then (and not now) when we actually have a concrete example of
> what such a more complex setup could look like and thus also have
> something to actually design any userspace api for this around.

All I've seen of this is the ASoC bits of this, including this series
and it's all fitting patterns that look like forcing policy decisions
into the kernel in ways that are hard to review - look at this patch as
an example of this, there's stuff like the handling of bypass paths
which you're dismissing.  You say "when we actually have concrete
examples of what such a more complex setup could look like" but this
very patch seems to be for a device that causes issues, and I keep
pointing at the wm5102 and similar devices which just break this model.=20

You have a clear model of what you want to do on your systems and are
trying to implement that but that model looks to have policy in it which
a resonable system integrator could want to decide differently even when
running on the same hardware.  If it is all handled inside the kernel
then it's a lot more painful to do anything about that than when it's
handled in userspace.

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA9TEsACgkQJNaLcl1U
h9CEsQf/dKWQxPqIr6tfyeo2PMRdET3Mdmez47EnkWYv2dAukmHQWb3VZvZkA++h
YxHh5SXumvTpTd4znvZh4mWVyJNjq5fV4WempwYhZMWB9h/FFt3egYRZWDb4szNf
22QQHcjnpeHiVLHdnFtPYkNE+gLIps39yq0EIYpPfm7Tx71QY4QRHuHqJLzWNg8C
sNuiFqgLw88DKfdrCCSWhDyhTj+D/ZHNv605rRqqFBFCT6YMzuEoaG7crzx/jWJ1
me02clg1gkPPJWjPNay2w0FD+92LnyyaPNTlAd/ibszDK00IbFkM1RXWst2DDZNh
PAYjxZN/HnggiKXuyf2soccU9DKbqQ==
=kj9z
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
