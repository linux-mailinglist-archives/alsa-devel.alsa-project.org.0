Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79C4D6F37
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 14:33:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6B01746;
	Sat, 12 Mar 2022 14:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6B01746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647091986;
	bh=AXG4AaOM30WRmXMVqa46r8vMoUYBquyrVZpZ7OwY4Ws=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=di6Qj4XGR4wcjSgri2PNLaoYund86dxyM7d08FDBOvXiydi9VeGgFqyliE4nAIUzz
	 /bCzARWPcTkqpoCHSdtTmnRRbsCqHUaxWxUTDnNWC5bmCC0xTBvg32+2t1/lffIPTQ
	 DE7yHiiKBVDwCqrV0G+85dnu9eiPTQfqfQI4C+OY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4249BF8025C;
	Sat, 12 Mar 2022 14:32:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A315F801D5; Sat, 12 Mar 2022 14:31:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E0EF80095
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 14:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E0EF80095
X-UUID: 99baf5ba28184cf080b2aedc2d23801a-20220312
X-UUID: 99baf5ba28184cf080b2aedc2d23801a-20220312
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1999243638; Sat, 12 Mar 2022 21:31:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 12 Mar 2022 21:31:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Mar 2022 21:31:43 +0800
Message-ID: <bb5737baf5c7430ccc40d7cfeaa1bc1a7c8890af.camel@mediatek.com>
Subject: Re: [PATCH 2/5] dt-bindings: mediatek: mt8195: add reset property
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 12 Mar 2022 21:31:43 +0800
In-Reply-To: <Yip3z3XoarN8TeMn@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-3-trevor.wu@mediatek.com>
 <Yip3z3XoarN8TeMn@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
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

On Thu, 2022-03-10 at 16:12 -0600, Rob Herring wrote:
> On Tue, Mar 08, 2022 at 03:24:32PM +0800, Trevor Wu wrote:
> > Add required properties "resets" and "reset_names", which are used
> > to
> > specify audiosys hw reset for mt8195 afe driver.
> 
> The subject needs to be more specific and indicate this applies to
> ASoC 
> and mt8195-afe-pcm. Try to write subjects that could only ever
> appear 
> once as you can never make the same change twice.
> 
> Rob

Hi Rob,

Thanks for your suggestion.
I will revise the subject to "ASoC: dt-bindings: mediatek: mt8195-afe-
pcm: add reset property" in v2.

Thanks,
Trevor

