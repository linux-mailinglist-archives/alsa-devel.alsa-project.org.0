Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E3585F90
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jul 2022 17:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D5183E;
	Sun, 31 Jul 2022 17:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D5183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659282160;
	bh=AlJtEfdaDoXjLqJx89aibwIk0zNm07zeaPeWVGjhYHo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZdSvfV4m1s8dutNe4HDjEqE4qJz/Y9ClnaMpRQMkmESrLnWl+Aie8AdaxTXm4h587
	 LwQBMfTQ28bCZxQgVSJ7qVAn1XrIEV4DF/wUE0d3yCSeftB1ucBPSOcfwDWvMXVR0O
	 RcRMvZojKjuWFj3jUFytKgNWybTUb+g5iCIlZtgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BD1F80240;
	Sun, 31 Jul 2022 17:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC7FCF801F5; Sun, 31 Jul 2022 17:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEEC3F8014C
 for <alsa-devel@alsa-project.org>; Sun, 31 Jul 2022 17:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEEC3F8014C
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id IB4IoW8sbLFqbIB4IoU93a; Sun, 31 Jul 2022 17:41:31 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 31 Jul 2022 17:41:31 +0200
X-ME-IP: 90.11.190.129
Message-ID: <e30925e7-56b7-48df-b287-094441f8c586@wanadoo.fr>
Date: Sun, 31 Jul 2022 17:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/3] ASoC: amd: acp: Add legacy audio driver support
 for Rembrandt platform
Content-Language: fr
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Newsgroups: gmane.linux.alsa.devel,gmane.linux.kernel
References: <20220707161142.491034-1-Vsujithkumar.Reddy@amd.com>
 <20220707161142.491034-4-Vsujithkumar.Reddy@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220707161142.491034-4-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 ssabakar@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, venkataprasad.potturu@amd.com,
 Meng Tang <tangmeng@uniontech.com>, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Hi,

this patch has already reached -next, but a few nit below.

Le 07/07/2022 à 18:11, V sujith kumar Reddy a écrit :
> Add i2s and dmic support for Rembrandt platform,
> Add machine support for nau8825, max98360 and rt5682s,rt1019 codec
> in legacy driver for rembrandt platform.
> Here codec is in a slave mode.
> 
> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> ---
>   sound/soc/amd/acp/Kconfig            |  11 +
>   sound/soc/amd/acp/Makefile           |   2 +
>   sound/soc/amd/acp/acp-i2s.c          | 137 ++++++++-
>   sound/soc/amd/acp/acp-legacy-mach.c  |  32 +++
>   sound/soc/amd/acp/acp-mach-common.c  |  86 +++++-
>   sound/soc/amd/acp/acp-mach.h         |   6 +
>   sound/soc/amd/acp/acp-pci.c          |   6 +
>   sound/soc/amd/acp/acp-platform.c     |  16 +-
>   sound/soc/amd/acp/acp-rembrandt.c    | 401 +++++++++++++++++++++++++++
>   sound/soc/amd/acp/amd.h              |  62 ++++-
>   sound/soc/amd/acp/chip_offset_byte.h |  28 ++
>   11 files changed, 781 insertions(+), 6 deletions(-)
>   create mode 100644 sound/soc/amd/acp/acp-rembrandt.c
> 

[...]

> diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
> new file mode 100644
> index 000000000000..2b57c0ca4e99
> --- /dev/null
> +++ b/sound/soc/amd/acp/acp-rembrandt.c
> @@ -0,0 +1,401 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +//
> +// This file is provided under a dual BSD/GPLv2 license. When using or
> +// redistributing this file, you may do so under either license.

These lines are useless. There is already a SPDX-License-Identifier just 
above.

> +//
> +// Copyright(c) 2022 Advanced Micro Devices, Inc.
> +//
> +// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> +//          V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> +/*
> + * Hardware interface for Renoir ACP block
> + */
> +

[...]

> +static int rembrandt_audio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct acp_chip_info *chip;
> +	struct acp_dev_data *adata;
> +	struct resource *res;
> +
> +	chip = dev_get_platdata(&pdev->dev);
> +	if (!chip || !chip->base) {
> +		dev_err(&pdev->dev, "ACP chip data is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	if (chip->acp_rev != ACP6X_DEV) {
> +		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
> +		return -ENODEV;
> +	}
> +
> +	rmb_acp_init(chip->base);

Should rmb_acp_deinit() be called if an error occurs below?
Or a devm_add_action_or_reset() + .remove() simplification?

(this is called in the .remove() function)

> +
> +	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "acp_mem");
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (!adata->acp_base)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "acp_dai_irq");
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata->i2s_irq = res->start;
> +	adata->dev = dev;
> +	adata->dai_driver = acp_rmb_dai;
> +	adata->num_dai = ARRAY_SIZE(acp_rmb_dai);
> +	adata->rsrc = &rsrc;
> +
> +	adata->machines = snd_soc_acpi_amd_rmb_acp_machines;
> +	acp_machine_select(adata);
> +
> +	dev_set_drvdata(dev, adata);
> +	acp6x_enable_interrupts(adata);
> +	acp_platform_register(dev);
> +
> +	return 0;
> +}
> +
> +static int rembrandt_audio_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	struct acp_chip_info *chip;
> +
> +	chip = dev_get_platdata(&pdev->dev);
> +	if (!chip || !chip->base) {
> +		dev_err(&pdev->dev, "ACP chip data is NULL\n");
> +		return -ENODEV;
> +	}

These tests and dev_err and return look useless.
The same is already tested at the biginning of the probe and if it 
fails, the probe will fail, right?

> +
> +	rmb_acp_deinit(chip->base);
> +
> +	acp6x_disable_interrupts(adata);
> +	acp_platform_unregister(dev);
> +	return 0;
> +}

[...]

