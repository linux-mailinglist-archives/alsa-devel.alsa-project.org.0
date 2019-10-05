Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB60CC851
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFC21683;
	Sat,  5 Oct 2019 08:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFC21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255681;
	bh=gb8s1sMaPU8PDoQXY6E3SMfTiZ04bS2BT/qdRIfI1aM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axMH3R9eMv1ozbLLu77Id2OgDf7tRUVt0un20pFysUnPAD6q75OAKWeQPSoUT85h7
	 wsF9wUWNxF5Tx3qQhDe3icLYpFPmBB3x5zQK026I/gm0a5qT3FUG0qsrL7nuKaqd/G
	 2GzykKVxPh/DCexo7vl/co5ACvivnAcK5NOi7B0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB27F800D2;
	Sat,  5 Oct 2019 07:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15412F8070E; Sat,  5 Oct 2019 07:59:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_30,RDNS_NONE,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 7DACFF80506
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DACFF80506
X-UUID: c482a5b751ea4e828975679a310b3ef0-20191005
X-UUID: c482a5b751ea4e828975679a310b3ef0-20191005
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 332400420; Sat, 05 Oct 2019 13:59:41 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 5 Oct 2019 13:59:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 5 Oct 2019 13:59:38 +0800
Message-ID: <1570255179.29077.24.camel@mtksdaap41>
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Sat, 5 Oct 2019 13:59:39 +0800
In-Reply-To: <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <a0b2e9a3-ca77-814f-b7bd-edc69f00fce2@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 yong.liang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 eason.yen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add
	reset controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 2019-10-03 at 06:49 -0700, Guenter Roeck wrote:
> On 9/27/19 3:31 AM, Jiaxin Yu wrote:

<snip..>


> > +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> > +			       unsigned long id)
> > +{
> > +	unsigned int tmp;
> > +	unsigned long flags;
> > +	struct toprgu_reset *data = container_of(rcdev,
> > +				struct toprgu_reset, rcdev);
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +
> > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > +	tmp |= BIT(id);
> > +	tmp |= WDT_SWSYS_RST_KEY;
> > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > +
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> > +				 unsigned long id)
> > +{
> > +	unsigned int tmp;
> > +	unsigned long flags;
> > +	struct toprgu_reset *data = container_of(rcdev,
> > +					struct toprgu_reset, rcdev);
> > +
> > +	spin_lock_irqsave(&data->lock, flags);
> > +
> > +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> > +	tmp &= ~BIT(id);
> > +	tmp |= WDT_SWSYS_RST_KEY;
> > +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> > +
> > +	spin_unlock_irqrestore(&data->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int toprgu_reset(struct reset_controller_dev *rcdev,
> > +			unsigned long id)
> > +{
> > +	int ret;
> > +
> > +	ret = toprgu_reset_assert(rcdev, id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return toprgu_reset_deassert(rcdev, id);
> 
> Unless there is additional synchronization elsewhere, parallel calls
> to the -> assert, and ->reset callbacks may result in the reset being
> deasserted while at least one caller (the one who called the ->assert
> function) believes that it is still asserted.
> 
> [ ... and if there _is_ additional synchronization elsewhere, the
>    local spinlock would be unnecessary ]
> 

I'm not sure if this count as additional synchronization, but you could
get exclusive control to the reset by calling
reset_control_get_exclusive so others won't try to reset the component
while you are using it.

In this case, you still need spinlock because other drivers might trying
to reset their components and they share same register.

Joe.C


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
