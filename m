Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE4546A97
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BBF218C5;
	Fri, 10 Jun 2022 18:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BBF218C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654879105;
	bh=qhb3ue3jkx0OzNd+SAkFQAItwZgBg+sANmqWbb2tG7A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XM0GM6V9JhAClGf/As1p9T4VbB6TcDDra8sO6GqXH5KrWdpiosup/2KmxmMPWNe2V
	 s6fKZ455VlbRBG7O5Y/UxivWzWy6tznqUCwM/vghV7UVRZ00UkBtHlvX2FeeNwp3HN
	 ZbUYrx3igYIeOrR55yMgHnxuianHTmXaiedulbAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCEBF80527;
	Fri, 10 Jun 2022 18:37:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5371F80529; Fri, 10 Jun 2022 18:37:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A88F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 18:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A88F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BJvOG+JT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654879015; x=1686415015;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qhb3ue3jkx0OzNd+SAkFQAItwZgBg+sANmqWbb2tG7A=;
 b=BJvOG+JTgAJPFA5F0k21appnSB4zyybGyggNFznPOECbzIbIvw9aRX3E
 a3CCH0VCR7F9Mh4dlVAjTNIu/rlUeiedaImHQTBGbh4Ciy2Uih0RSLA4u
 DWPRj+SfWsoeUGmeMtMYSzzyJXFRKFWtmCOOFI4jOTdouI/iLDrJDuS3p
 WGsNxwy4OB8N20qtJyzHXFOOnWUJerVxPKpgRdtOSNk3RgyEb7tGV4Ua3
 ToZup4JeKnIR8rZ6TJEI+lPk1PPgUrtc0xLMpWD/1n4o8HzjDkEfxlsTy
 V6cbATP+f73LKvZ1kHwurFG1trRcLjqG0aEfUSJGEchldAO9JvW/+YxCW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="303054971"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="303054971"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 09:36:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="725032963"
Received: from pljackso-mobl.amr.corp.intel.com (HELO [10.213.190.122])
 ([10.213.190.122])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 09:36:46 -0700
Message-ID: <b86e6cbd-3488-a239-d765-cf01bf0d4f70@linux.intel.com>
Date: Fri, 10 Jun 2022 10:06:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] soundwire: intel: uniquify debug message
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
 <YqLVwqx9/Pos8T06@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqLVwqx9/Pos8T06@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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



On 6/10/22 00:25, Greg KH wrote:
> On Fri, Jun 10, 2022 at 10:35:36AM +0800, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> The same debug message is replicated multiple time, add __func__ to
>> figure out what link is ignored.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>  drivers/soundwire/intel.c | 28 ++++++++++++++--------------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>> index 505c5ef061e3..808e2f320052 100644
>> --- a/drivers/soundwire/intel.c
>> +++ b/drivers/soundwire/intel.c
>> @@ -1328,8 +1328,8 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>>  
>>  	if (bus->prop.hw_disabled) {
>>  		dev_info(dev,
>> -			 "SoundWire master %d is disabled, ignoring\n",
>> -			 sdw->instance);
>> +			 "%s: SoundWire master %d is disabled, ignoring\n",
>> +			 __func__, sdw->instance);
> 
> This is not a debug message, please make it such if you want to have
> __func__  And even then, it's not needed as you can get that from the
> kernel automatically.

Sorry, I don't understand the feedback at all.

This message was added precisely to figure out why the expected
programming sequence was not followed, only to discover that we have
devices with spurious PCI wakes handled below. Without this added
difference with __func__, we wouldn't know if the issue happened during
the expected/regular programming sequence or not.

> 
>>  		return 0;
>>  	}
>>  
>> @@ -1489,8 +1489,8 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
>>  	bus = &sdw->cdns.bus;
>>  
>>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
>> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>> -			bus->link_id);
>> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
>> +			__func__, bus->link_id);
>>  		return 0;
>>  	}
>>  
>> @@ -1549,8 +1549,8 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
>>  	int ret;
>>  
>>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
>> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>> -			bus->link_id);
>> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
>> +			__func__, bus->link_id);
> 
> Not needed, it is provided automatically if you ask the kernel for this.
> Same for all other instances in this patch.

provided how? Your comment is a bit cryptic here.
