Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5425B59CD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5144916BC;
	Mon, 12 Sep 2022 14:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5144916BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984062;
	bh=GWWaF9Ele3nDBBodDuXQSkJfAumMGqKhY0d2QLPHBeE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjJX2NBgmxY1RCgHR4s5pR7HfA1hhv9M609ImT068cK/vGdakJp959LoWByouXrRZ
	 ZZ+BBqDOPdlg3qhHewswqeDlaTcDAFbLh7HbZK5gnpBKhfBOgr7DLaUdgpG3PfiT4Y
	 E63dr0Gj11GncTRAC2dxXr4Y0bnQmU9CPkdm4pD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C2CF804AA;
	Mon, 12 Sep 2022 14:00:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA387F8030F; Mon, 12 Sep 2022 14:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B84EF80095;
 Mon, 12 Sep 2022 13:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B84EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dE0spSnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662983995; x=1694519995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GWWaF9Ele3nDBBodDuXQSkJfAumMGqKhY0d2QLPHBeE=;
 b=dE0spSnBIPX/CvS3nrabzJy/0ZgyjohTrjfRrzh+AMZQ4ls7u6+fVgUR
 bDio2Oj3m/OulO8ltoDLBbvDjT1NxTZhreZg3VdKjAOfL08RMrYJVK9Tn
 kIk57rvN06OAUxBW5ac0oZOJiAZQ13N09hONf+0B7myOmV8OpqJx8Tsdh
 jDIWoCzLk5G/kXz+YZnLQD4gmtZ9hgL70fGn9swLYnR+q7KxIe9SLhwlo
 B0xZLSaCk5+FRe9KtxQfZXljLd+5KxxmkuYpZb0167pLht6m+K5r50FkG
 IcfZewlVyQHkgKG/msTk/N5O+c8u+AMlxvZ5TH/fZwla4rx6B4PRSgcEG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="298646403"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="298646403"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 04:59:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126286"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 04:59:41 -0700
Message-ID: <f67f29bc-64af-52dc-a63f-3b74523c06b0@linux.intel.com>
Date: Mon, 12 Sep 2022 12:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] soundwire: bus: Do not forcibly disable child
 pm_runtime
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 sanyog.r.kale@intel.com, broonie@kernel.org
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-2-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220907101402.4685-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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



On 9/7/22 12:13, Richard Fitzgerald wrote:
> Do not call pm_runtime_disable() of a child driver in
> sdw_delete_slave(). We really should never be trying to disable
> another driver's pm_runtime - it is up to the child driver to
> disable it or the core driver framework cleanup. The driver core
> will runtime-resume a driver before calling its remove() so we
> shouldn't break that.
> 
> The patch that introduced this is
> commit dff70572e9a3 ("soundwire: bus: disable pm_runtime in sdw_slave_delete")
> which says:
> 
> "prevent any race condition with the resume being executed after the
> bus and slave devices are removed"
> 
> The actual problem is that the bus driver is shutting itself down before
> the child drivers have been removed, which is the wrong way around (see
> for example I2C and SPI drivers). If this is fixed, the bus driver will
> still be operational when the driver framework runtime_resumes the child
> drivers to remove them. Then the bus driver will remove() and can shut
> down safely.

The description of the fix looks good, but "if this is fixed" is very
confusing to me.

Don't you have a dependency issue here?

There should be first a patch to fix the bus issue and then remove this
pm_runtime_disable second.


> 
> Also note that the child drivers are not necessarily idle when the bus
> driver is removed, so disabling their pm_runtime and stopping the bus
> might break more than only their remove().
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 0bcc2d161eb9..99429892221b 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -151,8 +151,6 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  	struct sdw_bus *bus = slave->bus;
>  
> -	pm_runtime_disable(dev);
> -
>  	sdw_slave_debugfs_exit(slave);
>  
>  	mutex_lock(&bus->bus_lock);
