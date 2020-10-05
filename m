Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70091284632
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4020176D;
	Tue,  6 Oct 2020 08:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4020176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601966373;
	bh=YDa9qgcYN/rLvsHl7wxHnDzXxyPxrajJMh139W2bTQc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQ4RODc/evs726eB5sreHI06M2O370Pun//2iwAo/7nl/kjVezK4WLMl5knkAEpZC
	 YFIpoH5XEPWFn6XSM72r1Jd9eatG08OhAq6gQvVYZhDggNOcRuDigSAUGrbYjpIssK
	 ArhV3cF1OKcvFWHzNWqy9bo82ftAhQYEsyf+tt3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59089F80255;
	Tue,  6 Oct 2020 08:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D27EDF8025A; Mon,  5 Oct 2020 17:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C94BF800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 17:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C94BF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yt3ruZa6"
Received: from earth.universe (dyndsl-095-033-158-146.ewe-ip-backbone.de
 [95.33.158.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CD5C2085B;
 Mon,  5 Oct 2020 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601912361;
 bh=YDa9qgcYN/rLvsHl7wxHnDzXxyPxrajJMh139W2bTQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yt3ruZa68573tch0c/Ho1ALzHfCpTDMLesbdlPmWRDYNKB50IT55EoZp87fsRkzgz
 7+6j5JNoNjJ3AsqOjA1un0djegx8x339kHr5uakI101R3J4o5G+KgoyioglXZXg5dL
 Bxy38eyfhsJbMySPsKZTFlatV3r6LR8AuCR8oLYA=
Received: by earth.universe (Postfix, from userid 1000)
 id 1CDCB3C0C87; Mon,  5 Oct 2020 17:39:19 +0200 (CEST)
Date: Mon, 5 Oct 2020 17:39:19 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another round of adding missing
 'additionalProperties'
Message-ID: <20201005153919.llmcjbz4hiqvzd4x@earth.universe>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ruzfmjzmyxibtjj5"
Content-Disposition: inline
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 06 Oct 2020 08:37:07 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-serial@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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


--ruzfmjzmyxibtjj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 06:41:43PM -0500, Rob Herring wrote:
> Another round of wack-a-mole. The json-schema default is additional
> unknown properties are allowed, but for DT all properties should be
> defined.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>=20
> I'll take this thru the DT tree.
>=20
>  [...]
>  .../bindings/power/supply/cw2015_battery.yaml |  2 ++
>  .../bindings/power/supply/rohm,bd99954.yaml   |  8 ++++++++
> [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--ruzfmjzmyxibtjj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl97PhAACgkQ2O7X88g7
+pqkbg/9HQHD97P7Thh0rG2tNf/oTuwqdbqpGz8XffiIbWso3SaAukPavFc/b34T
Bhf9ldAe4Jy7Sz8qDavKYO8qMWOF8av5Je5ajNG3fFmRAO28Jz1vcRsxn7JiTvlU
SnlrNgxMlppGfzCt59G/IH6GyJVUVhZduf1HhaterbutugRNLE6LKY85rtwPlCR6
d4+sJE+gKYJmNhxj1XYyVrXoWQs22IA8nJggb2g2l5nHfFolffKHFRXTX5Ax7WFL
vhm/uSgz/4T9RyObm3lx4ODSSZqC3oc1E0DR3jf97rWH6xGUVFuJoAtE5ZpS5AJt
uC3k2QQJ8mCt5fUA+khtnS4DIsF07uOzd5Hbex8NcXiFnlO/9GYWlmGXxlAnhdrk
vSk8jlPgslc4xKpae1y8DFQiMndd9+1g0b4ZOJ6RnhaNpnOoFOIIPmC2ViRnQ8/0
kv5w7Hop2CIxAYj3Jk1IzlmtbmJeQt39ya7uHNJhV2ISd8P3AmrkcNedPd8OV7MO
7DrV+n/aKjH2gLYX0+377iH59APbluDQd64e+iDir2L5PP4BWXmyMOGqZ+Od7ScJ
YT7hlpoKPVwZ1lqta77S7LDpYrRtyv8Ce5EsFineimEc1b4N51GTMh6lDPIGVcXz
Xa1GC6kpGXU9Cx39fOb5K64cnrJ5Whplgiyv+4xd1suU1q25CZM=
=XHTx
-----END PGP SIGNATURE-----

--ruzfmjzmyxibtjj5--
