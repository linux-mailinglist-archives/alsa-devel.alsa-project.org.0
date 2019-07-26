Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CF75BF5
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B8A1FCE;
	Fri, 26 Jul 2019 02:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B8A1FCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099874;
	bh=k/lBYmlC2Tur7BtyY/1pzaN53R04y+j92jzm/lbwKPQ=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRxF272nf6fcxVHkHLFl2iORxQrSSIzpglDVnULpJ7lcBSmZAZET9gUDAYl78PD89
	 aQ+0OpD2h3puuWEFQaQ27VOkA5LJiXH4SI9B1rVhYJdFWLjKv6MwwxsSAKWDemFQjl
	 F8OHwbCUGFlkrZTroEGpbndbhETFmUZbMcE1BdBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B20F80447;
	Fri, 26 Jul 2019 02:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C3ADF803D0; Fri, 26 Jul 2019 02:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE67F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 02:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE67F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="EjeAwp0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564099806; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFaFrhEeyihyNbT3NtUBxEN4a+tGXeK6Vj+6otZDbtA=;
 b=EjeAwp0Z/Iz3JRj9xNi/OYWvP2qoXOXLR2kbAZQ7FDIMPuZOSiF0qc+SgEr+9qWUDz7njx
 9fSJSmwLBKrpzZNSM2vLDDU9dSKZqz4/qtlXGm6qm9sWN7tSWyprI05k88rU07mM/u+DSu
 bZeGz0/dkH6Ou3QGiuwrGDsK3pWy2rI=
Date: Thu, 25 Jul 2019 20:09:41 -0400
From: Paul Cercueil <paul@crapouillou.net>
To: Paul Burton <paul.burton@mips.com>
Message-Id: <1564099781.1699.0@crapouillou.net>
In-Reply-To: <20190725234735.h7qmtt26qpkjw3n6@pburton-laptop>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-3-paul@crapouillou.net>
 <20190725234735.h7qmtt26qpkjw3n6@pburton-laptop>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



Le jeu. 25 juil. 2019 =E0 19:47, Paul Burton <paul.burton@mips.com> a =

=E9crit :
> Hi Paul,
> =

> On Thu, Jul 25, 2019 at 06:02:06PM -0400, Paul Cercueil wrote:
>>  Move all the platform data to devicetree.
> =

> Nice! :)
> =

>>  The only bit dropped is the PWM beeper, which requires the PWM =

>> driver
>>  to be updated. I figured it's okay to remove it here since it's =

>> really
>>  a non-critical device, and it'll be re-introduced soon enough.
> =

> OK, I can see that being a price worth paying. Though it's possible to
> include the binding at least for that in this series I'd be even
> happier. Actually I see we already have
> =

>   Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt
> =

> in mainline - what needs to change with it?

The PWM driver will be updated to use the TCU clocks and the regmap =

provided
by the TCU driver. The PWM node will be a sub-node of the TCU one.

Additionally, there is this[1] ongoing discussion about PWM which makes
me uneasy about how to write the binding. So I'd rather not rush it,
because once the devicetree is written, it's ABI.

[1]: https://lkml.org/lkml/2019/5/22/607


>>  +	spi {
>>  +		compatible =3D "spi-gpio";
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		sck-gpios =3D <&gpc 23 GPIO_ACTIVE_HIGH>;
>>  +		mosi-gpios =3D <&gpc 22 GPIO_ACTIVE_HIGH>;
>>  +		cs-gpios =3D <&gpc 21 GPIO_ACTIVE_LOW>;
>>  +		num-chipselects =3D <1>;
>>  +
>>  +		spi@0 {
>>  +			compatible =3D "ili8960";
> =

> Should this be "ilitek,ili8960"?
> =

> Is there a binding & driver for this submitted somewhere? If not then =

> do
> we need this at all? It doesn't look like the existing platform data
> would actually lead to a driver being loaded so I'm wondering if we =

> can
> just drop this until such a driver (or at least a documented DT =

> binding)
> exists.

I can drop it. There is no driver for it, and I'm not even sure the LB60
has a ILI8960 in the first place.


> Thanks,
>     Paul


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
