Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A155451AF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 18:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EEED1AC9;
	Thu,  9 Jun 2022 18:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EEED1AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654791271;
	bh=EYCV9KXWa67qHXTbHuOyzbjwN2oWzDnG3cGXK7zFHZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOxpzime0904rvs9lVKSFGb3Pe3X6RD9Zietexs0c/xFdi4d+hgiBwRPHz2soL8Xp
	 NIVV/erksLBO/Dgp6d84CZsCGoB+3WmVgbWfOBgpeNFGEQWIXbC8XpSYR8Yt7nggS0
	 ePuP9MAiHMcrtKL2vdg6xzyfKMFuC4aR/x4HW64I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD2BCF80240;
	Thu,  9 Jun 2022 18:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5804FF800E9; Thu,  9 Jun 2022 18:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25910F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 18:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25910F800E9
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-30c2f288f13so246181267b3.7
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 09:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkr4kpyjyxhytcYi9ZJbG4/P8VjvDKac01TatzKEEwk=;
 b=rC7D9dCzudCmn5I7EA8FTFycVPNlwC3taoR6rS9BKapV7vZhU7zNUyX1OI16NtTchg
 cPJyEvDvYgiYh1kgcoQK3cQ0ZISEJrapWuzXTtEiLmlU6xjhfaKB6xynPja1bv9YTlun
 gI6T7pkL+finx5/6A/2JgAFPkmA+7Apxl6aL9B4XIGMiAl6eZW+/z0ERMCa8aAcr1F7v
 2DpuPRaOlGDYkQPvLSYTmD2NKevrwx0tA0V1pBBz5ea5jFw+eYLsf2WfFotGV3D0lvg8
 /27EjXa9VEfLQAHHcgYaQAgVdzgGXDC501HDYr2gL97bYdFrRRXvQgWmpZMCHr/mAncM
 KIlA==
X-Gm-Message-State: AOAM532ydYC4oluKv77TQh7jA9i3JvCfs3t3WBCG1Y5eVq8T2ATmdkNS
 uwL8qGWuaNuhsk9Sq2o41QFL/kmXN3FXCzIf/k4=
X-Google-Smtp-Source: ABdhPJwSGkzpfsEK18MU6vMMd4SUuG5LxBOhyOXdJeWtJgk0AEJ/f4LOGlEeVAomvMsvJWoPBt+27hqVj1/fRtw+MGY=
X-Received: by 2002:a0d:c442:0:b0:2fe:beab:1fef with SMTP id
 g63-20020a0dc442000000b002febeab1fefmr44227485ywd.196.1654791202217; Thu, 09
 Jun 2022 09:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <1843211.tdWV9SEqCh@kreacher> <5296779.Sb9uPGUboI@kreacher>
 <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
In-Reply-To: <63d7f3ed-b5a9-c869-5d25-a33a1d4e63c8@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Jun 2022 18:13:11 +0200
Message-ID: <CAJZ5v0i7xtjrEOXgKiWP5St8OZoiZ4qq+gL62BFrmv-qpeaG_w@mail.gmail.com>
Subject: Re: [PATCH v1 14/16] soundwire: Use acpi_dev_for_each_child()
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Thu, Jun 9, 2022 at 5:23 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Thanks Rafael. This looks mostly good but I have a doubt on the error
> handling, see below.
>
> > +static int sdw_acpi_check_duplicate(struct acpi_device *adev, void *data)
> > +{
> > +     struct sdw_acpi_child_walk_data *cwd = data;
> > +     struct sdw_bus *bus = cwd->bus;
> > +     struct sdw_slave_id id;
> > +
> > +     if (adev == cwd->adev)
> > +             return 0;
> > +
> > +     if (!find_slave(bus, adev, &id))
> > +             return 0;
> > +
> > +     if (cwd->id.sdw_version != id.sdw_version || cwd->id.mfg_id != id.mfg_id ||
> > +         cwd->id.part_id != id.part_id || cwd->id.class_id != id.class_id)
> > +             return 0;
> > +
> > +     if (cwd->id.unique_id != id.unique_id) {
> > +             dev_dbg(bus->dev,
> > +                     "Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> > +                     cwd->id.unique_id, id.unique_id, cwd->id.mfg_id,
> > +                     cwd->id.part_id);
> > +             cwd->ignore_unique_id = false;
> > +             return 0;
> > +     }
> > +
> > +     dev_err(bus->dev,
> > +             "Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> > +             cwd->id.unique_id, id.unique_id, cwd->id.mfg_id, cwd->id.part_id);
> > +     return -ENODEV;
>
> if this error happens, I would guess it's reported ....
>
> > +}
> > +
> > +static int sdw_acpi_find_one(struct acpi_device *adev, void *data)
> > +{
> > +     struct sdw_bus *bus = data;
> > +     struct sdw_acpi_child_walk_data cwd = {
> > +             .bus = bus,
> > +             .adev = adev,
> > +             .ignore_unique_id = true,
> > +     };
> > +     int ret;
> > +
> > +     if (!find_slave(bus, adev, &cwd.id))
> > +             return 0;
> > +
> > +     /* Brute-force O(N^2) search for duplicates. */
> > +     ret = acpi_dev_for_each_child(ACPI_COMPANION(bus->dev),
> > +                                   sdw_acpi_check_duplicate, &cwd);
> > +     if (ret)
> > +             return ret;
>
> ... here, but I don't see this being propagated further...
>
> > +
> > +     if (cwd.ignore_unique_id)
> > +             cwd.id.unique_id = SDW_IGNORED_UNIQUE_ID;
> > +
> > +     /* Ignore errors and continue. */
> > +     sdw_slave_add(bus, &cwd.id, acpi_fwnode_handle(adev));
> > +     return 0;
> > +}
> > +
> >  /*
> >   * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
> >   * @bus: SDW bus instance
> > @@ -135,8 +200,7 @@ static bool find_slave(struct sdw_bus *b
> >   */
> >  int sdw_acpi_find_slaves(struct sdw_bus *bus)
> >  {
> > -     struct acpi_device *adev, *parent;
> > -     struct acpi_device *adev2, *parent2;
> > +     struct acpi_device *parent;
> >
> >       parent = ACPI_COMPANION(bus->dev);
> >       if (!parent) {
> > @@ -144,52 +208,7 @@ int sdw_acpi_find_slaves(struct sdw_bus
> >               return -ENODEV;
> >       }
> >
> > -     list_for_each_entry(adev, &parent->children, node) {
> > -             struct sdw_slave_id id;
> > -             struct sdw_slave_id id2;
> > -             bool ignore_unique_id = true;
> > -
> > -             if (!find_slave(bus, adev, &id))
> > -                     continue;
> > -
> > -             /* brute-force O(N^2) search for duplicates */
> > -             parent2 = parent;
> > -             list_for_each_entry(adev2, &parent2->children, node) {
> > -
> > -                     if (adev == adev2)
> > -                             continue;
> > -
> > -                     if (!find_slave(bus, adev2, &id2))
> > -                             continue;
> > -
> > -                     if (id.sdw_version != id2.sdw_version ||
> > -                         id.mfg_id != id2.mfg_id ||
> > -                         id.part_id != id2.part_id ||
> > -                         id.class_id != id2.class_id)
> > -                             continue;
> > -
> > -                     if (id.unique_id != id2.unique_id) {
> > -                             dev_dbg(bus->dev,
> > -                                     "Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> > -                                     id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
> > -                             ignore_unique_id = false;
> > -                     } else {
> > -                             dev_err(bus->dev,
> > -                                     "Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
> > -                                     id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
> > -                             return -ENODEV;
> > -                     }
> > -             }
> > -
> > -             if (ignore_unique_id)
> > -                     id.unique_id = SDW_IGNORED_UNIQUE_ID;
> > -
> > -             /*
> > -              * don't error check for sdw_slave_add as we want to continue
> > -              * adding Slaves
> > -              */
> > -             sdw_slave_add(bus, &id, acpi_fwnode_handle(adev));
> > -     }
> > +     acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);
>
> ... here?
>
> It looks like a change in the error handling flow where
> sdw_acpi_find_slaves() is now returning 0 (success) always?
>
> Shouldn't the return of sdw_acpi_find_one() be trapped, e.g. with
>
> return acpi_dev_for_each_child(parent, sdw_acpi_find_one, bus);

Sure, I'll do that.  Thanks!
