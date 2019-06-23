Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB694FA4E
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 06:59:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78701615;
	Sun, 23 Jun 2019 06:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78701615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561265988;
	bh=5inLc8+xzi84keC574c68mzyFn5xgNjWyA9v42zGpqo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRL9JFnD+Hhj0pUy+DOSruUbJTKCJWg9JsYFDyyRRJJlJB3QuXes/3PoHLoxp1+M5
	 PoBQm+4vufKQJ3wAdl8dA7fV0hqUCyjgZs2K/IpScphEUqwYzNnHPtmE0HQ9R5y6qJ
	 YPuskt7Ya6RHxvqGXCeQbt0+h4MkmvGIJSWnWdyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D561F896FC;
	Sun, 23 Jun 2019 06:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0952AF896F0; Sun, 23 Jun 2019 06:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42DE2F8065D
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 06:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DE2F8065D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1hpueBX7"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E791420657;
 Sun, 23 Jun 2019 04:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561265871;
 bh=lD6bIkqMeAtWIWyEkQNSr1EWpiDCKXGaPEfsIslfyA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1hpueBX7IotWt8P5nT0JXedtjZnyYoXf7BLwNpHS7fm7YB11yEl0ezgXjUgAQQbRK
 XOciIWMBi8JjUhvIb0ZvH4EDXs0Fl7Ze5tXRl5YCt1mh3D0hAWVllOF6Q/Wl0KZ3zK
 +ZXQiYOhuS1o8nSJOn4l4v+5jpCxRadeADLSNxyY=
Date: Sun, 23 Jun 2019 06:57:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190623045749.GA4812@kroah.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-2-gregkh@linuxfoundation.org>
 <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/5] sound: soc: skylake: no need to check
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

On Sat, Jun 22, 2019 at 09:57:07PM +0200, Cezary Rojewski wrote:
> 
> On 2019-06-14 11:47, Greg Kroah-Hartman wrote:
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> > 
> 
> This change heavily impacts user space and development kits used by us
> internally, and our clients. That is, if anything goes wrong during debugfs
> initialization process.

As Takashi said, and as I said numerous times, how can anything go wrong
during debugfs file creation that does not also cause the rest of your
system to just crash.

userspace should NEVER care about a debugfs file being present or not.
If it does, then you should not be using debugfs as it is never
guaranteed to be present on a system (and is locked down and removed on
many shipping systems for good reason.)

For development, it's wonderful, but it truely is just a debugging aid.

> Currently, apps may safely assume entire debugfs tree is up and running once
> audio stack gets enumerated successfully. With your patch this is no longer
> the case and user space is forced to verify status of all debugfs files and/
> or directories manually.

What apps rely on debugfs for audio?  We need to fix those.

Again, my goal with these changes is two things:
  - no kernel operation should ever modify its behavior if debugfs is
    enabled, or working, at all.
  - no normal userspace code should ever care if debugfs is working

debugfs is for debugging things, that is all.  If you have system
functionality relying on files in debugfs, they need to be moved to a
system functionality that is always going to be present for your users
(i.e. sysfs, configfs, tracefs, etc.)

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
