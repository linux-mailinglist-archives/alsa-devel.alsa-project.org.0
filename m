Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD964F20DA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 05:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7637C14E;
	Tue,  5 Apr 2022 05:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7637C14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649127962;
	bh=Qmeyu8SiNimBSvE3QbAgciwcRE9B7q9O2RG6uIiM3gE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7p44lAWrFX7PAA8fjBrX7nXAZIuapW0YKGimhyhc5JhHP0tJuHtH4CYW93wygV0K
	 5WphRBTsWyr5qkqQTPxHJ6tJqZ51aZSEPEktFeVq+oazvTFGhAtsAm6E4N+KInKeXm
	 m1dIKeQ5P30kZr+nb8zDc2uo2cQVItX2+wTr2Q54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3136F8016B;
	Tue,  5 Apr 2022 05:05:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42653F8016A; Tue,  5 Apr 2022 05:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8741AF800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 05:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8741AF800D1
X-UUID: c4b5aafc4076432f8e1a3f4932de0a97-20220405
X-UUID: c4b5aafc4076432f8e1a3f4932de0a97-20220405
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1780051827; Tue, 05 Apr 2022 11:04:43 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 11:04:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Apr 2022 11:04:41 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Apr 2022 11:04:40 +0800
Message-ID: <808d08a6dbbca1c0f1699643deb52b71b8b74669.camel@mediatek.com>
Subject: Re: [v3 19/19] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>
Date: Tue, 5 Apr 2022 11:04:33 +0800
In-Reply-To: <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-20-jiaxin.yu@mediatek.com>
 <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

On Mon, 2022-03-14 at 11:18 +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > This fixes the following build errors when mt6358 is configured as
> > module:
> > 
> > > > ERROR: modpost: "mt6358_set_mtkaif_protocol"
> > > > [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko]
> > > > undefined!
> > > > ERROR: modpost: "mt6358_set_mtkaif_protocol"
> > > > [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko]
> > > > undefined!
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> 
> Hello Jiaxin,
> 
> Can you please add a Fixes tag to this patch and send it separately
> from
> the MT8186 series?
> 
> After adding the Fixes tag:
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> Thanks,
> Angelo
> 

Hello, Angelo

Sorry for the late reply. I've sent this out separately.

Link: 
https://lore.kernel.org/lkml/20220319120325.11882-1-jiaxin.yu@mediatek.com/

> > ---
> >   sound/soc/codecs/mt6358.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
> > index 1fdd2f8cf877..61f2a7632fd4 100644
> > --- a/sound/soc/codecs/mt6358.c
> > +++ b/sound/soc/codecs/mt6358.c
> > @@ -107,6 +107,7 @@ int mt6358_set_mtkaif_protocol(struct
> > snd_soc_component *cmpnt,
> >   	priv->mtkaif_protocol = mtkaif_protocol;
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_protocol);
> >   
> >   static void playback_gpio_set(struct mt6358_priv *priv)
> >   {
> > @@ -273,6 +274,7 @@ int mt6358_mtkaif_calibration_enable(struct
> > snd_soc_component *cmpnt)
> >   			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
> >   
> >   int mt6358_mtkaif_calibration_disable(struct snd_soc_component
> > *cmpnt)
> >   {
> > @@ -296,6 +298,7 @@ int mt6358_mtkaif_calibration_disable(struct
> > snd_soc_component *cmpnt)
> >   	capture_gpio_reset(priv);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
> >   
> >   int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component
> > *cmpnt,
> >   					int phase_1, int phase_2)
> > @@ -310,6 +313,7 @@ int mt6358_set_mtkaif_calibration_phase(struct
> > snd_soc_component *cmpnt,
> >   			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
> >   	return 0;
> >   }
> > +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
> >   
> >   /* dl pga gain */
> >   enum {
> 
> 

