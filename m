Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE354A5EA1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 15:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759F317CB;
	Tue,  1 Feb 2022 15:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759F317CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643727244;
	bh=zjehNGebZbUtFEwwR9eBUeklUsJzQ3f9Pi6/cgyxL68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P426UGgdIjuHanES3+Hpg4+Rdm6vGpjF4+Qb09RurkCI1zyAwm9QPs92ornF4/r1i
	 o0BtZJ/29zSL4zYICvQ/QgHcsOcfNP+ryhSS5TVP/7DTFAGyX795iBhNmR/TyejCms
	 IdVOEShtK18KyB8361pToucjYIeVwmmGf1YIeBgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDEDF80139;
	Tue,  1 Feb 2022 15:52:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A776DF80130; Tue,  1 Feb 2022 15:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECFFDF80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 15:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECFFDF80089
Received: by mail-yb1-f174.google.com with SMTP id c6so51741198ybk.3
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 06:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yriV3jrREEgzkPR54dv4q5A+98LvC0ePS/Zx7NSyEBA=;
 b=SSO615Hz5iUkihI9fPRrTAjdU2iCPETgjyU/aGvUiJBfhH8zIH2N6mukCx3s4PTGwy
 Zr7SMCXt/VmERZEf9kmrRtIMJHyw5goWOXEMEWTY5igqefOZWPpjqBtO2CzuXeGu7qMg
 ypa7Q3dWg0WMqD7UpwYGHC03qmz2zA2Zg4dcLU4p4r+pBIYwKiXmPxtmiglzhFzCbAxs
 ka7vs1dzeJQdF9atl+YWcJFCfC6VSG2kZMYf59qjzlR0yfmxNbOBcogLcaaOfr6Z4boM
 XTdrbcKOK1FnmeUw1ovG6q5zfZfyZ2kA0YXe7rSISQbMiNJrSKXnAklyjQpe679FfII8
 A6YQ==
X-Gm-Message-State: AOAM532rUlCNhHYEQzWv/ZxZPyhhhzf9o9tQmvuPrUsWuB/qr5JndvkB
 t1m3zmlnyqEU/c5Z/kHD/By/Bq4i9eSosGNlWQ4=
X-Google-Smtp-Source: ABdhPJwaJImvyobUjfAmbGN6jDMtgtsvo6mZe7/B6yfYsZC0x9D8AMv6LnK9U7CnT98B2f8aS4FAxVzsxPw5ZySwc+U=
X-Received: by 2002:a05:6902:1507:: with SMTP id
 q7mr38572163ybu.343.1643727169529; 
 Tue, 01 Feb 2022 06:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-2-sbinding@opensource.cirrus.com>
 <c821953a-6572-d60d-6a00-fccd541268c5@redhat.com>
In-Reply-To: <c821953a-6572-d60d-6a00-fccd541268c5@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 1 Feb 2022 15:52:38 +0100
Message-ID: <CAJZ5v0jGqUvZS113VewgsGm8cMJc2B=M5KyqmOHTPNy+R8KeEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] spi: Make spi_alloc_device and spi_add_device
 public again
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 linux-spi <linux-spi@vger.kernel.org>, Len Brown <lenb@kernel.org>
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

On Tue, Feb 1, 2022 at 3:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/21/22 18:24, Stefan Binding wrote:
> > This functions were previously made private since they
> > were not used. However, these functions will be needed
> > again.
> >
> > Partial revert of commit da21fde0fdb3
> > ("spi: Make several public functions private to spi.c")
> >
> > Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

The series also looks good to me from the ACPI side, so what tree
should it go into?

> > ---
> >  drivers/spi/spi.c       |  6 ++++--
> >  include/linux/spi/spi.h | 12 ++++++++++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index 4599b121d744..1eb84101c4ad 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -532,7 +532,7 @@ static DEFINE_MUTEX(board_lock);
> >   *
> >   * Return: a pointer to the new device, or NULL.
> >   */
> > -static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
> > +struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
> >  {
> >       struct spi_device       *spi;
> >
> > @@ -557,6 +557,7 @@ static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
> >       device_initialize(&spi->dev);
> >       return spi;
> >  }
> > +EXPORT_SYMBOL_GPL(spi_alloc_device);
> >
> >  static void spi_dev_set_name(struct spi_device *spi)
> >  {
> > @@ -652,7 +653,7 @@ static int __spi_add_device(struct spi_device *spi)
> >   *
> >   * Return: 0 on success; negative errno on failure
> >   */
> > -static int spi_add_device(struct spi_device *spi)
> > +int spi_add_device(struct spi_device *spi)
> >  {
> >       struct spi_controller *ctlr = spi->controller;
> >       struct device *dev = ctlr->dev.parent;
> > @@ -673,6 +674,7 @@ static int spi_add_device(struct spi_device *spi)
> >       mutex_unlock(&ctlr->add_lock);
> >       return status;
> >  }
> > +EXPORT_SYMBOL_GPL(spi_add_device);
> >
> >  static int spi_add_device_locked(struct spi_device *spi)
> >  {
> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> > index 7ab3fed7b804..0346a3ff27fd 100644
> > --- a/include/linux/spi/spi.h
> > +++ b/include/linux/spi/spi.h
> > @@ -1452,7 +1452,19 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
> >   * use spi_new_device() to describe each device.  You can also call
> >   * spi_unregister_device() to start making that device vanish, but
> >   * normally that would be handled by spi_unregister_controller().
> > + *
> > + * You can also use spi_alloc_device() and spi_add_device() to use a two
> > + * stage registration sequence for each spi_device. This gives the caller
> > + * some more control over the spi_device structure before it is registered,
> > + * but requires that caller to initialize fields that would otherwise
> > + * be defined using the board info.
> >   */
> > +extern struct spi_device *
> > +spi_alloc_device(struct spi_controller *ctlr);
> > +
> > +extern int
> > +spi_add_device(struct spi_device *spi);
> > +
> >  extern struct spi_device *
> >  spi_new_device(struct spi_controller *, struct spi_board_info *);
> >
> >
>
