Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ABC554ACF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 15:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36AFE1F83;
	Wed, 22 Jun 2022 15:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36AFE1F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655904059;
	bh=PXNU/AWt06MxyZAOWAfI1WBgvSKZMWam2nU+sD3jJrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZUIPoUibHAMxKDAcgxS4HU/GCfDKP3MUbMycBlRILHcZJFV3Mx1EUpURdxR7M5X8
	 SDFAGIbKnaA36YYxJuuMYj66NJFvPXtFza6SWKzinSF4eHBg13A7CGi8DfIUBOaUVL
	 YXJM5qlkh1jWEzyY2Kjc51qQU6JyJ8YQntOhfxHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A191DF8032D;
	Wed, 22 Jun 2022 15:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 088A1F802D2; Wed, 22 Jun 2022 15:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE967F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 15:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE967F800CB
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-317741c86fdso160735307b3.2
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 06:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqOQ1mRCFn6Ej3pl8pj+iDE9h6BQbGKpcTypXijaYr0=;
 b=sJpE+J96CxkxB7sbhBT8Fg6S1DX/LKP9o6gvgqQoOgPeesXR9mHwebEUayyiFBjc+p
 vqLPtxfcU99rsJ+0K9BRruzol1F8g8sr1s/C1P2HRHI9tq3ptkMsOtFq8x8xt10d5aWx
 nZjmFl9Rb7cARM15j7+CowQuoSl1ZWHOzQuRynaK0m4PTVgtXbpwCbTXQ/mlU58tJWZn
 Icy2uVEB0xpVrMazz3J8938zbEeUXopuVMl1CguCoowt4DiUK4TfBh101FD2YFA4yxwO
 rmhM135u5wygdrxjgVTKLtUpAm9h8wKei9GPGk4YYXDyWcoBEYIa7AMX6xnQ+0pBMN9X
 Dxiw==
X-Gm-Message-State: AJIora/MUda1Kqb/uoaUdr68enqDWzHUf9ldYhDqZ740cGYNf92ti2Ac
 bYy6u9ILydUGc3ZNvsF61eI5CXH8YiXzSFuYApQ=
X-Google-Smtp-Source: AGRyM1sn53Rt6HkhjVlMSbjNcbNLgVPQ9GwJB20ZiQABo8pxntYhAsovfB2VWcuhTxwAeGHL8rNEKt8B/xh/xVXVPjM=
X-Received: by 2002:a0d:ed83:0:b0:317:50bb:5463 with SMTP id
 w125-20020a0ded83000000b0031750bb5463mr4185434ywe.149.1655903990990; Wed, 22
 Jun 2022 06:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220622130730.1573747-1-sbinding@opensource.cirrus.com>
 <20220622130730.1573747-2-sbinding@opensource.cirrus.com>
In-Reply-To: <20220622130730.1573747-2-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Jun 2022 15:19:40 +0200
Message-ID: <CAJZ5v0ij63HVTTWUBwv9WiWhCfKewJR48reUaGN3nvbzoS31tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ACPI: utils: Add api to read _SUB from ACPI
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

On Wed, Jun 22, 2022 at 3:08 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Add a wrapper function to read the _SUB string from ACPI.
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/acpi/utils.c | 26 ++++++++++++++++++++++++++
>  include/linux/acpi.h |  8 ++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 3a9773a09e19..5d1bdb79e372 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -291,6 +291,32 @@ int acpi_get_local_address(acpi_handle handle, u32 *addr)
>  }
>  EXPORT_SYMBOL(acpi_get_local_address);
>
> +int acpi_get_sub(acpi_handle handle, char *sub, size_t size)

I'd call it acpi_get_subsystem_id().

> +{
> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +       union acpi_object *obj;
> +       acpi_status status;
> +       int ret;
> +
> +       status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
> +       if (!ACPI_SUCCESS(status)) {

Typically, ACPI_FAILURE() is used in checks like this.

> +               acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);

It would be enough to say "_SUB evaluation failed".

> +               return -ENOENT;

Why not use -ENODATA here?

> +       }
> +
> +       obj = buffer.pointer;
> +       if (obj->type == ACPI_TYPE_STRING) {
> +               ret = strscpy(sub, obj->string.pointer, size);

It may be simpler to allocate the memory here so that callers don't
have to worry about it.

Also, this is expected to be a proper device ID, not just a string, so
maybe some validation checks could be made here?

> +       } else {
> +               acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
> +               ret = -EINVAL;
> +       }
> +       acpi_os_free(buffer.pointer);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_sub);
> +
>  acpi_status
>  acpi_evaluate_reference(acpi_handle handle,
>                         acpi_string pathname,
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4f82a5bc6d98..9bf18adf5920 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -21,6 +21,8 @@
>  #endif
>  #include <acpi/acpi.h>
>
> +#define ACPI_MAX_SUB_BUF_SIZE  9
> +
>  #ifdef CONFIG_ACPI
>
>  #include <linux/list.h>
> @@ -762,6 +764,7 @@ static inline u64 acpi_arch_get_root_pointer(void)
>  #endif
>
>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
> +int acpi_get_sub(acpi_handle handle, char *sub, size_t size);
>
>  #else  /* !CONFIG_ACPI */
>
> @@ -1023,6 +1026,11 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
>         return -ENODEV;
>  }
>
> +static int acpi_get_sub(acpi_handle handle, char *sub, size_t size)
> +{
> +       return -ENODEV;
> +}
> +
>  static inline int acpi_register_wakeup_handler(int wake_irq,
>         bool (*wakeup)(void *context), void *context)
>  {
> --
