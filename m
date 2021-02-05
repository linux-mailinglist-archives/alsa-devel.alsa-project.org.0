Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A65C310DC3
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 17:20:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96411886;
	Fri,  5 Feb 2021 17:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96411886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612542053;
	bh=2EWjdo5BPIHh9NqcN6QPLreymg8X4YR9ie2+oaJxfeg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFN/lZICFSR5ccTn4Lxspbj03oSUKMORBDvRdNORXB3LTTDg+70Ey3SEcwogQy66W
	 lPSbdpXhMkWkZ5aYFDVdJeiaZdwEBBp/1VdiUWilTLSYm8taOWC65ZYxg9qE9RswJE
	 Qz0ZxWawfrZEoIj+cXsCY3NivnlN35pbgAIbN53Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C7D3F80139;
	Fri,  5 Feb 2021 17:19:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF96FF80156; Fri,  5 Feb 2021 17:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35D3BF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 17:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D3BF80139
IronPort-SDR: hwZLZUJPnWU8KNlAX+iZAsjHa5NrSPwYY51SH3uVgjYly8w7oBXQKpqArSS+ey48nxk7bgDJoy
 hOCFbURHgptw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168570492"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="168570492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 08:19:08 -0800
IronPort-SDR: FP/VEBG9vqjfwxCyoDJS0wV0opk7IUkxufqPQuqnTjJ0ix5hq54xp9fM9HbC/Nt28UBkNmfKP2
 0XCOkls9hR6g==
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="393923536"
Received: from gjcomber-mobl.amr.corp.intel.com (HELO [10.255.228.165])
 ([10.255.228.165])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 08:19:07 -0800
Subject: Re: [PATCH 1/2] soundwire: slave: introduce DMI quirks for HP Spectre
 x360 Convertible
To: Vinod Koul <vkoul@kernel.org>
References: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
 <20210204204837.27876-2-pierre-louis.bossart@linux.intel.com>
 <20210205071621.GF2656@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <46897c27-50ff-564c-5a44-b2c230d4d39b@linux.intel.com>
Date: Fri, 5 Feb 2021 09:15:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205071621.GF2656@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

Thanks for the review Vinod.

> On 04-02-21, 14:48, Pierre-Louis Bossart wrote:
>> HP Spectre x360 Convertible devices expose invalid _ADR fields in the
>> DSDT, which prevents codec drivers from probing. A possible solution
>> is to override the DSDT, but that's just too painful for users.
>>
>> This patch suggests a simple DMI-based quirk to remap the existing
>> invalid ADR information into valid ones.
> 
> While I agree with the approach, I do not like the implementation. The
> quirks in firmware should not reside in core code. Drivers are the right
> place, of course we need to add callbacks into driver for this.
> 
> So I did a quick hacking and added the below patch, I think you can add
> the quirks in Intel driver based on DMI for this.

I thought about this, but the Intel driver is about the *master* 
configuration. It's not really about slave-related _ADR. If and when the 
IP configuration changes, it'll be problematic to have such quirks in 
the middle.

At the end of the day, the problem is an ACPI one, not an Intel master 
one, and I put the code where it's protected by CONFIG_ACPI.

I don't mind doing the change, but the notion of conflating Intel master 
and list of slave quirks isn't without its own problems.

An alternate solution would be to break the ACPI and OF slave 
initialization into two separate files (slave-acpi.c and slave-of.c), 
that way there is a cleaner split.

Or we put all those quirks in a dedicated slave-dmi-quirks.c and use 
your solution. That may be more manageable since the list of quirks is 
historically likely to grow.

It's really ugly in all cases.

I try to look at the positive side of things: if we have quirks to 
handle it's an indicator that more platforms are moving to SoundWire...

I hope though that it doesn't reach the level of Baytrail where most of 
the machine driver is a dictionary of quirks.

> 
> -- >8 --
> 
>  From 20af8100025637ea5e295877d28f3afb9dbd4814 Mon Sep 17 00:00:00 2001
> From: Vinod Koul <vkoul@kernel.org>
> Date: Fri, 5 Feb 2021 12:38:21 +0530
> Subject: [PATCH] soundwire: add override addr ops
> 
> Some firmware can have buggy _ADR values causing the scanning of devices
> to fail. Add the override_ops which if implemented by master driver
> would be invoked instead of reading _ADR. The drivers can implement
> quirks based on DMI etc to override the addr values.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   -compile tested only, pls validate
> 
>   drivers/soundwire/slave.c     | 25 +++++++++++++++++++++----
>   include/linux/soundwire/sdw.h |  3 +++
>   2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index a08f4081c1c4..2b0d646c5c2f 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -91,12 +91,11 @@ int sdw_slave_add(struct sdw_bus *bus,
>   
>   #if IS_ENABLED(CONFIG_ACPI)
>   
> -static bool find_slave(struct sdw_bus *bus,
> -		       struct acpi_device *adev,
> -		       struct sdw_slave_id *id)
> +static bool _find_slave(struct sdw_bus *bus,
> +		        struct acpi_device *adev,
> +		        struct sdw_slave_id *id)
>   {
>   	unsigned long long addr;
> -	unsigned int link_id;
>   	acpi_status status;
>   
>   	status = acpi_evaluate_integer(adev->handle,
> @@ -108,6 +107,24 @@ static bool find_slave(struct sdw_bus *bus,
>   		return false;
>   	}
>   
> +	return addr;
> +}
> +
> +static bool find_slave(struct sdw_bus *bus,
> +		       struct acpi_device *adev,
> +		       struct sdw_slave_id *id)
> +{
> +	unsigned long long addr;
> +	unsigned int link_id;
> +
> +	if (bus->ops->override_adr)
> +		addr = bus->ops->override_adr(bus);
> +	else
> +		addr = _find_slave(bus, adev, id);
> +
> +	if (!addr)
> +		return false;
> +
>   	/* Extract link id from ADR, Bit 51 to 48 (included) */
>   	link_id = SDW_DISCO_LINK_ID(addr);
>   
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index f0b01b728640..d0ad3404ca95 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -804,6 +804,8 @@ struct sdw_defer {
>   /**
>    * struct sdw_master_ops - Master driver ops
>    * @read_prop: Read Master properties
> + * @override_adr: Override reading address from firmware and read from
> + * driver instead (quirk for buggy firmware)
>    * @xfer_msg: Transfer message callback
>    * @xfer_msg_defer: Defer version of transfer message callback
>    * @reset_page_addr: Reset the SCP page address registers
> @@ -813,6 +815,7 @@ struct sdw_defer {
>    */
>   struct sdw_master_ops {
>   	int (*read_prop)(struct sdw_bus *bus);
> +	unsigned long long (*override_adr)(struct sdw_bus *bus);
>   
>   	enum sdw_command_response (*xfer_msg)
>   			(struct sdw_bus *bus, struct sdw_msg *msg);
> 
