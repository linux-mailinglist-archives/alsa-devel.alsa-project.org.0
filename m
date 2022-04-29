Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530251464A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 12:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 149AA82A;
	Fri, 29 Apr 2022 12:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 149AA82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651226951;
	bh=WY0qLc8hONdFW5NbGN8KXS8inO/L55/MMJmyQxs8cBY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fEJbgwXXiwP7Tr5t94wpBK4jUe5bnQzL9D3JWR2trjpMo0IJ25uOlSFIZW9qd6k2b
	 6WFpV3fvdQnQWNa6Ty2h0S+sQVbX14XzoPZukYBjXlzfnR1DZeMrPaBPD93ohesHRv
	 FF/abSx5Hyo5SS2ehECe4PmTsjJBeGUEDhpDAdkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7595FF8012B;
	Fri, 29 Apr 2022 12:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7779F8025D; Fri, 29 Apr 2022 12:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6B73F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 12:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6B73F8012B
X-UUID: 045731cb2f5c49ca9f4965c85acaa12a-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:be8b9c79-132d-48e6-a122-55eb691152c0, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:043ef6c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 045731cb2f5c49ca9f4965c85acaa12a-20220429
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 592507732; Fri, 29 Apr 2022 18:07:54 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 18:07:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 18:07:53 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 18:07:52 +0800
Message-ID: <99c329534a462b39d9b39ba04851318e7823e54c.camel@mediatek.com>
Subject: Re: [v4 13/18] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 29 Apr 2022 18:07:52 +0800
In-Reply-To: <YmqCORqp6nYuQJZf@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-14-jiaxin.yu@mediatek.com>
 <YmqCORqp6nYuQJZf@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 2022-04-28 at 13:02 +0100, Mark Brown wrote:
> On Thu, Apr 28, 2022 at 05:33:50PM +0800, Jiaxin Yu wrote:
> > Add mt8186 platform and affiliated driver.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  sound/soc/mediatek/Kconfig                    |   44 +
> >  sound/soc/mediatek/Makefile                   |    1 +
> >  sound/soc/mediatek/mt8186/Makefile            |   22 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
> >  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
> >  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3005
> > +++++++++++++++++
> >  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
> >  .../soc/mediatek/mt8186/mt8186-misc-control.c |  294 ++
> >  .../mediatek/mt8186/mt8186-mt6366-common.c    |   59 +
> >  .../mediatek/mt8186/mt8186-mt6366-common.h    |   17 +
> >  sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913
> > ++++++++++++++++
> >  11 files changed, 6920 insertions(+)
> 
> This looks mostly good though it is enormous so I might've missed
> some
> things.  The patch series is already very large but it might still be
> worth splitting this up a bit more, perhaps split the code and data
> tables/register definitions into separate patches?
> 
Yes, agree with you.

I will spit them into three patches:

PATCH 1: 
  - mt8186-reg.h
  - mt8186-interconnection.h
  - mt8186-misc-control.c

PATCH 2:
  - mt8186-mt6366-common.c
  - mt8186-mt6366-common.h

PATCH 3:
  - sound/soc/mediatek/Kconfig 
  - sound/soc/mediatek/Makefile
  - sound/soc/mediatek/mt8186/Makefile
  - sound/soc/mediatek/mt8186/mt8186-afe-common.h
  - .../soc/mediatek/mt8186/mt8186-afe-control.c
  - sound/soc/mediatek/mt8186/mt8186-afe-pcm.c

> A few relatively minor issues with the controls.
> 
> > +/* this order must match reg bit amp_div_ch1/2 */
> > +static const char * const mt8186_sgen_amp_str[] = {
> > +	"1/128", "1/64", "1/32", "1/16", "1/8", "1/4", "1/2", "1" };
> > +static const char * const mt8186_sgen_mute_str[] = {
> > +	"Off", "On"
> > +};
> 
> On/off controls should be normal Switch controls not enums so
> userspace
> can display things sensibly.
> 
> > +static int mt8186_sgen_set(struct snd_kcontrol *kcontrol,
> > +			   struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	struct soc_enum *e = (struct soc_enum *)kcontrol-
> > >private_value;
> > +	int mode;
> > +	int mode_idx;
> > +
> > +	if (ucontrol->value.enumerated.item[0] >= e->items)
> > +		return -EINVAL;
> 
> ...
> 
> > +				   0x3f << INNER_LOOP_BACK_MODE_SFT);
> > +	}
> > +
> > +	afe_priv->sgen_mode = mode;
> > +
> > +	return 0;
> > +}
> 
> This should return 1 if the value is different from the previous
> value
> so event generation works, please run mixer-test against a system
> using
> the driver to help spot issues like this.  The same issue applies to
> at
> least some of the other custom controls.
> 
Got it.

> > +static int mt8186_sgen_mute_set(struct snd_kcontrol *kcontrol,
> > +				struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct soc_enum *e = (struct soc_enum *)kcontrol-
> > >private_value;
> > +	int mute;
> > +
> > +	if (ucontrol->value.enumerated.item[0] >= e->items)
> > +		return -EINVAL;
> > +
> > +	mute = ucontrol->value.integer.value[0];
> > +
> > +	dev_dbg(afe->dev, "%s(), kcontrol name %s, mute %d\n",
> > +		__func__, kcontrol->id.name, mute);
> > +
> > +	if (strcmp(kcontrol->id.name, SGEN_MUTE_CH1_KCONTROL_NAME) ==
> > 0) {
> > +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> > +				   MUTE_SW_CH1_MASK_SFT,
> > +				   mute << MUTE_SW_CH1_SFT);
> > +	} else {
> > +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> > +				   MUTE_SW_CH2_MASK_SFT,
> > +				   mute << MUTE_SW_CH2_SFT);
> > +	}
> > +
> > +	return 0;
> > +}
> 
> I can't tell why some of these are done with custom code rather than
> using a normal SOC_SINGLE()?

Yes, it's better to use SOC_SINGLE. I will fix them in next version.

Thanks,
Jiaxin.yu

