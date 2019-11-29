Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175BD10D1A5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 07:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750E616F6;
	Fri, 29 Nov 2019 07:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750E616F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575010604;
	bh=NAEeV6bpy74Rvi5YWKMFiSXdbKioP2f5psvtMAC0jN4=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBCCyB/UtUCvfXJKn/N23XXuJFj7iI3ayL217doVVQ8HGkBh7jUuK3AHvKaETEfXG
	 xjxisM2vC7f5aGSAHx+sFFH32k1rXxJEjpTtlH1sRePH9P5NHQVfnAteLwqQ/GgXTs
	 rmDmjBUkm3VrX63oC3vit2wX8U1ZCx/JpX7V0AkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6500F8021C;
	Fri, 29 Nov 2019 07:53:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBB29F80141; Fri, 29 Nov 2019 07:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id E1008F800B3
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 07:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1008F800B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="qfnE/gvH"
X-UUID: 5fd80979d24a453a84ff3b12e0933b1c-20191129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Date:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID;
 bh=oi4tPDzs8ZbqKpkDr986mLKVJSE8Ydo7EgiDBxABqc8=; 
 b=qfnE/gvHM0lLKuMXq76D7iOBs8W4yf36PnHxz7I7N5qOGu5Etqyn0daooLulozQyzdibxq8+4HT5vgvV1Td/5wEeglrI61C8luxJt2IJtGfarwCCbiIQJojIiJbgJDWo/KqclZzo3VFpgOxbpkP/9QyFihEuYN4yiKDgPZs/BkQ=;
X-UUID: 5fd80979d24a453a84ff3b12e0933b1c-20191129
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1394102897; Fri, 29 Nov 2019 14:44:00 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 29 Nov 2019 14:43:53 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 29 Nov 2019 14:43:49 +0800
Message-ID: <1575009205.6367.4.camel@mhfsdcap03>
From: Yong Liang <yong.liang@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <49c94039ba327a1295fdfd5d74dca0b9805269b0.camel@pengutronix.de>
References: <1574651030-29519-1-git-send-email-jiaxin.yu@mediatek.com>
 <1574651030-29519-2-git-send-email-jiaxin.yu@mediatek.com>
 <49c94039ba327a1295fdfd5d74dca0b9805269b0.camel@pengutronix.de>
Date: Fri, 29 Nov 2019 14:33:25 +0800
MIME-Version: 1.0
X-Mailer: Evolution 3.10.4-0ubuntu2 
X-TM-SNTS-SMTP: FF3A6F2BD736D72B4F26A39DECBD324E971B973519332DC24613CED2AD969F4E2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 29 Nov 2019 07:53:11 +0100
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzungbi@google.com" <tzungbi@google.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>,
 Eason Yen =?UTF-8?Q?=28=E9=A1=8F=E5=BB=B7=E4=BB=BB=29?=
 <Eason.Yen@mediatek.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 1/2] dt-bindings: mediatek: mt8183: Add
	#reset-cells
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

On Mon, 2019-11-25 at 18:07 +0800, Philipp Zabel wrote:
> On Mon, 2019-11-25 at 11:03 +0800, Jiaxin Yu wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Add #reset-cells property and update example
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
> >  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
> >  .../reset-controller/mt8183-resets.h          | 15 +++++++++++++
> >  3 files changed, 44 insertions(+), 3 deletions(-)
> >  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 3ee625d0812f..4dd36bd3f1ad 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -4,6 +4,7 @@ Required properties:
> >  
> >  - compatible should contain:
> >  	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> > +	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> >  	"mediatek,mt6589-wdt": for MT6589
> >  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> >  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> > @@ -16,11 +17,14 @@ Required properties:
> >  
> >  Optional properties:
> >  - timeout-sec: contains the watchdog timeout in seconds.
> > +- #reset-cells: Should be 1.
> >  
> >  Example:
> >  
> > -wdt: watchdog@10000000 {
> > -	compatible = "mediatek,mt6589-wdt";
> > -	reg = <0x10000000 0x18>;
> > +watchdog: watchdog@10007000 {
> > +	compatible = "mediatek,mt8183-wdt",
> > +		     "mediatek,mt6589-wdt";
> > +	reg = <0 0x10007000 0 0x100>;
> >  	timeout-sec = <10>;
> > +	#reset-cells = <1>;
> >  };
> > diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> > new file mode 100644
> > index 000000000000..e81c8bb311b7
> > --- /dev/null
> > +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Author: Yong Liang <yong.liang@mediatek.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> > +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> > +
> > +#define MT2712_TOPRGU_INFRA_SW_RST				0
> > +#define MT2712_TOPRGU_MM_SW_RST					1
> > +#define MT2712_TOPRGU_MFG_SW_RST				2
> > +#define MT2712_TOPRGU_VENC_SW_RST				3
> > +#define MT2712_TOPRGU_VDEC_SW_RST				4
> > +#define MT2712_TOPRGU_IMG_SW_RST				5
> > +#define MT2712_TOPRGU_INFRA_AO_SW_RST				8
> > +#define MT2712_TOPRGU_USB_SW_RST				9
> > +#define MT2712_TOPRGU_APMIXED_SW_RST				10
> > +
> > +#define MT2712_TOPRGU_SW_RST_NUM				10
> 
> Setting rcdev->nr_resets to 10 will make the check in
> of_reset_simple_xlate() fail for MT2712_TOPRGU_APMIXED_SW_RST.
  -> OK. I will change MT2712_TOPRGU_SW_RST_NUM from 10 to 11
> 
> > +
> > +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> > diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> > index 8804e34ebdd4..d582da6bedae 100644
> > --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> > +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> > @@ -78,4 +78,19 @@
> >  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
> >  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
> >  
> > +#define MT8183_TOPRGU_MM_SW_RST					1
> > +#define MT8183_TOPRGU_MFG_SW_RST				2
> > +#define MT8183_TOPRGU_VENC_SW_RST				3
> > +#define MT8183_TOPRGU_VDEC_SW_RST				4
> > +#define MT8183_TOPRGU_IMG_SW_RST				5
> > +#define MT8183_TOPRGU_MD_SW_RST					7
> > +#define MT8183_TOPRGU_CONN_SW_RST				9
> > +#define MT8183_TOPRGU_CONN_MCU_SW_RST				12
> > +#define MT8183_TOPRGU_IPU0_SW_RST				14
> > +#define MT8183_TOPRGU_IPU1_SW_RST				15
> > +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> > +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> > +
> > +#define MT8183_TOPRGU_SW_RST_NUM				18
> 
> Same here. If the driver uses the default of_xlate function, this has to
> be larger than the index of the last reset.
  -> I will change MT8183_TOPRGU_SW_RST_NUM from 18 to 19
> 
> regards
> Philipp
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
