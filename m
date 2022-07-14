Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D95754EB
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 20:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20DC1867;
	Thu, 14 Jul 2022 20:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20DC1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657823167;
	bh=frw5ojcsvQRn/8u7o9gyuwqp4Bd7f7rNxIzkGD7aWpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGb5+fKl1IdVZn6ngDPsCp/85xWVVcDmRHzRFJG04UQnnXijUXdaFfUXpm8ZA9Qc8
	 fXjoBRLDVv5jX2zKfxj43vE1dO0y0Go1KLV0h4O6Q/XBUUIBktHlIoXV2H/ICk40EO
	 PMV4F5VRGtL3N9ewaRSpGZzEACWFFXJFGhta9dxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E25F800AA;
	Thu, 14 Jul 2022 20:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CF7EF80165; Thu, 14 Jul 2022 20:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E51E8F800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 20:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51E8F800AA
Received: by mail-yb1-f172.google.com with SMTP id e69so4673191ybh.2
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 11:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QgpUMNKvx4KSxdOjg/H5oB64G7sRuqVxnCSFFK5S8sA=;
 b=TnIuJLg2KvnXxZm6OlTjvyyQYi4XFOmyc7wlktjv8+wTJdPnOj1ae84zp9qDJZWk33
 RmiENvPdBp2+LAOYLeGHFBMa+pVGe27KrapKuovCkYGoF4QOKlP0BoOarrG6+dZFevZ8
 0aVSsSEEwCBgMJ6vNixrMUI1MrYXvQF2AHizA/raCa+NWr46WLkc24x0XPHGNk7CbXWS
 OLk8CgFqU4bAtEUb7MF4N80hAow1F5eu8V28OiDg30BK0HdNsoPSTjUJtFXz8bKqrcQR
 1SXKdb8xX6yqBxPynhQXnsNhA/tpR9kC0D4KKCnXq0PAgGIfktTQN8nlA7hopCTPytRF
 7fIg==
X-Gm-Message-State: AJIora8IdyUDP/uFioRxNA2m1BoUnyLw5LG+ksNaz2BZ5nSwEishFQhn
 hW4ufWVMeqgGmBKOB+83kKazlQVsKUxVYdDaYSE=
X-Google-Smtp-Source: AGRyM1sKF8hIlILzeJt9pj1sahLhPItLqLYJjCcPGgCAkSjpiF/Bs5Sy+YH0mASza7jY0e7LismkGuftew052O7DREk=
X-Received: by 2002:a5b:202:0:b0:66f:aab4:9c95 with SMTP id
 z2-20020a5b0202000000b0066faab49c95mr8918464ybl.81.1657823100117; Thu, 14 Jul
 2022 11:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220707151037.3901050-1-sbinding@opensource.cirrus.com>
 <20220707151037.3901050-2-sbinding@opensource.cirrus.com>
In-Reply-To: <20220707151037.3901050-2-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Jul 2022 20:24:49 +0200
Message-ID: <CAJZ5v0gNwsddY1Ecasxhc_9hze5b77KdyUcQbbieHd3orGUGJQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] ACPI: utils: Add api to read _SUB from ACPI
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

On Thu, Jul 7, 2022 at 5:11 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Add a wrapper function to read the _SUB string from ACPI.
>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

In case you want to push this through ASoC

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Otherwise, I need a maintainer's ACK to apply the second patch.

> ---
>  drivers/acpi/utils.c | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  6 ++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index 3a9773a09e19..5a7b8065e77f 100644
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
> +       size_t len;
> +
> +       status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
> +       if (ACPI_FAILURE(status)) {
> +               acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
> +               return ERR_PTR(-ENODATA);
> +       }
> +
> +       obj = buffer.pointer;
> +       if (obj->type == ACPI_TYPE_STRING) {
> +               len = strlen(obj->string.pointer);
> +               if (len < ACPI_MAX_SUB_BUF_SIZE && len > 0) {
> +                       sub = kstrdup(obj->string.pointer, GFP_KERNEL);
> +                       if (!sub)
> +                               sub = ERR_PTR(-ENOMEM);
> +               } else {
> +                       acpi_handle_err(handle, "ACPI _SUB Length %zu is Invalid\n", len);
> +                       sub = ERR_PTR(-ENODATA);
> +               }
> +       } else {
> +               acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
> +               sub = ERR_PTR(-ENODATA);
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
> index 2a0e95336094..447898685e09 100644
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
