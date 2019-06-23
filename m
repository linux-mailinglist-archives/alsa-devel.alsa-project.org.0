Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463A4FCAF
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 18:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8DC1607;
	Sun, 23 Jun 2019 18:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8DC1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561307657;
	bh=9prweYcdSploHe65uiiuP6AL/E2h7WZniTpm9srdgO4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4ih6MlkSVkn4mx649C735G6EN2yiQlFylFKsM5VxUXu0CbRAVe0keFMZyP7pmd44
	 Uza6KFFmZ7404rE+vDJK1jS7FJqOHxOiD4VkC4Gbc+/ZLYPDGqPERcfln7j5fJLwaK
	 /Bu/J2CjWxGJtw3qpgzrfjIbmkeWBA2CeFeFmjts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3242F8065D;
	Sun, 23 Jun 2019 18:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBA2FF896F0; Sun, 23 Jun 2019 18:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1230F8065B
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 18:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1230F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wHHRf6vj"
Received: from localhost (unknown [84.241.196.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CFC420645;
 Sun, 23 Jun 2019 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561305341;
 bh=1EnAnB2wrjzb69QIE+A+qEL6DskLxBPlyBVBX8KYtCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wHHRf6vjFElpDBetSKwxsLbVxqc0goS08VN4EeGKRqkQ3rGzGEbNvF72XI9pT02Hm
 FpRSgR76tdMnvP/uEOHZcFamx4OvXBxyq5JdUJbZZFFqzEo8IFxsrmRpQzfJL1lkWH
 GhuxCwqyZeiv4GwYtNSPeI5stA8E2LC2YgOxEE+8=
Date: Sun, 23 Jun 2019 17:55:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190623155535.GB17284@kroah.com>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-2-gregkh@linuxfoundation.org>
 <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
 <20190623045749.GA4812@kroah.com>
 <398523ac-5ef8-2f13-ff2c-9837a7d6518c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <398523ac-5ef8-2f13-ff2c-9837a7d6518c@intel.com>
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

On Sun, Jun 23, 2019 at 05:18:39PM +0200, Cezary Rojewski wrote:
> 
> On 2019-06-23 06:57, Greg Kroah-Hartman wrote:
> > On Sat, Jun 22, 2019 at 09:57:07PM +0200, Cezary Rojewski wrote:
> > > 
> > > On 2019-06-14 11:47, Greg Kroah-Hartman wrote:
> > > > When calling debugfs functions, there is no need to ever check the
> > > > return value.  The function can work or not, but the code logic should
> > > > never do something different based on this.
> > > > 
> > > 
> > > This change heavily impacts user space and development kits used by us
> > > internally, and our clients. That is, if anything goes wrong during debugfs
> > > initialization process.
> > 
> > As Takashi said, and as I said numerous times, how can anything go wrong
> > during debugfs file creation that does not also cause the rest of your
> > system to just crash. >
> > userspace should NEVER care about a debugfs file being present or not.
> > If it does, then you should not be using debugfs as it is never
> > guaranteed to be present on a system (and is locked down and removed on
> > many shipping systems for good reason.)
> > 
> > For development, it's wonderful, but it truely is just a debugging aid.
> > 
> > > Currently, apps may safely assume entire debugfs tree is up and running once
> > > audio stack gets enumerated successfully. With your patch this is no longer
> > > the case and user space is forced to verify status of all debugfs files and/
> > > or directories manually.
> > 
> > What apps rely on debugfs for audio?  We need to fix those.
> > 
> 
> Takashi,
> Thanks for reply. I hope you don't mind me replying here and not explicitly
> on your post. My message would be exactly the same as the one you see below.
> 
> 
> Greg,
> Forgive me for not clarifying: by userspace of course I meant any
> development/ debug related app which we use exhaustively.
> 
> Look at this from different perspective: I'm "just" a user of debugfs
> interface. I call a function and given its declaration I receive either 0 on
> success or != 0 on failure. Definition of said function may change in time
> and -ENOMEM might not be the only possible outcome, but that I leave to
> other developers and as long as behavior remains the same, changes are
> welcome.

Again, you should not even care if a debugfs call succeeds or not.

> Moreover, if we're compiling with CONFIG_DEBUGFS=1, driver may choose to
> collapse during probe if any of debugfs objects fail to initialize: in this
> case one can say CONFIG_DEBUGFS adds yet another condition for enumeration
> to be considered successful.

It should never matter to your code.

Debugfs was written to be much simpler and easier to use than procfs.
It goes against the "normal" defensive mode of kernel programming in
that you should not care if it works or not, your code should just keep
on working no matter what.

> > Again, my goal with these changes is two things:
> >    - no kernel operation should ever modify its behavior if debugfs is
> >      enabled, or working, at all.
> >    - no normal userspace code should ever care if debugfs is working
> > 
> > debugfs is for debugging things, that is all.  If you have system
> > functionality relying on files in debugfs, they need to be moved to a
> > system functionality that is always going to be present for your users
> > (i.e. sysfs, configfs, tracefs, etc.)
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> With mindset "may or may not succeed" one might as well resign from debugfs
> entirely and move to sysfs and other fs you'd mentioned.

That's fine, but do not put debugging stuff in sysfs please.  There are
strict rules on what you can and can not do in sysfs and other
filesystems.  Debugfs has no such rules except that no userspace code
should ever care about it.

> And why would he otherwise, when the only way to verify debugfs object
> state is either log parsing (filtering errors) or file-exists check.
> 
> My app should not be guessing, instead, it should know upfront with what its
> working with.

What app digs around in debugfs that any user should care about?  The
goal is to never have any functionality in there that the system
requires in order to work properly.

Again, we have found places where this is not the case, and it is being
fixed to remove that dependancy.

debugfs is "fire and forget" and used for debugging stuff only.  No
working system should care at all about it.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
