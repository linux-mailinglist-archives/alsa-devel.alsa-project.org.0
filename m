Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63C4E4D59
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 08:30:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3008E16D2;
	Wed, 23 Mar 2022 08:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3008E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648020636;
	bh=mf98cGObLm914ZFUbMaxrHvWSfSkSW6WPgbj6DrS280=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcgBZ+SF4j8wKBF1QfXI3jjMRPW/kvT4sU4Z6dVa1MjHtOTAE+lOL5uebqsYcIttU
	 ofZYTqdX33bA4H6n4QZPmHSsw/04Ssj936cnNmmur0+QGxQ3ADUYdtdN5JKhXza+vD
	 za44LVj/0FVCgH+x5j7sZYbQe6b7eikOmcMEnED8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F587F800C1;
	Wed, 23 Mar 2022 08:29:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5620FF802DB; Wed, 23 Mar 2022 08:29:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C879DF800C1
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 08:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C879DF800C1
X-UUID: 8906c5f59aaa459abc743dba05c9964d-20220323
X-UUID: 8906c5f59aaa459abc743dba05c9964d-20220323
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2145046796; Wed, 23 Mar 2022 15:29:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 15:29:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 15:29:17 +0800
Message-ID: <08e3059ab5d645de0544e600b1bf85c95478e897.camel@mediatek.com>
Subject: Re: [PATCH v3 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Wed, 23 Mar 2022 15:29:17 +0800
In-Reply-To: <YjiV9DfLC7T1uweb@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-6-trevor.wu@mediatek.com>
 <YjiV9DfLC7T1uweb@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Mon, 2022-03-21 at 23:12 +0800, Tzung-Bi Shih wrote:
> On Mon, Mar 21, 2022 at 03:23:11PM +0800, Trevor Wu wrote:
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> >  #define RT1011_SPEAKER_AMP_PRESENT		BIT(0)
> >  #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
> > +#define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
> > +
> > +#define MAX98390_CODEC_DAI	"max98390-aif1"
> > +#define MAX98390_DEV0_NAME	"max98390.2-0038" /* right */
> > +#define MAX98390_DEV1_NAME	"max98390.2-0039" /* left */
> >  
> >  #define RT1011_CODEC_DAI	"rt1011-aif"
> >  #define RT1011_DEV0_NAME	"rt1011.2-0038"
> 
> The quirk bit order: RT1011, RT1019, and MAX98390.  To be neat, move
> MAX98390_CODEC_DAI, MAX98390_DEV0_NAME, and MAX98390_DEV1_NAME after
> RT1019_DEV0_NAME to maintain the order.

OK. I will reorder the sequence in v4.

> 
> > +static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_max98390_routes,
> > +				      ARRAY_SIZE(mt8195_max98390_routes
> > ));
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK. I will remove it in v4.

Thanks,
Trevor

