Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205028397F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 17:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65D871799;
	Mon,  5 Oct 2020 17:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65D871799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601911600;
	bh=qaZXNaYbUPsH7MCLzkuV1LTDCnnpmVKvRfRuGNqSqNA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hZoYonPwcjBurmxb82DDmbzMcCXBKfD0YBJYNP7AJh06n1XoZOVB4pKYXnAvcLN7q
	 FtDErcbnVYqxWPg7w9GJw7p/2szOTxcmve6jvrxXhRH0k3qps1UifWuVzwEHPrd41k
	 ooStDMlqAr7oRs47SecAntK1/06dao6ZGLwGauKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AADF80121;
	Mon,  5 Oct 2020 17:24:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 942F8F8025A; Mon,  5 Oct 2020 17:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A282F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 17:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A282F800C9
IronPort-SDR: kk2fckKKFBsvrzPrtjTneI8WSPLTUwCgQvjnL1yb2MsWbe3MfC0EYIg7s8GJ9bnrdv1+RhiK82
 3DMAWiTukRoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="143637265"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="143637265"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 08:23:10 -0700
IronPort-SDR: r4Am0PpNhYL8r/PTv+IoO6AJ6nLsVCbnmf3bAOjpfpqBnL6Tfh1ugJC9r0AkAoXeWS8Vja6tph
 xc/C5tV+D4Mw==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="352581204"
Received: from srembels-mobl1.amr.corp.intel.com (HELO [10.212.125.28])
 ([10.212.125.28])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 08:18:22 -0700
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
 <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
 <20201002045357.GA34005@kroah.com>
 <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
 <20201003090201.GC114893@kroah.com>
 <8e0bb7b90d689f98fc2dd861b4444fda9b36bab8.camel@intel.com>
 <20201005112711.GB401816@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <074b20bf-ecce-82a9-574a-758da31cef06@linux.intel.com>
Date: Mon, 5 Oct 2020 10:18:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005112711.GB401816@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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


>>>>>>> As you are creating new sysfs directories, you should have
>>>>>>> some
>>>>>>> documentation for them :(
>>>>>> Hi Greg,
>>>>>>
>>>>>> We are not adding any sysfs entries in this series.
>>>>>
>>>>> You added directories in sysfs, right?
>>>> Hi Greg,
>>>>
>>>> We are not adding any sysfs directories.
>>>
>>> Really?  Then what does creating these new devices do in sysfs?  If
>>> nothing, then why are they being used at all?  :)
>>>
>>>> The only change in the /sys directory will be the new ancillary
>>>> devices created in the /sys/bus/ancillary/devices directory ie
>>>> snd_sof_client.ipc_test.0 and snd_sof_client.ipc_test.1.
>>>
>>> That is what I was referring to.
>>>
>>>> In the following patches, we're adding debugfs entries for the ipc
>>>> test clients but no other sysfs changes.
>>>>
>>>> Is it required to add documentation for these as well?
>>>
>>> Why would you not document them?  If you don't do anything with these
>>> devices, then why even use them?  debugfs does not require sysfs
>>> entries, so I fail to see the need for using this api at all here...
>> Hi Greg,
>>
>> Pardon my ignorance here a bit. Typically, when registering platform
>> devices, we've not added any documentation to highlight how they are
>> used. Of course thats no excuse for not doing this right.
>>
>> But just to clarify so that we can fix this properly in the next
>> version, are we expected to add documentation for the directories added
>> in the /sys/bus (ie /sys/bus/ancillary, /sys/bus/ancillary/devices,
>> /sys/bus/ancillary/drivers etc) and also for the devices and drivers
>> added by the SOF driver?
> 
> You are using a brand-new interface, which is designed to represent
> things in the driver model and sysfs properly, and yet your usage
> doesn't actually take advantage of the driver model or sysfs at all?
> 
> That implies to me that you are using this incorrectly.

We are taking advantage of 'standard' sysfs capabilities, e.g. we get a 
power/ directory and can disable pm_runtime if we chose to do so.

But the point is that for now we haven't added domain specific 
properties with attributes.

For example, I noodled with this code last week to replace the platform 
devices with ancillary devices in the Intel SoundWire code, and I get 
this in sysfs:

root@plb:/sys/bus/ancillary/devices/soundwire_intel.link.0# ls -l
total 0
lrwxrwxrwx 1 root root    0 Oct  2 15:48 driver -> 
../../../../bus/ancillary/drivers/intel-sdw
lrwxrwxrwx 1 root root    0 Oct  5 10:12 firmware_node -> 
../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:63/PRP00001:00
drwxr-xr-x 2 root root    0 Oct  5 10:12 power
drwxr-xr-x 5 root root    0 Oct  2 15:48 sdw-master-0
lrwxrwxrwx 1 root root    0 Oct  2 15:48 subsystem -> 
../../../../bus/ancillary
-rw-r--r-- 1 root root 4096 Oct  2 15:48 uevent

What would you want us to document here?
