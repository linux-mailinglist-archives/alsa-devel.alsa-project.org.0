Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FD376FDCB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFE4DF6;
	Fri,  4 Aug 2023 11:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFE4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142514;
	bh=3VfCIXa0o6lPlMqgLObVQKbgPy8BjrH0uFz89nlwuOg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VyZspYSedr44dKL1z6GB9gKbfC+ak5KjEQaLk7En0Ric0a6yW6byXQ+DUiSjVRwHp
	 URx7ODbi+zpasGZrWLrKSvZ1adFNDKk7H0Ds4GimSlJfJ7V3NPBAth4wYGlZtwnomj
	 GWl+ILzjpm1T1KD1MicGEQ5VPcM45txHcuFs2RG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54DA0F8057B; Fri,  4 Aug 2023 11:44:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C6ABF80606;
	Fri,  4 Aug 2023 11:44:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0D71F8025A; Fri,  4 Aug 2023 11:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9246F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 11:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9246F8016D
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DB05324E2E3;
	Fri,  4 Aug 2023 17:24:38 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 4 Aug
 2023 17:24:39 +0800
Received: from [192.168.125.128] (183.27.98.54) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 4 Aug
 2023 17:24:37 +0800
Message-ID: <00553fc1-a033-5d4b-e8db-18f265f08492@starfivetech.com>
Date: Fri, 4 Aug 2023 17:20:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-4-xingyu.wu@starfivetech.com>
 <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XYHZBMFOZKO3QIRVIIU4HXEDHVE46DVS
X-Message-ID-Hash: XYHZBMFOZKO3QIRVIIU4HXEDHVE46DVS
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:44:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYHZBMFOZKO3QIRVIIU4HXEDHVE46DVS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/8/3 13:16, Maxim Kochetkov wrote:
>=20
>=20
> On 02.08.2023 11:42, Xingyu Wu wrote:
>=20
>> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
>> index c076090a9864..4dfbd8ddbcf5 100644
>> --- a/sound/soc/dwc/dwc-i2s.c
>> +++ b/sound/soc/dwc/dwc-i2s.c
>> @@ -16,6 +16,7 @@
>> =C2=A0 #include <linux/init.h>
>> =C2=A0 #include <linux/io.h>
>> =C2=A0 #include <linux/interrupt.h>
>> +#include <linux/mfd/syscon.h>
>> =C2=A0 #include <linux/module.h>
>> =C2=A0 #include <linux/reset.h>
>> =C2=A0 #include <linux/slab.h>
>> @@ -198,7 +199,7 @@ static void i2s_start(struct dw_i2s_dev *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_write_reg(d=
ev->i2s_base, IRER, 1);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (dev->use_pio)
>> +=C2=A0=C2=A0=C2=A0 if (dev->use_pio || dev->is_jh7110)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_enable_irqs=
(dev, substream->stream, config->chan_nr);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_enable_dma(=
dev, substream->stream);
>> @@ -216,7 +217,7 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_write_reg(d=
ev->i2s_base, IRER, 0);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (dev->use_pio)
>> +=C2=A0=C2=A0=C2=A0 if (dev->use_pio || dev->is_jh7110)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_disable_irq=
s(dev, substream->stream, 8);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2s_disable_dma=
(dev, substream->stream);
>=20
> Why do we need to enable interrupts for DMA mode?

This is special mechanism about data transmission by DMA controller on th=
e
StarFive JH7110 SoC.
The DMA controller needs to make a handshake with I2S interrupt and canno=
t
move the audio data without enabling the I2S interrupt.
So I should keep the I2S interrupt enabled in both interrupt or DMA mode.

>=20
>> @@ -227,6 +228,21 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 +static int dw_i2s_startup(struct snd_pcm_substream *substream,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct snd_soc_dai *cpu_dai)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct dw_i2s_dev *dev =3D snd_soc_dai_get_drvdata=
(cpu_dai);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (dev->is_jh7110) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_pcm_runtime=
 *rtd =3D asoc_substream_to_rtd(substream);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai_link *d=
ai_link =3D rtd->dai_link;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dai_link->trigger_stop =3D=
 SND_SOC_TRIGGER_ORDER_LDC;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 ch_reg;
>> @@ -267,6 +283,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substr=
eam *substream,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->data_wi=
dth =3D 16;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->ccr =3D 0x=
00;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->xfer_resol=
ution =3D 0x02;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set DMA buswidth on JH7=
110 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->is_jh7110) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v->play_dma_data.dt.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v->capture_dma_data.dt.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Not needed.
> See: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/commit/?h=3Dnext-20230802&id=3D6f80197f40515853814d0f22e5209d53f899ab91
> Proper bus width calculations is performed by snd_hwparams_to_dma_slave=
_config()

Will use this ops instead.

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SNDRV_PCM_FORMAT_S24_LE:
>> @@ -279,6 +300,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substr=
eam *substream,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->data_wi=
dth =3D 32;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->ccr =3D 0x=
10;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->xfer_resol=
ution =3D 0x05;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set DMA buswidth on JH7=
110 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->is_jh7110) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v->play_dma_data.dt.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v->capture_dma_data.dt.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Not needed
Will drop.

>=20

Thanks,
Xingyu Wu

