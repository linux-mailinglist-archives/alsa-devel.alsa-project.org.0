Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C544002AB
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DB118B3;
	Fri,  3 Sep 2021 17:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DB118B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630684460;
	bh=N5ikRjsunM6u4Rj6jCsrMSVHxexBHAHR5BNCYYEhc5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXzDXa2IrzaFLUpvOpspnaOFhtw8hPjBGDR1kU25pxFC8wuXitD34tgvQkYyePCSo
	 LC+7CpdnvjyIdXvh5Wh8I49pcWG7+SS70HJcuj7Ay/jatepzF2HODhz3ELdyllAv/r
	 NJamRxz/rjsl+Oj7AJCKSDrU/WNJ5edhP28gCOZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE03F80256;
	Fri,  3 Sep 2021 17:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F2C2F80254; Fri,  3 Sep 2021 17:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C427BF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C427BF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="bhYZ4ZHs"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 04EC33FEB7;
 Fri,  3 Sep 2021 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630684371; bh=N5ikRjsunM6u4Rj6jCsrMSVHxexBHAHR5BNCYYEhc5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bhYZ4ZHs0crDvHNWVNKHa5OgtJANem0yfORE1sURs0+UvlLGMg9DI9c0AEdvttxDA
 YiOkxygYikSY8Nr2KdyOTsKKak2bAIpRmyUYLdvzODGserD1Nm5wbvwkFSfO0WQHKL
 ZscIYdheGAxRdtvF/PeF1J9w34KY6hrAU15GrXVTcbES05SD/FMU+ajYPEidgkIHfq
 t75BoUzrGROloy1Dn87itkJiErZu8BLhUAYxN+WXKl5S0dns8aYKChE3paBMbIhych
 QqD9Hs37aMskC9Md993M8U6PDKr6Nkb1Bo6G8Z8+di3ZgfyYvIO4miQ08WptNtpuJf
 +rNje2K2hT9Rg==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: max98927: Handle reset gpio when probing i2c
Date: Fri, 03 Sep 2021 17:52:29 +0200
Message-ID: <11848098.O9o76ZdvQC@alexpc>
In-Reply-To: <CAHp75VeD8sbxcu==BF97yY4ZGtLbNAQSiTxq2cDvBSdCpXxsyw@mail.gmail.com>
References: <cover.1630632805.git.atafalla@dnyon.com>
 <04a18f4115539752429da55fb857834cea0944e5.1630632805.git.atafalla@dnyon.com>
 <CAHp75VeD8sbxcu==BF97yY4ZGtLbNAQSiTxq2cDvBSdCpXxsyw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On viernes, 3 de septiembre de 2021 10:18:14 (CEST) Andy Shevchenko wrote:
> On Fri, Sep 3, 2021 at 4:51 AM Alejandro <atafalla@dnyon.com> wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> > 
> > Drive the reset gpio if defined in the DTS node.
> 
> ...
> 
> > +       reset_gpio
> > +               = devm_gpiod_get_optional(&i2c->dev, "reset",
> > GPIOD_OUT_LOW); +       if (IS_ERR(reset_gpio)) {
> > +               ret = PTR_ERR(reset_gpio);
> > +               return dev_err_probe(&i2c->dev, ret, "failed to request
> > GPIO reset pin");
> Not sure why my comments have been ignored here.
> 
> > +       }
> 
> --
> With Best Regards,
> Andy Shevchenko
Sorry, I misread your suggestion and didn't notice PTR_ERR was also in the 
same line.



