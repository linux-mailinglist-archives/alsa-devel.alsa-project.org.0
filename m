Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BE463C1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 18:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5355187C;
	Fri, 14 Jun 2019 18:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5355187C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560528936;
	bh=BrPwgAlzT1gsaNcFGvCG16hT/3p16mXA6OG0vUakYgM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mT5fmwW+/ITb+qRBTBd4a8z/u0+HSFCiDq3GnUNkQw7uMCDwyEUeJA+9eIetXdcpA
	 3ItMwplOjOEiPTI9CP54fOw9KG2K3t+da2LD8IBzR/5Egoi5g5xBKtPfdK+tIhE2pT
	 FEpdCuMC960R33kuaWH1D5HqQdtLyDPFrGBOKT2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4A5F896E0;
	Fri, 14 Jun 2019 18:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B2BEF896E0; Fri, 14 Jun 2019 18:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C766F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 18:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C766F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jwf1yGss"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 122582084E;
 Fri, 14 Jun 2019 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560528823;
 bh=2uBBU08ih/z1vvZiAk87PoxeiWmJGZJKpbJS72Crzf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwf1yGssjoNYppOtITboxnk4g8vA1ZzVoWo7Ze2ajVZFKnOWvbOODjXXPb5Mky7jL
 kHjk3rT633NrENeopm1WiA20khgsoznBlRCMK5EMsJqWtuf9luSF1FZSPFqtpgmjTF
 NT3LTqx96s08/2AuGqtT4sVUzzanOiEQKnBkRokg=
Date: Fri, 14 Jun 2019 18:13:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190614161339.GB22607@kroah.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-5-gregkh@linuxfoundation.org>
 <20190614153405.GD5316@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614153405.GD5316@sirena.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 5/5] sound: soc: core: no need to check
 return value of debugfs_create functions
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

On Fri, Jun 14, 2019 at 04:34:05PM +0100, Mark Brown wrote:
> On Fri, Jun 14, 2019 at 11:47:56AM +0200, Greg Kroah-Hartman wrote:
> 
> > Note, the soc-pcm "state" file has now moved to a subdirectory, as it is
> > only a good idea to save the dentries for debugfs directories, not
> > individual files, as the individual file debugfs functions are changing
> > to not return a dentry.
> 
> It'd be better to split this out into a separate change for ease of
> review.
> 
> > -	d = debugfs_create_file(w->name, 0444,
> > -				dapm->debugfs_dapm, w,
> > -				&dapm_widget_power_fops);
> > -	if (!d)
> > -		dev_warn(w->dapm->dev,
> > -			"ASoC: Failed to create %s debugfs file\n",
> > -			w->name);
> > +	debugfs_create_file(w->name, 0444, dapm->debugfs_dapm, w,
> > +			    &dapm_widget_power_fops);
> 
> The majority of this is removing error prints rather than code that
> actively does something different.  If this was like kmalloc() where the
> API is itself reported errors then this wouldn't be an issue but unless
> I'm missing something debugfs fails silently so this means that if
> something goes wrong it's going to be harder for the user to figure out
> where the debugfs files they wanted to check went to.  I'm guessing you
> don't want to add error prints in debugfs itself so I'd rather they
> stayed here.
> 
> Yes, the error check is looking for NULL not an error pointer - it was
> correct when written but I see that the debugfs API changed earlier this
> year to return error pointers so we ought to fix that up.

No, the long-term goal is for debugfs_create_file() to just return void.
I have already done enough cleanups in my local tree to do that already
for many of the helper functions.

No one should care one bit if a debugfs file succeeds or not, no logic
should ever change, nor should it matter.  debugfs is for debugging
kernel code, not for anything that anyone should ever rely on.

So yes, this patch does remove a bunch of error messages (that as you
point out can never be triggered), but the main goal here is to not
check the return value of the function at all, which is what this patch
does.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
