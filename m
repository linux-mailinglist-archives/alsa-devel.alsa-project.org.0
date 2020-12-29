Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE92E7263
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 17:45:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A5ED1814;
	Tue, 29 Dec 2020 17:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A5ED1814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609260338;
	bh=zr8+Gf6ff79teNiZmuuRHKBzNI6o9kxvfwUwN9QOFPw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8MvZ7kdWmdswLf4lFrg9gDivxzUo0k/ilqrCuzvNVRCGTLH2a3XQI4JrH56KIEUh
	 Zq0AXjBveEcWUDq2a9TD6hsUvZ3ajbFtYzMwiiWkjsoMDac2divxF2kJxrZR5nZJbX
	 bsDj+yGEO+DAXFknJ2D6I48xlQjZbuCwoFHOmVWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE4DF8020C;
	Tue, 29 Dec 2020 17:44:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCA78F80143; Tue, 29 Dec 2020 17:44:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8C7CF80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 17:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C7CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gsfwEgeW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTGepGZ011369; Tue, 29 Dec 2020 10:43:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=HNEJqDx1uGzTbYnhzcdCDawRhXCn21gHMiqEZZvsCY8=;
 b=gsfwEgeWT3LkvHqnk0uZS2qtdYh1cIYqaL0nel/4FA7afKHFYaJAoujKk5G7qeV3Kc5t
 d1Zk6Sm84/EfkC3a9I6qVWMAANGkH3lPInKBs2VLr5WD0UIV5omMTEvhJ/p1sXMlqXxX
 nxd8VUIHltqYutMxIyTlO/yDuw0wHbyhBcMq1MoBj3ojRX0+NUJMQlHJCCVF8QnADsKT
 zTLwmTMLcPO4eGWIRJ5aiIVvQYMwbszVcxgHHg2R3HBS9Kl17zQJGNG9gd6BxA1ha9sd
 qziGJm1/X0z2RA6zAb7lagFTmrjcmpYcbtZy7D9oyvQUCCzxVmxD0U5DXItHql3q3Be+ HQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs2gy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 10:43:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 16:43:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 16:43:53 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.77])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4972345;
 Tue, 29 Dec 2020 16:43:47 +0000 (UTC)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Hans de Goede
 <hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150635.GP9673@ediswmail.ad.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <938c2a83-8224-60a7-18d2-6a4db6516254@opensource.cirrus.com>
Date: Tue, 29 Dec 2020 16:43:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201229150635.GP9673@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290105
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>
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



On 29/12/2020 15:06, Charles Keepax wrote:
> On Tue, Dec 29, 2020 at 02:57:38PM +0100, Hans de Goede wrote:
>> On 12/29/20 2:06 PM, Charles Keepax wrote:
>>> On Mon, Dec 28, 2020 at 04:28:07PM +0000, Mark Brown wrote:
>>>> On Mon, Dec 28, 2020 at 02:16:04PM +0100, Hans de Goede wrote:
>>>>
>>>>> And more in general AFAIK extcon is sort of deprecated and it is
>>>>> not advised to use it for new code. I would esp. not expect it to
>>>>> be used for new jack-detection code since we already have standard
>>>>> uAPI support for that through sound/core/jack.c .
>>>>
>>>> Has Android been fixed to use the ALSA/input layer interfaces?  That's
>>>> why that code is there, long term the goal was to have ALSA generate
>>>> extcon events too so userspace could fall over to using that.  The basic
>>>> thing at the time was that nobody liked any of the existing interfaces
>>>> (the input layer thing is a total bodge stemming from it having been
>>>> easy to hack in a key for GPIO detection and using ALSA controls means
>>>> having to link against alsa-lib which is an awful faff for system level
>>>> UI stuff) and there were three separate userspace interfaces used by
>>>> different software stacks which needed to be joined together, extcon was
>>>> felt to be a bit more designed and is a superset so that was the
>>>> direction we were heading in.
>>>
>>> Android has been updated to have the option to catch input events
>>> for jack detection now.
>>>
>>> I have always been slightly confused between extcon and the ALSA
>>> jack reporting and have been unsure as to what is the longer term
>>> plan here. I vaguely thought there was a gentle plan to move to
>>> extcon, it is interesting to see Hans basically saying the
>>> opposite that extcon is intended to be paritially deprecated. I
>>> assume you just mean with respect to audio jacks, not other
>>> connector types?
>>
>> No I mean that afaik extcon is being deprecated in general. Extcon
>> is mostly meant for kernel internal use, to allow things like
>> charger-type-detection done by e.g. a fsa micro-usb mux or a
>> Type-C PD controller to be hooked up to the actual charger chip
>> and set the input-current-limit based on this.
>>
> 
> Fascinating thanks for taking the time to write such detailed
> answers. I thought it was mostly intended for user-space usage,
> but I guess I never really thought through that most of this
> stuff you don't really need to know from user-space.
> 
>>> I would agree with Mark though that if extcon exists for external
>>> connectors it seems odd that audio jacks would have their own
>>> special way rather than just using the connector stuff.
>>
>> Well as I said above in me experience the extcon code is (was) mostly
>> meant for kernel internal use. The sysfs API is more of a debugging
>> tool then anything else (IMHO).
>>
>> Also the kernel has support for a lot of sound devices, including
>> many with jack-detection support. Yet a grep for EXTCON_JACK_HEADPHONE
>> over the entire mainline kernel tree shows that only extcon-arizona.c
>> is using it. So given that we have dozens of drivers providing jack
>> functionality through the sound/core/jack.c core and only 1 driver
>> using the extcon interface I believe that the ship on how to export
>> this to userspace has long sailed, since most userspace code will
>> clearly expect the sound/core/jack.c way of doing things to be used.
>>

The majority of customers for these codecs + Linux were building Android
devices. So compatibility with Android was the most important goal. At
the time this code was written Android used a custom kernel subsystem
called "switch" to report jack events. extcon is basically a cleaner
version of "switch" and the advantage is that they are almost identical
so it was easy to port a mainline extcon driver back into an Android
"switch" driver. Android didn't use input events or ALSA jack events so
one of those drivers would be no use to the majority of users of this
codec at that time. And as Android's "switch" was so similar to extcon,
surely Android would just convert to supporting extcon...? The arizona
extcon driver is a legacy of the way Android did jack detection.

>> Arguably we should/could maybe even drop the extcon part of extcon-arizona.c
>> but I did not do that as I did not want to regress existing userspace
>> code which may depend on this (on specific embedded/android devices).
>>
> 
> All reasonable arguments, with Android now supporting input
> events for jacks I guess there would be no need for us to use
> extcon for future devices.
> 
> There is maybe more argument for porting the Arizona code across
> anyways, since for a long time Android didn't properly support extcon
> either. It supported the earlier out of tree switch stuff, extcon
> had a switch compatibility mode, but that didn't actually work I
> think due to android hard coding some sysfs naming or something
> (memory is a little fuzzy on the details was a while ago now).
> 
> I think extcon support was fixed in Android at about the same time
> the support for input events was added. So it might be harmless but
> someone probably needs to go and check the timeline before we go
> changing stuff.
> 
> Thanks,
> Charles
> 
