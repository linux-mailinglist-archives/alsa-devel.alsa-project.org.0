Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C12647BC
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C46016BC;
	Thu, 10 Sep 2020 16:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C46016BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746912;
	bh=j9OR6E6fl8dGp0e1mya1ekdIgcAQycE+yl79eSOwqH0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9dntYAXc/4X5ZfTGxdWwoJkfhmqk89AaxIHxCuT96Df0RaG1KRhuscRqFrfVlDeQ
	 y/OpL8a1WNFpyVPo2S39oIu8FpXzmf0JFl2/XtwsmF4KFp4B2PFzPqgcFcBkgmvOGp
	 yzShx21uSupB/6g6rQTMcpBI1qjcEm4rIGXBDaVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB24EF800D0;
	Thu, 10 Sep 2020 16:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50066F80264; Thu, 10 Sep 2020 16:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3C19F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C19F800E9
IronPort-SDR: t2MLtJNTXER73lrEm02bevHkzujIOkLCGd9nxudyZ2/yhAGAFknUmSQJiM3jb3h8CGtPJfGlKl
 OTexEddXoMmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="155933969"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="155933969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 07:06:40 -0700
IronPort-SDR: vYcHCsxxJa5nFfuXY/At97aRV0e15vGQrbvXh5H8lGogJDq6ZqhIui3bE/WVjiO9m8a/bxwNCr
 CZU599mKOwIw==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="480901555"
Received: from minfanti-mobl.amr.corp.intel.com (HELO [10.254.126.4])
 ([10.254.126.4])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 07:06:39 -0700
Subject: Re: [PATCH] soundwire: add slave status as a sysfs file
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200910140349.681739-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5f7f9d1a-3a30-41db-d9c7-da4e92e101f5@linux.intel.com>
Date: Thu, 10 Sep 2020 09:06:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910140349.681739-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 9/10/20 9:03 AM, Vinod Koul wrote:
> SoundWire Slave status is not reported in the sysfs, so add this file
> with string values for status to userspace. Users can look into this
> file to see the Slave status at that point of time.

As I explained in my other email, this doesn't work in the case where a 
device does not have a driver or is not described in platform firmware: 
sysfs entries are only added *after* the driver probe.

We've need a separate sysfs attr group for this, added in 
sdw_slave_add() and separate from the attributes added after probe.

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> On RB3 it shows as:
> root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:1/status
> Attached
> root@linaro-alip:/sys/bus/soundwire/devices# cat sdw:0:217:2010:0:2/status
> Attached
> 
>   .../ABI/testing/sysfs-bus-soundwire-slave       |  7 +++++++
>   drivers/soundwire/sysfs_slave.c                 | 17 +++++++++++++++++
>   include/linux/soundwire/sdw.h                   |  2 ++
>   3 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> index db4c9511d1aa..8a64f8e9079a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> +++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> @@ -89,3 +89,10 @@ Description:	SoundWire Slave Data Source/Sink Port-N DisCo properties.
>   		for SoundWire. They define various properties of the
>   		Source/Sink Data port N and are used by the bus to configure
>   		the Data Port N.
> +
> +What:		/sys/bus/soundwire/devices/sdw:.../status
> +Date:		September 2020
> +Contact:	Vinod Koul <vkoul@kernel.org>
> +Description:	Soundwire Slave status
> +		This reports the current status of the slave, e.g if it is
> +		UNATTACHED, Attached, Alert or Reserved
> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> index f510071b0add..3d2cc7612d0d 100644
> --- a/drivers/soundwire/sysfs_slave.c
> +++ b/drivers/soundwire/sysfs_slave.c
> @@ -97,8 +97,25 @@ static ssize_t modalias_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(modalias);
>   
> +static const char *const slave_status[SDW_SLAVE_MAX] = {
> +	[SDW_SLAVE_UNATTACHED] =  "UNATTACHED",
> +	[SDW_SLAVE_ATTACHED] = "Attached",
> +	[SDW_SLAVE_ALERT] = "Alert",
> +	[SDW_SLAVE_RESERVED] = "Reserved",
> +};
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +
> +	return sprintf(buf, "%s\n", slave_status[slave->status]);
> +}
> +static DEVICE_ATTR_RO(status);
> +
>   static struct attribute *slave_attrs[] = {
>   	&dev_attr_modalias.attr,
> +	&dev_attr_status.attr,
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(slave);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 790823d2d33b..e8c9c20d38b0 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -73,12 +73,14 @@ enum {
>    * @SDW_SLAVE_ATTACHED: Slave is attached with bus.
>    * @SDW_SLAVE_ALERT: Some alert condition on the Slave
>    * @SDW_SLAVE_RESERVED: Reserved for future use
> + * @SDW_SLAVE_MAX: Last status value
>    */
>   enum sdw_slave_status {
>   	SDW_SLAVE_UNATTACHED = 0,
>   	SDW_SLAVE_ATTACHED = 1,
>   	SDW_SLAVE_ALERT = 2,
>   	SDW_SLAVE_RESERVED = 3,
> +	SDW_SLAVE_MAX,
>   };
>   
>   /**
> 
