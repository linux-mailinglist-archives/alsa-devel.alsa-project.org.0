Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F1585208
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 17:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7494D15CC;
	Fri, 29 Jul 2022 17:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7494D15CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659107058;
	bh=XQhKrj3mBkmm98vaiqZCcsYovhORhaIgbJh9hVRNzwk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JdCnEySFwKe3JXbIm7nsFjCfpTBVaJfX+HeifR7I97Wml5Ay1w+TlsRI8SkG+TqCl
	 ygStSOqLtSGbGh0BOl9Yzi7itMbaLrFYPY++DFdXvYFtdx1+Jn2COSoMhtEnXLTL5d
	 BMbDe1BaGb5W0AJaFEbUcPXgCH2xWTTDD8qCRJ0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE2F6F804B1;
	Fri, 29 Jul 2022 17:03:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1020F8049C; Fri, 29 Jul 2022 17:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C83EBF800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 17:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83EBF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="daLcI1iv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 637DECE2912;
 Fri, 29 Jul 2022 15:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BFEC433C1;
 Fri, 29 Jul 2022 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659106985;
 bh=XQhKrj3mBkmm98vaiqZCcsYovhORhaIgbJh9hVRNzwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=daLcI1iv3PX39Fx76j5qPHaQB72ymYbKc6AsnVgpC4NA26mIa9NuZEgWv1+L2oido
 1jyvyTg+b0AyKxgzElaxr1hjUS0RZTYC7MPhJxxrqoH9z5vPdpd6GVy8F1eF1qFOze
 k9GkYl1DuGNkoh7BQ9LpqbApv/HqR7wWd/Try0k8=
Date: Fri, 29 Jul 2022 17:03:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Message-ID: <YuP2pjhyKTTfpXQq@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
 <YuP0Ffs3G7ZBR0AC@kroah.com>
 <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
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

On Fri, Jul 29, 2022 at 09:57:52AM -0500, Pierre-Louis Bossart wrote:
> 
> 
> On 7/29/22 09:52, Greg Kroah-Hartman wrote:
> > On Fri, Jul 29, 2022 at 09:46:26AM -0500, Pierre-Louis Bossart wrote:
> >>
> >>
> >> On 7/29/22 08:50, Greg Kroah-Hartman wrote:
> >>> There's no need to special-case the dp0 sysfs attributes, the
> >>> is_visible() callback in the attribute group can handle that for us, so
> >>> add that and add it to the attribute group list making the logic simpler
> >>> overall.
> >>>
> >>> This is a step on the way to moving all of the sysfs attribute handling
> >>> into the default driver core attribute group logic so that the soundwire
> >>> core does not have to do any of it manually.
> >>>
> >>> Cc: Vinod Koul <vkoul@kernel.org>
> >>> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> >>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> >>> Cc: alsa-devel@alsa-project.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> ---
> >>>  drivers/soundwire/sysfs_slave.c | 18 ++++++++++++------
> >>>  1 file changed, 12 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> >>> index 83e3f6cc3250..3723333a5c2b 100644
> >>> --- a/drivers/soundwire/sysfs_slave.c
> >>> +++ b/drivers/soundwire/sysfs_slave.c
> >>> @@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
> >>>  }
> >>>  static DEVICE_ATTR_RO(words);
> >>>  
> >>> +static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
> >>> +			      int n)
> >>> +{
> >>> +	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
> >>> +
> >>> +	if (slave->prop.dp0_prop)
> >>> +		return attr->mode;
> >>> +	return 0;
> >>> +}
> >>
> >> This changes the results slightly by creating an empty 'dp0' directory
> >> with no attributes inside.
> >>
> >> Before:
> >>
> >> [root@fedora ~]# cd /sys/bus/soundwire/devices/sdw:3:025d:0714:01
> >> [root@fedora sdw:3:025d:0714:01]# ls dp0
> >> ls: cannot access 'dp0': No such file or directory
> >>
> >> After:
> >> [root@fedora sdw:3:025d:0714:01]# ls dp0
> > 
> > That should be fine, tools should just be looking for the attributes,
> > not the existance of a directory, right?
> 
> The idea what that we would only expose ports that actually exist.
> That's helpful information anyone with a basic knowledge of the
> SoundWire specification would understand.

Is "dp0" a port?  If so, why isn't it a real device?

> The attributes are really details that few people/applications would
> understand, and unfortunately the information reported in DSDT is more
> often than not complete garbage.

I don't understand what DSDT is, or how it is relevant here :(

thanks,

greg k-h
