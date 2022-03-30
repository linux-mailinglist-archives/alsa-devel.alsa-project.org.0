Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F10154EC998
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 18:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF0518E2;
	Wed, 30 Mar 2022 18:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF0518E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648657292;
	bh=Yf1j2oPEzYKaACxuNGQO3Zdvn73rRlvh9s5KCX6nBkE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcD0xCPc7+2oFZ0Inl32KdvM3s0EBU+d5K+UdFHrJZX1bGfbXk6Wyb4MwkN44IEdO
	 a80TG/9aiUua/f3lY+cTIN/xfCUqFzA8BI/AqJPFtqebTBxECpLbvZwDAxW0iItLLM
	 VzTVaRu5+n6RMjJYquIVE1zl+RxUZVNm8uBKyHYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8204F80253;
	Wed, 30 Mar 2022 18:20:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03889F80254; Wed, 30 Mar 2022 18:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB1AF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 18:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB1AF80155
X-UUID: 3a9f5d6c95384520b331cc0095484ebf-20220331
X-UUID: 3a9f5d6c95384520b331cc0095484ebf-20220331
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1884505418; Thu, 31 Mar 2022 00:20:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 00:20:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 00:20:09 +0800
Message-ID: <7462933d959bd8ed1b7e3259f607a2e47436371c.camel@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Thu, 31 Mar 2022 00:20:09 +0800
In-Reply-To: <20220330152026.6nuigsldx46lue44@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
 <20220330152026.6nuigsldx46lue44@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
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

On Wed, 2022-03-30 at 11:20 -0400, Nícolas F. R. A. Prado wrote:

> > > >  static int mt8192_mt6359_dev_probe(struct platform_device
> > > > *pdev)
> > > >  {
> > > >  	struct snd_soc_card *card;
> > > > -	struct device_node *platform_node, *hdmi_codec;
> > > > +	struct device_node *platform_node, *hdmi_codec,
> > > > *speaker_codec;
> > > >  	int ret, i;
> > > >  	struct snd_soc_dai_link *dai_link;
> > > >  	struct mt8192_mt6359_priv *priv;
> > > >  
> > > > -	platform_node = of_parse_phandle(pdev->dev.of_node,
> > > > -					 "mediatek,platform",
> > > > 0);
> > > > -	if (!platform_node) {
> > > > -		dev_err(&pdev->dev, "Property 'platform'
> > > > missing or
> > > > invalid\n");
> > > > +	card = (struct snd_soc_card
> > > > *)of_device_get_match_data(&pdev-
> > > > > dev);
> > > > 
> > > > +	if (!card)
> > > >  		return -EINVAL;
> > > > +	card->dev = &pdev->dev;
> > > > +
> > > > +	platform_node = of_parse_phandle(pdev->dev.of_node,
> > > > "mediatek,platform", 0);
> > > > +	if (!platform_node) {
> > > > +		ret = -EINVAL;
> > > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > > 'platform'
> > > > missing or invalid\n");
> > > > +		goto err_platform_node;
> > > >  	}
> > > >  
> > > > -	card = (struct snd_soc_card
> > > > *)of_device_get_match_data(&pdev-
> > > > > dev);
> > > > 
> > > > -	if (!card) {
> > > > +	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> > > > "mediatek,hdmi-codec", 0);
> > > > +	if (!hdmi_codec) {
> > > >  		ret = -EINVAL;
> > > > -		goto put_platform_node;
> > > > +		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-
> > > > codec'
> > > > missing or invalid\n");
> > > > +		goto err_hdmi_codec;
> > > 
> > > You're making hdmi-codec a required property, since now the
> > > driver
> > > fails to
> > > probe without it. Is it really required though? The driver code
> > > still
> > > checks for
> > > the presence of hdmi_codec before using it, so shouldn't it be
> > > fine
> > > to let it be
> > > optional?
> > > 
> > > If it is really required now though, then I guess at least the
> > > dt-
> > > binding should
> > > be updated accordingly. (Although I think this would technically
> > > break the ABI?)
> > > 
> > > Thanks,
> > > Nícolas
> > 
> > Hi Nícolas,
> > 
> > Thanks for your comment. Indeed I made hdmi-codec a required
> > property,
> > because it is a must in this machine driver. I prefer to report
> > errors
> > during the registration rather than during the use.
> 
> But what do you mean that it is required in this machine driver? The
> code checks
> for presence of hdmi_codec and ignores it if it's not set, so it does
> really
> seem optional to me. Also, I have tested this driver on mt8192-
> asurada-spherion
> without hdmi-codec set in the DT and the speaker and headphone sound
> works just
> fine.
> 
> Besides, there might be machines using this driver that don't support
> HDMI, and
> requiring an hdmi-codec in the DT for them would not make any sense.
> So keeping
> hdmi-codec as optional seems like the most sensible solution to me,
> really.
> 
> Thanks,
> Nícolas

Yes, I agree with you. In the past, if there was a new board without
HDMI audio, we would choose to add a new machine driver and a new dt-
bindings. But now, in order to simplify the code, we tend to share one
machine driver for boards that use similar codecs. And we are doing
this now.

Thanks,
Jiaxin.Yu


