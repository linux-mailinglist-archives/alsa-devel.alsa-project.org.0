Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4333A55750D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 10:11:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAF91B48;
	Thu, 23 Jun 2022 10:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAF91B48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655971902;
	bh=R3uCGcBzcPhEjKLhoHYVr0mcT7inFO/vUdrx4pb+wmY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASr+xDklSiH5Cd/uQ0Gf5ZBS6pv8I1udjy9higeZHPEWk7Q3scaxxin00xQjffkzW
	 m6FeIc2QPSPwra2efymWzKuSqnrFW9GrN/3SQPBXE6H6FMWgRlfaiyujjwBBQLf25o
	 GHnTIvLH98XtJQaup+Y8jFYuuIZG4DDxjOqQTJ48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81AE2F804C1;
	Thu, 23 Jun 2022 10:10:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5278CF800CB; Thu, 23 Jun 2022 10:10:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59477F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 10:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59477F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bpb8gFH2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DCD3B82205;
 Thu, 23 Jun 2022 08:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECCEC3411B;
 Thu, 23 Jun 2022 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655971841;
 bh=R3uCGcBzcPhEjKLhoHYVr0mcT7inFO/vUdrx4pb+wmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpb8gFH2ZoatfRw2fHmWNw0l08XRetd1naHwiFW0SnH5+PLXNAt3WbYdpzFN7PyLR
 pzD04MEf/DFEbSUQ1MGQzaIK5f4MrFoqE9zicARpfwAD9aZ4rxKfmKsi3x89f8HGxq
 JwJEQK6tF7+7Rdml1BXBR2pQd/sIjPDso0xC/6kiD22LCbL/Yv5lrcj1iY7vAmZCXi
 aH0h4rk1zSQtdHP1ker7Mr+lTM2iRnrRi2N6aFCsSvQgHRVDQ5a3rd3EsdVD+zVxtL
 bYZv6hI4Vyh1F4EXWR/DBVc9ntWgGJWLS9WUrgJdUJ6D0F8Q1pBQEpwuvHg3GLbfkN
 tJ2T/s4H7XF4A==
Date: Thu, 23 Jun 2022 13:40:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 14/16] soundwire: Use acpi_dev_for_each_child()
Message-ID: <YrQf/W/Kmo954hAm@matsya>
References: <1843211.tdWV9SEqCh@kreacher> <2653857.mvXUDI8C0e@kreacher>
 <9017824.rMLUfLXkoz@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9017824.rMLUfLXkoz@kreacher>
Cc: alsa-devel@alsa-project.org, Hans de Goede <hdegoede@redhat.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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

On 13-06-22, 20:35, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Instead of walking the list of children of an ACPI device directly,
> use acpi_dev_for_each_child() to carry out an action for all of
> the given ACPI device's children.
> 
> This will help to eliminate the children list head from struct
> acpi_device as it is redundant and it is used in questionable ways
> in some places (in particular, locking is needed for walking the
> list pointed to it safely, but it is often missing).

Applied, thanks

-- 
~Vinod
