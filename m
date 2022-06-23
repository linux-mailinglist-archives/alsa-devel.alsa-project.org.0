Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656E557A87
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 14:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A899190F;
	Thu, 23 Jun 2022 14:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A899190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655988160;
	bh=VEKQqqv0GJJfssR5O+DbzVMdKUZxwolWDybsziOqZNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gc7VoyOBsdriyfX1/fanjo1iWG6WtiCKPrRTVe/P1x8ex3m9q9fjHTyldn7nmvLNI
	 0CBgss26hzUjm04hgE6YBSHvwNmh+GlD8RrkLHwcGYNlw2MTMQaVxbm8lurpS4nKQK
	 LAnxNLC0UWaXjssNYgy94+JNwUE8xyfd4vvzJe8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEEEF804CC;
	Thu, 23 Jun 2022 14:41:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D97F800BD; Thu, 23 Jun 2022 14:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27329F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 14:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27329F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mP4e/YxZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08D8161C52;
 Thu, 23 Jun 2022 12:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC524C3411B;
 Thu, 23 Jun 2022 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655988091;
 bh=VEKQqqv0GJJfssR5O+DbzVMdKUZxwolWDybsziOqZNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mP4e/YxZ8SvnRHgTYBotpx2q2gyxVmuP+Dj7EWGigubb6+JnPDxEUSwo4E7BK3lZo
 PPrzQlZ3R3kE+AWDrE+4ZzxOBWWqMqBEact1Pe21v5Kpj6hfICQSn4hK+CWKat3Zr3
 4xndA33E9xINreJ8aMNJamSjLFSPHEwJiGhpBYipFfIyJtqatN1jcbyl4mEj69QsOd
 Z/CvQWEZ1gpQF+B+YLMkYPS49aj5cnaVJ4aKeLjdEpOTKLsjE3CrXtVJ139RFmYGsb
 TaRkoyVZ3EN3AMgH41R/CxZrnMbHBJvSNh7g+WoHEyKXZCVxB2LSx2QknwEjQNVvY8
 PV2nSHSQblf5w==
Date: Thu, 23 Jun 2022 18:11:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 14/16] soundwire: Use acpi_dev_for_each_child()
Message-ID: <YrRfd0AvYVn19wck@matsya>
References: <1843211.tdWV9SEqCh@kreacher> <2653857.mvXUDI8C0e@kreacher>
 <9017824.rMLUfLXkoz@kreacher> <YrQf/W/Kmo954hAm@matsya>
 <CAJZ5v0jY5M-L-XdgY+LT=iSbABzL6cLuSdLiuUEQ+mEjYYk=xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jY5M-L-XdgY+LT=iSbABzL6cLuSdLiuUEQ+mEjYYk=xA@mail.gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Linux PM <linux-pm@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On 23-06-22, 14:29, Rafael J. Wysocki wrote:
> On Thu, Jun 23, 2022 at 10:10 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 13-06-22, 20:35, Rafael J. Wysocki wrote:
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Instead of walking the list of children of an ACPI device directly,
> > > use acpi_dev_for_each_child() to carry out an action for all of
> > > the given ACPI device's children.
> > >
> > > This will help to eliminate the children list head from struct
> > > acpi_device as it is redundant and it is used in questionable ways
> > > in some places (in particular, locking is needed for walking the
> > > list pointed to it safely, but it is often missing).
> >
> > Applied, thanks
> 
> Thanks, but the export of acpi_dev_for_each_child() is being added by
> one of the previous patches in the series, so this one will not
> compile without the rest of the series in the modular case.

Aha, I checked the symbol exists and my test build passed!
> 
> Is this not a problem?

Yes indeed, so can you give a tag for that and or would you like to taje
this thru ACPI tree, in that case

Acked-By: Vinod Koul <vkoul@kernel.org>

BR
-- 
~Vinod
