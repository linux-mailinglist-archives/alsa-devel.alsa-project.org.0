Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0E4E78B0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 17:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E413F1755;
	Fri, 25 Mar 2022 17:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E413F1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648224550;
	bh=LfZuJY9U4bYtmapuCWRM97xDsnarYz/hLGP7Oixd4xU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tk9WuCWRriPBiz21Eol8O/3EO5/dKHRNwatRH2H3uJ2ZD3Qqc6KnXXRCpmTRajx1Q
	 D5lpHm/IYQvVG/ph+vU2TIt/+CwqtZXgbCASNyMEHK0AgZEhl3yLC78avqnwtKKGgz
	 UZoJP4rz2mSlpy2nLDgR2pJZFPTTI1Ef18pqmy90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE04F800F4;
	Fri, 25 Mar 2022 17:07:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08480F80162; Fri, 25 Mar 2022 17:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 439F3F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 17:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439F3F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hVvmk025"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648224474; x=1679760474;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LfZuJY9U4bYtmapuCWRM97xDsnarYz/hLGP7Oixd4xU=;
 b=hVvmk025tFzdU752jhpeoJ4Yog50mzWOHq3V/piO+bF1zO1FWF99xumP
 IDQei7X1bS0TK6X9Cenp/mCh4TQn6O9iyVLPL1Fet3khdBzTUImtyPpW0
 NYRJNJgPzvq+7kzQE0xI2kCJN/WJlHZSdRIaj0wGTAszfCFcRfMbyOz2O
 SmYrSqPL65dstMFd6OHGGy/2HahfiPxiCRER3RUQTH1Nk6i0ytaHBknvV
 twoXR2zsm4swi/Um16LeKD4y1nZbU4TKGs56p1Tss8/R4HRMLpAi4/LNG
 wr5WuBa6+2iNP1DevOgoIplNbhgibZ98XZUWVfmoqc/XVSo/Pzd7oWhgR w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="258632669"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258632669"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 09:07:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="617165843"
Received: from jkbowlin-mobl1.amr.corp.intel.com (HELO [10.212.134.93])
 ([10.212.134.93])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 09:07:48 -0700
Message-ID: <34c503b3-203c-11b5-fd96-ae45bf939970@linux.intel.com>
Date: Fri, 25 Mar 2022 10:51:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: Conceptual bug on SoundWire probe/remove?
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
 <YjxS3k2V9t1tJ8RD@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YjxS3k2V9t1tJ8RD@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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



On 3/24/22 06:15, Greg Kroah-Hartman wrote:
> On Wed, Mar 23, 2022 at 02:45:59PM -0500, Pierre-Louis Bossart wrote:
>> Hi,
>> I could use feedback/guidance on a possible conceptual bug in the SoundWire
>> probe and bus handling.
>>
>> When we probe a driver, the code does this:
>>
>> static int sdw_drv_probe(struct device *dev)
>> {
>> 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>> 	const struct sdw_device_id *id;
>> 	const char *name;
>> 	int ret;
>>
>> 	/*
>> 	 * fw description is mandatory to bind
>> 	 */
>> 	if (!dev->fwnode)
>> 		return -ENODEV;
>>
>> 	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
>> 		return -ENODEV;
>>
>> 	id = sdw_get_device_id(slave, drv);
>> 	if (!id)
>> 		return -ENODEV;
>>
>> 	slave->ops = drv->ops;
> 
> That is wrong and should never happen as you lost all reference
> counting.  Please don't do that.

ok, so I think we all agree on the issue. It's not new code, it's been 
there since December 2017 and 4.16

>> The last line is the problematic one. If at some point, the user does an
>> rmmod and unbinds the SoundWire codec driver, the .remove will be called and
>> the 'drv' will no longer be valid, but we will still have a reference to
>> drv->ops and use that pointer in the bus code, e.g.
>>
>> 		/* Update the Slave driver */
>> 		if (slave_notify && slave->ops &&
>> 		    slave->ops->interrupt_callback) {
>> 			slave_intr.sdca_cascade = sdca_cascade;
>> 			slave_intr.control_port = clear;
>> 			memcpy(slave_intr.port, &port_status,
>> 			       sizeof(slave_intr.port));
>>
>> 			slave->ops->interrupt_callback(slave,
>> &slave_intr);
>> 		}
>>
>> I noodled with a potential fix in
>> https://github.com/thesofproject/linux/pull/3534/commits/82d64fb0fd39b532263f060a8ec86e47e9ab305b
>>
>> where I force-reset this slave->ops pointer, but it is likely to be very
>> racy.
> 
> Just properly reference count things and this should be ok.  You can
> NEVER just save off a pointer to a random thing that you do not own
> without increasing the reference count, otherwise bad things will
> happen.  It's always been this way.

but I am not following the reference count recommendation in that 
specific case. If we increase a reference count in the probe, wouldn't 
that prevent the unbind/remove?

