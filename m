Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2E496292
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 17:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED0B2B36;
	Fri, 21 Jan 2022 17:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED0B2B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642781017;
	bh=7qZfYEBB5du2TX6DXOb2PSaLh9LzIEID5vLRoQpgeZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R7byKhH05dwf4LY6S9PifzyQ1ERyOMVFVJMSxXbUrh1BEcJ5KayhUBQ4LaqUW8ZEh
	 3S8+l+7v+xIGRsjw+fKi5Q/tEIym/7qkgGgJNJh+OrI97VJt2vfXQlOouUujgiSXv4
	 TzJptRlZK5HdrDOj62Pj/cAWZc4LtcabA1F1HraQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FB7F8007E;
	Fri, 21 Jan 2022 17:02:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A09F8028B; Fri, 21 Jan 2022 17:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7CAAF800F5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 17:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7CAAF800F5
Received: by mail-qt1-f170.google.com with SMTP id ay42so1912942qtb.2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 08:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KpCR+Z689R28drQeDQcp9uqMqNyhPaZvMRjfBqgHVo=;
 b=rXSE+aMAdFTjhjD7pN5KNoeB9evNNhEgeKO3PnknO9FBOKuOBuXbpDAO1g7S5MTjyO
 pICDs2g22f8zdRW93vI2O4ity8c/vqIQXsU4/rnw8St2j1yAvqXre9YWLbLCBPXDOkrP
 WzHddlKspfgH7jLmtpMo6fVn5EXyhXqEAvYvy/Ddh3A57nbGmec1/hxxOotrLXBL1EhQ
 eFCk1cEjskZN1/Ms00sb9XcRRp+ShTdtAWtyiQeQXwGyxxvpwbO8rMsDUlJE95xCo+CQ
 wDr41hn2MmJAclexvz0XC5lioCyY/t15IpBo07QcJAxfcRpDeiYCBoU9KDjz26hLzSco
 bmvA==
X-Gm-Message-State: AOAM533P6ExKkg7bDeQcpCP9OdfGhVs5XNLIv4lUWdHozLxIL6JrDJbx
 8SVGA+nP76USJENAAQwZ4JZHFNWB39IktlvGsJo=
X-Google-Smtp-Source: ABdhPJwVf9bX8dCQaHmqyfdL5+QcQnJQcCzVhlndDgwrIo04CO2rcgcy3cO8We0xcYhu3dznmi5S28CSB4cOjVD8+6I=
X-Received: by 2002:a05:622a:293:: with SMTP id
 z19mr3719687qtw.302.1642780939078; 
 Fri, 21 Jan 2022 08:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
 <20220121143254.6432-10-sbinding@opensource.cirrus.com>
In-Reply-To: <20220121143254.6432-10-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Jan 2022 17:02:07 +0100
Message-ID: <CAJZ5v0jqetwRmmQt1b4xo2VAUxye0+VdPhSmW_MZ0hveweY6gA@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] ACPI / scan: Create platform device for CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, linux-spi <linux-spi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Fri, Jan 21, 2022 at 3:33 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>
> The ACPI device with CSC3551 or CLSA0100 are sound cards
> with multiple instances of CS35L41 connectec by I2C or SPI

s/connectec/connected/

> to the main CPU.
>
> We add an ID to the ignore_serial_bus_ids list to enumerate
> all I2C or SPI devices correctly.

The serial-multi-instantiate change needs to be mentioned too.

> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  drivers/acpi/scan.c                             |  3 +++
>  drivers/platform/x86/serial-multi-instantiate.c | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 38c4f55960f4..b59e4c994878 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1744,8 +1744,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>          */
>                 {"BSG1160", },
>                 {"BSG2150", },
> +               {"CSC3551", },
>                 {"INT33FE", },
>                 {"INT3515", },
> +       /* Non-conforming _HID for Cirrus Logic already released */
> +               {"CLSA0100", },
>         /*
>          * HIDs of device with an UartSerialBusV2 resource for which userspace
>          * expects a regular tty cdev to be created (instead of the in kernel
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 535c80789852..cef201065fdb 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -305,6 +305,17 @@ static const struct smi_node int3515_data = {
>         .bus_type = SMI_I2C,
>  };
>
> +static const struct smi_node cs35l41_hda = {
> +       .instances = {
> +               { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +               { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +               { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +               { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +               {}
> +       },
> +       .bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to serial_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -313,6 +324,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>         { "BSG1160", (unsigned long)&bsg1160_data },
>         { "BSG2150", (unsigned long)&bsg2150_data },
>         { "INT3515", (unsigned long)&int3515_data },
> +       { "CSC3551", (unsigned long)&cs35l41_hda },
> +       /* Non-conforming _HID for Cirrus Logic already released */
> +       { "CLSA0100", (unsigned long)&cs35l41_hda },
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
> --
> 2.25.1
>
