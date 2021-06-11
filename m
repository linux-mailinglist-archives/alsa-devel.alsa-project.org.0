Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCBE3A430E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 15:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C248194A;
	Fri, 11 Jun 2021 15:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C248194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623418292;
	bh=5syIn+RCk4Eumnt8SPMfARRletWX4c3GwaWbmkOsZ0U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tb156wDeXSBMDPIqK0ssA96EZv/bIhUz8ri5WVsBYgf1T9eg8LLECWi+/bXeH7vcC
	 0XN4L/b82IBE7kCtrDVdSp9gTH6eBguzrbqEQ+h1n7mI9L19BRZNYJsR0OsrASwGfi
	 oADeTy5cNrkQ6WZXLTAYMUEeefMrIz8Sno3QO2Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BAEF80276;
	Fri, 11 Jun 2021 15:30:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA70F8026C; Fri, 11 Jun 2021 15:29:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 755EAF800FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 15:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 755EAF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="ww7KB1r+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68D97613FA;
 Fri, 11 Jun 2021 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623418167;
 bh=5syIn+RCk4Eumnt8SPMfARRletWX4c3GwaWbmkOsZ0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ww7KB1r+D6dLROk8dlMYpi8iAR+fwNDQlEDSaCPbj5ILCyBZIVmxoxZuhCrKnpvKj
 8IDtkwQZd5W6UKgQfJmVQrV21q17wF8pVvEaTtvilYc+1BUFqEt3ecnEdzHqeQS4TL
 e4fCFA5MiVakh10bIUuEx1haWK3nCHSjqgUsbvn4=
Date: Fri, 11 Jun 2021 15:29:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
Message-ID: <YMNlND32rR9aKWeW@kroah.com>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
 <20210609151022.GF1002214@nvidia.com> <YMNIfHPRcgKLXJ0v@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMNIfHPRcgKLXJ0v@vkoul-mobl>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On Fri, Jun 11, 2021 at 04:56:52PM +0530, Vinod Koul wrote:
> On 09-06-21, 12:10, Jason Gunthorpe wrote:
> > On Wed, Jun 09, 2021 at 09:44:08AM -0500, Pierre-Louis Bossart wrote:
> > 
> > > The consensus for the auxiliary_device model was hard to reach, and the
> > > agreement was to align on a minimal model. If you disagree with the
> > > directions, you will have to convince Nvidia/Mellanox and Intel networking
> > > folks who contributed the solution to do something different.
> > 
> > The purpose of the aux devices was primarily to bind a *software*
> > interface between two parts of the kernel.
> 
> Then I dont think this example is valid... This example has a PCI device,
> which represents a DSP, HDA controller, DMICs, Soundwire
> links... So at least here it is hardware.

Yes, and that's fine, and exactly what aux devices were created for.

You divide up a single logically addressable device into differently
handled portions.

Not all hardware specs were as "smart" as USB was in allowing multiple
drivers to bind to the same physical USB device and talk to it at the
same time :)

Luckily the USB spec authors learned from the mistakes of PCI...

thanks,

greg k-h
