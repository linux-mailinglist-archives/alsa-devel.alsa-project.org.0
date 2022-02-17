Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4664BA205
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982A91ADE;
	Thu, 17 Feb 2022 14:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982A91ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645106063;
	bh=74EOCaejs0HnBkIIQOPo4SvBnsGOmtiURdVAU6p9RJs=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hVyAC8ScYNNiLnnYuo740sAjoS5d8oxCfMf/InLjuVbQpyOLvpgqG5rQdn/Fq6hjk
	 lVEdTY7rzKQjn0ao9foKK8lPLlhxppT71raE/h97huEA6WRkvXp/+YBNhkXvmU+fMC
	 N3uG1VxbQSgiDtTxC1YUUHU4gDMcaH0FpKVwROks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17ED0F80246;
	Thu, 17 Feb 2022 14:53:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7C08F800CE; Thu, 17 Feb 2022 14:53:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF83FF800CE
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF83FF800CE
X-UUID: 7508a21f15cf42f68e8bd0d4720c2844-20220217
X-UUID: 7508a21f15cf42f68e8bd0d4720c2844-20220217
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553058100; Thu, 17 Feb 2022 21:53:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 21:53:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:53:02 +0800
Message-ID: <4958e2ad25f4940a0c0bbbf23ea027e7bdaf5ac7.camel@mediatek.com>
Subject: Re: [PATCH 10/15] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Feb 2022 21:51:57 +0800
In-Reply-To: <YgaK4hiRjEJi9wQ4@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-11-jiaxin.yu@mediatek.com>
 <YgaK4hiRjEJi9wQ4@sirena.org.uk>
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

On Fri, 2022-02-11 at 16:12 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:13PM +0800, Jiaxin Yu wrote:
> 
> >  sound/soc/mediatek/Kconfig                    |   44 +
> >  sound/soc/mediatek/Makefile                   |    1 +
> >  sound/soc/mediatek/mt8186/Makefile            |   21 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  719 ++++
> >  sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  210 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  245 ++
> >  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  262 ++
> >  sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  211 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
> >  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3030
> > +++++++++++++++
> >  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
> >  .../soc/mediatek/mt8186/mt8186-misc-control.c | 1729 +++++++++
> >  sound/soc/mediatek/mt8186/mt8186-reg.h        | 3433
> > +++++++++++++++++
> 
> I know it's already a long series but perhaps the clock and GPIO bits
> could be split out into separate patches?  This one patch is over
> 300K
> which is a bit much in one go, especially when it's not just all big
> tables.

Ok, I see. I've split them out into separate patches in v2 version.

