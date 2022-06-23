Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4B557CEF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 15:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23ABC1DE8;
	Thu, 23 Jun 2022 15:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23ABC1DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655990896;
	bh=nxTVkuTRwT7zaUdBEZjmRQEHWHA9MbFr7dx9PzbNS8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MF46jHhE/NWeNGsGyWyX0ybEjkYi0C3pfFd9UUzptogVQQB4iFs8B3nEUJOJb+oe8
	 JuTw47riCu3Pc5BHGpDx7umm/VKBghPQ5nGUaeEcfN6FGNt8H5M++bgFoUlILlTMGK
	 kPLa0mucd0ErGOxVYkuRvfCb0cOMGLz3uBhCTtio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 430A8F800CB;
	Thu, 23 Jun 2022 15:27:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C2A6F800CB; Thu, 23 Jun 2022 15:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73F8CF800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 15:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F8CF800CB
Received: by mail-yb1-f170.google.com with SMTP id v81so35868670ybe.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 06:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxTVkuTRwT7zaUdBEZjmRQEHWHA9MbFr7dx9PzbNS8w=;
 b=RfJGHZm3lRpig/+5VvV8PIBjtbc98KrH8NgfgDmtgm4/YwwNn1jPEYLk08C7VI6/FT
 kKI3RuDklcdrHFdIfUvG1ImGzIO92q8nk4StJkQbeONs3Ab1wTbfWDOWbOUa+kbFzCIN
 nXlhYR+Fqj+yY1/9qhnFWDaMJu3TqUHOTuqo79Q4Rdj3QkIFrgKmZiOwRHTCbfH2lzlC
 L0buDSRY0IJBqeQ/i1wOS2uLnUi/BP5WqCs4GAyWlX4N69gjScNMba4Pt0b8gIHZTXF0
 rtO9/L42uARzmtM9XQBCAcp7hKA5upyMuOwD85L/axFfsn9JPUZbouoHYJCx4RozX1s4
 kKaw==
X-Gm-Message-State: AJIora8WB16pcsKIUoyimqKuDgarEAOU8mWwkJCh9gyygAYE2kcdi6Fo
 iIAYoWDchkFbrYI/7NxFCCf43EvdtY6vz3mXnEs=
X-Google-Smtp-Source: AGRyM1tHqoIBXvJ/qKXGJAn7vF6/FjaDbr0XBkhwJ/ueBXNgIfPFWwxORM0OiHCx5aXQGGQ+VCKyt/V80YugRpmswUI=
X-Received: by 2002:a25:6b50:0:b0:64f:4b33:664 with SMTP id
 o16-20020a256b50000000b0064f4b330664mr9743130ybm.153.1655990826869; Thu, 23
 Jun 2022 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <1843211.tdWV9SEqCh@kreacher> <2653857.mvXUDI8C0e@kreacher>
 <9017824.rMLUfLXkoz@kreacher> <YrQf/W/Kmo954hAm@matsya>
 <CAJZ5v0jY5M-L-XdgY+LT=iSbABzL6cLuSdLiuUEQ+mEjYYk=xA@mail.gmail.com>
 <YrRfd0AvYVn19wck@matsya>
In-Reply-To: <YrRfd0AvYVn19wck@matsya>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Jun 2022 15:26:56 +0200
Message-ID: <CAJZ5v0iRcpVZEGA0w6JaoHOFTM4hVAoUEoJ54n-AVE2StFgrgg@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] soundwire: Use acpi_dev_for_each_child()
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Hans de Goede <hdegoede@redhat.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Thu, Jun 23, 2022 at 2:41 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 23-06-22, 14:29, Rafael J. Wysocki wrote:
> > On Thu, Jun 23, 2022 at 10:10 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 13-06-22, 20:35, Rafael J. Wysocki wrote:
> > > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > >
> > > > Instead of walking the list of children of an ACPI device directly,
> > > > use acpi_dev_for_each_child() to carry out an action for all of
> > > > the given ACPI device's children.
> > > >
> > > > This will help to eliminate the children list head from struct
> > > > acpi_device as it is redundant and it is used in questionable ways
> > > > in some places (in particular, locking is needed for walking the
> > > > list pointed to it safely, but it is often missing).
> > >
> > > Applied, thanks
> >
> > Thanks, but the export of acpi_dev_for_each_child() is being added by
> > one of the previous patches in the series, so this one will not
> > compile without the rest of the series in the modular case.
>
> Aha, I checked the symbol exists and my test build passed!
> >
> > Is this not a problem?
>
> Yes indeed, so can you give a tag for that and or would you like to taje
> this thru ACPI tree, in that case

I'll take it.

> Acked-By: Vinod Koul <vkoul@kernel.org>

Thank you!
