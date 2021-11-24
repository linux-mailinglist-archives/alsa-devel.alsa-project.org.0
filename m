Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34445B85A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 11:27:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CDE217BA;
	Wed, 24 Nov 2021 11:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CDE217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637749630;
	bh=J/fxyXU6XorbEB8q7buh5vRjgvB/7wImXjmxGvJlWLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzLH3dothSDffF836fGfk4zZ/VTYUSkrvmfO1/FN5zobYqwOOr8dBKL4BBXB2ShOm
	 wm8pYc/Y/Bs/yeGrSxOY7JW5Tk/M30YnQRpm9F8hza2ZjLwXetWK0df6kfbEi4s0Ix
	 bBjoaTouIlEGMsHF0l/Ti+vIDu4Hxw29WQr/4/K8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BAD5F804B4;
	Wed, 24 Nov 2021 11:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04CC3F804E6; Wed, 24 Nov 2021 11:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2451F80245
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 11:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2451F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VowkGQmd"
Received: by mail-pj1-x1036.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so3976214pjb.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 02:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tHyc4vww6f6Wxw3/eQBdIL1Je73VlgA7JKdBmqCGaqQ=;
 b=VowkGQmdCxCl/a39pPTkWIbniAxWrdCHUsnAMenLISOVDapuFtot+ZCoAIEwY+DpO+
 NK/tnsSLBHrGigPWuscFnVh6tQZkOSgNYqvpsT2EZJt1Hx+iyTkg1YSBJeYFbRkfl36C
 uj+uL9HLk//ZN790gI6f6zcYkjVdMvHVXFu0s4He+PE6Ogh7ZfFHYQSm9034+1hd6Sr6
 PSH+E3CeS3mz4J6EuPObfwTOUcvU2hlHBO8XsElgtmA9kmOwDcO65PS+yaho+l2S4mD5
 qECsdYfGUEdUV3ZAZtssW5/2fp0oS2ynsO+UWRvZENTt8l7F/AB3S/y7naJqLsmq15ep
 QQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tHyc4vww6f6Wxw3/eQBdIL1Je73VlgA7JKdBmqCGaqQ=;
 b=RqnStXURMOo/o/jQJFIPFxzfqFnWU8YW6FT/kvwKAZ+SZ18242ZQnQXnQ0b1P82e+Y
 rxujVniiT+54z1EAEzsAK2BEvQpPSCbbT3uKfCQ5tH4IXt2xK+0VtIhxR8teGu1qPqBA
 t3aOCNEyMM6OLNx58v0fUCBUEbG/l40xwqdxwz6cJqui6tkSbVo80Yhv2aDSJGgyH0J6
 anFilOPyGjvrRVKl7KrWX5U+o61gADTqh1hc8xEQi1tWvdchIo+Hm2zQUvCIOP68ih9W
 ZEKcBBgcQpbv8xrrl5S81K5A4LJhz5Oi5Mv+CgoU1x0aPG3sqyOJpHFXHCNMqmCNmSaf
 J4Nw==
X-Gm-Message-State: AOAM530FDUVC8FUxFgWzxElKaAkbF8EUgdl9fO0jIf+P7sUH5zhx/dkf
 AlaOQJKiAmOLUBuQpJxWTjC+xQ==
X-Google-Smtp-Source: ABdhPJwLWZxBb9qwghOW25FeDDOjCEelQjT4dSKut4RYsVrgGIzla0FvveTn3livbxhFig7UgwmMkg==
X-Received: by 2002:a17:903:2449:b0:142:b3c:f9c6 with SMTP id
 l9-20020a170903244900b001420b3cf9c6mr16910209pls.77.1637749534624; 
 Wed, 24 Nov 2021 02:25:34 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:104b:13b9:d53:e2aa])
 by smtp.gmail.com with ESMTPSA id q9sm11522330pfj.114.2021.11.24.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:25:34 -0800 (PST)
Date: Wed, 24 Nov 2021 18:25:30 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YZ4TGvtwO5ySCEkT@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |  10 ++
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 130 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 ++++++++++
>  6 files changed, 216 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

The patch should move before the 2nd patch in the series as the 2nd patch uses mtk-adsp-ipc.h.

> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op)
> +{
> +	struct mtk_adsp_chan *dsp_chan = &ipc->chans[idx];
> +	struct adsp_mbox_ch_info *ch_info = dsp_chan->ch->con_priv;
> +	int ret;
> +
> +	if (idx >= MTK_ADSP_MBOX_NUM)
> +		return -EINVAL;

If idx >= MTK_ADSP_MBOX_NUM, the invalid memory access has occurred at beginning of the function.

> +static int mtk_adsp_ipc_probe(struct platform_device *pdev)
> +{
[...]
> +	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);

Why does it need to call device_set_of_node_from_dev()?

> +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (!chan_name)
> +			return -ENOMEM;
> +
> +		dsp_chan = &dsp_ipc->chans[i];
> +		cl = &dsp_chan->cl;
> +		cl->dev = dev->parent;
> +		cl->tx_block = false;
> +		cl->knows_txdone = false;
> +		cl->tx_prepare = NULL;
> +		cl->rx_callback = adsp_ipc_recv;
> +
> +		dsp_chan->ipc = dsp_ipc;
> +		dsp_chan->idx = i;
> +		dsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
> +		if (IS_ERR(dsp_chan->ch)) {
> +			ret = PTR_ERR(dsp_chan->ch);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
> +					i, ret);

If ret == -EPROBE_DEFER, wouldn't it need to return -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.
