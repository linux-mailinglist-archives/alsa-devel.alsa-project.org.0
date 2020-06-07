Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70C1F0CBA
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 18:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AEC01665;
	Sun,  7 Jun 2020 18:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AEC01665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591545679;
	bh=hW04VBwJIndN1wJ6ID4qIeVMpcDRO0bmFDuP2V53zUU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=EPUYroW5wJsL1Drt1W2Bih5IOqIti+cMcN0aFIRvWmesz8aKYbltz16SP8nv/kjqr
	 uYFPmRZaYqpXcy7KzTc1z5Ai5/KY4kvP8IJyRuAtA5lmM8lMxwKQDrIFg9gT7v+zpt
	 4Ax8uc9pYYya8YiBA1hOvG1UZT6kLn9kYKhp7Bzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B61D8F800F4;
	Sun,  7 Jun 2020 17:59:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B20DCF8021E; Sun,  7 Jun 2020 17:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79668F800F4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 17:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79668F800F4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51706AC79;
 Sun,  7 Jun 2020 15:59:22 +0000 (UTC)
Message-ID: <ceef6f3cc9aa51518361a538523129aae0b41a38.camel@suse.com>
Subject: Re: ALSA control service in user space
From: Scott Bahling <sbahling@suse.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Sun, 07 Jun 2020 17:59:11 +0200
In-Reply-To: <20200605011843.GA268102@workstation>
References: <20200603100556.GA198303@workstation>
 <4c046724106e88b69584c6bf5604a5e7f7189c1f.camel@suse.com>
 <20200605011843.GA268102@workstation>
Organization: SUSE Software Solutions Germany GmbH
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-P4ww1VBl3P83m3RyA6Ib"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
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
Reply-To: sbahling@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--=-P4ww1VBl3P83m3RyA6Ib
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Fri, 2020-06-05 at 10:18 +0900, Takashi Sakamoto wrote:
> Hi Scott,
>=20
> On Thu, Jun 04, 2020 at 09:02:23PM +0200, Scott Bahling wrote:
> > Hi Takashi,
> >=20
> > On Wed, 2020-06-03 at 19:05 +0900, Takashi Sakamoto wrote:
> > > Now instead of Python 3, I select Rust language to write the server
> > > programs for audio and music units on IEEE 1394 bus. The hinawa-rs he=
lps
> > > the third and fourth of the above tasks.
> >=20
> > What does this mean for the future of hinawa-utils?
>=20
> I'm sorry to puzzle you but I shift my effort of userspace applications
> from hinawa-utils into the services.
>=20
> As you can see, Python 3 scripts in hinawa-utils depends on 'libhinawa 1'
> which produces 'Hinawa-2.0.gir'. On the other hand, libhinawa 2 produces
> 'Hinawa-3.0.gir'. Although hinawa-utils needs to be arranged for its
> dependency to the latest libhinawa, at present I have no plan for it due
> to the rest of my time... Therefore hinawa-utils is actually going to bec=
ome
> abandoned now at least Python 3 areas, unfortunately.
>=20
> > I have created an OSC server interface[1] to the Tascam FW-1884 control
> > surface using a fork of the hinawa-utils with a few enhancements[2]. Th=
e
> > OSC server works great for controlling applications like Ardour with th=
e
> > FW-1884.
>=20
> I'm interested in Open Sound Control protocol itself, and I would use it
> if I were a developer out of alsa-project. However it's secondary option
> to me if any ALSA interface assists me to achieve the aim.
>=20
> Now I made the repository public[1] for your information. The 'topic/work=
'
> branch includes the latest codes for the services[2]. You can see many
> protocols are already added. (The most of them are just makeshift...)
>=20
> For Tascam FireWire series, I uses two types of ALSA interfaces for
> inter-process communication between the service and ALSA applications:
>=20
> - interface on ALSA control character device
> - interface on ALSA sequencer character device
>=20
> For FW-1884, below elements are transparently visible for ALSA control
> applications (e.g. amixer, qashctl):
>=20
>  * clock-source
>  * clock-rate
>  * input-threshold
>  * coax-output-source
>  * master-fader-assign
>  * host-mode
>  * opt-output-source
>  * spdif-input-source
>  * monitoring (to start polling for below elements)
>  * monitor-rotary (readonly)
>  * solo-rotary (readonly)
>  * input-meters (readonly)
>  * output-meters (readonly)
>  * detected-clock-source (readonly)
>  * detected-clock-rate (readonly)
>  * monitor-meters (readonly)
>  * analog-mixer-meters (readonly)
>  * monitor-mode (readonly)
>=20
> Additionally, 'FW-1884' port is opened to ALSA Sequencer. The events gene=
rated
> by touching control surfaces such as fader, rotary are converted to stand=
ard
> MIDI messages and sent to the port. Any ALSA Sequencer application can re=
ceive
> the messages via the port. Ardour is such an application.

Very nice! I'm particularly interested in the monitoring controls which is
currently missing and would be useful.

> You can see the conversion in 'src/tascam/isoch/seq_ctl.rs'[3] and everyt=
hing
> is hard-coded. It's possible to be more inconvenient than your implementa=
tion.
>=20
> > I was just cleaning up the code and was prepared to submit my patches f=
or
> > hinawa-utils, but if that will go unmaintained, I might just integrate =
the
> > hinawa-utils parts into my OSC server code and only depend on libhinawa
> > directly. What do you recommend?
> >=20
> > [1] https://gitlab.com/tascam-fw-1884/tascam-fw-osc
> > [2] https://github.com/sbahling/hinawa-utils/compare/master...fw-1884
>=20
> The integration into your repository is easy and convenient to you. I
> recommend it. But I'm welcome your comment and patches for the service it=
self
> when the service officially starts for public development.
>=20
>=20
> Well, from my interests, how do you implement to blight 'REC' LEDs? It's =
my
> concern when using ALSA Sequencer because MIDI standard has no
> specification to associate LED and messages.

With Ardour OSC the state of record enable/disable for each channel is sent
using the following message format:

command           channel  state=20
/strip/recenable  1        1
/strip/recenable  1        0

I listen for those events and turn the LED on or off depending on the state
of channel it's assigned to.  For a MIDI implementation if there is not a
standard, I guess you need to just pick a note or control signal to use.
There seems to be no standard for many controls and different units have
their own MIDI mappings.

An example of mappings can be found in the Ardour code[ [1]. A description
of how map MIDI messages to Ardour actions is in the docs [2]. Unfortunatel=
y
,given no standard, each application needs to be configured/adjusted to use
any particular controller. Even with my OSC implementation I have API
translation service to translate the general FW-1884 API that I came up wit=
h
to specific applications like Ardour.

I looked into MIDI briefly at first, but an OSC implementation seemed easie=
r
and more flexible to me. I think it's a better fit for complex control
surfaces. But it's not as ubiquitous as MIDI so a MIDI implementation would
be useful.

[1] https://github.com/Ardour/ardour/tree/master/share/midi_maps
[2] https://manual.ardour.org/using-control-surfaces/generic-midi/midi-bind=
ing-maps/

Scott

--=-P4ww1VBl3P83m3RyA6Ib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQjvzoZ9RLbHiUT/sAst8aI6UpxIFAl7dDs8ACgkQAst8aI6U
pxIzkg/+LtCsBRPF1N/95CmH0agogW1qK/+IbbSVoAp0HHpJE2lvYujyWF2H/54y
hrAqBSA5y09mlNbBcXecXDaiDfNwZJzbELIlIKes8MuOX/XIIMBAtl+ecplKOMID
pi0NIPtQp05qDEFBK8IFVoTA9VhUlxHD3Y0rmnhhhxOyq4pVAZ4SYeA7jERffwec
sJVCFz8FEw6COtKZKxore/ABeD3+BYVsxxd4MYjgecT0F2LKI4iyFwpK/4y3lupJ
8eDUOGE37Eo7M9WAn7PBgxOmb8k9p1EsLWzhLkk39uu6Wcb9pG20U7s+EJxnlSZM
EuJku10aGrl/6fsp50cabw9iDoyL3Xn41ew9x+zVUSLEwZtiiZNw6LDG3aqk8iBo
tgkbnwQnlYpSpuasRuL57IV4Yq9pCDMtnfEysHVwdRIDJv7coDvMVDleV1amw5iw
lFzdkalyHLrmXVg6hZ8qvkNAEB68iYPY8QNqS3C70KJnnfd5tVDDnOB4Xxt0CWCs
jBO1t4G4ON88d3fzrExPOVADL4MvwBSdvkv+DxvXGNeH+AK4rbMpH3dkrMVWExuf
3SM+tgKzOdtJoMAYmo7rARfCTgazR7MEmmd2yjOKAJntLZViKJamsIC4hyb8j4VX
E/W352TNylks/5HbbHrOBvHlvMIVcUYHVMfHZcFaqczYL4DjPGY=
=+Rk4
-----END PGP SIGNATURE-----

--=-P4ww1VBl3P83m3RyA6Ib--

