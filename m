Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CA462B6
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 17:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 310061876;
	Fri, 14 Jun 2019 17:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 310061876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560526137;
	bh=q4EtfaKnc0IQ8GZsIZg+6HqeFlsxmnF6GH/pO+f1iIg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwc5NGrHzQFGWrdHZarzBaKJz6CXHlLZhUF0oThcQr39cR6yIUL9NUBguGySgqHsy
	 tlImpEJH10cdwzfB8Y5jvdNUlVk/ZKCvLSm30MrtG5kRiq5DCehPpGf+YPG+b15ZmF
	 j8mscm508hMJ7FKqdVgCpKQLoAQ7ejUuwjy6t7qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E3D9F896EA;
	Fri, 14 Jun 2019 17:27:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EFBF896E0; Fri, 14 Jun 2019 17:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E504F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 17:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E504F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="syX6S5th"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5C742133D;
 Fri, 14 Jun 2019 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560526026;
 bh=38ki4S8yn9Slntw406DiMLvP2B1ai7NTtPy+XqPxVuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=syX6S5thWzNy5wPFz4oWzi0MU1w6Wm5fVK6+WOlmI9enPKu6uznz0zNQWN0HwjJM+
 ERstfJyEQVjR8E4OFxfjxUMZWaLyz5+atshrbnqBBUVqtbBDkEiYPJH6rqTaiq/mrP
 dby+0DxbYDDXFDUSmvpZg0DnIFYvzudptn8N5z0c=
Date: Fri, 14 Jun 2019 17:27:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190614152704.GB18049@kroah.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614151410.GC5316@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614151410.GC5316@sirena.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] sound: SoC: sof: no need to check
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

On Fri, Jun 14, 2019 at 04:14:10PM +0100, Mark Brown wrote:
> On Fri, Jun 14, 2019 at 11:47:52AM +0200, Greg Kroah-Hartman wrote:
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> 
> > +++ b/sound/soc/sof/debug.c
> > @@ -77,8 +77,7 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
> >  		if (!pm_runtime_active(sdev->dev) &&
> >  		    dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
> >  			dev_err(sdev->dev,
> > -				"error: debugfs entry %s cannot be read in DSP D3\n",
> > -				dfse->dfsentry->d_name.name);
> > +				"error: debugfs entry cannot be read in DSP D3\n");
> >  			kfree(buf);
> >  			return -EINVAL;
> >  		}
> 
> This appears to be an unrelated change with no description in the
> changelog, please split it out into a separate change with a description
> of the change.

The whole "dfsentry" variable is now gone, so it is very related.  Why
split this out?

> > @@ -119,13 +119,8 @@ static int trace_debugfs_create(struct snd_sof_dev *sdev)
> >  	dfse->size = sdev->dmatb.bytes;
> >  	dfse->sdev = sdev;
> >  
> > -	dfse->dfsentry = debugfs_create_file("trace", 0444, sdev->debugfs_root,
> > -					     dfse, &sof_dfs_trace_fops);
> > -	if (!dfse->dfsentry) {
> > -		/* can't rely on debugfs, only log error and keep going */
> > -		dev_err(sdev->dev,
> > -			"error: cannot create debugfs entry for trace\n");
> > -	}
> > +	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
> > +			    &sof_dfs_trace_fops);
> 
> I might be missing something but I can't see any error logging in
> debugfs_create_file() so this isn't equivalent (though the current code
> is broken, it should be using IS_ERR()).  Logging creation failures is
> helpful to developers trying to figure out what happened to the trace
> files they're trying to use.

There is no need to log anything in in-kernel, working code.  If a
developer wants to do this on their own when writing the code the first
time and debugging it, great, but for stuff we know works, there's no
need for being noisy.

Also, the check is incorrect, there's no way for this function to return
NULL, so that code today, will never trigger.  So obviously no one
counted on this message anyway :)

Just call the function and move on, like the rest of the kernel is being
converted over to do.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
