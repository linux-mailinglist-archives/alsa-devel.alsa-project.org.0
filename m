Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C94DBFC7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 07:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B841F1767;
	Thu, 17 Mar 2022 07:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B841F1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500328;
	bh=2jNEDI57DHT4zzHKNNtITSwKi3aODzIYXN0tBmStiRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/Aqvoe6MsG+v5IX5xmsq8Zl7oSKGDoXGaU71xcgY3d4sUGkHx6Fy/nySDOvzm9HM
	 7sG/TKKsEbDePqhMXAnnPmTm5a0Fw3eGS5ufylUkAXyZbBnqElb1U/QHtakxhMon+p
	 qKFLZ8QDaJBBoG6hAhmclVnkucwODf1E/1u2WMto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79FA2F80552;
	Thu, 17 Mar 2022 07:55:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03B9F80162; Tue, 15 Mar 2022 19:02:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E0A1F800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 19:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E0A1F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TlfZFBpL"
Received: by mail-ej1-x629.google.com with SMTP id qa43so42855955ejc.12
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lEC/nkhZWgafnlNYWqRvQ8T9pwDdv1X4bS+vmmN1SPI=;
 b=TlfZFBpL4ZxfH1h0A4azfOpuLuqRtduCM9W127vgQdbSX84AaRxquI24AZvaA/0Mhu
 W5o4xZkQR752Hf126heU6U/BBocdrE6/a2Ihx8NnsX9drwO5lACiezAZxvUZP3XJP8CY
 RgL/YsUwucofJYAR5HTDtSgiXc/8GSxvQKtINLDlNNpQhcJWsrikOyezbu8mRlY3gTlv
 rEOGgvjWGrYlDAjMi05/fTIC1jrV0GVsW+UEpEd1os1ZbL3wwjfaDDRl0voUi4hHNHYk
 rJABGDMHxUmjB3eeAevsUeKUu16sJWDZhY2h8sMc8S1ej06qZ5FAgZCqYTXYxZQxhKT7
 g/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEC/nkhZWgafnlNYWqRvQ8T9pwDdv1X4bS+vmmN1SPI=;
 b=I3A0say8pPIJD0FfgirzT9F0iq0cWXrs/OqP6yNkwmmHpkI72/2kaNBPNzzp96os4Y
 q+R3G8DJMxlBJS8OOyfdhGi2ezawxEdUMEZu1WBTcz1vwUOgFNNZV2HIlK445noA+UBF
 p+VH/PrEqyi2uTfPbovbcjBC/5jKQclLt3bMhrf7LUA+cCUv4xmPcTSelUoM7qqbaPsX
 urVUeY3HEBjNyT/fqxnH4uDBQjqm3zKX2Q5hBDJEpmAFuccI4nGOhv+XYmzQcSV0VxwK
 9mLts1BOTMkqxwPPsTEUkKhXTZ6n7uq8IeNy3cq6MnK4+cDT0sVsbuMb8unmb0CBLLfx
 2Vwg==
X-Gm-Message-State: AOAM533rnLeOg+8XcL+JKBVruyiWssM/8uhB4di0mGz9P9WGRjt3PrXK
 b/c7sVlY7PNT/8WeZgZjfayX1U/H+f0tpn34ECE=
X-Google-Smtp-Source: ABdhPJwQNXcLkTGaCJKCgGEQ39fH/f9rG+zOEFi6wUHEyZIylN9K230wh3LynYxeoxVpwJTKYSVD3SjkIYeMUl1wmGU=
X-Received: by 2002:a17:907:6e01:b0:6d0:562c:e389 with SMTP id
 sd1-20020a1709076e0100b006d0562ce389mr23976723ejc.497.1647367351540; Tue, 15
 Mar 2022 11:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220312132856.65163-1-krzysztof.kozlowski@canonical.com>
 <20220312132856.65163-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220312132856.65163-6-krzysztof.kozlowski@canonical.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Mar 2022 20:01:18 +0200
Message-ID: <CAHp75VfLtjfrB4Zj9ncOg3VYQrX58chEL+6g31_5fwuMUuURPg@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] PCI: Use driver_set_override() instead of
 open-coding
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:05 +0100
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stuart Yoder <stuyoder@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On Sat, Mar 12, 2022 at 4:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Use a helper to set driver_override to reduce amount of duplicated code.

the amount

> Make the driver_override field const char, because it is not modified by
> the core and it matches other subsystems.


Seems like mine #4 here
https://gist.github.com/andy-shev/a2cb1ee4767d6d2f5d20db53ecb9aabc :-)
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci-sysfs.c | 28 ++++------------------------
>  include/linux/pci.h     |  6 +++++-
>  2 files changed, 9 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 602f0fb0b007..5c42965c32c2 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -567,31 +567,11 @@ static ssize_t driver_override_store(struct device *dev,
>                                      const char *buf, size_t count)
>  {
>         struct pci_dev *pdev = to_pci_dev(dev);
> -       char *driver_override, *old, *cp;
> -
> -       /* We need to keep extra room for a newline */
> -       if (count >= (PAGE_SIZE - 1))
> -               return -EINVAL;
> -
> -       driver_override = kstrndup(buf, count, GFP_KERNEL);
> -       if (!driver_override)
> -               return -ENOMEM;
> -
> -       cp = strchr(driver_override, '\n');
> -       if (cp)
> -               *cp = '\0';
> -
> -       device_lock(dev);
> -       old = pdev->driver_override;
> -       if (strlen(driver_override)) {
> -               pdev->driver_override = driver_override;
> -       } else {
> -               kfree(driver_override);
> -               pdev->driver_override = NULL;
> -       }
> -       device_unlock(dev);
> +       int ret;
>
> -       kfree(old);
> +       ret = driver_set_override(dev, &pdev->driver_override, buf, count);
> +       if (ret)
> +               return ret;
>
>         return count;
>  }
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 60d423d8f0c4..415491fb85f4 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -516,7 +516,11 @@ struct pci_dev {
>         u16             acs_cap;        /* ACS Capability offset */
>         phys_addr_t     rom;            /* Physical address if not from BAR */
>         size_t          romlen;         /* Length if not from BAR */
> -       char            *driver_override; /* Driver name to force a match */
> +       /*
> +        * Driver name to force a match.  Do not set directly, because core
> +        * frees it.  Use driver_set_override() to set or clear it.
> +        */
> +       const char      *driver_override;
>
>         unsigned long   priv_flags;     /* Private flags for the PCI driver */
>
> --
> 2.32.0
>


-- 
With Best Regards,
Andy Shevchenko
