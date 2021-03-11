Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11970336D75
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 09:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9920B171B;
	Thu, 11 Mar 2021 09:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9920B171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615449656;
	bh=Szg8UW7qwq7gvQgWlO5XR4le4X9qTSUuYr/ZzcN6kpI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMzeZRfyjF1i9KPiBqjTSqhRL29ESZcF2JjPB+YzR3D32G6qXlJAc5pvQ0mB1+ZnQ
	 QS9nT7jFhcm1+5wReo/VAobvMPDVVfEDghWrcXsNC05rnEkQolvbGasTiLjR0muzuY
	 rtn0DD0cFlnz5+iw2vRSEC/GWh55n9AaSJ3Mkum8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87A0F800BF;
	Thu, 11 Mar 2021 08:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8940F80227; Thu, 11 Mar 2021 08:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D3A9F8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 08:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3A9F8015B
IronPort-SDR: s50RPG8pPRS3Ae5T2yC0BSglDYWWxgf6S5GxsDZEF12f2rvM52g4eCCtWyrwYIJtW4okhNo7w6
 wRLrfoGoSv0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="273668873"
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; d="scan'208";a="273668873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 23:59:03 -0800
IronPort-SDR: qbDtCL6QXRic/IwLLzR2J8V5sbdWEIsD85pctovP/O4bsXSjIxuEQm+sCvhyNGg3yvCoIbPvJt
 2uA8Mjb+Po7Q==
X-IronPort-AV: E=Sophos;i="5.81,239,1610438400"; d="scan'208";a="448203759"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.16.216])
 ([10.213.16.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 23:59:00 -0800
Subject: Re: No sound cards detected on Kabylake laptops after upgrade to
 kernel 5.8
To: Chris Chiu <chris.chiu@canonical.com>
References: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
 <dba864a6-1442-1ebc-9de0-8c1511682b70@intel.com>
 <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <4ec526eb-cb2e-e0e3-8f23-6f7a25b9919b@intel.com>
Date: Thu, 11 Mar 2021 08:58:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CABTNMG1bO2AJLY0o58TX2=1QZPnPsZXabtYZA01QyqDS40JORg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On 2021-03-11 6:50 AM, Chris Chiu wrote:
> On Tue, Mar 9, 2021 at 11:29 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>

...

>> Topologies for most common skylake driver configurations:
>> - skl/kbl with i2s rt286
>> - apl/glk with i2s rt298
>> - <any> with hda dsp
>> can be found in alsa-topology-conf [2].
>>
>> Standard, official tool called 'alsatplg' is capable of compiling these
>> into binary form which, after being transferred to /lib/firmware/ may be
>> consumed by the driver during runtime.
>> I have no problem with providing precompiled binaries to linux-firmware,
>> if that's what community wants.

...

> 
> I think the guild [1] is too complicated for normal users to fix the problem.
> Given it's not only the internal microphone being affected, it's no sound
> devices being created at all so no audio functions can work after kernel 5.8.
> 
> Is there any potential problem to built-in the "<any> with hda dsp" precompiled
> binary in linux-firmware?

In general, linux-firmware is not the place to put driver-specific 
configuration files. It'd best to have standard UCM/topology files being 
build and honored during disto image creation.

In regard to the guide, thanks for checking it out. What do you think 
could be improved so that normal user has easier time with it? Feedback 
is much appreciated.

Regards,
Czarek
