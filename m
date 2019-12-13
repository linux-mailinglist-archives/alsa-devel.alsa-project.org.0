Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0811ED42
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 22:52:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB4191616;
	Fri, 13 Dec 2019 22:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB4191616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576273942;
	bh=7GP+0ACDIcqv6rfqyaj3pevrTaMpbMKCfwslShQrZK0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Es/jfbMYqLYqykBY4R0RW6HCu8iKdh3e7/C0tY0er1HE8UaUTh1AfNRre9tFu4svo
	 HOyYbPATWVq1ZW9OMSaH19OlE5GI/U+IHFUzebbg64aGgGx5KEDlMVshPxhts1MPBX
	 qolSp3ZbEZmcZZ7pve2bfG3fcg4WYyPFsfxnYack=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24265F80259;
	Fri, 13 Dec 2019 22:49:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25A53F80240; Fri, 13 Dec 2019 22:49:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92568F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 22:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92568F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eFDk6Bl+"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B6BF2465B;
 Fri, 13 Dec 2019 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576273743;
 bh=V2CFaPZrBBdO4R3RxH32GOkPbplsMRGGeYhs5JVDvlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eFDk6Bl+gPJrHIciR4vBH+8r8r0dzIndAkbihFAR+VZl7n9w4+z4X3YS0jXCKDm2N
 L/xhDeR8Us+FMN0hmZj3LDaxscVUQRjdRF0vb6ofww0UVFzHgDtovR8oAR0FMZEkon
 +npXLMc+JdbVBYLeUDoJ7x2DHhpGZ2Bh7D1TAb9E=
Date: Fri, 13 Dec 2019 17:12:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213161218.GC2653074@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
 <20191213072127.GD1750354@kroah.com>
 <41d1fcbc-47b7-bbee-5b55-759cbb5f5a7b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41d1fcbc-47b7-bbee-5b55-759cbb5f5a7b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 06/15] soundwire: add support for
 sdw_slave_type
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

On Fri, Dec 13, 2019 at 09:05:37AM -0600, Pierre-Louis Bossart wrote:
> On 12/13/19 1:21 AM, Greg KH wrote:
> > On Thu, Dec 12, 2019 at 11:04:00PM -0600, Pierre-Louis Bossart wrote:
> > > Currently the bus does not have any explicit support for master
> > > devices.
> > > 
> > > First add explicit support for sdw_slave_type and error checks if this type
> > > is not set.
> > > 
> > > In follow-up patches we can add support for the sdw_md_type (md==Master
> > > Device), following the Grey Bus example.
> > 
> > How are you using greybus as an example of "master devices"?  All you
> > are doing here is setting the type of the existing devices, right?
> 
> I took your advice to look at GreyBus and used the 'gb host device' as the
> model to implement the 'sdw master' add/startup/remove interfaces we needed.
> 
> so yes in this patch we just add a type for the slave, the interesting part
> is in the next patches.

Is that what a "master" device really is?  A host controller, like a USB
host controller?  Or something else?

I thought things were a bit more complex for this type of topology.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
