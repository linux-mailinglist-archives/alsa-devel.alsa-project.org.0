Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF145D61F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 09:25:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A3D184D;
	Thu, 25 Nov 2021 09:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A3D184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637828747;
	bh=QwPZq/jl5XuE9VBWfjOrXWTriG7Q8YL7m/hdAlaferw=;
	h=Subject:From:To:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnW0kxPKLN3rLj9q90LH7D4aNuVtu8JTWdc0EFPFwr2C1Q3SM0yHSbBWoJaIW1OXR
	 yvkhxtLOeNnTD5B+BBQ77YH0AcaI+1TnOWw2CSC9nR4YWwIYu4YthHANutbYpRmuqU
	 hBvqv8CLkc890uII6KrpChVE/n8lTABJdf9cTV+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675DDF80430;
	Thu, 25 Nov 2021 09:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25BC4F8049E; Thu, 25 Nov 2021 09:24:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4395FF80087;
 Thu, 25 Nov 2021 09:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4395FF80087
X-UUID: ce4a736e9ec949118e53bf084a580923-20211125
X-UUID: ce4a736e9ec949118e53bf084a580923-20211125
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1816071343; Thu, 25 Nov 2021 16:24:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 16:24:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 16:24:32 +0800
Message-ID: <d7626397a034ff429e0d915994c0ebc16f2706fe.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 25 Nov 2021 16:24:32 +0800
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
 <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
 <YZ8r9GvUFqkGCqSz@google.com>
In-Reply-To: <YZ8r9GvUFqkGCqSz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,
 "cujomalainey@google.com" <cujomalainey@google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

On Thu, 2021-11-25 at 14:23 +0800, Tzung-Bi Shih wrote:
> > On Thu, Nov 25, 2021 at 09:51:27AM +0800, allen-kh.cheng wrote:
> > > > On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> > > > > > > > On Wed, Nov 24, 2021 at 04:45:13PM +0800, allen-
> > > > kh.cheng wrote:
> > > > > > > > > > > > +static int mtk_adsp_mbox_send_data(struct
> > > > > > mbox_chan *chan,
> > > > 
> > > > > > > >
> > > > > > > > void
> > > > > > > > > > > > *data)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +  struct adsp_mbox_ch_info *ch_info = chan-
> > > > > > >con_priv;
> > > > > > > > > > > > +  void __iomem *reg = ch_info->va_reg;
> > > > > > > > > > > > +
> > > > > > > > > > > > +  spin_lock(&ch_info->lock);
> > > > > > > > > > > > +  writel(ch_info->ipc_op_val, reg +
> > > > > > MTK_ADSP_MBOX_IN_CMD);
> > > > > > > > > > > > +  spin_unlock(&ch_info->lock);
> > > > 
> > > > > > > >
> > > > > > > > Why does it need the lock?
> > > > > > > >
> > > > > > > > Is the write to MTK_ADSP_MBOX_IN_CMD a synchronous
> > > > operation?
> > > > > > > > - If yes, I failed to understand why does it need the
> > > > > > > > lock.  Every
> > > > > > > > calls to mtk_adsp_mbox_send_data() should wait for the
> > > > data
> > > 
> > > > > >
> > > > > > transfer
> > > > > > > > completion.
> > > > > > > > - If no, I also failed to understand
> > > 
> > > > > >
> > > > > > why.  mtk_adsp_mbox_send_data()
> > > > > > > > has no way to be aware of the transfer
> > > > completion.  Would
> > > > > > > > expect a
> > > > > > > > loop for checking the completion for the case.
> > > > > > > >
> > > 
> > > > > >
> > > > > >  
> > 
> > > >
> > > > In ADSP MBOX IPC flow,
> > > >  
> > > > Host would call mbox send data when the shared data transfer
> > > > completed.
> > > >  
> > > > (mtk_adsp_mbox_send_data will notice client using
> > > > MTK_ADSP_MBOX_IN_CMD)
> > > >  
> > > > It’s more like a signal.
> > > >  
> > > > In general case,
> > > >  
> > > > There may be some hosts use the same mbox channel.
> > > >  
> > > > I think it’s better using lock to protect access to
> > > > MTK_ADSP_MBOX_IN_CMD registers
> 
> >
> > I still failed to understand.  What if 2 hosts notify the same
> client
> > by writing MTK_ADSP_MBOX_IN_CMD at the same time?

 
Hi Tzung-Bi,
 
After I think carefully. There is no need to add lock in
mtk_adsp_mbox_send_data.
 
In our dsp ipc design, we only have one host(ap) and one client(dsp).
 
If sof ip message transfer is complete, host will use mbox notice dsp
message arrived.
 
(MTK_ADSP_MBOX_IN_CMD is signal to trigger mbox irq)
 
I will remove this in next version.
 
 

