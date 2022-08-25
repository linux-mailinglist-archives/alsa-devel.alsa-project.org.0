Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD55A0AC9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 09:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B055A100;
	Thu, 25 Aug 2022 09:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B055A100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661414050;
	bh=w2+CDzxpLXzinHv/LpItV/WhSldf7eSUvIqt6KGdQzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxR9LiBeYHSq73fKn9mWGC7ePayhDCCa1AjIsF8YTerCl2K1vtUzRvtZ3tdTB6gdY
	 k6i7g4AnfJhU8CZgjS1+GpQPtUC/9Y+p7iZrN0dx1iIi0v6/csj0p3PvxYXeorpepM
	 trKAf9cE2DgdRmFPWDBNytZg3gYlcTEQD1wfV/s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30896F80271;
	Thu, 25 Aug 2022 09:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD93F800BD; Thu, 25 Aug 2022 09:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E6CF800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 09:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E6CF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="fnzCVtKH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C96C61A1D;
 Thu, 25 Aug 2022 07:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328A6C433C1;
 Thu, 25 Aug 2022 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661413980;
 bh=w2+CDzxpLXzinHv/LpItV/WhSldf7eSUvIqt6KGdQzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnzCVtKHNpcY0e2qXAOg73IGB7exSoP5+NySASktbYFpo6bN8+f3rtzSpollWmKut
 qzr8x7OWCCE5dkMO4gyxAjO7tMD351Jl0EcdKONjp+8KbAxJkq9fvNnixCFf0zxCfV
 Vzk4v0S/ryUSSAtcCPODZNuWUnQZovrtkXCNj4yg=
Date: Thu, 25 Aug 2022 09:52:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/6] sysfs: do not create empty directories if no
 attributes are present
Message-ID: <YwcqWaAX8yv3wyoi@kroah.com>
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
 <fb3a66c6-a8b3-02db-4170-5d5c521165e2@linux.intel.com>
 <YwZCPdPl2T+ndzjU@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwZCPdPl2T+ndzjU@kroah.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Wed, Aug 24, 2022 at 05:22:37PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 24, 2022 at 05:17:44PM +0200, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 8/24/22 15:59, Greg Kroah-Hartman wrote:
> > > When creating an attribute group, if it is named a subdirectory is
> > > created and the sysfs files are placed into that subdirectory.  If no
> > > files are created, normally the directory would still be present, but it
> > > would be empty.  Clean this up by removing the directory if no files
> > > were successfully created in the group at all.
> > > 
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> > > Cc: alsa-devel@alsa-project.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > > v2: new patch
> > > 
> > > Note, totally untested!  The following soundwire patches will need this,
> > > if a soundwire developer could test this out, it would be most
> > > apreciated.
> > 
> > Not able to see the kernel boot with this first patch. The device is
> > stuck with the cursor not even blinking. It seems our CI test devices
> > are also stuck.
> > 
> > This is completely beyond my comfort zone but I can run more tests to
> > root cause this.
> 
> Ick, ok, so much for sending out untested patches :(
> 
> I'll test and debug this tomorrow and resend a correct version, thanks
> for helping out here, sorry it didn't work.

I have run out of time to work on this for this week, I'll try to pick
it up next week.  Don't worry about the soundwire changes for now, I'll
resend them when I get this all working properly.

thanks,

greg k-h
