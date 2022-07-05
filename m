Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E295673BB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 18:01:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC8216F6;
	Tue,  5 Jul 2022 18:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC8216F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657036913;
	bh=BdNL7ib7ocwxkH6m5p/iv1xjd2w8h/FBQFgaA52UytA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alj3wHLKJYcKuOl1Qmw7R70p2m5AFlght0YhgMtdVThIGfxr7LcjfGR6pcrFdWP7i
	 g4B+X3rXVC2xjBHzlt8uQ3cH4FFg50MDe2ztnJFyBP6OXzu9eNDrfERy2ErRnn6Lij
	 hUFcUtugtdhXAXSJgKSDmJirCMy3g6/6PslrmUj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 613F1F80104;
	Tue,  5 Jul 2022 18:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 699EAF8015B; Tue,  5 Jul 2022 18:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B60BF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 18:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B60BF80104
Received: by mail-yb1-f171.google.com with SMTP id e80so15366826ybb.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 09:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0PWyJkGbY1QecBgTJVZxXj+1AZU7IHfNHTa4FKb8zOI=;
 b=C8RpahL7nmpQllQcfOIWrME3/AV4xIqFfki4g4NP5Wngqt/k+FROtGtKSPr1EflGsV
 yg7FX/CYW08MAE4QraCshLZveqXVlaPDL4KlP18f73qsd0TqQVZ9zLEQ2spl0cjdfwjS
 M1b4YbaYtM1FU1rlSHfm8Zx+heLHww9K3HuH3GlvsAZev0rFEZ/HWtV3Tylk18IwV786
 77hWU01KyKUGe1Tff73goqWGkjX+xKT1MNMC8WHbA48kjqQkBiRqellLXqAGyaw1xfhM
 EtnFkqnyKSzogyIVuEk90vvaTriVx4KpNBXuKk/v/y5r2sI61yhUGuSr6nB8zWO50lfp
 zFZw==
X-Gm-Message-State: AJIora9UbTvwSz0sr4b77PSCvnS0//7wH8bqMudtZkzendVWYYY9wWC1
 BnFj1bOwmCRS5llR+06zzWfrx+s2DoFnVOTgZKc=
X-Google-Smtp-Source: AGRyM1tcBwZLh8rRYpqHw497xW826C2jzB0Zuqve2AKbtsgc3kdwC5WdPPJja5gSs9nyc6dKnOr9oErdWKb927wiSpg=
X-Received: by 2002:a25:9847:0:b0:669:b4c6:d081 with SMTP id
 k7-20020a259847000000b00669b4c6d081mr37036694ybo.633.1657036843024; Tue, 05
 Jul 2022 09:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
 <20220630150135.1799535-2-sbinding@opensource.cirrus.com>
In-Reply-To: <20220630150135.1799535-2-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 Jul 2022 18:00:32 +0200
Message-ID: <CAJZ5v0i-UQYVimV0wPygV3Qe_ASEAPA66Taeardg_LdxT7rGkg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ACPI: utils: Add api to read _SUB from ACPI
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

On Thu, Jun 30, 2022 at 5:01 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Add a wrapper function to read the _SUB string from ACPI.
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/acpi/utils.c | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  6 ++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 3a9773a09e19..394954f4b6ef 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -291,6 +291,44 @@ int acpi_get_local_address(acpi_handle handle, u32 *addr)
>  }
>  EXPORT_SYMBOL(acpi_get_local_address);
>
> +#define ACPI_MAX_SUB_BUF_SIZE  9
> +
> +const char *acpi_get_subsystem_id(acpi_handle handle)
> +{
> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +       union acpi_object *obj;
> +       acpi_status status;
> +       const char *sub;
> +
> +       status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
> +       if (ACPI_FAILURE(status)) {
> +               acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
> +               return ERR_PTR(-ENODATA);
> +       }
> +
> +       obj = buffer.pointer;
> +       if (obj->type == ACPI_TYPE_STRING) {
> +               if (strlen(obj->string.pointer) < ACPI_MAX_SUB_BUF_SIZE &&
> +                   strlen(obj->string.pointer) > 0) {
> +                       sub = kstrdup(obj->string.pointer, GFP_KERNEL);
> +                       if (!sub)
> +                               sub = ERR_PTR(-ENOMEM);

The error codes below are somewhat questionable.

> +               } else {
> +                       acpi_handle_err(handle, "ACPI _SUB Length %zu is Invalid\n",
> +                                       strlen(obj->string.pointer));
> +                       sub = ERR_PTR(-EINVAL);

This is as good as failure, so why not use -ENODATA here?

> +               }
> +       } else {
> +               acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
> +               sub = ERR_PTR(-EINVAL);

Likewise.

> +       }
> +
> +       acpi_os_free(buffer.pointer);
> +
> +       return sub;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_subsystem_id);
> +
>  acpi_status
>  acpi_evaluate_reference(acpi_handle handle,
>                         acpi_string pathname,
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 7b96a8bff6d2..7651198ad6f5 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -762,6 +762,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
>  #endif
>
>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
> +const char *acpi_get_subsystem_id(acpi_handle handle);
>
>  #else  /* !CONFIG_ACPI */
>
> @@ -1023,6 +1024,11 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
>         return -ENODEV;
>  }
>
> +static inline const char *acpi_get_subsystem_id(acpi_handle handle)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int acpi_register_wakeup_handler(int wake_irq,
>         bool (*wakeup)(void *context), void *context)
>  {
> --
> 2.25.1
>
