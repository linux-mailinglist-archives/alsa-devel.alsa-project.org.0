Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC42E7FA3
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF4B16F2;
	Thu, 31 Dec 2020 12:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF4B16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609413764;
	bh=kkH0Rv2417zNHLez3MbmgjEPPz+AqMRHWONeeVbxltA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcEy6Gb5Plz7heFzzJE3kZ8/2f8K3vBG+R19oJcMWZNzbE6E2u4mmuZC3I4eCdI/9
	 btHw7tbtEp39bHLUpdnFCy+k2bwygEz50YMHOMZXEQfIDcDe3vWYE19/zHzL3p5xea
	 eNwVYgM831gTdMrfLHOuToCaEIWXjEh1gt3VwgDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 515A0F8020C;
	Thu, 31 Dec 2020 12:21:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CA1CF8022B; Thu, 31 Dec 2020 12:21:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 213E7F80129
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 12:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213E7F80129
IronPort-SDR: fYi8E82uQe+Vg8V2250O5DtbCDpyKsubPPgTvcjtsux8or/J/PCDyLaeZqZelwhYFbJpvFT/s6
 62Cck3s6X66Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="155895400"
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="155895400"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 03:21:00 -0800
IronPort-SDR: MCSb26NCT3haZgnwKx3W+3G0gg8BUw5jh/DgXusdplSmczPYUHtfkrsPhvTyOIycslnx9xZ4Jx
 d7oZ0tZpkm9g==
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="419856018"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.135.34])
 ([10.249.135.34])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 03:20:57 -0800
Subject: Re: Haswell audio no longer working with new Catpt driver
To: Christian Labisch <clnetbox@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2f0acfa1330ca6b40bff564fd317c8029eb23453.camel@gmail.com>
 <efc6d5e8abc1da3cac754cb760fff08a1887013b.camel@gmail.com>
 <X+2MzJ7bKCQTRCd/@kroah.com>
 <a194639e-f444-da95-095d-38e07e34f72f@metafoo.de>
 <267863e8ca1464e4e433d83c5506ed871e3899b2.camel@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <4c5b8a03-6508-541f-2a72-39cb3052b4f1@linux.intel.com>
Date: Thu, 31 Dec 2020 12:20:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <267863e8ca1464e4e433d83c5506ed871e3899b2.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Akemi Yagi <toracat@elrepo.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <stable@vger.kernel.org>,
 Greg Kroah-Hartman <linux-kernel@vger.kernel.org>,
 Justin Forbes <jforbes@redhat.com>
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

On 12/31/2020 11:50 AM, Christian Labisch wrote:
> Hi Lars-Peter,
> 
> Thank you, please find attached the requested information from both kernels.
> I freshly installed the fedora kernel 5.10.4 to give you the latest results.
> 
> Regards,
> Christian
> 
> Christian Labisch
> Red Hat Accelerator
> clnetbox.blogspot.com
> access.redhat.com/community
> access.redhat.com/accelerators
> 
> 
> On Thu, 2020-12-31 at 11:04 +0100, Lars-Peter Clausen wrote:
>> On 12/31/20 9:33 AM, Greg Kroah-Hartman wrote:
>>> On Wed, Dec 30, 2020 at 07:10:16PM +0100, Christian Labisch wrote:
>>>> Update :
>>>>
>>>> I've just tested the kernel 5.10.4 from ELRepo.
>>>> Unfortunately nothing changed - still no sound.
>>> Ah, sad.  Can you run 'git bisect' between 5.9 and 5.10 to determine the
>>> commit that caused the problem?
>>
>> The problem is that one driver was replaced with another driver. git
>> bisect wont really help to narrow down why the new driver does not work.
>>
>> Christian can you run the alsa-info.sh[1] script on your system and send
>> back the result?
>>
>> You say sound is not working, can you clarify that a bit? Is no sound
>> card registered? Is it registered but output stays silent?
>>
>> - Lars
>>
>> [1] https://www.alsa-project.org/wiki/AlsaInfo
>> <https://www.alsa-project.org/wiki/AlsaInfo>
>>
>>

Hi,

from reading provided files it seems that you use snd_intel_hda driver, 
it should be possible to git bisect it between 5.9 and 5.10 as it wasn't 
replaced.

Catpt driver is used on machines using DSP.

Amadeusz
