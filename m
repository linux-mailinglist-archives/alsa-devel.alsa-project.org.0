Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464A4BA230
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 15:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50501AB7;
	Thu, 17 Feb 2022 15:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50501AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645106494;
	bh=wubUiqClI40QXc6MVVcu+O4s9yGDSJSJkDxMGa0mCM4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ob46c5We003HQycPrYqxd6OSWchaEvMuBEH17Dm0Y8Bno0+i9+lsQsnCNoqqcVJae
	 igP9fW7ziIJtru1cfuf4HG3HHtdBMl7MNhj+O4VGIUq8Udo1vryTD4z5eqr7X3GI0i
	 D8r4MsSzTNwwpxGx+vNdi0rKsk6fkjhTuySlgJz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48EFAF800C0;
	Thu, 17 Feb 2022 15:00:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A188EF80246; Thu, 17 Feb 2022 15:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 811D2F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 15:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 811D2F800C0
X-UUID: 334b4836794847bbb0e77f7a0a234c33-20220217
X-UUID: 334b4836794847bbb0e77f7a0a234c33-20220217
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 205135712; Thu, 17 Feb 2022 22:00:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 22:00:16 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 22:00:15 +0800
Message-ID: <a912ed83c8d959fc3bb0a08f00b3fd036beee270.camel@mediatek.com>
Subject: Re: [PATCH 09/15] ASoC: mediatek: mt8186: support tdm in platform
 driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Feb 2022 21:59:43 +0800
In-Reply-To: <YgZ/pzrJqvcAuzmE@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-10-jiaxin.yu@mediatek.com>
 <YgZ/pzrJqvcAuzmE@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
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

On Fri, 2022-02-11 at 15:24 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:12PM +0800, Jiaxin Yu wrote:
> 
> Again, mostly looks good just fairly small and easily fixable issues:
> 
> > +static int mtk_tdm_hd_en_event(struct snd_soc_dapm_widget *w,
> > +			       struct snd_kcontrol *kcontrol,
> > +			       int event)
> > +{
> > +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w-
> > >dapm);
> > +
> > +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> > +		 __func__, w->name, event);
> > +
> > +	return 0;
> > +}
> 
> This does nothing, you can just remove it.

Yes, this is readlly useless, removed it in the v2 version.

> 
> > +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > +	case SND_SOC_DAIFMT_NB_NF:
> > +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_NB_IF:
> > +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_IB_NF:
> > +		tdm_priv->bck_invert = TDM_BCK_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> > +		break;
> > +	case SND_SOC_DAIFMT_IB_IF:
> > +	default:
> > +		tdm_priv->bck_invert = TDM_BCK_INV;
> > +		tdm_priv->lck_invert = TDM_LCK_INV;
> 
> You should return an error in the default case rather than just
> picking
> one of the behaviours to help spot any configuration errors.

Done in the v2 version.

> 
> > +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +	case SND_SOC_DAIFMT_CBM_CFM:
> > +		tdm_priv->slave_mode = false;
> > +		break;
> > +	case SND_SOC_DAIFMT_CBS_CFS:
> > +		tdm_priv->slave_mode = true;
> 
> We're trying to move away from these defines and the master/slave
> terminology to talk about clock providers instead - the new defines
> are
> _PROVIDER_MASK, _DAIFMT_CBP_CFP and _DAIFMT_CBC_CFC.

Done in the v2 version.

