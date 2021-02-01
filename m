Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B430A52F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF8B1768;
	Mon,  1 Feb 2021 11:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF8B1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612174561;
	bh=wSWGa0AelgE602zA7s8sVuYnMOyWFW24cLHyxoZNYfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdyIugxV2yv0Z0yvDWZuV+9cjaK7lVX9BunbTXIGwT5QLjNO0XjO6V5sOBrX2yqQd
	 KFajUc+4vTRHfNqIg1hHkx71hQRZ/NgJXYiiYLpr85cYRif0Jx0yw0kv6zqXslY61U
	 uu2qKAILrRzo3Bj1nD0yrB/APPEgKkZnLv5/KEjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EA9F80154;
	Mon,  1 Feb 2021 11:14:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B08F80153; Mon,  1 Feb 2021 11:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E6E3F80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E6E3F80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gk+wAbdl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C16C64DDD;
 Mon,  1 Feb 2021 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612174459;
 bh=wSWGa0AelgE602zA7s8sVuYnMOyWFW24cLHyxoZNYfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gk+wAbdlwBheXAQXLjaJm15extS73qIDqUBGucZqPW5kf/Cc7IsbSde/eoEWpEG6r
 ysyEJCkXiriqE5jfqSNXEgT4FEpH2Uce3eXfcjHCeRQehaTGwC3IE6ELPkiRH/HPkC
 YbV1kes4m6ptkpiMPf4C21xicjejLsBRdB0xDwZQOwOE38H5HqNpBWgvK3xeYnglST
 ogznAUVtWylVTKvwVCKuvr8AD4b8K6JuhKIo9jJNgqsRvliGYBpw0JOINv43EXhO0i
 +BIgB9k9WdZWd9fsWUJ+R5V/AWK6aX5eDZefYilW+dextu1yx7+jXy5JJdzoH5x/ta
 Lu8mkzNExbKFg==
Date: Mon, 1 Feb 2021 15:44:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
Message-ID: <20210201101414.GS2771@vkoul-mobl>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
 <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
 <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 21-01-21, 17:23, Srinivas Kandagatla wrote:
> 
> 
> On 21/01/2021 15:12, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 1/21/21 6:03 AM, Srinivas Kandagatla wrote:
> > > 
> > > 
> > > On 19/01/2021 19:09, Pierre-Louis Bossart wrote:
> > > > 
> > > > > currently we have
> > > > > /sys/kernel/debug/soundwire/master-*
> > > > > 
> > > > > Are you suggesting that we have something like this:
> > > > > 
> > > > > /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??
> > > > 
> > > > Yes this is what I was thinking about.
> > > 
> > > Vinod/Pierre,
> > > 
> > > One Question here,
> > > 
> > > Why is link_id part of "struct sdw_bus", should it not be part of
> > > "struct sdw_master_device " ?
> > > 
> > > Given that "There is one Link per each Master"
> > 
> > it's true that link == master == bus at the concept level.
> > 
> > but we have an existing code base with different structures and we can't
> > break too many things at once.
> > 
> > In the existing flow, the 'bus' is created and setup first, the
> > sdw_bus_master_add() routine takes a 'bus' argument, and the link_id is
> > already set. This routine only creates a device and in the rest of the
> > code we keep using the 'bus' pointer, so there's no real short-term
> > scope for moving the information into the 'sdw_master_device' structure
> > - that would be a lot of surgery when nothing is really broken.
> 
> I totally agree!
> 
> If I understand it correctly in Intel case there will be only one Link ID
> per bus.

Yes IIUC there would be one link id per bus.

the ida approach gives us unique id for each master,bus I would like to
propose using that everywhere

> 
> 
> Does this change look good to you?
> 
> ---------------->cut<---------------
> 
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index b6cad0d59b7b..f22868614f09 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -19,13 +19,14 @@ void sdw_bus_debugfs_init(struct sdw_bus *bus)
>                 return;
> 
>         /* create the debugfs master-N */
> +       bus->controller_debugfs = debugfs_create_dir(dev_name(bus->dev),
> sdw_debugfs_root);
>         snprintf(name, sizeof(name), "master-%d", bus->link_id);
> -       bus->debugfs = debugfs_create_dir(name, sdw_debugfs_root);
> +       bus->debugfs = debugfs_create_dir(name, bus->controller_debugfs);
>  }
> 
>  void sdw_bus_debugfs_exit(struct sdw_bus *bus)
>  {
> -       debugfs_remove_recursive(bus->debugfs);
> +       debugfs_remove_recursive(bus->controller_debugfs);
>  }
> 
>  #define RD_BUF (3 * PAGE_SIZE)
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index b198f471bea8..242bde30d8bd 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -877,6 +877,7 @@ struct sdw_bus {
>         struct sdw_master_prop prop;
>         struct list_head m_rt_list;
>  #ifdef CONFIG_DEBUG_FS
> +       struct dentry *controller_debugfs;
>         struct dentry *debugfs;
>  #endif
>         struct sdw_defer defer_msg;
> 
> ---------------->cut<---------------
> 
> With this change I get something like this on my board:
> 
> ~# find /sys/kernel/debug/soundwire/
> /sys/kernel/debug/soundwire/
> /sys/kernel/debug/soundwire/sdw-master-2
> /sys/kernel/debug/soundwire/sdw-master-2/master-0
> /sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:4
> /sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:4/registers
> /sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:3
> /sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:3/registers
> /sys/kernel/debug/soundwire/sdw-master-1
> /sys/kernel/debug/soundwire/sdw-master-1/master-0
> /sys/kernel/debug/soundwire/sdw-master-1/master-0/sdw:0:217:10d:0:3
> /sys/kernel/debug/soundwire/sdw-master-1/master-0/sdw:0:217:10d:0:3/registers
> /sys/kernel/debug/soundwire/sdw-master-0
> /sys/kernel/debug/soundwire/sdw-master-0/master-0
> /sys/kernel/debug/soundwire/sdw-master-0/master-0/sdw:0:217:10d:0:4
> /sys/kernel/debug/soundwire/sdw-master-0/master-0/sdw:0:217:10d:0:4/registers
> 
> 
> 
> Thanks,
> srini

-- 
~Vinod
