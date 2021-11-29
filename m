Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FAC460F35
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 08:13:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F394A17DF;
	Mon, 29 Nov 2021 08:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F394A17DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638170010;
	bh=ICHXB4RmmsukPvDeywJI2dyNG39LhW9DaEq8VgSAZzM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwT2wyhL4KGGGCF5P9OUlNgzXBC95ieMropBCr/wg7YsjmaX/zfvIDipGzax72cON
	 9U+U1RM5WQjO/CP5C6y3o1WTnSssQT5Gt2eq2Isw+nuAYl4AByZJNMVij+8NuYnc2s
	 s4D3Csvq/TKyvivS87kLe3uNwM0+WxY0TGah91QE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71313F800EE;
	Mon, 29 Nov 2021 08:12:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49F0F80249; Mon, 29 Nov 2021 08:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA9B2F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 08:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9B2F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="byknp2pQ"
Received: by mail-pl1-x631.google.com with SMTP id b11so11424341pld.12
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 23:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gqKVeAmtJ28Ij4ESFKCTCEHmSmtmFX8yHUJYwywb7ag=;
 b=byknp2pQnyhSxsju+3ZYpfkAC1hcQDQqoJqM760EFq6VNOQv8X+BnqYuiplE689ts2
 mbKbxp+vvTN9i4N+Z16OHd7gaftw1X7rpCkl4Rr6TO3V4XICotc3njsV/SqwM3URK95c
 GZ8Bq/+u5/FGSuAg+IFHZD8ArKWluJyoXUoFFSqkXIoF9LrYjGuBe2adhZor6ZVeyAYF
 5egiGwxvxHOPve0HLQFzORfNbY+kjK/vsEVgd9eZyy3RbAWfktUHUhJEDiZfIj0YGhH3
 G7yND1SrWGgF3CDV7IxPqpIhPLKebVFGskbf2PIL0cgkXRx/65PdswFRiBMr5w+U7F31
 T+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqKVeAmtJ28Ij4ESFKCTCEHmSmtmFX8yHUJYwywb7ag=;
 b=TzKQvpzYYKoxVs8bT+SOMIUkRTlVrdkj+apotGV9xyVpdTLvrsRar+DpUP/7bJU7th
 ZgY4Q/osxGgwdgK79iJVayamqaVcoTvzv56TZwfJwInKNTCnoKkkzxZ+vuaejVAvfJ8I
 XMA1OAvNlY43hGDl6CDYVbrpUyidGppFzWd+a+fy4dyRyqlEUpa5ijhT+n8H3/tLtogw
 GsQMtuNaB4pfOM01fjNANwFSMsguaPQzb2jWueNllafBHHZxe0t8kxQJH9j20vZl7qQU
 RgQ37jENZorHlSEJOstXQlgU8QQI8fQCZaTz3QmpQHx2O0tzNfjwlIZi0DsJmKZmvijt
 XoOQ==
X-Gm-Message-State: AOAM531Ly+n+Y7is+lKkdRjXmcpLgaFoCsF0GOvsIFPp+uWBfsbTuqMX
 C+/EAP0S9cgOv9gCFawOWjQYkQ==
X-Google-Smtp-Source: ABdhPJxrgJOD/gmN8VFUGDa5VdyygIRYVYL060w2qQSdMuiLI7ClSzvocpOzoXnhLbFDwTtBCLNHLg==
X-Received: by 2002:a17:90b:17c4:: with SMTP id
 me4mr36397983pjb.15.1638169919135; 
 Sun, 28 Nov 2021 23:11:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id g20sm17607742pfj.12.2021.11.28.23.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:11:58 -0800 (PST)
Date: Mon, 29 Nov 2021 15:11:54 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v7 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <CA+Px+wV8opw7vzuvb5cPJtWFxBO0jdahOqK1jOQZnGLr7MKojA@mail.gmail.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
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

On Mon, Nov 29, 2021 at 02:39:53PM +0800, allen-kh.cheng wrote:
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Please double check again if you use the R-b tags correctly.  I have provided my R-b tag before but have some more minor comments below.

With the minor comments:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/firmware/mediatek/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
[...]
> +int adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op)
> +{
> +     struct mtk_adsp_chan *dsp_chan;
> +     struct adsp_mbox_ch_info *ch_info;
> +     int ret;
> +
> +     if (idx >= MTK_ADSP_MBOX_NUM)
> +             return -EINVAL;
> +
> +     dsp_chan = &ipc->chans[idx];
> +     ch_info = dsp_chan->ch->con_priv;
> +     ch_info->ipc_op_val = op;
> +     ret = mbox_send_message(dsp_chan->ch, NULL);
> +     if (ret < 0)
> +             return ret;
> +
> +     return 0;
> +}
> +EXPORT_SYMBOL(adsp_ipc_send);

To be neat, I think use mtk_adsp for all names looks better.  I.e. s/adsp_ipc_send/mtk_adsp_ipc_send/.

> +static void adsp_ipc_recv(struct mbox_client *c, void *msg)
> +{

Ditto, mtk_adsp_ipc_recv looks better to me.

> diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
[...]
> +struct adsp_mbox_ch_info {
> +     u32 ipc_op_val;
> +     void __iomem *va_reg;
> +};

Ditto, mtk_adsp_mbox_ch_info.

> +static inline void adsp_ipc_set_data(struct mtk_adsp_ipc *ipc, void *data)
> +{

mtk_adsp_ipc_set_data, although there is no use case yet.

> +static inline void *adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
> +{

mtk_adsp_ipc_get_data, although there is no use case yet.
