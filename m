Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30144825556
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 15:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C638CE96;
	Fri,  5 Jan 2024 15:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C638CE96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704465149;
	bh=FGs+5L0/QduZgoKrI9nOSDC/2ZJfCtlXqxUUjzHMF2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W8d7J+VHv1xwTWP/5swTuXehmEyrCC6MWPYjtiUWN4XG93T/XoQmnVX/Nzex5oHKR
	 MRiFFvYQGQoVEOVaETvjVeNVdCYaxX/8kMb32sxEykG1Tj3wMShpK9ZWuR5iKjY8yt
	 hNUQ/fMWV9lq72KXMEkpQe8yeikOv6grzi5xffNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57BE2F80567; Fri,  5 Jan 2024 15:31:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A248EF80548;
	Fri,  5 Jan 2024 15:31:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE5AF804B0; Fri,  5 Jan 2024 15:31:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A95FEF8011B
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 15:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A95FEF8011B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rLlEH-0002Kr-D9; Fri, 05 Jan 2024 15:31:21 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rLlEF-000baM-VY; Fri, 05 Jan 2024 15:31:19 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rLlEF-000BgI-2u;
	Fri, 05 Jan 2024 15:31:19 +0100
Message-ID: <c15f1a71b01f7d3985ee8d3b42b6e1ae0dddd235.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sean Anderson
 <sean.anderson@seco.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,  Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,  Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 05 Jan 2024 15:31:19 +0100
In-Reply-To: <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
	 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
	 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
	 <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
	 <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
	 <fcbae47b-3b28-42f0-b93f-f83932025dc1@linaro.org>
	 <2be19fbf-4c73-4594-be42-31587dc7b747@seco.com>
	 <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GQ4UVECEPIWDEVATGE7W2L6QBUSWV7QU
X-Message-ID-Hash: GQ4UVECEPIWDEVATGE7W2L6QBUSWV7QU
X-MailFrom: p.zabel@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQ4UVECEPIWDEVATGE7W2L6QBUSWV7QU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Do, 2024-01-04 at 20:08 +0100, Krzysztof Kozlowski wrote:
> On 04/01/2024 17:30, Sean Anderson wrote:
> > On 1/4/24 11:08, Krzysztof Kozlowski wrote:
> > > On 04/01/2024 17:04, Sean Anderson wrote:
> > > > On 1/4/24 03:57, Krzysztof Kozlowski wrote:
> > > > > The driver (reset consumer) knows when it is safe or not. You mus=
t
> > > > > implement proper reset handling in your driver.
> > > >=20
> > > > The driver has no idea whether it is safe or not. It just calls
> > > > reset_assert/deassert at the appropriate time, and the reset
> > > > framework/controller is supposed to coordinate things so e.g. the d=
evice
> > > > doesn't get reset multiple times as multiple drivers all probe.
> > >=20
> > > Sorry, then I don't get what you refer to. The driver calls deassert
> > > when it is safe for it to do it, so the driver *knows*. Now, you clai=
m
> > > that driver does not know that... core also does not know, so no one =
knows.
> >=20
> > Yes! That is the problem with this design. Someone has to coordinate th=
e
> > reset, and it can't be the driver. But the core also doesn't have enoug=
h
> > information. So no one can do it.
>=20
> The point is that the driver coordinates.

Currently the reset controller API supports two types of shared resets.
I hope distinguishing the two types and illustrating them helps the
discussion:

1) For devices that just require the reset to be deasserted while they
are active, and don't care otherwise, there is the clk-like behavior
described in [1].

  requested reset signal via reset_control_deassert/assert():
    device A: =E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA\=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA=
=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=
=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA
    device B: =E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=
=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA\=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=
=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA

  actual reset signal to both devices:
              =E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA\=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=
=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=BA=E2=8E=
=BA

In this scenario, there should be no delays in the reset controller
driver. reset_control_deassert() may return as soon as the physical
reset signal is deasserted [2]. Any post-deassert delays required by
the devices are handled in the device drivers,=C2=A0and they can be
different for each device. The devices have to be able to cope with a
(much) longer post-deassert delay than expected (e.g. device B in this
case). It is assumed that the reset signal is initially asserted.

The reset-gpio patchset supports this.

2) The second type is for devices that require a single reset pulse for
initialization, at any time before they become active. This is
described in [3].

  requested reset signal via reset_control_reset/rearm():
    device A: =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA\=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD
    device B: =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA\=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD

  actual reset signal to both devices:
              =E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD/=E2=8E=BA=E2=8E=BA\=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=
=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=
=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=
=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD=E2=8E=BD

Here the reset controller needs to know the delay between assertion and
deassertion - either baked into the hardware or as a delay call in the
.reset callback.

This is not supported by the reset-gpio patchset. It could be
implemented via a delay property in the device tree that would have to
be the same for all devices sharing the reset line, and by adding the
.reset callback to the reset controller driver. The only issue is that
the initial state of the reset line should be deasserted, and at
reset_control_get() time, when the reset-gpio controller is
instantiated, it is not yet known which type the driver will use.

Sharing a reset line between devices of different type is not
supported. Unfortunately, this will only fail at
reset_control_deassert() / reset_control_reset() time when the second
device tries to use the reset control in a different way than the
first.

[1] https://docs.kernel.org/driver-api/reset.html#assertion-and-deassertion
[2] https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert
[3] https://docs.kernel.org/driver-api/reset.html#triggering

> > For example, say we want to share a reset GPIO between two devices. Eac=
h
> > device has the following constraints:
> >=20
> > device post-assert delay post-deassert delay
> > =3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > A                  500us                 1ms
> > B                    1ms               300us
>=20
> And now imagine that these values are incompatible between them, so
> using 1ms on device A is wrong - too long.
>=20
> This is just not doable. You invented some imaginary case to prove that
> hardware is broken.
>=20
> Now, if we are back to realistic cases - use just the longest reset time.

Right. This all only works if no device has an upper bound to the
allowed delays on the shared reset line.

I interpret the post-assert delay to be the desired length of the reset
pulse between the rising edge and the falling edge in case 2) above,
since in case 1) a post-assert delay is not useful.

The post-deassert delays are not supposed to be handled by the reset
controller drivers at all, except where they are needed to reach the
deasserted state on the reset line. Reset drivers that do have post-
deassert delays in the .deassert callback might be bending the rules a
bit for convenience.

regards
Philipp


