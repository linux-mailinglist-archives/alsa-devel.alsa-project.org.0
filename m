Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F966FA187
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035FA12EA;
	Mon,  8 May 2023 09:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035FA12EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532297;
	bh=oVetGf8Af6lupBLgtJRdjnXfVBqn+Fsva7z9QX4GpJs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S6AQBagZPnPHFHr7l98SHc8FLuDag1zAiua9J/xPfxDutiimrxx+L1ChqqKKtXSBD
	 QcsBWiAG27Ius6KS+giPm53wjKhKbdfWuXsmKghGRqaC21r8Uovf0XFGh2EglwLXcV
	 Ktbj1zj92sRQQMH7Ni/zsXJSGjuvhcZ9mt1asLAE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 117A1F805F3;
	Mon,  8 May 2023 09:46:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0767BF8032D; Mon,  8 May 2023 03:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.0 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A663CF802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 03:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A663CF802E8
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3505F24E03C;
	Mon,  8 May 2023 09:41:33 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 8 May
 2023 09:41:33 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 8 May
 2023 09:41:32 +0800
Message-ID: <622746ca-8d29-72cf-cc8f-cfe7bc5aea58@starfivetech.com>
Date: Mon, 8 May 2023 09:41:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/3] ASoC: starfive: Add JH7110 TDM driver
To: Shengyu Qu <wiagn233@outlook.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-3-walker.chen@starfivetech.com>
 <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: 
 <TY3P286MB26118DAB0E0E2BF32C91B19F98739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TNJLXZHA7CHR4ESHKUE6Q7IOGAT3M4MM
X-Message-ID-Hash: TNJLXZHA7CHR4ESHKUE6Q7IOGAT3M4MM
X-Mailman-Approved-At: Mon, 08 May 2023 07:46:12 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNJLXZHA7CHR4ESHKUE6Q7IOGAT3M4MM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/5/6 21:47, Shengyu Qu wrote:
> Hi,
>=20
>> Add tdm driver support for the StarFive JH7110 SoC.
>>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +
>> =C2=A0 sound/soc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 sound/soc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 sound/soc/starfive/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 15 +
>> =C2=A0 sound/soc/starfive/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 2 +
>> =C2=A0 sound/soc/starfive/jh7110_tdm.c | 573 +++++++++++++++++++++++++=
+++++++
>> =C2=A0 sound/soc/starfive/jh7110_tdm.h | 147 ++++++++
>> =C2=A0 7 files changed, 745 insertions(+)
>> =C2=A0 create mode 100644 sound/soc/starfive/Kconfig
>> =C2=A0 create mode 100644 sound/soc/starfive/Makefile
>> =C2=A0 create mode 100644 sound/soc/starfive/jh7110_tdm.c
>> =C2=A0 create mode 100644 sound/soc/starfive/jh7110_tdm.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5f9c544bc189..add89615d327 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19945,6 +19945,12 @@ F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree=
/bindings/power/starfive*
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/soc/starfive/jh71xx_pmu.c
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 include/dt-bindings/power/starfive,jh7110-=
pmu.h
>> =C2=A0 +STARFIVE JH7110 TDM DRIVERS
>> +M:=C2=A0=C2=A0=C2=A0 Walker Chen <walker.chen@starfivetech.com>
>> +S:=C2=A0=C2=A0=C2=A0 Maintained
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/sound/starfive=
,jh7110-tdm.yaml
>> +F:=C2=A0=C2=A0=C2=A0 sound/soc/starfive/jh7110-tdm.*
>> +
>> =C2=A0 STARFIVE SOC DRIVERS
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Conor Dooley <conor@kernel.org>
>> =C2=A0 S:=C2=A0=C2=A0=C2=A0 Maintained
>> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
>> index 848fbae26c3b..8d1d9401ecf2 100644
>> --- a/sound/soc/Kconfig
>> +++ b/sound/soc/Kconfig
>> @@ -91,6 +91,7 @@ source "sound/soc/sh/Kconfig"
>> =C2=A0 source "sound/soc/sof/Kconfig"
>> =C2=A0 source "sound/soc/spear/Kconfig"
>> =C2=A0 source "sound/soc/sprd/Kconfig"
>> +source "sound/soc/starfive/Kconfig"
>> =C2=A0 source "sound/soc/sti/Kconfig"
>> =C2=A0 source "sound/soc/stm/Kconfig"
>> =C2=A0 source "sound/soc/sunxi/Kconfig"
>> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
>> index 507eaed1d6a1..65aeb4ef4068 100644
>> --- a/sound/soc/Makefile
>> +++ b/sound/soc/Makefile
>> @@ -59,6 +59,7 @@ obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D sh/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D sof/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D spear/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D sprd/
>> +obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D starfive/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D sti/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D stm/
>> =C2=A0 obj-$(CONFIG_SND_SOC)=C2=A0=C2=A0=C2=A0 +=3D sunxi/
>> diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
>> new file mode 100644
>> index 000000000000..737c956f7b93
>> --- /dev/null
>> +++ b/sound/soc/starfive/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config SND_SOC_STARFIVE
>> +=C2=A0=C2=A0=C2=A0 tristate "Audio support for StarFive SoC"
>> +=C2=A0=C2=A0=C2=A0 depends on COMPILE_TEST || SOC_STARFIVE
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y or M if you want to add support =
for codecs attached to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the Starfive SoCs' Audio interfaces. Y=
ou will also need to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select the audio interfaces to support=
 below.
>> +
>> +config SND_SOC_JH7110_TDM
>> +=C2=A0=C2=A0=C2=A0 tristate "JH7110 TDM device driver"
>> +=C2=A0=C2=A0=C2=A0 depends on HAVE_CLK && SND_SOC_STARFIVE
>> +=C2=A0=C2=A0=C2=A0 select SND_SOC_GENERIC_DMAENGINE_PCM
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y or M if you want to add support =
for StarFive TDM driver.
>> diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
>> new file mode 100644
>> index 000000000000..f7d960211d72
>> --- /dev/null
>> +++ b/sound/soc/starfive/Makefile
>> @@ -0,0 +1,2 @@
>> +# StarFive Platform Support
>> +obj-$(CONFIG_SND_SOC_JH7110_TDM) +=3D jh7110_tdm.o
>> diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh71=
10_tdm.c
>> new file mode 100644
>> index 000000000000..33f7cf43e4bd
>> --- /dev/null
>> +++ b/sound/soc/starfive/jh7110_tdm.c
>> @@ -0,0 +1,573 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * jh7110_tdm.c -- StarFive JH7110 TDM driver
>> + *
>> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
>> + *
>> + * Author: Walker Chen <walker.chen@starfivetech.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include <sound/initval.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc.h>
>> +#include <sound/soc-dai.h>
>> +#include "jh7110_tdm.h"
>> +
>> +static inline u32 jh7110_tdm_readl(struct jh7110_tdm_dev *tdm, u16 re=
g)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return readl_relaxed(tdm->tdm_base + reg);
>> +}
>> +
>> +static inline void jh7110_tdm_writel(struct jh7110_tdm_dev *tdm, u16 =
reg, u32 val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, tdm->tdm_base + reg);
>> +}
>> +
>> +static void jh7110_tdm_save_context(struct jh7110_tdm_dev *tdm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_pcm_substream *s=
ubstream)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAY=
BACK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tdm->saved_pcmtxcr =3D jh7=
110_tdm_readl(tdm, TDM_PCMTXCR);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tdm->saved_pcmrxcr =3D jh7=
110_tdm_readl(tdm, TDM_PCMRXCR);
>> +}
>> +
>> +static void jh7110_tdm_start(struct jh7110_tdm_dev *tdm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_pcm_substream *substream)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 data;
>> +
>> +=C2=A0=C2=A0=C2=A0 data =3D jh7110_tdm_readl(tdm, TDM_PCMGBCR);
>> +=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | PCMGBCR=
_ENABLE);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* restore context */
>> +=C2=A0=C2=A0=C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAY=
BACK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMTXCR, tdm->saved_pcmtxcr | PCMTXCR_TXEN);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMRXCR, tdm->saved_pcmrxcr | PCMRXCR_RXEN);
>> +}
>> +
>> +static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct snd_pcm_substream *substream)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int val;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAY=
BACK) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D jh7110_tdm_readl(t=
dm, TDM_PCMTXCR);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~PCMTXCR_TXEN;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMTXCR, val);
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D jh7110_tdm_readl(t=
dm, TDM_PCMRXCR);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~PCMRXCR_RXEN;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMRXCR, val);
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 sl, sscale, syncdiv;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (tdm->rx.sl >=3D tdm->tx.sl)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sl =3D tdm->rx.sl;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sl =3D tdm->tx.sl;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (tdm->rx.sscale >=3D tdm->tx.sscale)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sscale =3D tdm->rx.sscale;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sscale =3D tdm->tx.sscale;
>> +
>> +=C2=A0=C2=A0=C2=A0 syncdiv =3D tdm->pcmclk / tdm->samplerate - 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ((syncdiv + 1) < (sl * sscale)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(tdm->dev, "Failed =
to set syncdiv!\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (tdm->syncm =3D=3D TDM_SYNCM_LONG &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->rx.sscale <=3D 1 || =
tdm->tx.sscale <=3D 1)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((syncdiv + 1) <=3D sl)=
 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl=
]\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM_PCMDIV, syncdiv);
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int jh7110_tdm_config(struct jh7110_tdm_dev *tdm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_pcm_substream *substream)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 datarx, datatx;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D jh7110_tdm_syncdiv(tdm);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 datarx =3D (tdm->rx.ifl << IFL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->rx.wl <<=
 WL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->rx.sscal=
e << SSCALE_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->rx.sl <<=
 SL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->rx.lrj <=
< LRJ_BIT);
>> +
>> +=C2=A0=C2=A0=C2=A0 datatx =3D (tdm->tx.ifl << IFL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->tx.wl <<=
 WL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->tx.sscal=
e << SSCALE_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->tx.sl <<=
 SL_BIT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tdm->tx.lrj <=
< LRJ_BIT);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAY=
BACK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMTXCR, datatx);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jh7110_tdm_writel(tdm, TDM=
_PCMRXCR, datarx);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void jh7110_tdm_clk_disable(struct jh7110_tdm_dev *tdm)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D tdm->num_clks - 1; i >=3D 0; i--)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(tdm-=
>clks[i]);
>> +}
>> +
>> +static int jh7110_tdm_clk_enable(struct jh7110_tdm_dev *tdm)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int i, ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < tdm->num_clks; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D clk_prepare_enable=
(tdm->clks[i]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wh=
ile (i-- > 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(tdm->clks[i]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D reset_control_deassert(tdm->resets);
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(tdm->dev, "Failed =
to deassert tdm resets\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto dis_tdm_clk;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* select tdm_ext clock as the clock source for td=
m */
>> +=C2=A0=C2=A0=C2=A0 ret =3D clk_set_parent(tdm->clks[5], tdm->clks[4])=
;
>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(tdm->dev, "Can't s=
et clock source for clk_tdm: %d\n", ret);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto dis_tdm_clk;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +dis_tdm_clk:
>> +=C2=A0=C2=A0=C2=A0 for (i =3D tdm->num_clks - 1; i >=3D 0; i--)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(tdm-=
>clks[i]);
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int jh7110_tdm_runtime_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct jh7110_tdm_dev *tdm =3D dev_get_drvdata(dev=
);
>> +
>> +=C2=A0=C2=A0=C2=A0 jh7110_tdm_clk_disable(tdm);
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int jh7110_tdm_runtime_resume(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct jh7110_tdm_dev *tdm =3D dev_get_drvdata(dev=
);
>> +
>> +=C2=A0=C2=A0=C2=A0 return jh7110_tdm_clk_enable(tdm);
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int jh7110_tdm_suspend(struct snd_soc_component *component)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /* save context */
>> +=C2=A0=C2=A0=C2=A0 tdm->saved_pcmgbcr =3D jh7110_tdm_readl(tdm, TDM_P=
CMGBCR);
>> +=C2=A0=C2=A0=C2=A0 tdm->saved_pcmdiv =3D jh7110_tdm_readl(tdm, TDM_PC=
MDIV);
>=20
> tdm isn't declared here. Is that same with resume function?

OMG! Maybe I accidentally deleted the declaration of tdm while deleting s=
ome debugging statement.
Yes, it is same with resume function.

Best regards,
Walker
