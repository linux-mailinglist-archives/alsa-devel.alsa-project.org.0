Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F94792BA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 18:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652C42841;
	Fri, 17 Dec 2021 18:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652C42841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639761651;
	bh=dGZd1VFfh18BGluzxw8/TrTukrhW7Gh3qHbGM2uadp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q5ck4aiNdkP7WKcwajgpnO2KWHrjOfhzxaN+7CeG1Z3xjNi6WYo97zqJOLEIeGMkJ
	 GcM6Iiw2go3CDKQokcQnRkMmttgmsuYebONnFKV6Sx2WaB0kPhl30ciT7W00Y7vvzL
	 UC74Vs4F86I43SuMIpONimLvslvFtitvXLi395uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32787F80311;
	Fri, 17 Dec 2021 18:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3978F8047C; Fri, 17 Dec 2021 18:19:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 111DEF80311
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111DEF80311
Received: by mail-ot1-f45.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso3772000otf.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Zx+iGaRJx7HOeobGJtBFJYWR+l1UjgQTuzqvPExFxA=;
 b=QGcck8xEBsgBJa1cbBw8EYLKjhrm2lr+9nGH1i8CoDVmalwHZua7Gza65qEoVkfgh0
 GYrXbtf77FaQlSH1F4oolTkSYbJgAi/OmE/BPJmExJzoyrGRX4vbe06c4mgG1kgKFcPA
 80VR0gdDYs+X95UYcwGyF6ktgADI8FhuRpVS/3Fc9mi8lgXoI6PYlqRfxx+uOqMQScUs
 VLeC3cHO+HLFsEtDGbtasIip7PR4jXvweZbUdihsqJGECMqRVgs3q97ATOeg8g40W2Xi
 S/AtJJvuTH+f9LurBcOP5QZXTEiLHWIXnMtENLVr9YW4DYdX8mvzDPpS5K/1E1iVq9nQ
 q2BQ==
X-Gm-Message-State: AOAM530T/Xw5l7TEtO/1Hu00TNFVZJsP1xD2S0Kx5E0R5NAmkVmWiEVh
 xSx8SKIq7hT85bkXisH/VLfxDeqTr2fatJWF0WM=
X-Google-Smtp-Source: ABdhPJztoPqn/1Su9cfXcuaCyeozUoTqwJGGdS30ToTcoGqzV+VCNtcC4Lcb+2ReZtjWo+NLFWB5n59F2HXnfpyLmtU=
X-Received: by 2002:a05:6830:348f:: with SMTP id
 c15mr2958544otu.254.1639761569499; 
 Fri, 17 Dec 2021 09:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-9-tanureal@opensource.cirrus.com>
In-Reply-To: <20211217115708.882525-9-tanureal@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 Dec 2021 18:19:18 +0100
Message-ID: <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for CLSA0100
 and CSC3551 ACPI nodes
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Fri, Dec 17, 2021 at 12:57 PM Lucas Tanure
<tanureal@opensource.cirrus.com> wrote:
>
> The ACPI device with CLSA0100 or CSC3551 is a sound card
> with multiple instances of CS35L41 connectec by I2C to

"connected" I suppose?

> the main CPU.
>
> We add an ID to the i2c_multi_instantiate_ids list to enumerate
> all I2C slaves correctly.
>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>

This requires an ACK from Hans.

If you receive one, please feel free to add my ACK to it too.

Thanks!

> ---
>  drivers/acpi/scan.c                          |  3 +++
>  drivers/platform/x86/i2c-multi-instantiate.c | 11 +++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index b7a6b982226e..8740cfa11f59 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1712,8 +1712,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>         static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
>                 {"BSG1160", },
>                 {"BSG2150", },
> +               {"CSC3551", },
>                 {"INT33FE", },
>                 {"INT3515", },
> +               /* Non-conforming _HID for Cirrus Logic already released */
> +               {"CLSA0100", },
>                 {}
>         };
>
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index 4956a1df5b90..a889789b966c 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -147,6 +147,14 @@ static const struct i2c_inst_data int3515_data[]  = {
>         {}
>  };
>
> +static const struct i2c_inst_data cs35l41_hda[] = {
> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +       {}
> +};
> +
>  /*
>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -154,7 +162,10 @@ static const struct i2c_inst_data int3515_data[]  = {
>  static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>         { "BSG1160", (unsigned long)bsg1160_data },
>         { "BSG2150", (unsigned long)bsg2150_data },
> +       { "CSC3551", (unsigned long)cs35l41_hda },
>         { "INT3515", (unsigned long)int3515_data },
> +       /* Non-conforming _HID for Cirrus Logic already released */
> +       { "CLSA0100", (unsigned long)cs35l41_hda },
>         { }
>  };
>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> --
> 2.34.1
>
