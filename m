Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A359D249
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 09:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1F7A163C;
	Tue, 23 Aug 2022 09:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1F7A163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661240083;
	bh=jePQ4vKOAaTGNJG59sUIKK/F6+WTyTL/n1YsV3r6QqY=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TawN+J1iG1erRH+XW1sFLjPv7xxQ2kdPkDypxMPnhV3/yaST4MPi+ZnV8VUt7THiO
	 zodoeZHYTCtqCSKVXcWzOZxCDFJ5RLd1ZErFMdbxm4H8gl3mqioeKO6PHmXZtbky3m
	 oQBG6/0Nah+2gpS86Nl46aJhn8sSqoU+xZ1HPu6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3924FF8027B;
	Tue, 23 Aug 2022 09:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8D4CF8020D; Tue, 23 Aug 2022 09:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B4BF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B4BF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="H2XDFgnS"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661240018; bh=ftKfGYt19SPqa6Cn1sVIOkBEC6upRTpfHplVCy06jFo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=H2XDFgnSF0seYKYphMwMhHDHqvRe6U0bfcLzS8zKgohwWKDbnplD1OTsGdzFzUesC
 EXVXvyNF2rFo3RgQI1j1rhIzyKzx/qHIwzcftBWDYQMgr+DDehE+AIDXG7Y798yxxt
 BqmeeC/X+Bkyi8b2lTLSDnDHrQyrL46eu6s+QWUo=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 3/4] ASoC: apple: mca: Start new platform driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YwO/aqs7eqZx07kS@sirena.org.uk>
Date: Tue, 23 Aug 2022 09:33:36 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <24C0ABFA-BF71-4492-8A6A-E9BE1462B403@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-4-povik+lin@cutebit.org>
 <YwO/aqs7eqZx07kS@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


> On 22. 8. 2022, at 19:39, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Fri, Aug 19, 2022 at 02:54:29PM +0200, Martin Povi=C5=A1er wrote:
>=20
> This all looks good, one style nit and a couple of requests for
> clarification below but basically this is fine.
>=20
>> +++ b/sound/soc/apple/mca.c
>> @@ -0,0 +1,1149 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Apple SoCs MCA driver
>> + *
>> + * Copyright (C) The Asahi Linux Contributors
>> + *
>> + * The MCA peripheral is made up of a number of identical units =
called clusters.
>=20
> Please make the entire comment block a C++ one so things look more
> intentional.

Is this so that it does not look like the SPDX header was added
mechanically? I will do it, just curious what the reasoning is.

>=20
>> +#define USE_RXB_FOR_CAPTURE
>=20
> What's this all about?

There=E2=80=99s something we can configure one way or the other way in =
the
hardware (choosing RXA or RXB unit in a cluster for capture). Since this=20=

driver developed along reverse-engineering the hardware, this switch
got built in. I want to keep it for future experimentation. Also, as
the driver=E2=80=99s side gig is documenting the hardware, this way it
documents more.

>> +static int mca_fe_enable_clocks(struct mca_cluster *cl)
>> +{
>> +	struct mca_data *mca =3D cl->host;
>> +	int ret;
>> +
>> +	ret =3D clk_prepare_enable(cl->clk_parent);
>> +	if (ret) {
>> +		dev_err(mca->dev,
>> +			"cluster %d: unable to enable clock parent: =
%d\n",
>> +			cl->no, ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * We can't power up the device earlier than this because
>> +	 * the power state driver would error out on seeing the device
>> +	 * as clock-gated.
>> +	 */
>> +	cl->pd_link =3D device_link_add(mca->dev, cl->pd_dev,
>> +				      DL_FLAG_STATELESS | =
DL_FLAG_PM_RUNTIME |
>> +					      DL_FLAG_RPM_ACTIVE);
>=20
> I'm not clear on this dynamically adding and removing device links =
stuff
> - it looks like the main (only?) purpose is to take a runtime PM
> reference to the target device which is fine but it's not clear why
> device links are involved given that the links are created and =
destroyed
> every time the DAI is used, AFAICT always in the same fixed
> relationship.  It's not a problem, it's just unclear.

Indeed the only purpose is powering up the cluster=E2=80=99s power =
domain (there=E2=80=99s
one domain for each cluster). Adding the links is the only way I know to
do it. They need to be added dynamically (as opposed to statically =
linking,
say, the DAI=E2=80=99s ->dev to the cluster=E2=80=99s ->pd_dev, which I =
guess may do
something similar), because we need to sequence the power-up/power-down
with the enablement of the clocks.

Martin

