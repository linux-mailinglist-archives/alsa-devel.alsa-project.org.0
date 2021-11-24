Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556645B858
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 11:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC4A17A7;
	Wed, 24 Nov 2021 11:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC4A17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637749606;
	bh=CKHIHTg0Ne21AoP0jZbkP9W/BUZ5h3LG0HezFEK/yl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqgVc5KPtw6arRCAHepZXFXDjkZp6kNRkkJoh8kDhDAnSkk90HFj8rRxWQiU50t+c
	 485EYqi+6BbI166mPhHlkjd05PRC3YBH7Z5dvKDWNjW0bSHB3f35z32d4clkCLWX9W
	 IplIRkTIS1hoQPwSifOSbnaO8sXEqf/hxyOvnU1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F0EBF80212;
	Wed, 24 Nov 2021 11:25:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFB7F8013A; Wed, 24 Nov 2021 11:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C6EF8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 11:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C6EF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TUOz5Mfg"
Received: by mail-pg1-x531.google.com with SMTP id m15so1705740pgu.11
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RWDbxw0O+Eb2MTODPtyb5giEnnTJJaqwqAJtlwbLKPM=;
 b=TUOz5MfgG5JMzyZ6iwNq72F59avCAePjCoi5R5mYzgjxOabfcPIkv/bF2Tc1L1gGE/
 dXLcUIr5YGb2GMc38BMHvZFi8xLHBdoicirIxGj8Q8Fi3qy8Ty+rivQNOn6eNWpXjUeg
 Ka4IJxZZZyXSDcU342PW0GfzGYlVWPhL4ViLLwvmfTs4rPnjeKv+IqD9ac0NpcZGOnzp
 ldUTjhKiI7o+vzFrUwyanPTB1KN+3PggPEJWt895E6pucNJ5Hn5rNAvruC2i82QWgyO+
 v8fC1QGAyrRZX90+bJFZvUM3DgXMVM4cK9QmtNEc3ZY8zwK9ykP+OvQY7Uy7H2tu06jh
 Jefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RWDbxw0O+Eb2MTODPtyb5giEnnTJJaqwqAJtlwbLKPM=;
 b=Itv3taXczB00FcvkL6zcz/2Mjbi5pE+o1WzlRT5BK7KMS0denaUcNAq36/UtiHMpvn
 PYlW0wcFTIXXxp6+dWRbhNtD3KJotEx5VznXLxB1ZYQf1Wfe9W8aHB0nBJ/+VtyiJBM4
 zUoD2wnj6Nfyz5VEN/i2fY/sJhMFOEioWFQ/gWcu4DtvUHK7osIvb+NNkz8gnFvvJ1mT
 e8iEKe0hQXInx9UIIX9euDEqZCBQ7S94g2bxStSGE72V8VLM7j6ozhnp89akTh1vxZ7P
 ea+PX4KlPDOdvU8u5rie48Gi+ManAiMrieXsLSqeQnc51FEahrQFdy6dacNx3GiO1foc
 mTOA==
X-Gm-Message-State: AOAM531dYthuzIibd4loznQ8DbV0KCGJRM7d59AahYuCHRx5HQ8YNIO/
 j1nyqqvhqpYCBLBF7fEh6478LQ==
X-Google-Smtp-Source: ABdhPJy4yGk5G/wT8MjPGEmXFxJwr4sD+MfMiZ+bTpsvRjJhdnwJCzHW6W0Mc4xMDUEALiJGPp8oIg==
X-Received: by 2002:a63:90c1:: with SMTP id a184mr7144545pge.222.1637749518381; 
 Wed, 24 Nov 2021 02:25:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:104b:13b9:d53:e2aa])
 by smtp.gmail.com with ESMTPSA id f4sm15333725pfg.34.2021.11.24.02.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:25:18 -0800 (PST)
Date: Wed, 24 Nov 2021 18:25:13 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YZ4TCYmvegnC/kR0@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

On Wed, Nov 24, 2021 at 04:45:13PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index c9fc06c7e685..fc99d9fc80af 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -236,6 +236,13 @@ config MTK_CMDQ_MBOX
>  	  critical time limitation, such as updating display configuration
>  	  during the vblank.
>  
> +config MTK_ADSP_IPC_MBOX
> +	tristate "MediaTek ADSP Mailbox Controller"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
> +	  driver. It is used to send short messages between processors with dsp.

Although the file didn't maintain alphabetical order, to be neat, moving MTK_ADSP_IPC_MBOX before MTK_CMDQ_MBOX makes more sense.

> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index c2089f04887e..479a9ae56d5e 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -51,6 +51,8 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
>  
>  obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
>  
> +obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
> +

Ditto.  Move CONFIG_MTK_ADSP_IPC_MBOX before CONFIG_MTK_CMDQ_MBOX without blank line separation.

> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void *data)
> +{
> +	struct mbox_chan *ch = (struct mbox_chan *)data;

The cast should be able to remove.

> +static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
> +{
> +	struct mbox_chan *ch = (struct mbox_chan *)data;

The cast should be able to remove.

> +static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	/* Clear DSP mbox command */
> +	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
> +	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
> +
> +	return 0;
> +}
> +
> +static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
> +{
> +	chan->con_priv = NULL;
> +}

Shall mtk_adsp_mbox_shutdown() also clear DSP mbox?  I.e.:
writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);

> +static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +
> +	spin_lock(&ch_info->lock);
> +	writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
> +	spin_unlock(&ch_info->lock);

Why does it need the lock?

Is the write to MTK_ADSP_MBOX_IN_CMD a synchronous operation?
- If yes, I failed to understand why does it need the lock.  Every calls to mtk_adsp_mbox_send_data() should wait for the data transfer completion.
- If no, I also failed to understand why.  mtk_adsp_mbox_send_data() has no way to be aware of the transfer completion.  Would expect a loop for checking the completion for the case.

> +static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> +	void __iomem *reg = ch_info->va_reg;
> +	u32 op = readl(reg + MTK_ADSP_MBOX_IN_CMD);
> +
> +	return (op == 0) ? true : false;

To be concise, return readl(...) == 0;

> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
[...]
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "no adsp mbox register resource\n");
> +		return -ENXIO;
> +	}
> +
> +	size = resource_size(res);
> +	priv->va_mboxreg = devm_ioremap(dev, (phys_addr_t)res->start, size);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);

Use devm_platform_ioremap_resource(), it should be equivalent.

> +	/* set adsp mbox channel info */
> +	ch_info = devm_kzalloc(mbox->dev, sizeof(*ch_info), GFP_KERNEL);

To be neat, use dev instead of mbox->dev.

> +	ret = devm_mbox_controller_register(dev, &priv->mbox);
> +	if (ret < 0)
> +		dev_err(dev, "error: failed to register mailbox:%d\n", ret);
> +
> +	return ret;

To be concise, return devm_mbox_controller_register(...);
