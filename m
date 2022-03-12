Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D34D6FFF
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 17:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C15AE16A9;
	Sat, 12 Mar 2022 17:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C15AE16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647102004;
	bh=YbYHhsm0Wj5um7qmQVflkxyp45Ii/WjNyXEKbXosnk0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=at1E6HRF9G7pj4o8eCJvLwb66ETweZEJhCfSIeE/YT4RdFkI3AhyYuaE6gClUT7Al
	 IAKMJiPk92ExwJCwtu32oc3gTVClwThnlpoHSxz8uo7Gq4AS9hlYyP2cwo9bsW7Ra+
	 w7xiyhPO8Y4gorV5MhL4qcsjTuP/tz5cWB0viwQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28DA0F800D2;
	Sat, 12 Mar 2022 17:18:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DDE4F800D2; Sat, 12 Mar 2022 17:18:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_30,RDNS_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC12F800D2
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC12F800D2
X-UUID: aee794b93a184520b26ddf324e04e89d-20220313
X-UUID: aee794b93a184520b26ddf324e04e89d-20220313
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 399267673; Sun, 13 Mar 2022 00:18:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 00:18:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Mar 2022 00:18:34 +0800
Message-ID: <5fafa7d8a23fbdce82272529d817816f42c4ac37.camel@mediatek.com>
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8195: add machine driver with
 mt6359, max98390 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Date: Sun, 13 Mar 2022 00:18:34 +0800
In-Reply-To: <e812796f-6b9b-fe9d-50a7-b681d7b174fd@collabora.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-5-trevor.wu@mediatek.com>
 <e812796f-6b9b-fe9d-50a7-b681d7b174fd@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 2022-03-10 at 16:21 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/03/22 08:24, Trevor Wu ha scritto:
> > This patch adds support for mt8195 board with mt6359, max98390 and
> > rt5682.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> 
> Hello Trevor,
> thanks for the patch! However, there's something to improve...
> 
> > ---
> >   sound/soc/mediatek/Kconfig                    |   16 +
> >   sound/soc/mediatek/mt8195/Makefile            |    5 +
> >   .../mt8195/mt8195-mt6359-max98390-rt5682.c    | 1058
> > +++++++++++++++++
> >   3 files changed, 1079 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-
> > max98390-rt5682.c
> >   
> > 

[...]
> > +
> > +static const struct snd_soc_dapm_widget
> > +	mt8195_mt6359_max98390_rt5682_widgets[] = {
> > +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
> > +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
> > +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> 
> We can at least partially reuse existing UCM2 configuration if you
> slightly change the names for these controls.
> 

I don't know what the UCM2 configuration means.
Could you give me more information?


> Specifically, MAX98090 (yes I know it's a different codec) has names
> "Speaker Left", "Speaker Right" instead, we will be able to at least
> partially reuse these (or get uniform naming, which is still good).
> As for the "Headphone Jack", it's simply "Headphone".
> 
> Please note that the actual control names in userspace will be,
> exactly,
> 
> "Speaker Left Switch", "Speaker Right Switch",
> "Headphone Left Switch", "Headphone Right Switch"...
> 
> ....where "Switch" gets automatically appended because of the control
> type.
> 
> > +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> 
> This "Headset Mic" name is fine.
> 
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
> > +};
> > +
[...]
> > +
> > +static struct snd_soc_dai_link
> > mt8195_mt6359_max98390_rt5682_dai_links[] = {
> 
> 
> ... again, different name, same contents ...
> 
> 
> And I won't go on repeating the same thing over and over again.
> I think that the best idea here is to either create a mt8195-mt6359-
> rt5682-common.c
> file, or to rename the others to something else and get them all in
> the same file.
> 
> 
> Regards,
> Angelo

Hi Angelo,

Thanks for your review.
Please forgive me for deleting some comments above.
I totally agree that most code can be reused.
I will try revising and merging all mt8195 machine drivers in a file.

Thanks,
Trevor

