Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF976262FE2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B8016F2;
	Wed,  9 Sep 2020 16:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B8016F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599662486;
	bh=28EKHZSl/k57du8qagtcqlgoEz+tScRlpJObCYw69BQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jv7N5mm1QwUlnt3nRnIWGsP3XwkNOT6+dnLS+hlGUhKuOObIbzfkA+rgPMGCLyxsD
	 UAaeBWlQ8SzX/bh5n6dqGmHjuKHLEFQ7D1D1Y/uTODHzwGc0FLt+Ay4DqXLeIcRwYU
	 ik3mEGijHHXgLAgrnEZBkXcmGH56Shgh+Pm5XgbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5264F8015F;
	Wed,  9 Sep 2020 16:39:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0077FF80227; Wed,  9 Sep 2020 16:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01EABF8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 16:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01EABF8015F
IronPort-SDR: Rut8dd20Han+AL51bDH4+B2ZyyY3nRC1gf/pFKWF5H/qmznUZqtA5pqpSFbfN0t6Z6q84rjj8m
 GG1in9Yj1u+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="158371650"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="158371650"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 07:39:27 -0700
IronPort-SDR: GCSL0Ela4Jea3HKxxVgV9QfVD1pxCMqZXJtu2wol68k9I9lZ4TGaJNC5CJ0ZPDrkyaIqa4e/tr
 efe1lYen/FNQ==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="505473210"
Received: from rsetyawa-mobl1.amr.corp.intel.com (HELO [10.212.20.145])
 ([10.212.20.145])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 07:39:26 -0700
Subject: Re: [PATCH] soundwire: bus: add enumerated slave to device list
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20200909082711.11670-1-srinivas.kandagatla@linaro.org>
 <80081c70-9137-c9f0-9813-8166275ef7af@linux.intel.com>
 <ab107351-dbde-7f6d-c588-11572aed5d2d@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4cdcda10-bdc6-211f-d279-e74f57684b79@linux.intel.com>
Date: Wed, 9 Sep 2020 09:39:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab107351-dbde-7f6d-c588-11572aed5d2d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


>>> Currently slave devices are only added either from device tree or acpi
>>> entries. However lets say, there is wrong or no entry of a slave device
>>> in DT that is enumerated, then there is no way for user to know all
>>> the enumerated devices on the bus.
>>
>> Sorry Srinivas, I don't understand your point.
>>
>> The sysfs entries will include all devices that are described in 
>> platform firmware (be it DT or ACPI).
> 
> yes that is true, but it will not include all the enumerated devices on 
> the bus!
> 
> In my case on a new board I was trying to figure out what devices are on 
> the bus even before even adding any device tree entries!

We've seen this before but dynamic debug provides all the information 
you need. see e.g. the logs from 
https://sof-ci.01.org/linuxpr/PR2425/build4447/devicetest/

jf-cml-rvp-sdw-1 kernel: [  289.751974] soundwire sdw-master-0: Slave 
attached, programming device number
jf-cml-rvp-sdw-1 kernel: [  289.752121] soundwire sdw-master-0: SDW 
Slave Addr: 10025d070000 <<< HERE
jf-cml-rvp-sdw-1 kernel: [  289.752122] soundwire sdw-master-0: SDW 
Slave class_id 0, part_id 700, mfg_id 25d, unique_id 0, version 1

  > In second case I had a typo in the device tree entry and sysfs 
displayed
> devices with that typo rather than actual enumerated device id.

That's a feature, not a bug? We use what address the platform firmware 
provides. If it's inaccurate then nothing can work.

>> If you add to sysfs entries unknown devices which happen to be present 
>> on the bus, then what? How would you identify them from the devices 
>> that are described in firmware?
> 
> Both of them should be displayed in sysfs, core should be able to 
> differentiate this based on the presence of fw_node or of_node and not 
> bind!

Core yes but user not so much. If the intent is to list the devices 
present on the bus, your patch still requires manual work.

>> Also the sysfs entries describe properties, but if you haven't bound a 
>> driver then how would this work?
> 
> This is would be informative, atleast in cases like me!
> 
> All I want to know is the list of enumerated devices on the bus, If 
> doing this way is not the right thing, then am happy to try any suggestion!
> 
> For now I have managed to figure out enumerated device ids on the bus 
> with this patch, I was hoping that other people would also hit such 
> issue, so I sent this patch!

Now I get your point but
a) you already have a dynamic debug trace to list all devices
b) adding 'undeclared' devices would make things quite murky and is only 
half of the solution. We already struggle because we already have 
'ghost' devices in sysfs that are not physically present, and no way to 
differentiate between the two. If we did add those entries, then we'd 
need two new sysfs attributes such as
'declared' and 'enumerated'.
