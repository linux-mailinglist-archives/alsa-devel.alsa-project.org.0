Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3271634A1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 22:18:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA5A1697;
	Tue, 18 Feb 2020 22:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA5A1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582060706;
	bh=nHRe/OQ2NNaFnMFw+r3Zig6NYE3+s2YyUxjjdOPXYgE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A6iuVdD9C5KvmmZNO9iADWqEXx+VEM2Z7tjCyrB2Cyp5yWObf6eMWEXbiKo9qJrOD
	 qOES5kpgihT+36qKG9+Hsk7jRdJY+oiikDRhBOLspOxA+pm27rBgA8BJMpGvna1R+X
	 myplTPuvvlSKo+NoH1mZC0TJ7U+ixsj3Inq+pESc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82B1F8014A;
	Tue, 18 Feb 2020 22:16:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C0BFF80148; Tue, 18 Feb 2020 22:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE515F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 22:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE515F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="y7zAP7mI"
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 608962176D;
 Tue, 18 Feb 2020 21:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582060594;
 bh=nHRe/OQ2NNaFnMFw+r3Zig6NYE3+s2YyUxjjdOPXYgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y7zAP7mI4BoxJuQNsqJptFo6ZghaJ17vMGaG6n5RelnvtoWt/526lB0/X+oDQk9ot
 eOzzgdEv0ignCkP/sp10HHlz2ZVEOzmnJCFR5eIuMqoszSlrK8oFf/BFcEFrpWWWsy
 tDV8eD6HOSCHhi8gZzbgeVNp3E8mRdqHJ8NquUYc=
Received: by earth.universe (Postfix, from userid 1000)
 id C514B3C0C83; Tue, 18 Feb 2020 22:16:31 +0100 (CET)
Date: Tue, 18 Feb 2020 22:16:31 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200218211631.fxojsxzvttoidfed@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2rxpqdecy453qod"
Content-Disposition: inline
In-Reply-To: <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--v2rxpqdecy453qod
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 18, 2020 at 02:43:19PM +0200, Peter Ujfalusi wrote:
> On 18/02/2020 1.10, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
> >> On 14/02/2020 19.03, Tony Lindgren wrote:
> >>> But right now in droid4 voice call case mcbsp is just the i2s transpo=
rt,
> >>> and everything happens betwee the modem and the cpcap pmic.
> >>
> >> Iow you don't need McBSP DAI at all. If you would have added the dummy
> >> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
> >> or McPDM...
> >>
> >> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
> >=20
> > Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
> > mcbsp for voice call.
> >=20
> > According to Sebastian sounds like mcbsp can be idle at that point.
> >=20
> > But what about capture of voice call at the mcbsp from the
> > TDM slot? In that case mcbsp would be active.
>=20
> Sure, but with the dummy dai it won't....
>=20
> If I understand correctly the HW setup:
> McBSP2 -> CPCAP_hifi (only playback)
>
> CPCAP_voice is the i2s clock master.
> McBSP3, CPCAP_voice, MDM6600 and WL1285 are all connected together via
> i2s lines.
>=20
> In case of Voice call with analog mic/speaker only CPCAP_voice and
> MDM6600 is used.
> In case of Voice call with BT only MDM6600 and WL1285 is used (but
> CPCAP_voice must provide the clocks?)
> In case you would have any algorithm running on OMAP4 for the calls,
> then you will have McBSP3 inserted and used between MDM6600 and
> CPAC_voice/WL1285.
> Similarly, if you would like to tap in and record the data from the bus
> you will have McBSP3 enabled.
>=20
> The simplest use cases you want to support:
> A. McBSP3 <-> CPCAP_voice (playback/capture)
> B. MDM6600 <-> CPCAP_voice (handset mic/speaker voice call)
> C. MDM6600 <-> WL1285 (BT voice call)
> D. McBSP3 <-> BT (VoIP?)

Your description matches my understanding of the hardware setup.

> I would not bother with recording the call as you would need tom
> reconfigure the McBSP playback pin (is it even possible) as input to
> OMAP4, I think..
>=20
> B/C is codec2codec, McBSP3 is not involved at all.
> A/D is when McBSP3 is used only.
>=20
> Imho this can be represented as
> McBSP2: 1 port
> 	1.1: to CPCAP_hifi
>=20
> McBSP3: 1 port, 2 endpoint
> 	2.1: to CPCAP_voice
> 	2.2: to WL1285
> CPCAP: 2 ports
> 	hifi:	3.1: to McBSP2
> 	voice:	4.1: to McBSP3
> 		4.2: to MDM6600
> MDM6600: 2 ports

I suppose you mean 1 port, 2 endpoints?

> 	5.1: to CPAC_voice
> 	5.2: to WL1285
> WL1285: 2 ports

and here too?

> 	6.1: to McBSP3
> 	6.2: to MDM6600
>=20
> The machine driver should switch between the graph links based on the
> use case for the interconnected devices:
> A: 2.2 <-> 4.1
> B: 4.2 <-> 5.1
> C: 6.2 <-> 5.1
> D: 2.2 <-> 6.1
>=20
> Can a generic card provide such a functionality?

I suppose in the end its a question if generic card can provide TDM
support.

> In case of B/C you should not have a running stream imho.

I would expect, that MDM6600 codec marks itself as running/stopped
based on call state. That should enable DAPM widgets automatically
when CPCAP_voice is routed to MDM6600?

> In all cases CPCAP_voice should be able to run the clocks on i2s,
> even if it is not used by the audio setup.
> Not sure if you can just turn Wl1285 as master, but it is possible
> that it is master, but silent when it is not used?

I provided CPCAP registers for BT call, which should be enough to
figure this out (I did not yet analyze the results myself).

> I'm not sure if we should span out dummy dais for endpoints within a
> port. Imho the port _is_ the dai. Different endpoints might use
> different TDM slots on the port (or the same slot, which makes them
> exclusive).

Makes sense to me.

-- Sebastian

> >>>>>> I know it was discussed, but can not find the mail:
> >>>>>> Can you brief again on the audio connection?
> >>>>>
> >>>>> Below is a link to a mailing list thread where Sebastian describes
> >>>>> the audio connection:
> >>>>>
> >>>>> https://lkml.org/lkml/2018/3/28/881
> >>>>
> >>>> Thanks!
> >>>> =20
> >>>>>> Do you have branch with working code?
> >>>>>
> >>>>> Yeah I have slightly older set of the patches in my droid4-pending-=
v5.5
> >>>>> kernel.org git branch with voice calls working.
> >>>>
> >>>> I think I should put my droid4 out and try to get it working...
> >>>> Do you have a link for dummies to follow to get started? ;)
> >>>
> >>> Probably the easiest one to use right now is the Maemo-leste devuan b=
ased
> >>> test image using v5.5 kernel + modem and audio patches:
> >>>
> >>> https://leste.maemo.org/Motorola_Droid_4
> >>>
> >>> Just use a decent speed micro-sd card rated "a1" for example.
> >>
> >> Cool. Now I can dual boot the droid4 :D
> >> I needed to rewrite the /etc/shadow to get a known root password so I
> >> can log in.
> >=20
> > Not sure if you mean password for the droid4-kexecboot or the
> > Linux distro you installed..
>=20
> It was for the maemo-leste.
> Bringing up Gentoo will be a bit harder as I don't have wifi stuff in my
> reference image...
>=20
> > But for droid4-kexecboot, you
> > can configure it to automatically download new kernels over wlan.
> > There's some info on the machine specific password and how to
> > configure wlan in the droid4-kexecboot buildroot commits here:
> >=20
> > https://github.com/tmlind/buildroot/commits/droid4-kexecboot-2017.11
> >=20
> >> Wifi is up, so in theory I can scp kernel/dtb to /boot/boot/ and update
> >> the /boot/boot/boot.cfg to boot my kernel, right?
> >=20
> > Yeah you can update kernels and modules over wlan from the distro(s)
> > you have configured, and also from droid4-kexecboot as above.
>=20
> I need to try droid4-kexecboot's wifi support then.
>=20
> > And note that kexecboot looks for a boot/boot.cfg file to use on
> > every usable parition it finds and uses all the found entries
> > based on the priority configured for the boot.cfg entry.
>=20
> OK, thanks!
>=20
> >=20
> > Regards,
> >=20
> > Tony
> >=20
>=20
> - P=E9ter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--v2rxpqdecy453qod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5MVCwACgkQ2O7X88g7
+prLEg/+LPnmQMNYZFn441eV+SUTJC1FrKxWZlFyXlsRtSFojK4ZttcG0R+h640J
ZwgSmVpmwIKLk/Z4e/b9NmaP4f0b3KJj1IGYV7oAxDWetH+Bo1FbHs7NCYKszZ/H
gEvuoWUktSAho9zK8cXF2p395wVsLUSEwIUWAKzrzQ+5P58Mh8Tn0bQlU4oSZmHh
I+b23pxVNCdjb4O4SiwZDp1uccYLVCLW6Nj/qh4Aq9L1d8c/gDupPbnwd6JMZ8iL
DuOzLykqmcJttxCw1IoXFmZDH3oA3hBP7vmQXwOYMcetCUKOpQYSCSgJISemIAj9
FDgSR6f8+OhDHUwZLkmB5NZIEtsBFLMV9rYe7tTeNJezI4UNK8r0nNBBQUn7RmrF
oFgVwdKBdHByFQQK6+I+3FuJHg8MN4fOO71BB+biI6PHEiyMcPx/DQRpONi98zKb
FlFjSDJbAEpOlfHKbYj1q/yvxj5+jzpVuMwvaA4gpX0SUCLpttHA9AHA7F4LekdN
Kh0QMVm8zKjBD6/DWReAYWY4nbB+Vo2ywzFshAmgJ+vOYY71RKOT7johmyFecZ66
nF4lN4eiecv3Cr9EHmBHfnBW5K4mo25KNyFAzEXzuAsY+FYrWRhvIgw+vv+i7B6o
7NUDeBmzSF6+/TyVflHwXatpbeQwZbVG+R7/2C/F9inEFcAbxR0=
=mPEo
-----END PGP SIGNATURE-----

--v2rxpqdecy453qod--
