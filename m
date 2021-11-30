Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3C463C0E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8096235B;
	Tue, 30 Nov 2021 17:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8096235B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638290572;
	bh=Z8LLX983HffiH7cGo2vruAESg3dSLxIp2aHGxBgc36Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iamBVCKAqPORMMGhPIZbOA0XCvxpzvbKBfzN302FjiYupakzammXH4zTXsy0suoYp
	 71qcvKlO9I4r/ManPoViwg5GjkkHEhdRX5LhEldyq9tYHIp4yDs12CEl2mCy/5rytn
	 nL7v/DpaWvkAE3pKnidI0lqmStiks5F9o7el9pTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FEF2F800EE;
	Tue, 30 Nov 2021 17:41:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97817F80290; Tue, 30 Nov 2021 17:41:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B49F9F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B49F9F8020D
Received: by mail-vk1-f171.google.com with SMTP id f7so14004546vkf.10
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9e+BfCk8Var4/ZAoJpMqiBWB8frMmHg3JI2ty7Fj1I=;
 b=t5cTh/IghkKTpckwd6s+x7pD7OPp2rAdDwhwlZkF+HuPqZWHQ3VV2MiW8VX3JDTF9q
 SaKo8Mv6u0eJmUM54D3aRMADzcXUoWIrAof5zh+v+IswgMeLYZn98jsE2ujAfw1OtTLa
 JmmwoZu3rXey4FL1E0F7FL8DDzi9ABMnaDSN70L/ou8BMxgYxIDXN0D9JvsMSiy+d+Np
 04/sgzR8w4AJg5FESXu30o8BMgFE1goE3deGYtK13yIobuXx79+i6ii6BkzE5Y9KxaHx
 7HgIWURXNgrKBHVfVtacJDO6WjFhIy0tWnWnpfQ7RWcCPKfJ+5vU2WixGWZ/7Xbv5x4h
 Sqrw==
X-Gm-Message-State: AOAM531fC2PDepNORdM9mKWSqYJbCiLCPrAqnr0rve0KGnZiH3ueUmaA
 bzEWh6+3Rha/AEIqsjtw5vTbZyViEdtuXw==
X-Google-Smtp-Source: ABdhPJximW+l3RxkKLOD9+pd9qqArVC1vB1neDfNQVGj2fY6iN57+jpV65STu+9wqB+YCrw6Y+WBSg==
X-Received: by 2002:a05:6122:1cf:: with SMTP id
 h15mr46035548vko.22.1638290483696; 
 Tue, 30 Nov 2021 08:41:23 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id v8sm10230751vkc.52.2021.11.30.08.41.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:41:23 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id az37so42668149uab.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:41:22 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr286260vsg.57.1638290482182; 
 Tue, 30 Nov 2021 08:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
In-Reply-To: <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 17:41:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Message-ID: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Julian.Schroeder@amd.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

On Wed, Nov 17, 2021 at 12:39 PM Daniel Baluta
<daniel.baluta@oss.nxp.com> wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>
> ACP hw block configuration differs across various distributions
> and hence it's required to register different drivers module for
> distributions. For now we support three ACP drivers:
>
> * ACP without SOF use case
> * ACP with SOF use case
> * ACP with SOF use case for DMIC and non SOF for I2S endpoints
>
> As all above driver registers with common PCI ID for ACP hw block
> we need code to determine ACP configuration and auto select driver
> module. This patch expose function that return configuration flag
> based on dmi checks for a system. ACP driver module probe register
> platform device based on such configuration flag to avoid conflict
> with other ACP drivers probed for same PCI ID.
>
> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks for your patch, which is now commit f1bdd8d385a80356 ("ASoC:
amd: Add module to determine ACP configuration") in sound-asoc/for-next.

> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -96,4 +96,10 @@ config SND_SOC_AMD_YC_MACH
>           Say m if you have such a device.
>           If unsure select "N".
>
> +config SND_AMD_ACP_CONFIG
> +       tristate "AMD ACP configuration selection"

This definitely needs proper dependencies, to prevent asking the user
about this when configuring a kernel without AMD Audio ACP support.

I would have sent a patch, but...

> +       help
> +        This option adds an auto detection to determine which ACP
> +        driver modules to use
> +
>  source "sound/soc/amd/acp/Kconfig"

> --- /dev/null
> +++ b/sound/soc/amd/acp-config.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +//
> +// This file is provided under a dual BSD/GPLv2 license. When using or
> +// redistributing this file, you may do so under either license.
> +//
> +// Copyright(c) 2021 Advanced Micro Devices, Inc.
> +//
> +// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> +//
> +
> +/* ACP machine configuration module */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +
> +#include "../sof/amd/acp.h"

This doesn't seem to use anything from this header file?

> +#include "mach-config.h"
> +
> +static int acp_quirk_data;
> +
> +static const struct config_entry config_table[] = {
> +       {
> +               .flags = FLAG_AMD_SOF,
> +               .device = ACP_PCI_DEV_ID,
> +               .dmi_table = (const struct dmi_system_id []) {
> +                       {
> +                               .matches = {
> +                                       DMI_MATCH(DMI_SYS_VENDOR, "AMD"),
> +                                       DMI_MATCH(DMI_PRODUCT_NAME, "Majolica-CZN"),
> +                               },
> +                       },
> +                       {}
> +               },
> +       },
> +};
> +
> +int snd_amd_acp_find_config(struct pci_dev *pci)
> +{
> +       const struct config_entry *table = config_table;
> +       u16 device = pci->device;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
> +               if (table->device != device)
> +                       continue;
> +               if (table->dmi_table && !dmi_check_system(table->dmi_table))
> +                       continue;
> +               acp_quirk_data = table->flags;
> +               return table->flags;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(snd_amd_acp_find_config);

> +struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
> +       {
> +               .id = "AMDI1019",
> +               .drv_name = "renoir-acp",
> +               .pdata = (void *)&acp_quirk_data,
> +       },
> +       {},
> +};
> +EXPORT_SYMBOL(snd_soc_acpi_amd_acp_machines);

These symbols are only used from sound/soc/sof/amd/pci-rn.c.

Why is this code living under sound/soc/amd/, while the ACP code
is under sound/soc/amd/acp/?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
