Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816378B4E8
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 12:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8381665;
	Tue, 13 Aug 2019 12:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8381665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565690636;
	bh=j3L/hbACvXbdaiEPXVARNeDX92IyK4toJ0nnjOeYZ4Q=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nB1C2EUDHXWO23m19pFFkSyxRB9+wkjsTqKGFu0k/j/v9CMWN18LVNhZp7DtHDL32
	 wNc9s9IOjnqNICQZ6qPsfhdA4LgMTIEKFCJW/dwhXoG705WubMWHiBItwThbWViRuO
	 u/yHjyawkZi041fcyT/W8YwvQDIaE99igrklmVNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 436B4F80273;
	Tue, 13 Aug 2019 12:02:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B868F80273; Tue, 13 Aug 2019 12:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 236BAF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236BAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="pFFfezQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1565690517; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbzHVM6ENaR4P/6+oOoubZ60cH5LA2N4J6V2DJChuP0=;
 b=pFFfezQjKuJRCyCrZ9/ijjroaefD35Husngjhtv0sS9eRbULkJZieHwFjjUUwZHaOSMVhv
 Jym9DJW3vwQNxQw4SI21TSkg5AYgp4PLMnIjtp7Fi2rteFN9o2S3rSBW+rrUXddKsUjfoL
 iN4pdyxvhjsec4lYAWRoFxESQB5CuEc=
Date: Tue, 13 Aug 2019 12:01:48 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Philippe =?iso-8859-1?q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-Id: <1565690508.1856.0@crapouillou.net>
In-Reply-To: <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net> <20190812081640.GA26727@dell>
 <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
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

Hi Philippe,


Le mar. 13 ao=FBt 2019 =E0 10:44, Philippe =

=3D?iso-8859-1?q?Mathieu-Daud=3DE9?=3D <f4bug@amsat.org> a =E9crit :
> Hi Lee,
> =

> On 8/12/19 10:16 AM, Lee Jones wrote:
>>  On Thu, 25 Jul 2019, Paul Cercueil wrote:
>> =

>>>  It has been replaced with the ingenic-iio driver for the ADC.
>>> =

>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>>  ---
>>>   drivers/mfd/Kconfig      |   9 --
>>>   drivers/mfd/Makefile     |   1 -
>>>   drivers/mfd/jz4740-adc.c | 324 =

>>> ---------------------------------------
>>>   3 files changed, 334 deletions(-)
>>>   delete mode 100644 drivers/mfd/jz4740-adc.c
>> =

>>  Applied, thanks.
> =

> It seems the replacement is done in "MIPS: qi_lb60: Migrate to
> devicetree" which is not yet merged.

It's merged in the MIPS tree, though, so it'll blend together just
fine in linux-next.

> =

> Probably easier if this patch goes thru the MIPS tree as part of the
> "JZ4740 SoC cleanup" series.
> =

> Regards,
> =

> Phil.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
