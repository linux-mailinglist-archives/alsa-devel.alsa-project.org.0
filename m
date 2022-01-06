Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D04860E5
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 08:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFC117F4;
	Thu,  6 Jan 2022 08:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFC117F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641453093;
	bh=+kJurRtjTcskO4sR940mg6toDzXUQXxt8ikh245W5M8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5WYD/1iivUz46r75TweXZPgIuXU/xow0DyhydqhMFk7rSeNiuGQYLqvyBGYPMuA3
	 ESUMKcEkSTBxgpWIckHsMsIssKKff9cb6e8K7AFZMqcdQXd34ym33Ox8ksq6POPhsE
	 333FUdSfxUrgCLZU8atwFr+lO/SGQv/8TdMhcb2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9870F80158;
	Thu,  6 Jan 2022 08:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B172CF8007E; Thu,  6 Jan 2022 08:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D95F8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 08:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D95F8007E
X-UUID: 8ea96f7b9d844bf38ad79796b36d1f34-20220106
X-UUID: 8ea96f7b9d844bf38ad79796b36d1f34-20220106
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1291158459; Thu, 06 Jan 2022 15:10:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 15:10:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 15:10:08 +0800
Message-ID: <3e00db1d4fe71938b0274331cd49b96bdddccea4.camel@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
From: YC Hung <yc.hung@mediatek.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 6 Jan 2022 15:10:08 +0800
In-Reply-To: <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
References: <20220103043202.6524-1-yc.hung@mediatek.com>
 <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, allen-kh.cheng@mediatek.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Daniel,

My mistake. Thanks for review and comments. I have updated v4 to fix
it. Thanks
On Wed, 2022-01-05 at 17:53 +0200, Daniel Baluta wrote:
> On Mon, Jan 3, 2022 at 1:00 PM YC Hung <yc.hung@mediatek.com> wrote:
> > 
> > From: "YC Hung" <yc.hung@mediatek.com>
> > 
> > This patch adds mt8195 dsp document. The dsp is used for Sound Open
> > Firmware driver node. It includes registers,  clocks, memory
> > regions,
> > and mailbox for dsp.
> > 
> > Signed-off-by: yc.hung <yc.hung@mediatek.com>
> 
> The code patch should be created against original source code from
> Rob's tree. Here it seems the patch is against v2.
> 
> This isn't going to work! Because when Rob will try to apply the
> patch
> it will fail since he doesn't have (and doesnt need to have)
> your previous versions.
> 
> So, please keep the changes history (that's a good thing!) but always
> rebase your patch on maintainer's tree.
> 
> 
> > ---
> > Changes since v2:
> >   Remove useless watchdog interrupt.
> >   Add commit message more detail description.
> > 
> > Changes since v1:
> >   Rename yaml file name as mediatek,mt8195-dsp.yaml
> >   Refine descriptions for mailbox, memory-region and drop unused
> > labels
> >   in examples.
> > ---
> > ---
> >  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 --------
> > ----
> >  1 file changed, 12 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > index bde763191d86..779daa786739 100644
> > --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-
> > dsp.yaml
> > @@ -27,14 +27,6 @@ properties:
> >        - const: cfg
> >        - const: sram
> > 
> > -  interrupts:
> > -    items:
> > -      - description: watchdog interrupt
> > -
> > -  interrupt-names:
> > -    items:
> > -      - const: wdt
> > -
> >    clocks:
> >      items:
> >        - description: mux for audio dsp clock
> > @@ -75,8 +67,6 @@ required:
> >    - compatible
> >    - reg
> >    - reg-names
> > -  - interrupts
> > -  - interrupt-names
> >    - clocks
> >    - clock-names
> >    - memory-region
> > @@ -95,8 +85,6 @@ examples:
> >         reg = <0x10803000  0x1000>,
> >               <0x10840000  0x40000>;
> >         reg-names = "cfg", "sram";
> > -       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> > -       interrupt-names = "wdt";
> >         clocks = <&topckgen 10>, //CLK_TOP_ADSP
> >                  <&clk26m>,
> >                  <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> > --
> > 2.18.0
> > 

