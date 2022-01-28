Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78649FE96
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 18:01:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A74516F8;
	Fri, 28 Jan 2022 18:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A74516F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643389300;
	bh=8P+eSAgNnOF31pPTRXsOW177v5RTTaG7c1RirRI5f88=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUC7b7ox2S32OQcFpIaI/LLdC4V7lBVKq3jJJr8Wl/grov0Pd9xNSUaLO7fcB3xUs
	 wXJGeyJ3q01yKtTFomb+YYeZ4NKNxZlNHa6GVGgurLWBmVu7yX/Ip1Oiw6kafPV12t
	 p+qA7JVGe7H15vb3UnQDmuVpSiA89bTrd3IRtzgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748D2F80118;
	Fri, 28 Jan 2022 18:00:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C65A3F80240; Fri, 28 Jan 2022 18:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9985F8014B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 18:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9985F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ek7JBFVb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28C98B8265C;
 Fri, 28 Jan 2022 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08CEC340E0;
 Fri, 28 Jan 2022 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643389225;
 bh=8P+eSAgNnOF31pPTRXsOW177v5RTTaG7c1RirRI5f88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ek7JBFVbr8vzwneEhGVC43+FRdGQfVrNfUPV9kFOT3AeeKnhz12EzAHlrmGbCmjhU
 eYRdf6op4KewyhW6/xS8HT7sYy+Dwb0aFuaoVUwaGZ4Qd/DeelcuHdVmp1tcCmZFQa
 bz0WssfuETQFvm/UAg5sIVOWLAI39pBpxH42O3bVVE77TECgOM2MrEVQNLBU2VOzN4
 ny+L/q3ytsGrHcr0cioxzXMOdIGMD0aIXYpPyCaxnl13kGAXJL5rufE9BREUCD8COY
 hNAbgO/HxVrH4PHToXl3no672xDKuorbNdypbQRQCYmYRjBKFl3FDpJSaGe4xwSoQF
 mf8013vSkbwSg==
Date: Fri, 28 Jan 2022 17:00:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YfQhIoXTkzO9AEQc@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IkUs8IX5Ny/ppcLc"
Content-Disposition: inline
In-Reply-To: <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
X-Cookie: Torque is cheap.
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--IkUs8IX5Ny/ppcLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 02:39:56PM +0100, Cezary Rojewski wrote:
> On 2021-12-24 2:06 PM, Mark Brown wrote:
> > On Wed, Dec 08, 2021 at 12:12:24PM +0100, Cezary Rojewski wrote:

>   1/37 ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
>   2/37 ALSA: hda: Update and expose snd_hda_codec_device_init()
>   3/37 ALSA: hda: Update and expose codec register procedures
>   4/37 ALSA: hda: Expose codec cleanup and power-save functions
>   6/37 ASoC: Export DAI register and widget ctor and dctor functions
>=20
> As current RFC allows one to see the reasoning behind adding these five
> patches, I believe they could be sent as a separate series. A cover letter
> for that series would mention their purpose nonetheless of course.
> Note: patch 6/37 has been re-ordered with 5/37 as 6th patch fits the
> generic-theme whereas 5th I believe does not.

The first 5 also need review from Takashi more than me.

>   Note: patches 21-24/37 get reordered to prepend topology and path
> management (currently, patches 18/37 and 19/37 respectively). While right
> now I don't see a reason for doing so, this also provides a possibility f=
or
> separation or division of these last two mentioned patches if need be.

Part of the question is if path management is even something we want at
the driver level or if it should be done at more of a framework level.
Something that splits out any externally visible effect of that for
separate consideration would help a lot with reducing the cognative load
here.  The issue isn't just the sheer size, it's also that it's not just
a routine driver.

> > One is the paths code which feels like something that should
> > perhaps be pulled up a level to the framework since it feels like
> > the problems that it is addressing are general problems that all
> > DSPs face.  Doing something like hard coding this to some very
> > simple use case that does minimal to no processing would allow
> > the driver to load and function, then the path code can get a
> > proper review separately.

> Must admit, right now I'm not seeing what could be added from avs-path in=
to
> the framework. Not saying 'no', just after seeing the avs_path stripped f=
rom
> all the cAVS firmware specifics there's basically nothing left.

AIUI the firmware itself has a bunch of DSP modules that can be
dynamically instantiated and what the path stuff is doing is providing
fixed sets of instantiations that can be switched between.  It seems
like it should be possible to pull out the bit where we have sets of
modules we can instantiate from the mechanics of knowing what modules
are there and actually setting them up and tearing them down, other DSP
implementations would probably be able to benefit from that (at least
the larger ones) and I imagine more advanced users would find it useful
to be able to reconfigure the DSP pipelines separately from getting
firmware releases.

> Let's take a look at the standard path (discarding all the conditional pa=
th
> bits):

> struct avs_path {
> 	u32 dma_id;
> 	struct list_head ppl_list;
> 	u32 state;
>=20
> 	struct avs_tplg_path *template;
> 	struct avs_dev *owner;
> 	/* device path management */
> 	struct list_head node;
> };

> 'dma_id' and 'template' are avs-driver specific. To be honest, stream
> division into pipelines and modules as done in cAVS firmware is also
> specific and a different DSP or a different firmware may expect things to=
 be
> laid out differently, so 'ppl_list' is yet another candidate for not being
> framework friendly.

I suspect that at least the template could be pulled apart, and that the
DMA ID is identifying one end of the pipeline which seems like a concept
that could be made generic, even though the specific implementation of
it is going to be firmware/hardware specific.

> TLDR:
> avs_path is basically a wrapper for a list of pipelines which shape given
> stream - from ASoC side, that's a FE <-> BE relation. These pipelines exi=
st
> only on the DSP side and are tied to cAVS firmware expectations and
> architecture. Again, if one strips the avs_path interface from cAVS IPC
> logic, then there's basically nothing left.

I think part of the problem here is that there's missing framework,
coupled with the scaling issues that DPCM has.  Ideally routing in a
digital context shouldn't be fundamentally different to how we route in
an analogue context, there's new bits needed for format management (both
tracking what's valid and ensuring there's appropriate conversions) and
we really want to be able to dynamically add and remove purely software
components.  Unfortunately work on actually implementing this mostly
stalled out.

> We're open for more input from the users and distros. That does not mean =
we
> did not do our homework before moving to the coding part. In our research=
 it
> turned out that 'different device equals different card' is a popular and
> easy to follow notion. These results are of course influenced by the other
> OSes where such separation is more common and users got used to such mode=
l.

The user/distro thing is kind of separate to the splitting things out
into different devices thing (though there's overlap).  The issue for
users and distros is if they're OK with the change management that'd be
involved in shipping new firmwares and dealing with any user visible
changes.  The multiple cards thing is partly user visible but it's also
a framework thing - is the framework going to get confused trying to
join things up between different cards?  Especially with a DSP one can
imagine a use case where someone does something like play the same audio
stream to multiple devices for example.

> It's worth noting that we did make use of the APIs that are already
> available in ASoC. There are no hacks or hooks here, just the usage of the
> available interfaces. The granular-cards approach, while preferred, also

It's not just using the interfaces that exist, it's also using them in a
way that's (ideally) simple and idiomatic so that we don't make it hard
to refactor and improve things in future or otherwise create landmines
for ourselves.  It's a lot easier to not support something for now and
then extend the framework than to have to pull something too fancy out
of a driver.  There's tradeoffs for maintainability, in general we aim
to have drivers that are dumb or at least look a lot like each other so
that it's easier to work over the subsystem as a whole.

> By default, all the cards are independent of each other. avs-driver suppo=
rts
> 'cross linking' by the means of the conditional path. The 'conditional' i=
s a
> key word here. These paths are a 'side effect' of other paths being open
> simultaneously. If there requirements are not met e.g.: a FE is not runni=
ng

Right, this sort of thing is what I'm worried about with splitting the
cards - it's not impossible to manage but it's asking for trouble as
things change.

> In regard to quirk handling, could you elaborate? Right now all the
> supported cross linking and the machine board division scenarios are not
> causing any repercussions as it seems avs-driver gets credit for. I
> understand that it's good to think about far reaching consequences sooner
> than later, but the APIs allowing for the granular-card approach are here
> for a very long time and the card/device division has been seen in practi=
ce
> already.

We end up needing a lot of system specific quirks for x86 systems since
the idiom for ACPI firmware is to only have basic information in
firmware and rely on the OS using DMI information or something to figure
out critical bits of information about how the system is wired up.  Some
of that ends up in the CODEC drivers so should be easily shared but some
of it ends up in the various x86 machine drivers and if there's two
possible machine drivers for the same platform then both of them will
need to separately add any quirks.

> > It'd also be good to get this well enough integrated with the
> > intel-dsp-config code to avoid the need for the dependency on
> > SND_SOC_INTEL_SKYLAKE_FAMILY=3Dn.  If both are built then it could
> > start off with always require a command line override to select
> > the new driver with a _DSP_DRIVER_AVS constant, this can be
> > revisited later.  That mechanism is really nice for distros and
> > users since it allows people to do binary distributions without
> > having to worry about committing to one driver or another,
> > reducing the risks for things like breakage on upgrade for some
> > small subset of machines.

> Hmm.. this means that in time (once skylake-driver is removed) two values
> would translate to avs-driver selection rather than one. Value '2' is bei=
ng
> used for skylake-driver and we don't want to force users to manually chan=
ge
> it to anything else (i.e. to the to be added avs-driver selection value)
> when the time comes.

Yeah, that doesn't seem like an unreasonable outcome.  Thinking about it
I'm not sure the existing code handles the case where the user specified
a specific driver on the command line but then didn't actually build it
(which this'd just be a version of) well - haven't actually checked
though.

--IkUs8IX5Ny/ppcLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH0ISIACgkQJNaLcl1U
h9Al1wgAhFX6Ldo3ycv4Qc/G5XBrJWgVwbMBPaavnuQGlamN4Tuo9B+zCiowd2sQ
quTeRM+jmQoqG+C4cK/lNZiGXPQpoDfjRhywu1Bm7TLhRuH12rKQqgVAJln6TjCc
18Q+Bziks/6wZ6Pw8xWWbkbl5ksuxOQ+xWlGU9xFUpYAUu0q+fYbQCpzZdFH6rgG
Tb5G9++4tm9pQLYUHPKDWufiLz7lbVHQXlhIv7DIjwJP9dlaWpGDtk4LqJuj8oLH
l2z9bvDe35P8R4eLW41SmGk57yvlqKstYd/48SQaHISgInaXzVmjuNUF7u/9kv+z
osFzOMSVJ060vrsIwobyLTaxs903ZQ==
=y399
-----END PGP SIGNATURE-----

--IkUs8IX5Ny/ppcLc--
