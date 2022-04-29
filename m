Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16D51421F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 08:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 805619F6;
	Fri, 29 Apr 2022 08:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 805619F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651212065;
	bh=agT/OGbej8JavnKnB1CEWcJgau+bTDrE7NAcsDX59r4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPoNoWeKH+A8E4nfoWd/OYdgRK3fBOVSFW+Og6DrMruiyooFKPSzNNWucvjv6IwAE
	 LchrfXTupdfjZaJ2k9aTemDOCJetVrRWDSlmfbCKr/R6ZzpwSGheLzaqeWtaBU0puX
	 Yb99FuxY2knug1DNhJJDau6P4zObEy3CteSI94tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3C5FF8007E;
	Fri, 29 Apr 2022 08:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9FDF8025D; Fri, 29 Apr 2022 08:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A88F8007E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 07:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A88F8007E
X-UUID: bd6b44fac70b4733bbe0d11853d89fcf-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:6e9475b7-ebc5-477c-ac85-c26332b349d9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:31
X-CID-INFO: VERSION:1.1.4, REQID:6e9475b7-ebc5-477c-ac85-c26332b349d9, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:31
X-CID-META: VersionHash:faefae9, CLOUDID:3fd5232f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:6ec4fd23a083,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: bd6b44fac70b4733bbe0d11853d89fcf-20220429
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785308049; Fri, 29 Apr 2022 13:59:47 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 29 Apr 2022 13:59:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 13:59:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 13:59:45 +0800
Message-ID: <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
From: YC Hung <yc.hung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Date: Fri, 29 Apr 2022 13:59:46 +0800
In-Reply-To: <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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

Hi Mattias/Rob,

Sorry I miss this mail.
Could you please help to check this patch? Thanks.

On Fri, 2022-01-14 at 13:56 +0100, Matthias Brugger wrote:
> 
> On 12/01/2022 02:43, Rob Herring wrote:
> > On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
> > > From: "YC Hung" <yc.hung@mediatek.com>
> > > 
> > > This patch adds mt8195 dsp document. The dsp is used for Sound
> > > Open
> > > Firmware driver node. It includes registers,  clocks, memory
> > > regions,
> > > and mailbox for dsp.
> > > 
> > > Signed-off-by: yc.hung <yc.hung@mediatek.com>
> > > ---
> > > Changes since v3:
> > >    Fix patch v3 error : v3 only provide difference between v3 and
> > > v2.
> > > 
> > > Changes since v2:
> > >    Remove useless watchdog interrupt.
> > >    Add commit message more detail description.
> > > 
> > > Changes since v1:
> > >    Rename yaml file name as mediatek,mt8195-dsp.yaml
> > >    Refine descriptions for mailbox, memory-region and drop unused
> > > labels
> > >    in examples.
> > > ---
> > >   .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105
> > > ++++++++++++++++++
> > >   1 file changed, 105 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> > > 
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> 
> Rob, it seems we don't have a maintainer for this bindings. Shall I
> as MediaTek 
> SoC maintainer take them through my branch?
> 
> Regards,
> Matthias

