Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD689AC0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 12:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473E5167F;
	Mon, 12 Aug 2019 12:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473E5167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565604262;
	bh=3S+0gZJTrRfXZM4f9SF7e5pA4YqKW3/7B1GtwGciwHk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjWTu4vZfCq4fumEKsT/wX8xg3AdKJSZohUtZzrxlulJejdAuOrQ0vcjwCwsTbMyn
	 9P65OB7ZIkNI2+xC7jZMJikLNtM5YF6Jx8NNnXrLxcjqmXe6UfcFYIZq7S9BKFI8mq
	 HnyxLqukbTrw7PYPKOg0YeRBo3PU6IcBeXUebthA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3C7F801EB;
	Mon, 12 Aug 2019 12:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 796A3F80213; Mon, 12 Aug 2019 12:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C045FF8015A
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 12:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C045FF8015A
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0A47560008;
 Mon, 12 Aug 2019 10:02:31 +0000 (UTC)
Date: Mon, 12 Aug 2019 12:02:31 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Message-ID: <20190812100231.wlxitekfojr4jaki@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <2092329.vleAuWJ0xl@jernej-laptop>
 <20190731122953.2u3iabd6gkn7jv7k@flea>
 <1589203.0AjJVEASy3@jernej-laptop>
 <CAGb2v66D4-QvWYPXE=rf6Zv93X1LjnxUgpk+5wdAL_b7MM3vaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v66D4-QvWYPXE=rf6Zv93X1LjnxUgpk+5wdAL_b7MM3vaA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Christopher Obbard <chris@64studio.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Code Kipper <codekipper@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 6/9] ASoC: sun4i-i2s:
 Add multi-lane functionality
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
Content-Type: multipart/mixed; boundary="===============1475792127538148524=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1475792127538148524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tzqsccmfdz6gxrw"
Content-Disposition: inline


--4tzqsccmfdz6gxrw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 02:22:13PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 1, 2019 at 1:32 PM Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> >
> > Dne sreda, 31. julij 2019 ob 14:29:53 CEST je Maxime Ripard napisal(a):
> > > On Tue, Jul 30, 2019 at 07:57:10PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne torek, 04. junij 2019 ob 11:38:44 CEST je Code Kipper napisal(a=
):
> > > > > On Tue, 4 Jun 2019 at 11:02, Christopher Obbard <chris@64studio.c=
om>
> > wrote:
> > > > > > On Tue, 4 Jun 2019 at 09:43, Code Kipper <codekipper@gmail.com>=
 wrote:
> > > > > > > On Tue, 4 Jun 2019 at 09:58, Maxime Ripard
> > > > > > > <maxime.ripard@bootlin.com>
> > > >
> > > > wrote:
> > > > > > > > On Mon, Jun 03, 2019 at 07:47:32PM +0200, codekipper@gmail.=
com
> > wrote:
> > > > > > > > > From: Marcus Cooper <codekipper@gmail.com>
> > > > > > > > >
> > > > > > > > > The i2s block supports multi-lane i2s output however this
> > > > > > > > > functionality
> > > > > > > > > is only possible in earlier SoCs where the pins are expos=
ed and
> > > > > > > > > for
> > > > > > > > > the i2s block used for HDMI audio on the later SoCs.
> > > > > > > > >
> > > > > > > > > To enable this functionality, an optional property has be=
en
> > > > > > > > > added to
> > > > > > > > > the bindings.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > > > >
> > > > > > > > I'd like to have Mark's input on this, but I'm really worri=
ed
> > > > > > > > about
> > > > > > > > the interaction with the proper TDM support.
> > > > > > > >
> > > > > > > > Our fundamental issue is that the controller can have up to=
 8
> > > > > > > > channels, but either on 4 lines (instead of 1), or 8 channe=
ls on 1
> > > > > > > > (like proper TDM) (or any combination between the two, but =
that
> > > > > > > > should
> > > > > > > > be pretty rare).
> > > > > > >
> > > > > > > I understand...maybe the TDM needs to be extended to support =
this to
> > > > > > > consider channel mapping and multiple transfer lines. I was t=
hinking
> > > > > > > about the later when someone was requesting support on IIRC a=
 while
> > > > > > > ago, I thought masking might of been a solution. These can wa=
it as
> > > > > > > the
> > > > > > > only consumer at the moment is LibreELEC and we can patch it =
there.
> > > > > >
> > > > > > Hi Marcus,
> > > > > >
> > > > > > FWIW, the TI McASP driver has support for TDM & (i think?) mult=
iple
> > > > > > transfer lines which are called serializers.
> > > > > > Maybe this can help with inspiration?
> > > > > > see
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tre
> > > > > > e/s
> > > > > > ound/soc/ti/davinci-mcasp.c sample DTS:
> > > > > >
> > > > > > &mcasp0 {
> > > > > >
> > > > > >     #sound-dai-cells =3D <0>;
> > > > > >     status =3D "okay";
> > > > > >     pinctrl-names =3D "default";
> > > > > >     pinctrl-0 =3D <&mcasp0_pins>;
> > > > > >
> > > > > >     op-mode =3D <0>;
> > > > > >     tdm-slots =3D <8>;
> > > > > >     serial-dir =3D <
> > > > > >
> > > > > >         2 0 1 0
> > > > > >         0 0 0 0
> > > > > >         0 0 0 0
> > > > > >         0 0 0 0
> > > > > >     >
> > > > > >     >;
> > > > > >
> > > > > >     tx-num-evt =3D <1>;
> > > > > >     rx-num-evt =3D <1>;
> > > > > >
> > > > > > };
> > > > > >
> > > > > > Cheers!
> > > > >
> > > > > Thanks, this looks good.
> > > >
> > > > I would really like to see this issue resolved, because HDMI audio =
support
> > > > in mainline Linux for those SoCs is long overdue.
> > > >
> > > > However, there is a possibility to still add HDMI audio suport (ste=
reo
> > > > only) even if this issue is not completely solved. If we agree that
> > > > configuration of channels would be solved with additional property =
as
> > > > Christopher suggested, support for >2 channels can be left for a la=
ter
> > > > time when support for that property would be implemented. Currently,
> > > > stereo HDMI audio support can be added with a few patches.
> > > >
> > > > I think all I2S cores are really the same, no matter if internally
> > > > connected to HDMI controller or routed to pins, so it would make se=
nse to
> > > > use same compatible for all of them. It's just that those I2S cores=
 which
> > > > are routed to pins can use only one lane and >2 channels can be use=
d only
> > > > in TDM mode of operation, if I understand this correctly.
> > > >
> > > > New property would have to be optional, so it's omission would resu=
lt in
> > > > same channel configuration as it is already present, to preserve
> > > > compatibility with old device trees. And this mode is already suffi=
cient
> > > > for stereo HDMI audio support.
> > >
> > > Yeah, it looks like a good plan.
> > >
> > > > Side note: HDMI audio with current sun4i-i2s driver has a delay (ab=
out a
> > > > second), supposedly because DW HDMI controller automatically genera=
tes CTS
> > > > value based on I2S clock (auto CTS value generation is enabled per
> > > > DesignWare recomendation for DW HDMI I2S interface).
> > >
> > > Is that a constant delay during the audio playback, or only at startu=
p?
> >
> > I think it's just at startup, e.g. if you're watching movie, audio is i=
n sync,
> > it's just that first second or so is silent.
> >
> > >
> > > > I2S driver from BSP Linux solves that by having I2S clock output
> > > > enabled all the time. Should this be flagged with some additional
> > > > property in DT?
> > >
> > > I'd say that if the codec has that requirement, then it should be
> > > between the codec and the DAI, the DT doesn't really have anything to
> > > do with this.
> >
> > Ok, but how to communicate that fact to I2S driver then? BSP driver sol=
ves
> > that by using different compatible, but as I said before, I2S cores are=
 not
> > really different, so this seems wrong.
>
> Maybe we could make the DW-HDMI I2S driver require the I2S clock be on all
> the time? You wouldn't need any changes to the DT.

That's an option, but I'd really like to avoid it if possible.

I guess we could also just add a delay in the powerup path in the HDMI
case? Would it work?

maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4tzqsccmfdz6gxrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVE5NwAKCRDj7w1vZxhR
xaLkAP9Dau8CFZaqjfYlG8eEMwwmDGnmJ3Qb+OfrtRI9IxfL8AEA9pf3QqqQHWty
49bPYoHYZSaMSKd3MPMDdPL5aONO1Q8=
=l/Kl
-----END PGP SIGNATURE-----

--4tzqsccmfdz6gxrw--

--===============1475792127538148524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1475792127538148524==--
