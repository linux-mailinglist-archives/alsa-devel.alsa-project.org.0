Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9F3BBD86
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 15:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA20216A5;
	Mon,  5 Jul 2021 15:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA20216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625492083;
	bh=fbiWTr53bTjAhbArSvuhq4WzPsxDtwrUJS1t/V+uo3Y=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJn17ZbVX1fq6yT/1OvwYoKlb29NW4PqHBhWrm9swhSMIkpbN9Wrr68Bnqawq3S6A
	 ODWJQvl2BkWOHqVo7iQEX+xr0UwVPChKHHYWv/o/eQiY7/JycnaJFCxZ7cCVNtLuDn
	 xJBggRZ3NQXkFepzTmnZP0d7Xw8twgP8ea5gZrW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 256A3F8025C;
	Mon,  5 Jul 2021 15:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D87FF80224; Mon,  5 Jul 2021 15:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FF2F80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 15:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FF2F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com
 header.b="tzOTAYLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625491974;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=fRak6ASlaZRgXZ5yHDMa2KL0jh26L0XGJ2WV3FPhyfo=;
 b=tzOTAYLx/SMn4ocdNEcqqSRTkGO78vSh+bdS/60yhHTYmH1BbSVbe5IniHEOOHHvSP
 /Wh8RH9wdzJ5JuEQkUCR+s2J9fP9eSJmMX3h7Eu+nWzkXS8kzoOF4+V19Excfa/4EUGP
 h6IZnHev0kGqBjy2ztDZLaLp17xms1A/pEcj/H6nmrpFavc93NmpZobtt6v8RioaYQ6/
 7ae3mPGOuj+UJuaNDoGeEH9MJ1caswnc85Wj/3fXfzCS9L6iNtLeRGEpTLU85dt/PIgm
 de/BimLfCjG5CX8DmJJAmum4vDo4IIrY93DVUjgjC9JvR9KH/X60GiCHKsSgJXNe4fhW
 tUeg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4/qsw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
 with ESMTPSA id h06665x65DWsJos
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 15:32:54 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
Date: Mon, 5 Jul 2021 15:32:53 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
Cc: tony@atomide.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 linux-omap@vger.kernel.org
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

Hi P=C3=A9ter,

> Am 04.07.2021 um 17:04 schrieb Peter Ujfalusi =
<peter.ujfalusi@gmail.com>:
>=20
> Hi,
>=20
> it has been on my todo list for several years to support McASP on =
OMAP4 devices.
> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a =
stripped down
> davinci-mcasp driver) to support what was needed on that specific =
phone + it's
> dock for S/PDIF (48KHz, 16bit, stereo).
>=20
> Not many (if any) device available to test the DIT mode of McASP.
> I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to =
get the
> S/PDIF mode working then PandaES for OMAP4 support (on PandaES the =
gpio_121 is
> not used and the signal is routed to expansion J6 pin14)
>=20
> In theory the McASP in OMAP5 should be working after this series, but =
the OMAP5
> TRM is not public and I do not have one to check the addresses and see =
if there
> is a way to test it on omap5-uevm.
>=20
> Mark, Tony:
> The ASoC and dts patches can go via separate tree I felt that it is =
better if
> they are together, at least initially.
>=20
> Nikolaus: fyi, this might be useful for Pyra?

Yes, definitively.

I just wonder how compatible it is with the "old" omap-mcasp driver we =
carry
along for the Pyra:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3Dsound/soc/ti/=
omap-mcasp.c;h=3D24d839a24f34ec02456176744d3690016592b5a3;hb=3D7789ab635e5=
6a2fd9fe04ca2e9ccfeaccb8e0f52

Does it now have additional functionality or robustness?
And does it need changes of the OMAP5 device tree?

And also important seems to be the ABE/AESS integration where we so far =
failed
to make it work again on more recent kernels. Our most recent patch set =
is here:

=
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/aess-v5

Anyways I am happy to see a little progress on the omap4/5 audio =
subsystem.

BR and thanks,
Nikolaus



>=20
> Regards,
> P=C3=A9ter
> ---
> Peter Ujfalusi (5):
>  ASoC: ti: davinci-mcasp: Fix DIT mode support
>  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
>  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
>  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
>  ARM: dts: omap4-l4-abe: Add McASP configuration
>=20
> .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
> arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
> include/linux/platform_data/davinci_asp.h     |   1 +
> sound/soc/ti/Kconfig                          |   1 +
> sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
> 5 files changed, 168 insertions(+), 42 deletions(-)
>=20
> --=20
> 2.32.0
>=20

