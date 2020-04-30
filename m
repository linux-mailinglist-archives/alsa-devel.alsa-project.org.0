Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349E1BEEAD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 05:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3286168C;
	Thu, 30 Apr 2020 05:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3286168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588217220;
	bh=wrZNuOePX4x/Jfsv4+VHiYVgMCiAJdxt263IW5V21iY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEtyRSDmoCOZURRKOqUgEW0fdA/Ne5OZpavxis6G7yiS6z7Z9DEDSDUe4vCp7/Txb
	 nVUatAeNNGiMWBrsEPQ9P0Xk0gLATk92e0zLu+QdE5DtOvx8BPZxFlwbDKt2SR+Y3V
	 1UNLvm3TAHhCoZOBYZPx64N8Ilk73xiadnq6982Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF88FF80136;
	Thu, 30 Apr 2020 05:25:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79901F801DB; Thu, 30 Apr 2020 05:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1645DF800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 05:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1645DF800B6
IronPort-SDR: I/Ezp7zCaM0wK9/99TlIONH0Srm2VhTVKCZTxfx7HspwzarzL0l5nx3s8th3w7FVcaHQFZ0K9Z
 BoNwcXTihw2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 20:24:59 -0700
IronPort-SDR: 5UFjD9BeWhUuteZ1nJPArTK1K1Z+DUQVSe2f5qNw2x9Aqq14Q7JfVhE2uaW/s7v+vJDV1Xvo+F
 EoGvIEHBClyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
 d="scan'208,217";a="276376652"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.189.210])
 ([10.252.189.210])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2020 20:24:55 -0700
Subject: Re: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
 <20200420072631.GW72691@vkoul-mobl> <20200423142451.GA4181720@kroah.com>
 <20200428043144.GU56386@vkoul-mobl.Dlink> <20200428063736.GB990431@kroah.com>
 <20200428064951.GA56386@vkoul-mobl.Dlink> <20200428065524.GA992087@kroah.com>
 <20200428075145.GB56386@vkoul-mobl.Dlink>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <4ecfa01e-4ef4-5368-3a70-2bd57407d2ad@linux.intel.com>
Date: Thu, 30 Apr 2020 11:24:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200428075145.GB56386@vkoul-mobl.Dlink>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, mengdong.lin@intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, linux-kernel@vger.kernel.org
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


On 4/28/2020 3:51 PM, Vinod Koul wrote:
> On 28-04-20, 08:55, Greg KH wrote:
>> On Tue, Apr 28, 2020 at 12:19:51PM +0530, Vinod Koul wrote:
>>> On 28-04-20, 08:37, Greg KH wrote:
>>>> On Tue, Apr 28, 2020 at 10:01:44AM +0530, Vinod Koul wrote:
>>>>>>> That is not true for everyone, it is only true for Intel, pls call that
>>>>>>> out as well...
>>>>>> Why is it not true for everyone?  How else do you get the pm stuff back
>>>>>> to your hardware?
>>>>> The rest of the world would do using the real controller device. For
>>>>> example the soundwire controller on Qualcomm devices is enumerated as a
>>>>> DT device and is using these...
>>>>>
>>>>> If Intel had a standalone controller or enumerated as individual
>>>>> functions, it would have been a PCI device and would manage as such
>>>> If it is not a standalone controller, what exactly is it?  I thought it
>>>> was an acpi device, am I mistaken?
>>>>
>>>> What is the device that the proper soundwire controller driver binds to
>>>> on an Intel-based system?
>>> The HDA controller which is a PCI device. The device represent HDA
>>> function, DSP and Soundwire controller instances (yes it is typically
>>> more than one instance)
>> Then those "instances" should be split up into individual devices that a
>> driver can bind to.  See the work happening on the "virtual" bus for
>> examples of how that can be done.
> Yes removing platform devices is the goal for Intel now :) Pierre & Bard
> have been diligently trying to solve this.
>
> Only difference is the means to end goal. I am not convinced that this
> should be in soundwire subsystem.
>
> Looks like folks are trying to review and port to use this bus. Makes
> sense to me..
> https://lore.kernel.org/netdev/c5197d2f-3840-d304-6b09-d334cae81294@linux.intel.com/
>
>> A platform device better not be being used here, I'm afraid to look at
>> the code now...
> Well if the plan for 'virtual-bus' goes well, it should be  a simple
> replacement of platform->virtual for Intel driver. Rest of the driver
> should not be impacted :)

We can't expect when will 'virtual-bus' be upstream and it's not feasible
to wait forever. Can we move forward with current solution and switch to
'virtual-bus' whenever it is upstream?

> Thanks
