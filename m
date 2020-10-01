Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91D27FDF8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 13:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE472168D;
	Thu,  1 Oct 2020 13:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE472168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601550076;
	bh=eenR6WOEsdGEyYYJ1uo5sv+fXHWPX+NcnxG4BbWP3yM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTukIZW3U/AjqCrJ4Le7UwcKpwv3g+YWVs2y0lhXa0r7JgMbSwOkdJCylk9Lg8dMR
	 3/bzk9eLX/njXajE1wiIkU6rbZZ09ylw2LbaH0yFDCywuVROr1GgY66NF8TDPDzRSj
	 XzXANjltxN7qMSiHot+TjuEkeuSegyNII8m3OaGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F356FF800AB;
	Thu,  1 Oct 2020 12:59:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90977F801F5; Thu,  1 Oct 2020 12:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D8E3F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 12:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D8E3F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PgT4DfVs"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0B94207DE;
 Thu,  1 Oct 2020 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601549964;
 bh=eenR6WOEsdGEyYYJ1uo5sv+fXHWPX+NcnxG4BbWP3yM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PgT4DfVsQqVTCHYv0DSYfX6Q+8RnntocZwsMEnyhIdLmtrhxbxoW0eEgx0pLtVRq9
 q91Nbw7l5aegRnKpv/CVwrZYG7HfaKrp2CKotMJA7dYAdOgao4cAMMzarfzOM8MBpE
 PE6P1i903Fw5UJ6HkPzrsIrekejHED/naKEZbLVk=
Date: Thu, 1 Oct 2020 12:59:25 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001105925.GA1939744@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <8f34ae733db0447d93736f4f3f7524f9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f34ae733db0447d93736f4f3f7524f9@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

On Thu, Oct 01, 2020 at 10:05:13AM +0000, Rojewski, Cezary wrote:
> On 2020-10-01 12:50 AM, Dave Ertman wrote:
> > Brief history of Ancillary Bus
> > ==============================
> > The ancillary bus code was originally submitted upstream as virtual
> > bus, and was submitted through the netdev tree.  This process generated
> > up to v4.  This discussion can be found here:
> >   https://lore.kernel.org/netdev/0200520070227.3392100-2-jeffrey.t.kirsher@intel.com/T/#u
> > 
> > At this point, GregKH requested that we take the review and revision
> > process to an internal mailing list and garner the buy-in of a respected
> > kernel contributor.
> > 
> > The ancillary bus (then known as virtual bus) was originally submitted
> > along with implementation code for the ice driver and irdma drive,
> > causing the complication of also having dependencies in the rdma tree.
> > This new submission is utilizing an ancillary bus consumer in only the
> > sound driver tree to create the initial implementation and a single
> > user.
> > 
> > Since implementation work has started on this patch set, there have been
> > multiple inquiries about the time frame of its completion.  It appears
> > that there will be numerous consumers of this functionality.
> > 
> > The process of internal review and implementation using the sound
> > drivers generated 19 internal versions.  The changes, including the name
> > change from virtual bus to ancillary bus, from these versions can be
> > summarized as the following:
> > 
> > - Fixed compilation and checkpatch errors
> > - Improved documentation to address the motivation for virtual bus.
> > - Renamed virtual bus to ancillary bus
> > - increased maximum device name size
> > - Correct order in Kconfig and Makefile
> > - removed the mid-layer adev->release layer for device unregister
> > - pushed adev->id management to parent driver
> > - all error paths out of ancillary_device_register return error code
> > - all error paths out of ancillary_device_register use put_device
> > - added adev->name element
> > - modname in register cannot be NULL
> > - added KBUILD_MODNAME as prefix for match_name
> > - push adev->id responsibility to registering driver
> > - uevent now parses adev->dev name
> > - match_id function now parses adev->dev name
> > - changed drivers probe function to also take an ancillary_device_id param
> > - split ancillary_device_register into device_initialize and device_add
> > - adjusted what is done in device_initialize and device_add
> > - change adev to ancildev and adrv to ancildrv
> > - change adev to ancildev in documentation
> > 
> > This submission is the first time that this patch set will be sent to
> > the alsa-devel mailing list, so it is currently being submitted as
> > version 1.
> > 
> 
> Given the description and number of possible users, one could safely
> say: usage is assured. So, why not submit this bus as a standalone
> patch? Isn't it better to first have a stable, complete version present
> in Linus' tree and only then append the usage?

Because I want to see patches that actually _use_ the new code.  So far
the previous versions of this implementation have not shown how all of
the code will be used, making it impossible to review to see if it fits
the needs of people.

We don't add infrastructure without users.  And the normal rule of thumb
of "if we have 3 users, then it is a semi-sane api" really applies here.

thanks,

greg k-h
