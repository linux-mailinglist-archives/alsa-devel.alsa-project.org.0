Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF64BA278
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 15:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7E61AA8;
	Thu, 17 Feb 2022 15:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7E61AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645106784;
	bh=p6HGqdAGUD60ZHgNOAklk4mgMUS5llfoc1fRQXSYjCo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xu5w0cdek21DcMPojm+u9ims+CwqXByzJZZ1IyM8EuqnqvpwV0vuj2e/FgUBuQTJv
	 yWsmakXnKKrBbtdAQYbmTpfi+O4X9BNykefYThB+3AV5aGOdv0pDx2N4wN2pe+S6O3
	 QJcJLqarugdSs9ny2YcG7QaKdTdpkhdQZP6UuQE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38FE7F800C0;
	Thu, 17 Feb 2022 15:05:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE7E2F80240; Thu, 17 Feb 2022 15:05:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2579F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 15:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2579F800C0
X-UUID: 13930417666347189e89e6836c68b0ee-20220217
X-UUID: 13930417666347189e89e6836c68b0ee-20220217
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 197789904; Thu, 17 Feb 2022 22:05:09 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 22:05:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 22:05:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 22:05:07 +0800
Message-ID: <62ad00889c7cf0e1f7501b9e5b3ab1b132639281.camel@mediatek.com>
Subject: Re: [PATCH 05/15] ASoC: mediatek: mt8186: support hw gain in
 platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Feb 2022 22:05:07 +0800
In-Reply-To: <YgZ9gadN8RksWeWN@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-6-jiaxin.yu@mediatek.com>
 <YgZ9gadN8RksWeWN@sirena.org.uk>
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

On Fri, 2022-02-11 at 15:15 +0000, Mark Brown wrote:
> On Fri, Feb 11, 2022 at 06:38:08PM +0800, Jiaxin Yu wrote:
> 
> Again, mostly looks good just some minor issues (I've not repeated
> some
> that applied to the prior code):
> 
> > +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> > +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN15,
> > +				    I_ADDA_UL_CH1, 1, 0),
> > +};
> 
> These end up as regular user visible controls so should have standard
> control names - in this case ending in Switch since it's a simple
> on/off.  A similar issue was there in the earlier patches.
Yes, I have corrected the control names in the other patches together.

> 
> > +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> > +	SOC_SINGLE("HW Gain 1", AFE_GAIN1_CON1,
> > +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> > +	SOC_SINGLE("HW Gain 2", AFE_GAIN2_CON1,
> > +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),
> 
> These should have standard names like "HW 1 Volume" so userspace has
> a
> better idea how to display them.

Ok, I see.

