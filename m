Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DA645D299
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 02:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7826117DE;
	Thu, 25 Nov 2021 02:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7826117DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637804942;
	bh=0S8hOEqswhSazUjfgGM5A0KS6zrQJq/w/j7bSeBiJKo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyLwAFbtZdqIdyHvQIn5WWF34rfLHeI8wBKAFyVW8ja7H/EkPO8v7t8jLNZsf1Mnc
	 CkmuzYAE8VBsNbGCFq+m3bSXkzm030OESDDugD9UcBarPqHf3Cy2rnSQ6lpdHdmDev
	 2ft5R5p08GL/ruXAxMCChni8YolwFu/LpZs6SnyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2852F80212;
	Thu, 25 Nov 2021 02:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EB0F801F7; Thu, 25 Nov 2021 02:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F29FF80087;
 Thu, 25 Nov 2021 02:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F29FF80087
X-UUID: f4d73a026db042eead75ea7641a8ac6c-20211125
X-UUID: f4d73a026db042eead75ea7641a8ac6c-20211125
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1476824208; Thu, 25 Nov 2021 09:47:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 09:47:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 09:47:22 +0800
Message-ID: <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 25 Nov 2021 09:47:22 +0800
In-Reply-To: <YZ4TGvtwO5ySCEkT@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
 <YZ4TGvtwO5ySCEkT@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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
> On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |  10 ++
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 130
> > ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 ++++++++++
> >  6 files changed, 216 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> The patch should move before the 2nd patch in the series as the 2nd
> patch uses mtk-adsp-ipc.h.
> 
> > diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c
> > b/drivers/firmware/mediatek/mtk-adsp-ipc.c
> 
> [...]
> > +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx,
> > uint32_t op)
> > +{
> > +	struct mtk_adsp_chan *dsp_chan = &ipc->chans[idx];
> > +	struct adsp_mbox_ch_info *ch_info = dsp_chan->ch->con_priv;
> > +	int ret;
> > +
> > +	if (idx >= MTK_ADSP_MBOX_NUM)
> > +		return -EINVAL;
> 
> If idx >= MTK_ADSP_MBOX_NUM, the invalid memory access has occurred
> at beginning of the function.
> 
> > +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> > +{
> 
> [...]
> > +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> 
> Why does it need to call device_set_of_node_from_dev()?

The original design regards mt8195 sof of_node as a parent deivce of
mtk-adsp-ipc.

device_set_of_node_from_dev will set of_node_reuse flag to prevent
driver from attempting to claim any mbox ipc resources already claimed
by the sof dsp device.

> 
> > +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> > +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > +		if (!chan_name)
> > +			return -ENOMEM;
> > +
> > +		dsp_chan = &dsp_ipc->chans[i];
> > +		cl = &dsp_chan->cl;
> > +		cl->dev = dev->parent;
> > +		cl->tx_block = false;
> > +		cl->knows_txdone = false;
> > +		cl->tx_prepare = NULL;
> > +		cl->rx_callback = adsp_ipc_recv;
> > +
> > +		dsp_chan->ipc = dsp_ipc;
> > +		dsp_chan->idx = i;
> > +		dsp_chan->ch = mbox_request_channel_byname(cl,
> > chan_name);
> > +		if (IS_ERR(dsp_chan->ch)) {
> > +			ret = PTR_ERR(dsp_chan->ch);
> > +			if (ret != -EPROBE_DEFER)
> > +				dev_err(dev, "Failed to request mbox
> > chan %d ret %d\n",
> > +					i, ret);
> 
> If ret == -EPROBE_DEFER, wouldn't it need to return
> -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.

If ret != -EPROBE_DEFER, it will show a error message then goto out.

If ret == -EPROBE_DEFER, probe funcation also will goto out. 


Both of them will return ret. will not go to next round.

Thanks,
Allen


