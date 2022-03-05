Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0D4CE299
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 05:26:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7071AEA;
	Sat,  5 Mar 2022 05:25:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7071AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646454388;
	bh=ZwbbXQUlOHQetbbfyLpgu4qGfFTC17m6goqwT7zI3lE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Af8V8riBcHd1HEKc90oBQETV9dyvxyIyDuc+ZjC71xgX01QBU2aozHbvF1tuKevfU
	 w4Ihv+f8/F49qtzm8qbKz+0fAQogy919dynRe3abZQXdK5OATnITuf/iPINpFIF3Cr
	 BFGUEOMJ0ONCWaTfxOOOsXtzsohCzIpRUMEmNsMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347B9F800E4;
	Sat,  5 Mar 2022 05:25:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39AD8F80237; Sat,  5 Mar 2022 05:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8EF8F800D1
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 05:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EF8F800D1
X-UUID: f91cd922797a4c02b60543ed4c65f1a6-20220305
X-UUID: f91cd922797a4c02b60543ed4c65f1a6-20220305
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1076188222; Sat, 05 Mar 2022 12:25:00 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Mar 2022 12:24:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 5 Mar 2022 12:24:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Mar 2022 12:24:57 +0800
Message-ID: <6555d89deb9087825f865b9d4265f07465e7ae09.camel@mediatek.com>
Subject: Re: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
Date: Sat, 5 Mar 2022 12:24:57 +0800
In-Reply-To: <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-2-jiaxin.yu@mediatek.com>
 <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > Mt6366 is a new version of mt6358, and they are same about audio
> > part.
> > So we can reuse the driver of mt6358.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Hello Jiaxin,
> I'm sorry but this commit makes very little sense.
> 
> If you want to advertise MT6366 support, please write a note and/or
> a new compatible string inside of the mt6358 driver (and dt-
> bindings),
> then, please drop this commit.
> 

Hello angelogioacchino,

Thank you for your advice.

If I add a new compatible string inside of the mt6358 driver and dt-
bindings, then the machine driver which want to use mt6366 should
select SND_SOC_MT6358.

like below:

config SND_SOC_MT8186_MT6366_DA7219_MAX98357
	tristate "ASoC Audio driver for MT8186 with DA7219 MAX98357A
codec"
 	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
 	select SND_SOC_MT6366   ==> SND_SOC_MT6358
	...

I just doubt it's enough to make sense. I originally wanted to put this
relationship in the sound/soc/codecs layer. So that this relationship
is not perceived by users(machine driver).
However, if the general practice is like this, I will adopt your
suggestion. Thank you again.

> 
> > ---
> >   sound/soc/codecs/Kconfig  | 8 ++++++++
> >   sound/soc/codecs/Makefile | 1 +
> >   2 files changed, 9 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index 8fa24783ce01..6631094678f5 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
> >   	imply SND_SOC_MT6351
> >   	imply SND_SOC_MT6358
> >   	imply SND_SOC_MT6359
> > +	imply SND_SOC_MT6366
> >   	imply SND_SOC_MT6660
> >   	imply SND_SOC_NAU8315
> >   	imply SND_SOC_NAU8540
> > @@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
> >   	  for ASoC codec soc-jack detection mechanism.
> >   	  Select N if you don't have jack on board.
> >   
> > +config SND_SOC_MT6366
> > +	tristate "MediaTek MT6366 Codec"
> > +	depends on MTK_PMIC_WRAP
> > +	help
> > +	  Enable support for the platform which uses MT6366 as
> > +	  external codec device.
> > +
> >   config SND_SOC_MT6660
> >   	tristate "Mediatek MT6660 Speaker Amplifier"
> >   	depends on I2C
> > diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> > index 42d00aa4ee46..1279684feaf0 100644
> > --- a/sound/soc/codecs/Makefile
> > +++ b/sound/soc/codecs/Makefile
> > @@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-
> > mt6351.o
> >   obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
> >   obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
> >   obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
> > +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
> >   obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
> >   obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
> >   obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
> 
> 

