Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F6145D2A1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 02:53:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E561813;
	Thu, 25 Nov 2021 02:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E561813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637805182;
	bh=5gXc3ONYmg2RLThWQA/qUiKWqxm5zdJcLxfGKRjvhkc=;
	h=Subject:From:To:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IB9RCnQcTL/0GT1d4mZymQ5Q/SCvEjB8efq9bDQt041uaGHvKuEfDU8uZghW4Lhj1
	 tdUG65Xh9OzFxl/q7Wf/07qib3d3z/bnuw7fx24RvVZtMPFP+SaV+FrQSWSV+POeT5
	 pAsuJRxqLYKrKNUYxw8mqSBr26YbN/qWcdFRUfDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7141F80212;
	Thu, 25 Nov 2021 02:51:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC20BF801F7; Thu, 25 Nov 2021 02:51:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B108F80087;
 Thu, 25 Nov 2021 02:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B108F80087
X-UUID: 8da7169c529e42c4a7fa819988cc0cf6-20211125
X-UUID: 8da7169c529e42c4a7fa819988cc0cf6-20211125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1131350682; Thu, 25 Nov 2021 09:51:30 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 09:51:28 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Nov 2021 09:51:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 09:51:27 +0800
Message-ID: <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 25 Nov 2021 09:51:27 +0800
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
In-Reply-To: <YZ4TCYmvegnC/kR0@google.com>
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

Hi Tzung-Bi,
 
Thanks for your suggestions.
 
 
On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> > On Wed, Nov 24, 2021 at 04:45:13PM +0800, allen-kh.cheng wrote:
> > > > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > > > index c9fc06c7e685..fc99d9fc80af 100644
> > > > --- a/drivers/mailbox/Kconfig
> > > > +++ b/drivers/mailbox/Kconfig
> > > > @@ -236,6 +236,13 @@ config MTK_CMDQ_MBOX
> > > >      critical time limitation, such as updating display
> > > > configuration
> > > >      during the vblank.
> > > >  
> > > > +config MTK_ADSP_IPC_MBOX
> > > > +  tristate "MediaTek ADSP Mailbox Controller"
> > > > +  depends on ARCH_MEDIATEK || COMPILE_TEST
> > > > +  help
> > > > +    Say yes here to add support for MediaTek ADSP IPC mailbox
> > > > controller
> > > > +    driver. It is used to send short messages between
> > processors
> > > > with dsp.
> 
> >
> > Although the file didn't maintain alphabetical order, to be neat,
> > moving MTK_ADSP_IPC_MBOX before MTK_CMDQ_MBOX makes more sense.
> >
> > > > diff --git a/drivers/mailbox/Makefile
> > b/drivers/mailbox/Makefile
> > > > index c2089f04887e..479a9ae56d5e 100644
> > > > --- a/drivers/mailbox/Makefile
> > > > +++ b/drivers/mailbox/Makefile
> > > > @@ -51,6 +51,8 @@ obj-$(CONFIG_STM32_IPCC)  += stm32-ipcc.o
> > > >  
> > > >  obj-$(CONFIG_MTK_CMDQ_MBOX) += mtk-cmdq-mailbox.o
> > > >  
> > > > +obj-$(CONFIG_MTK_ADSP_IPC_MBOX) += mtk-adsp-mailbox.o
> > > > +
> 
> >
> > Ditto.  Move CONFIG_MTK_ADSP_IPC_MBOX before CONFIG_MTK_CMDQ_MBOX
> > without blank line separation.
> >
> > > > diff --git a/drivers/mailbox/mtk-adsp-mailbox.c
> > > > b/drivers/mailbox/mtk-adsp-mailbox.c
> 
> >
> > [...]
> > > > +static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void
> > *data)
> > > > +{
> > > > +  struct mbox_chan *ch = (struct mbox_chan *)data;
> 
> >
> > The cast should be able to remove.
> >
> > > > +static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
> > > > +{
> > > > +  struct mbox_chan *ch = (struct mbox_chan *)data;
> 
> >
> > The cast should be able to remove.
> >
> > > > +static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
> > > > +{
> > > > +  struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> > > > +  void __iomem *reg = ch_info->va_reg;
> > > > +
> > > > +  /* Clear DSP mbox command */
> > > > +  writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
> > > > +  writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
> > > > +
> > > > +  return 0;
> > > > +}
> > > > +
> > > > +static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
> > > > +{
> > > > +  chan->con_priv = NULL;
> > > > +}
> 
> >
> > Shall mtk_adsp_mbox_shutdown() also clear DSP mbox?  I.e.:
> > writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
> > writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
> >
> > > > +static int mtk_adsp_mbox_send_data(struct mbox_chan *chan,
> > void
> > > > *data)
> > > > +{
> > > > +  struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> > > > +  void __iomem *reg = ch_info->va_reg;
> > > > +
> > > > +  spin_lock(&ch_info->lock);
> > > > +  writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
> > > > +  spin_unlock(&ch_info->lock);
> 
> >
> > Why does it need the lock?
> >
> > Is the write to MTK_ADSP_MBOX_IN_CMD a synchronous operation?
> > - If yes, I failed to understand why does it need the lock.  Every
> > calls to mtk_adsp_mbox_send_data() should wait for the data
> transfer
> > completion.
> > - If no, I also failed to understand
> why.  mtk_adsp_mbox_send_data()
> > has no way to be aware of the transfer completion.  Would expect a
> > loop for checking the completion for the case.
> >
>  

In ADSP MBOX IPC flow,
 
Host would call mbox send data when the shared data transfer completed.
 
(mtk_adsp_mbox_send_data will notice client using MTK_ADSP_MBOX_IN_CMD)
 
It’s more like a signal.
 
In general case,
 
There may be some hosts use the same mbox channel.
 
I think it’s better using lock to protect access to
MTK_ADSP_MBOX_IN_CMD registers
 
 
Thanks,
Allen
 
> > > > +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> > > > +{
> > > > +  struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> > > > +  void __iomem *reg = ch_info->va_reg;
> > > > +  u32 op = readl(reg + MTK_ADSP_MBOX_IN_CMD);
> > > > +
> > > > +  return (op == 0) ? true : false;
> 
> >
> > To be concise, return readl(...) == 0;
> >
> > > > +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> > > > +{
> 
> >
> > [...]
> > > > +  res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +  if (!res) {
> > > > +      dev_err(dev, "no adsp mbox register resource\n");
> > > > +      return -ENXIO;
> > > > +  }
> > > > +
> > > > +  size = resource_size(res);
> > > > +  priv->va_mboxreg = devm_ioremap(dev, (phys_addr_t)res-
> > >start,
> > > > size);
> > > > +  if (IS_ERR(priv->va_mboxreg))
> > > > +      return PTR_ERR(priv->va_mboxreg);
> 
> >
> > Use devm_platform_ioremap_resource(), it should be equivalent.
> >
> > > > +  /* set adsp mbox channel info */
> > > > +  ch_info = devm_kzalloc(mbox->dev, sizeof(*ch_info),
> > > > GFP_KERNEL);
> 
> >
> > To be neat, use dev instead of mbox->dev.
> >
> > > > +  ret = devm_mbox_controller_register(dev, &priv->mbox);
> > > > +  if (ret < 0)
> > > > +      dev_err(dev, "error: failed to register mailbox:%d\n",
> > > > ret);
> > > > +
> > > > +  return ret;
> 
> >
> > To be concise, return devm_mbox_controller_register(...);
>  
>  
>  

