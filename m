Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5A1467F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 10:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E845A1839;
	Mon,  6 May 2019 10:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E845A1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557131906;
	bh=y2lKmeL8pvGxrkTNS6rir/LmGnq6hOFqKoXZXo/7bL0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyeiD+T2qv4Yo1L8K0lTyTrGTjbQGJ3vnHaH4P43hws5srMmL5gc3VlUzdKhzMWm8
	 A2thejkm91BdYLGDYUbfLTENkWfW/KPEHUPgbtucTSfGPLrxGwdK+7Ygfy1je5VwuD
	 3NhOsE5J3QXZ1Izbp8h3bh8l8PaPwn/3vq7GSzMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 702DCF89673;
	Mon,  6 May 2019 10:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D555F89673; Mon,  6 May 2019 10:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5306DF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 10:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5306DF80726
Received: by mail-oi1-f195.google.com with SMTP id l203so8950530oia.3
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 01:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI5tWDg9So1VuC7W9/kUG69QrGBsy3wNS2QspBOJr3w=;
 b=o3Ycz+amaQR2w9Gt9VzJppjhF0FktOm7uZZrvz3Ht2e+xEqWIRoJtUh8zYVOqwXPWw
 TDiyyUW+OUkUj8RGiRY1khYQiN6hNDHWtnWNWkz4q3W0AlrJOmFQB+SVCiKTWim1Do9X
 Oq0JET0yrCR4xyigvoA4IM+0VWbEdBWkxhJNk3HYCDHt4ienp9dW8npH/v2+V6B1B8sv
 G9XS36cf+5/mKs+wPr0kdDbEijyoA37IWFFzc3mmgtn4wPAmtPgSDgaZqOhVQwzuXMnA
 cZo9LTFu2aB917wvrcFz0ZReOYbtRUHGPzmn61TGO6XxOzpZLQOn1JNrOS4xBEeORC9q
 FSag==
X-Gm-Message-State: APjAAAUpss13kke03cuSF0stO2TWG9Fy60iuheQnyXRUyFxj10opYuCF
 vE0pn7Rp9dFby135Nz1nCLmnCvKEgonyyeFRhWk=
X-Google-Smtp-Source: APXvYqwAJUUjNvKVg6KZ3xRKyBM0B1Mi/aBfBkvmIKfrou4l4YatPD9RnwfhnPr74P6+x5gOB/MDST+7GGsfyLwLVXk=
X-Received: by 2002:aca:f01:: with SMTP id 1mr387656oip.68.1557131793348; Mon,
 06 May 2019 01:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
 <20190502045817.GZ3845@vkoul-mobl.Dlink>
In-Reply-To: <20190502045817.GZ3845@vkoul-mobl.Dlink>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 May 2019 10:36:22 +0200
Message-ID: <CAJZ5v0i+M8y3ddr+Z5o5af8OatMXq3xqCF5CUg5PjnANrTOSHw@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Robert Moore <robert.moore@intel.com>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Joe Perches <joe@perches.com>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ACPI / device_sysfs: change _ADR
	representation to 64 bits
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 2, 2019 at 6:58 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 01-05-19, 07:53, Pierre-Louis Bossart wrote:
> > Standards such as the MIPI DisCo for SoundWire 1.0 specification
> > assume the _ADR field is 64 bits.
> >
> > _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
> > released in 2002. The low levels already use _ADR as 64 bits, e.g. in
> > struct acpi_device_info.
> >
> > This patch bumps the representation used for sysfs to 64 bits. To
> > avoid any compatibility/ABI issues, the printf format is only extended
> > to 16 characters when the actual _ADR value exceeds the 32 bit
> > maximum.
> >
> > Example with a SoundWire device, the results show the complete
> > vendorID and linkID which were omitted before:
> >
> > Before:
> > $ more /sys/bus/acpi/devices/device\:38/adr
> > 0x5d070000
> > After:
> > $ more /sys/bus/acpi/devices/device\:38/adr
> > 0x000010025d070000
> >
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > ---
> > v2: only use 64 bits when required to avoid compatibility issues
> > (feedback from Vinod and Rafael)
> >
> >  drivers/acpi/device_sysfs.c | 6 ++++--
> >  include/acpi/acpi_bus.h     | 2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> > index 8940054d6250..7dda0ee05cd1 100644
> > --- a/drivers/acpi/device_sysfs.c
> > +++ b/drivers/acpi/device_sysfs.c
> > @@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device *dev,
> >  {
> >       struct acpi_device *acpi_dev = to_acpi_device(dev);
> >
> > -     return sprintf(buf, "0x%08x\n",
> > -                    (unsigned int)(acpi_dev->pnp.bus_address));
> > +     if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)
>
> Would prefer to use U32_MAX instead of 0xFFFFFFFF

I would.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
