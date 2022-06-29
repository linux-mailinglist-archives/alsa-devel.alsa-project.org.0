Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B655609C4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 20:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA9384C;
	Wed, 29 Jun 2022 20:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA9384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656528672;
	bh=aevsnNNFKH/TjK26S+UAslCCiBgLJlIoAy1XuOYOKX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gd1rRIxjZPfH9ok3DFfPmRjj+O9woiTu5kudp6HqoLnkgCnckyHIBSd/T7KsCuWV2
	 8HqHylQ9OxGPjhaLizuTxyDQu+vkuCHTdK8Ng9S6fSCMilej7UcUHjneAkweonLSWI
	 visDfiV+tQ6Cu0Wi1uGBz56U/w3wEbPJMvbK4B7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8081F80245;
	Wed, 29 Jun 2022 20:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53B87F8020D; Wed, 29 Jun 2022 20:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B6EEF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 20:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6EEF80107
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-31c1d580e4bso25096737b3.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRwlWNsQktWMF2euNfXj/Eod6yNt2K46g0nDE9s0cO4=;
 b=sRFRhrOY5YYxdpnY7K6G02tA8NUVfDHvqhnjW2P9GiLvkS9VugbQs9O9a3z3kQOyeV
 +1jlwQKePM3YDF9IvgaojEQioMQ5tTcDqO9mc1BxvRL25Fa1665z+FmV1GWeCKHKvXGx
 L0ccHCQH/eMaMkPmZwKJnkpBep5UjbPD10WyioMWTlEa8j0z9d5pLcNzEUGXDgiHrR5U
 dJzH6V3Z5dNvPNAlZoA4v95+AhX80Y6Lhk+SdHtgF//pCYYWaFmoa2VkQWFI+p+7R0KJ
 M0NEKHdqUzPgQyL/iFw2s9RnyOlgE3zdCTr/gWDzbrx5rduookfhKev03wAWXFX12ayn
 /I9A==
X-Gm-Message-State: AJIora+xEAfaKQukNRcQl1ziJtrFhfbpBgNK2sELwAhjd4e9u4Pai7kW
 earGQWI+zTNFjE+0ZXWRTvnxGgm/ruCnmAuKyns=
X-Google-Smtp-Source: AGRyM1vSND3nNpOCua9TxqWuka1+y023DNDu4pE9BPRV4wqxRK++krN2w1YqvdMGs4vdlNHUTDIm+wBvCFiFzI7pxlU=
X-Received: by 2002:a81:24c7:0:b0:314:1e60:a885 with SMTP id
 k190-20020a8124c7000000b003141e60a885mr5681810ywk.301.1656528604330; Wed, 29
 Jun 2022 11:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220628104411.984551-1-sbinding@opensource.cirrus.com>
 <20220628104411.984551-3-sbinding@opensource.cirrus.com>
In-Reply-To: <20220628104411.984551-3-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Jun 2022 20:49:53 +0200
Message-ID: <CAJZ5v0g8S3D6sc0tF2vTO6unLE_Qf1bgjLyk9Fkk0fP4h6ZcNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>
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

On Tue, Jun 28, 2022 at 12:44 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> When loading firmware, wm_adsp uses a number of parameters to
> determine the path of the firmware and tuning files to load.
> One of these parameters is system_name.
> Add support in cs35l41 to read this system name from the ACPI
> _SUB ID in order to uniquely identify the firmware and tuning
> mapped to a particular system.
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs35l41.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> index 8766e19d85f1..9ab016094b32 100644
> --- a/sound/soc/codecs/cs35l41.c
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -6,6 +6,7 @@
>  //
>  // Author: David Rhodes <david.rhodes@cirrus.com>
>
> +#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -1142,6 +1143,24 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
>         return ret;
>  }
>
> +static int cs35l41_probe_acpi(struct cs35l41_private *cs35l41)

I'd call this cs35l41_acpi_get_name(), because that's what it does.

> +{
> +       acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
> +       const char *sub;
> +
> +       /* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
> +       if (!handle)
> +               return 0;
> +
> +       sub = acpi_get_subsystem_id(handle);
> +       if (IS_ERR(sub))
> +               return PTR_ERR(sub);
> +
> +       cs35l41->dsp.system_name = sub;
> +       dev_dbg(cs35l41->dev, "Susystem ID: %s\n", cs35l41->dsp.system_name);
> +       return 0;
> +}
> +
>  int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
>  {
>         u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
> @@ -1270,6 +1289,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
>                 goto err;
>         }
>
> +       ret = cs35l41_probe_acpi(cs35l41);
> +       if (ret < 0)
> +               goto err;
> +
>         ret = cs35l41_dsp_init(cs35l41);
>         if (ret < 0)
>                 goto err;
> @@ -1316,6 +1339,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
>         pm_runtime_disable(cs35l41->dev);
>
>         regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
> +       kfree(cs35l41->dsp.system_name);
>         wm_adsp2_remove(&cs35l41->dsp);
>         cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
>
> --
