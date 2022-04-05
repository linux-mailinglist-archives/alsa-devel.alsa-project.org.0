Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F84F20E3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 06:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E5216E5;
	Tue,  5 Apr 2022 06:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E5216E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649131668;
	bh=kHtEycWZ45y55Y6RvDzK2Hra6uI165mJfOXu4WeCcoM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fk5Nlg6d/7lkhk4xpUzbtBIe2DHs7vuHfoungNJSukBowyaplfEL9Dt8sexoDYieg
	 7VF/OeH7Rn6oFD5it9zrnJUa93zs1Uv9qy7inQkxJ11UkXVk7/KUylzwsZB8u+mQEW
	 n/D5GEIfZJbWygB4W4VnGnvk4dmfRxq9h6qJfD5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC429F8016B;
	Tue,  5 Apr 2022 06:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B28F8016A; Tue,  5 Apr 2022 06:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31993F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 06:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31993F800D2
X-UUID: 270c0d8d6eea477fa457c65fac8df177-20220405
X-UUID: 270c0d8d6eea477fa457c65fac8df177-20220405
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2092507740; Tue, 05 Apr 2022 12:06:31 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 12:06:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Apr 2022 12:06:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Apr 2022 12:06:29 +0800
Message-ID: <6a29c32f42c25ec6e19de0db999ac7ca25869c36.camel@mediatek.com>
Subject: Re: [v3 15/19] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>
Date: Tue, 5 Apr 2022 12:06:29 +0800
In-Reply-To: <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-16-jiaxin.yu@mediatek.com>
 <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
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

On Mon, 2022-03-14 at 11:44 +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > Add support for mt8186 board with mt6366, da7219 and max98357.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 924
> > ++++++++++++++++++
> >   1 file changed, 924 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-
> > da7219-max98357.c
> > 
> 
> Hello Jiaxin,
> 
> I see some duplication between this one and the mt6366-rt1019-
> rt5682s....
> ....for this reason, I would propose to split out the MT6366 bits
> into a
> common file, something like mt8186-mt6366-common.c, as to reduce the
> duplication.
> 

Hello Angelo,

I'm sorry to reply so later about this comment. I've been thinking
about the repetition of these two machine driver recently. The biggest
difference between them are the .init .ops and .be_hw_params_fixup
callback functions of BE's dai_link. So I want break them down into
rt1019-rt5682s.c and da7219-max98357.c, the rest becomes mt8186-
mt6366.c.

SND_SOC_MT8186_MT6366 ==> mt8186-mt6366.c
SND_SOC_RT1019_RT5682S ==> rt1019-rt5682s.c
SND_SOC_DA7219_MAX98357 ==> da7219-max98357.c

Or put these three files in the same mt8186-mt6366.c, then distinguish
by different compatible string.

If it is expected to see MT8186 machines with DA7219 or MAX98357,
> then it'd be a
> good idea to also do something about preventively commonizing these
> ones, like
> it is being done in ... MT8192, if I remember correctly.
> 
> Regards,
> Angelo

Yes, I will change this part that being done in MT8192 to simplify the
code. But the part of mt8192 is being reviewed. I'm not sure if you
have any comments about this series.

Link: 
https://lore.kernel.org/linux-arm-kernel/20220402051754.17513-1-jiaxin.yu@mediatek.com/T/

Jiaxin.Yu
Thanks.



