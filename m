Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55145EB2E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 11:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78A8172E;
	Fri, 26 Nov 2021 11:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78A8172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637921953;
	bh=KcX7rHHPkbVBoPNzTbkKY19v5RLmo4U+f/zwJpmTIXo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjxDOR1MY8C3VabwaOkA9bplNQiT6tBEssaJDkcONfulqSrQqvVgnTiWhRKt45skh
	 l6xS8XIBS7+wIP0VTZolNFT43Mclwr/TwLRm2KENx7Klmq6yIBtpWFHBz/KKL4YafW
	 mxEyOH5QJoL/7TPlp+aMw3fj9c3CR0EBgC8uXqlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE6AF80087;
	Fri, 26 Nov 2021 11:18:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70F5EF80166; Fri, 26 Nov 2021 11:17:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D0C3F801F7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 11:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0C3F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LBWGHLBR"
Received: by mail-pf1-x431.google.com with SMTP id x131so8467246pfc.12
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xMgOp7lbYkwgl7D+YMk4FsWl75ZCyIN6+KuA/rtaF/I=;
 b=LBWGHLBRsRzhoMj3EqgNJCHjvF8Omp+lFltj4q3PZ2eTjzxauxbrZCw7VbA2RptFHn
 9JO/dvgYGwWp4DfxLeQ87M9rBFpS5DkINqTqchCLy+3yNbuIofGIjth24f7bfe8aKXFT
 EglCS4q/j7GP5uJ4lMjPtOb2gbX0j0DUHXDzZXyTF8mmC7crt2z6WMYg92igq2kFgHOQ
 EkDVWvXJ9BG6UYNazP6na42UVuE1dJn4OPLcOrN4d9Cxu4OOcaCKeaRAkFHhej6oMlSi
 Zu30smqSUDtulrTke8JXTTjnTRyYDBkyb2lMv6lTqM1BVNgwNV2dvLtMbFd8ZVIpNeUC
 g5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xMgOp7lbYkwgl7D+YMk4FsWl75ZCyIN6+KuA/rtaF/I=;
 b=CYw6MMoLDZMRDoWMFebQH33EdlyE+b0rVtOzun0JAO61g79ryXVLkZkadT6FZS+u8V
 BxqNQHwjG/V2u57dV6/XSBHxqXuXbxrYsJQPsv+mPo+7NgwLKs4HAzGHijuC2H+xOIX9
 1BMZ3Xbrow6FDTQt0A7ew/twJqFlT9OnhRC/rZTsGTcUaOOBcsSQ0R7giBRVn2mv66eH
 XApOz4R6swZkrnKtuN2mKbub5XWDoo/33TesZ6jEu2R9je6l/XuxFDrTcSAJlQlveHAN
 Cnf6Z63LMwtuQZIrf1JtabAWdVxIfCc9DRFK9itbbxDwnmG9n69IHZBcMjL0qvIfbSe2
 hUxA==
X-Gm-Message-State: AOAM533EyVVqlSmeQJvr8aNESWnOgBHySelb271c0Uj/qyuxJy05tSTa
 o9oBiYjfunt8a5Xj4OAYoPUeyA==
X-Google-Smtp-Source: ABdhPJy9F/ggoPbCVgIvZMQl0QH1RDypskEwFasKoD+ufuypgX8T72E/Pcuk/nqiUvcMw6OeB5Z0yw==
X-Received: by 2002:a05:6a00:24cd:b0:49f:bf3f:c42c with SMTP id
 d13-20020a056a0024cd00b0049fbf3fc42cmr19995895pfv.54.1637921863703; 
 Fri, 26 Nov 2021 02:17:43 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id f185sm6281835pfg.39.2021.11.26.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:17:43 -0800 (PST)
Date: Fri, 26 Nov 2021 18:17:39 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v6 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaC0Q2Qo4UJc+f3A@google.com>
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
 <20211126093021.25462-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126093021.25462-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
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

On Fri, Nov 26, 2021 at 05:30:21PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

With a minor comment:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index c9fc06c7e685..c44a0102585d 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -226,6 +226,13 @@ config STM32_IPCC
>  	  with hardware for Inter-Processor Communication Controller (IPCC)
>  	  between processors. Say Y here if you want to have this support.
>  
> +config MTK_ADSP_IPC_MBOX
> +	tristate "MediaTek ADSP Mailbox Controller"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	help
> +	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
> +	  driver. It is used to send short messages between processors with dsp.
> +
>  config MTK_CMDQ_MBOX
>  	tristate "MediaTek CMDQ Mailbox Support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index c2089f04887e..13d5c81852ca 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
>  
>  obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
>  
> +obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
> +
>  obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o

To be neat, Kconfig name should be aligned to the file name.

That is, either:
- s/MTK_ADSP_IPC_MBOX/MTK_ADSP_MBOX/
- s/mtk-adsp-mailbox.o/mtk-adsp-ipc-mailbox.o/
