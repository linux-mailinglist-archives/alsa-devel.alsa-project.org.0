Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8650430626D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:45:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A40A16CE;
	Wed, 27 Jan 2021 18:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A40A16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611769556;
	bh=X/FC8zvlyuwwtmd81t+5h/jO+fwtZ0GRqEHN1bQJdC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akALA4LUd4XktHZX4ViHJVVSY1eg0l/qwtXp4ZNlTSAp7S8wvXt4TnKCo1aks/DG7
	 a5rvwlJ83o+/GFz+PczVkw6njy+NQVkEkhGOfZt1k5VJTyzBhTaVEDqgpZ8qReBdAO
	 jpKUKvx/bPhJl8JbS/6/RGD4p6tmK/EuzRNm5s2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82559F800F0;
	Wed, 27 Jan 2021 18:44:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 740E8F80259; Wed, 27 Jan 2021 18:44:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0A34F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A34F800E9
Received: by mail-ot1-f52.google.com with SMTP id k8so2491167otr.8
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 09:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHVRlfV9EQu4gPj5dVenKguyA2U2WXu41Z7MOBH2q+k=;
 b=d4O1iMLfFxDVFxCqijpz8aRGDDMASprLprtqakPOmZ5UWn0ESnMiLYuVsqClLnopfN
 aX14DVDP9tRNitqBghwLhOCWTu8ukPX16MebrDBE2fALf/vyBVLdjZ2VTwZmkl4bRc4C
 sQDWhAsgqzz5ZKhCqpNBazvCZJC11gD+pwwO/lbFeN5JUQljprBOtJpLbrKaqZJ1SpZ5
 1ssEDRpvwXXebylKdXoEtShqU7ePFRGbKEcX9Pd3To6ZTg7gjOqip8zlthAOI8NE2l2T
 gHRB6x20tg5vVvns55Csg/3RWfSy+YEcK1SgERRIkEAQI4bniUPvBV5r9tGdrO20xK1y
 f0wg==
X-Gm-Message-State: AOAM531viSyv2pgzxeah0jvfUVZHzbFNqEz+sCh0dL80cuHACDxUPfS+
 ddLS3ITq4yxwo+XU5QqbmDLqgslh8JNs+1Gftm0=
X-Google-Smtp-Source: ABdhPJx3wpBSkXPSpXDG6M0ltMbmguxQMImznzdVeAu1VT6FKAr93J3QfMztoWACmNnTeM4RMvDtc7yrOgIFRwkLX6w=
X-Received: by 2002:a05:6830:2313:: with SMTP id
 u19mr8675107ote.321.1611769458811; 
 Wed, 27 Jan 2021 09:44:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0ir4=urUviCR_4N96revWZkHVDyNNUiaJ3jjGzpX8zLVQ@mail.gmail.com>
 <20210127160650.GA2991034@bjorn-Precision-5520>
In-Reply-To: <20210127160650.GA2991034@bjorn-Precision-5520>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Jan 2021 18:44:07 +0100
Message-ID: <CAJZ5v0gmP2QBmMWkdVaGy+j6+FFPH6VGfRMU9ncz6m4BhBPgFA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-hwmon@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Jean Delvare <jdelvare@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, acpi4asus-user@lists.sourceforge.net,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-spi <linux-spi@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>
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

On Wed, Jan 27, 2021 at 5:06 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Jan 27, 2021 at 04:44:02PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Jan 27, 2021 at 4:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> > > > From: Bjorn Helgaas <bhelgaas@google.com>
> > > >
> > > > The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> > > > Replace it with "if (ACPI_SUCCESS(status))".
> > > >
> > > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > ---
> > > >
> > > > This isn't really an ACPI patch, but I'm sending it to you, Rafael, since
> > > > it seems easier to just apply these all at once.  But I'd be happy to split
> > > > them up into individual patches if you'd rather.
> > >
> > > Thanks, everybody.  Rafael, I'll just merge this via my tree to avoid
> > > burdening you.
> >
> > It may conflict with some janitorial stuff I'm doing, though, so
> > unless you've already applied it, I'd prefer to take it via the ACPI
> > tree.
>
> No problem, it's all yours!

Applied as 5.12 material with the ACKs, thanks!
