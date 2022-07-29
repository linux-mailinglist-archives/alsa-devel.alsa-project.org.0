Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE75851D4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 16:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E151E1640;
	Fri, 29 Jul 2022 16:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E151E1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659106398;
	bh=F3R+IOAPEQcMnDp1+HJeg+EseSWL8jzg1ZzFD/TqHPU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q03QIHsee1ZuL1eizDAbuXyiWnI460XsVw6nOc48i1TFVBfPJfU19fLUyZvV0cluO
	 8e+hBjuqc1eDMjJKxmRBEXU7OwQkQJy4Be6xRbP6PK0J/KFM5jUzYvNVwd+ybTsn2Q
	 I70/MTcTO419g4slQx/VjprtAlRAwOaHZa1K6Dn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3616AF804B1;
	Fri, 29 Jul 2022 16:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 245A7F8049C; Fri, 29 Jul 2022 16:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 580B4F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 580B4F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="jx8RM2gZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2395D6194D;
 Fri, 29 Jul 2022 14:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099A1C433D6;
 Fri, 29 Jul 2022 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659106329;
 bh=F3R+IOAPEQcMnDp1+HJeg+EseSWL8jzg1ZzFD/TqHPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jx8RM2gZ0DRSCk7nSuPoQxG+jpm3VnWYi6IsuXN62pdo5x/bDUpQ0n/Z8sFwRNuLP
 tO56S+uBmc5IAjpYCdRGQWSxe0PxLpYSABHXnr65omm4BltMbQzIu9+1SJjdkWh3Lp
 3VPyYUk84A3A+HUQtcDIg1K4OBRMSMoXopRWibcI=
Date: Fri, 29 Jul 2022 16:52:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Message-ID: <YuP0Ffs3G7ZBR0AC@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Fri, Jul 29, 2022 at 09:46:26AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 7/29/22 08:50, Greg Kroah-Hartman wrote:
> > There's no need to special-case the dp0 sysfs attributes, the
> > is_visible() callback in the attribute group can handle that for us, so
> > add that and add it to the attribute group list making the logic simpler
> > overall.
> > 
> > This is a step on the way to moving all of the sysfs attribute handling
> > into the default driver core attribute group logic so that the soundwire
> > core does not have to do any of it manually.
> > 
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/soundwire/sysfs_slave.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> > index 83e3f6cc3250..3723333a5c2b 100644
> > --- a/drivers/soundwire/sysfs_slave.c
> > +++ b/drivers/soundwire/sysfs_slave.c
> > @@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(words);
> >  
> > +static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
> > +			      int n)
> > +{
> > +	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
> > +
> > +	if (slave->prop.dp0_prop)
> > +		return attr->mode;
> > +	return 0;
> > +}
> 
> This changes the results slightly by creating an empty 'dp0' directory
> with no attributes inside.
> 
> Before:
> 
> [root@fedora ~]# cd /sys/bus/soundwire/devices/sdw:3:025d:0714:01
> [root@fedora sdw:3:025d:0714:01]# ls dp0
> ls: cannot access 'dp0': No such file or directory
> 
> After:
> [root@fedora sdw:3:025d:0714:01]# ls dp0

That should be fine, tools should just be looking for the attributes,
not the existance of a directory, right?

thanks,

greg k-h
