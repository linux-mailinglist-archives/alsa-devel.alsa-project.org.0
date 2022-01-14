Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE148EF62
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 18:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0432030;
	Fri, 14 Jan 2022 18:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0432030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642182778;
	bh=zYT/Aidss70NzFIzGnrEzoFSwm/180PBALMMsgjTe0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bfwk2LWyF/PynPwfoT7bT7oeUWRPzhnYa6SjhOX1HQKkZ2ikvNFNO/+Etg1bVW+ib
	 /WYOlVKwwCr/EW7cgXTZYZhiUAHhJ4WXRcfRgTfxiBlvssCVmKfIdjN1IhSUmU09J5
	 /EYamUK/+2CQJ53W9DusSfMmGNyPkWmkHDjq2kBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 233F6F80310;
	Fri, 14 Jan 2022 18:51:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45169F8030F; Fri, 14 Jan 2022 18:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 153B6F800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 18:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153B6F800CE
Received: by mail-qt1-f181.google.com with SMTP id f17so11451166qtf.8
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 09:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fVQGLqQvJbwoy9xCNJlVEudmBlmdf+BHE1MexcrTM00=;
 b=JR+G15ZVi10XYvKJBO1no1kTSbNTVG3CK0flpkqWtq+XO4K6UIf8LlLgOzvpOHeHDr
 vMByfx13jDmYuZHwls3tpp89faNQqrnXLxDp5jDfA3GeSh5KOv60cTtGb2gGjiOsm28W
 rF0WtjUsfSvoh7Fd8LCnT7j8Yr7CrrkzrqWoMC4wBQSLJhKkS+v7RvZWDmKB7DkSoLSB
 TsJO0g84aUQ7Z/daRD2hhThg9Bz7CD8n9zZKfOm8n6v3fw+glJLKhnsqsSvqn9r5mLYh
 YbuM1aFxaxJAdFiKHcrhEDKC60kexfcVdd3H38x8Xu27dPMJ/zo9f4G5jgVRlSCZ91pz
 ICaQ==
X-Gm-Message-State: AOAM532IdOOyd7rQWI4takEEJ0WQUeT3uGLX4Oi/hGmEMo/95N8SO01m
 Ij6m1IjUn3d9rcfGaDB9zD/OCwu38vKfRmP7QMY=
X-Google-Smtp-Source: ABdhPJy9pR7Mnowkd0KohKvx8Ey6a0toGyrWLkMNTm/UVqZjGJWU/mmT1XO06fDtnN1gbd87tjrbSRkXkpmeJcWR8Ho=
X-Received: by 2002:a05:622a:44e:: with SMTP id
 o14mr8740079qtx.369.1642182699155; 
 Fri, 14 Jan 2022 09:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
 <20220113170728.1953559-5-tanureal@opensource.cirrus.com>
 <s5hee5a47et.wl-tiwai@suse.de>
In-Reply-To: <s5hee5a47et.wl-tiwai@suse.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Jan 2022 18:51:28 +0100
Message-ID: <CAJZ5v0ijGWNd9s-4mrFgK-QbPDhnj2K3DF+Z45t7ckV6ET0hpQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ACPI / scan: Create platform device for CLSA0100
To: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
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

On Fri, Jan 14, 2022 at 5:19 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 13 Jan 2022 18:07:28 +0100,
> Lucas Tanure wrote:
> >
> > The ACPI device with CLSA0100 is a sound card with
> > multiple instances of CS35L41 connected by I2C to
> > the main CPU.
> >
> > We add an ID to the i2c_multi_instantiate_idsi list
> > to enumerate all I2C slaves correctly.
> >
> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>
> I think it's better to merge this from sound git tree together with
> others in the patch set, presumably for rc1.
>
> It'd be great if ACPI people can take a review and give an ack/nack.

Hans, what do you think?

> > ---
> >  drivers/acpi/scan.c                          | 2 ++
> >  drivers/platform/x86/i2c-multi-instantiate.c | 8 ++++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index c215bc8723d0..2a68031d953e 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -1753,6 +1753,8 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
> >        */
> >               {"BCM4752", },
> >               {"LNV4752", },
> > +     /* Non-conforming _HID for Cirrus Logic already released */
> > +             {"CLSA0100", },
> >               {}
> >       };
> >
> > diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> > index 4956a1df5b90..a51a74933fa9 100644
> > --- a/drivers/platform/x86/i2c-multi-instantiate.c
> > +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> > @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
> >       {}
> >  };
> >
> > +static const struct i2c_inst_data cs35l41_hda[] = {
> > +     { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> > +     { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> > +     {}
> > +};
> > +
> >  /*
> >   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
> >   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> > @@ -155,6 +161,8 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
> >       { "BSG1160", (unsigned long)bsg1160_data },
> >       { "BSG2150", (unsigned long)bsg2150_data },
> >       { "INT3515", (unsigned long)int3515_data },
> > +     /* Non-conforming _HID for Cirrus Logic already released */
> > +     { "CLSA0100", (unsigned long)cs35l41_hda },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> > --
> > 2.34.1
> >
