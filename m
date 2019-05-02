Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29706120DE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 19:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C631819;
	Thu,  2 May 2019 19:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C631819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556817251;
	bh=CZ3eJpESJjRqhJiQ1VLA33qQWUH4/oniQJ3VEJ35XPY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vp3ZjNDMmKPV/tCBWCBV+0RTmGY7vEuT0pYoHn6M1hIfJ8Ewtl63e8QGHtidFxUD7
	 K4vlzZF8MuJmvXNe+5iYavvkuClTe4ncStOTTnN7vhIxMokEKLymcFvy6vCrLXEcsZ
	 +WCnc7dqexjpE+ykG1/YojwRK+AH/8FXjSxMY2oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C29F896C7;
	Thu,  2 May 2019 19:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6695BF896C7; Thu,  2 May 2019 19:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7696F89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 19:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7696F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gRKj6IXa"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37D8420652;
 Thu,  2 May 2019 16:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556814960;
 bh=5VENTQEmM/AAnDpfwMcf/sBzfs2PpjDDwyrzADrvdbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gRKj6IXa63OpSJPDY2uvTDZ10oeDBYVwN56J00GrdLzchYFG+oQd8033hIscbuzXS
 ZejNqafix+ht5t+cNfn6DWnluzyjJXAlxv0tJryP/s4mFd5K1VIOU4dGo+Z6Fhe2S5
 rQQ36ECZKpCpT0QGMrumsfOVBiMGEwcypDdbOO48=
Date: Thu, 2 May 2019 18:35:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502163558.GA14664@kroah.com>
References: <20190502105930.9889-1-vkoul@kernel.org>
 <20190502105930.9889-2-vkoul@kernel.org>
 <20190502150754.GA17197@kroah.com>
 <20190502151558.GA2499@kroah.com>
 <20190502152146.GS3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502152146.GS3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, Shreyas NC <shreyas.nc@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/14] soundwire: fix kconfig help format
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

On Thu, May 02, 2019 at 08:51:46PM +0530, Vinod Koul wrote:
> On 02-05-19, 17:15, Greg KH wrote:
> > On Thu, May 02, 2019 at 05:07:54PM +0200, Greg KH wrote:
> > > On Thu, May 02, 2019 at 04:29:17PM +0530, Vinod Koul wrote:
> > > > Move to help format instead of --help-- as that is not recommended and
> > > > this makes file consistent with other instance
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > >  drivers/soundwire/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> > > > index 84876a74874f..53b55b79c4af 100644
> > > > --- a/drivers/soundwire/Kconfig
> > > > +++ b/drivers/soundwire/Kconfig
> > > > @@ -28,7 +28,7 @@ config SOUNDWIRE_INTEL
> > > >  	select SOUNDWIRE_CADENCE
> > > >  	select SOUNDWIRE_BUS
> > > >  	depends on X86 && ACPI && SND_SOC
> > > > -	---help---
> > > > +	help
> > > >  	  SoundWire Intel Master driver.
> > > >  	  If you have an Intel platform which has a SoundWire Master then
> > > >  	  enable this config option to get the SoundWire support for that
> > > > -- 
> > > > 2.20.1
> > > > 
> > > 
> > > Huh?
> > > 
> > > Pierre-Louis sent this patch before you did.  Why did you just rewrite
> > > the changelog text a bit and then ignore his authorship and
> > > signed-off-by?
> > > 
> > > That's a really really shitty thing to do, I'm going to go take his
> > > version of these patches instead, let me see how they line up...
> > 
> > Ok, my apologies, that was incorrect.  Your patch was against a
> > different file than his.
> 
> Yes and our emails crossed, apology accepted.
> > 
> > Way to go and make this a total mess to try to figure out, let me see
> > what I can do...
> 
> If you can hold off for a bit longer, I have patches in next (pierre's
> full series and couple of then split and ofcourse authorship retain
> (https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/log/?h=next)
> and mine on top
> (https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/log/?h=checkpatch_fixes)
> 
> I can send you a signed PR for both and you can merged them. otherwise
> the style changes will conflict and defeat the whole purpose..
> 
> Let me know if that is okay, thanks

Send me the pull request and let's see how bad things are messed up :)

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
