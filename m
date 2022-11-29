Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA363C65B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A75F1697;
	Tue, 29 Nov 2022 18:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A75F1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669742593;
	bh=Lb4SESpHMOhPIMCGrj+WFGcavPsOts6fRzahyn7Voxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgcHY+UkO/Sfgc7irVexV2h6Ji3OoAXwQJ6JFQYXRU14E2HbO8a47wIDfuJg44+LP
	 jJpnt7HF/P6Md/vUL2z292/WkjL7DuOht6PVwDmSm3g+udduLF4NdAv3A7S0IfUnIq
	 OO2OzYecnQkue4chaKkmTcedDEfW0SKPF4uyBqsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A69F80212;
	Tue, 29 Nov 2022 18:22:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA52F801F7; Tue, 29 Nov 2022 18:22:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9D0F80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9D0F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PjTj6DhM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9C3E6185F;
 Tue, 29 Nov 2022 17:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC4EC433D6;
 Tue, 29 Nov 2022 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669742531;
 bh=Lb4SESpHMOhPIMCGrj+WFGcavPsOts6fRzahyn7Voxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjTj6DhMx9pbN6mtsEBac0RpBaIgx0ceKlawxs+e723Pfw3jj6mOMdV77XaMIhWfg
 hMb7PgKA0m0sm0En1h6+9dw4XaBiiNvZVmKq07dAcGOWUGrcgeJ2QqpNHHoGUlrQu9
 r9eDvvbD5OUdP0M940aNyZA+36L2jgE70sgKTYXzQ2sOxiFDH2SEJSG8OpWSz64NIE
 UipxIbRQ5UAihMlMTwBWPd4RJCIC3wrwGEikJjdG+i/cw3ILVrc0ylT6SbE9ErI9CM
 BrElCNX+gkrCcjvJGwSZnuiPFUkKNY+rdzX5hV72TeJw81iawEU2UyEGTM0v5ZySqv
 RkfuEDuUxjSpg==
Date: Tue, 29 Nov 2022 17:22:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qzMUDJamuQN8FqwP"
Content-Disposition: inline
In-Reply-To: <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
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


--qzMUDJamuQN8FqwP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 03:07:22PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Fri, 2022-11-25 at 12:18 +0000, Mark Brown wrote:
> > On Fri, Nov 25, 2022 at 05:44:11PM +0800, Jiaxin Yu wrote:

> > I'm a little unclear why this is being implemented as a DAPM
> > operation
> > rather than having the driver forward the PCM trigger op if it's
> > needed?
> > Or alternatively if a DAPM callback is needed why not provide one
> > directly rather than hooking into the trigger function - that's going
> > to
> > be called out of sequence with the rest of DAPM and be potentially
> > confusing given the very different environments that trigger and DAPM
> > operations run in.  A quick glance at the it6505 driver suggests it'd
> > be
> > happier with a DAPM callback.

> Let me describe the hardware connection about mt8186 with it6505(hdmi)
> and rt1015p(speakers).

>                        =3D=3D>it6505=20
>                      =3D=20
> DL1(FE) =3D=3D>I2S3(BE) =3D
>                      =3D
>                        =3D=3D>rt1015p

> They shared the same one i2s port, but we'd like to control them
> separately. So if hdmi-codec use the PCM trigger op, whne we turn on
> the speaker, hdmi-codec's PCM trigger op is also executed, resulting in
> sound on both devices.
> Is there another way to control them separately? Thank you.

If you just need power control for one or both devices then the machine
driver can add a _PIN_SWITCH() on the output of the device, that'll
cause DAPM to keep the device powered down when not in use.  That should
work well with the suggestion to provide a DAPM callback instead of a a
trigger operation.

--qzMUDJamuQN8FqwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGP7wACgkQJNaLcl1U
h9DZ8gf+PisMggrT6FuPtNTRpRKtS7VgpBbYiJRYI4/X3DFs3Vlj30D150dJWC/g
WqIhVaoDn6R5wsvhGw9YmtJKNT/A2SKeoUGksnstpvkd9KXkCeaKgfiFL877s9mK
+YHxZOH6Eb/w5XFAEo+3TEr+LEDj6ooKflpE/DEXs1rfcVPr0wwVdLoXp1I7b6jw
jQkRxRPfPSaszug+TYwzb6aXlXl2iAerXKo8pSkjSYI/GbLSEUb7Od/tCgoIXOmz
hP2ksKt/u+NNptKSgXMv6ZMDTyRcioBZPUZgDhBrOWQ6hwxEDD9XioMA/6tSRqtE
zRqubSrRrmnLXC2AeI1DJ0NKBo1gjQ==
=qgcp
-----END PGP SIGNATURE-----

--qzMUDJamuQN8FqwP--
