Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A8151CA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 18:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6651865;
	Mon,  6 May 2019 18:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6651865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557160808;
	bh=iXcNiO6GMVeLmtwxITWwXWK5oLiaq0MQBu8P3/lXzIc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpdMs32bU4ZvOVOB+H3GMoo2+wuUCQIc253QShA7yG/wYbAiIYz6cufTDzhErZB6j
	 5hpMA59JZt1Dv4aDDBpsbiwdwpQmtVxcJlRiSEobVXriCjhyfITj0ZE5JLJVcfoobx
	 /ZaZm8aqqgizX/xNvoXcIUAM/pIkknm6KhJ9vf8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1600AF896FD;
	Mon,  6 May 2019 18:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86011F896F0; Mon,  6 May 2019 18:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE1FF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 18:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE1FF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YBrU4rBu"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D51020578;
 Mon,  6 May 2019 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557160696;
 bh=AekdLqHpDoOsRjyE4YTt8yYR+74f0A2mIBOAgYZpno4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBrU4rBuE3MPa6I6muGRenYoUcTpyx1Mnkwhrx8nhlI1RKIxFNJ7QoCL+fknzhuce
 s0VhHL2Aa/yPpH6tQ1fpnqUzgC9JYH48qUgurR0SAdXulLgD9fN0BIm0mvOY4YBbAk
 IkE5vzwINvW4lZCzvQ3Ea1x3PeXvASZ5IcxGE48I=
Date: Mon, 6 May 2019 22:08:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190506163810.GK3845@vkoul-mobl.Dlink>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
 <20190504070301.GD9770@kroah.com>
 <a9e1c3d2-fe29-1683-9253-b66034c62010@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9e1c3d2-fe29-1683-9253-b66034c62010@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 5/7] soundwire: add debugfs support
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

On 06-05-19, 09:48, Pierre-Louis Bossart wrote:

> > > +struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
> > > +{
> > > +	if (d)
> > > +		return d->fs;
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL(sdw_bus_debugfs_get_root);
> > 
> > _GPL()?
> 
> Oops, that's a big miss. will fix, thanks for spotting this.

Not really. The Soundwire code is dual licensed. Many of the soundwire
symbols are indeed exported as EXPORT_SYMBOL. But I agree this one is
'linux' specific so can be made _GPL.

Pierre, does Intel still care about this being dual licensed or not?

> 
> > 
> > But why is this exported at all?  No one calls this function.
> 
> I will have to check.

It is used by codec driver which are not upstream yet. So my suggestion
would be NOT to export this and only do so when we have users for it
That would be true for other APIs exported out as well.

> > 
> > > +struct sdw_slave_debugfs {
> > > +	struct sdw_slave *slave;
> > 
> > Same question as above, why do you need this pointer?
> 
> will check.

The deubugfs code does hold a ref to slave object to read the data and
dump, this particular instance might be able to get rid of (should be
doable)

> > And meta-comment, if you _EVER_ save off a pointer to a reference
> > counted object (like this and the above one), you HAVE to grab a
> > reference to it, otherwise it can go away at any point in time as that
> > is the point of reference counted objects.
> > 
> > So even if you do need/want this, you have to properly handle the
> > reference count by incrementing/decrementing it as needed.

Yes, but then device exit routine is supposed to do debugfs cleanup as
well, so that would ensure these references are dropped at that point of
time. Greg should that not take care of it or we *should* always do
refcounting.

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
