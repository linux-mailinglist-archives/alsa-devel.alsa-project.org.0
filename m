Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0065A25F8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 12:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAD9167D;
	Fri, 26 Aug 2022 12:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAD9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661510391;
	bh=H1cVUBqgQOWtZSouq0La2ZdaTI6Covub52f5/uPBPdI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anM6LRldTA9H6q1E4/EHKi7FeKOVZ8dvf9OK3EjizML/Yd+/d0CeVo5AmgM2lC9H+
	 CPusIml7NHHHFK93EG/BWzgkbFeoEx5+iEE1pBTTyvyG3UsWGvqJBF9X6F7n6PGiv+
	 FuWWMTRj+oPuTea0gjgAn9L/6enmsnrfyif6vwjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA3AF8032D;
	Fri, 26 Aug 2022 12:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EF95F80238; Fri, 26 Aug 2022 12:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11CD8F80134
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 12:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11CD8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UezQeAzY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q5lZX1011210;
 Fri, 26 Aug 2022 05:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=9zVZF1thWOSD6FisJX63cECInLPkR0u5id9iG+QzKBw=;
 b=UezQeAzYx3dfN6ytwKTf2yt7CpZRNq0fDj8Puc0NaEIQVK39ZrHr+YHKcx4nFk93UoKh
 luzSzV12gN6erXJSeM06zoSFCGTHyBCdUVCimfdhp0s0xbcqsVXmLPNQdleNJsIcQS2D
 m2lEfzaIyV/P6dKi9G6uKbWIYLp7i4vB0l7G3abDYjPv0rLWi72A7wSY80eJdXvcEn6Y
 LF2qJ5BiZdE4nczIqquORXm8MHz/p98MPE9sgaqcH5R41hWZNjj5W6B3kV3Z4NjQjtDG
 hmwczpVldX+f7vSUgvnlAWSrKlacxbK+0wgk/eRvRBdYuIP9bkZO1Fo+KZSc1mvnQ0Yt Ig== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3j4dgmd66s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 05:38:43 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 26 Aug
 2022 05:38:41 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 26 Aug 2022 05:38:41 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 499EB45D;
 Fri, 26 Aug 2022 10:38:41 +0000 (UTC)
Message-ID: <99c0a747-aa76-95ff-ad03-723ff092b85e@opensource.cirrus.com>
Date: Fri, 26 Aug 2022 11:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] soundwire: bus: Fix lost UNATTACH when re-enumerating
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-4-rf@opensource.cirrus.com>
 <adfdf06a-e1a3-e47c-a71f-5e5dccef6fd0@linux.intel.com>
 <e9deb2fb-458a-8136-5ba7-a9e2b0f2d174@opensource.cirrus.com>
In-Reply-To: <e9deb2fb-458a-8136-5ba7-a9e2b0f2d174@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LfwZWuC5RlUl-lfBqz4VAxK5Plm6tf_N
X-Proofpoint-GUID: LfwZWuC5RlUl-lfBqz4VAxK5Plm6tf_N
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On 25/08/2022 16:25, Richard Fitzgerald wrote:
> On 25/08/2022 15:24, Pierre-Louis Bossart wrote:
>> Humm, I am struggling a bit more on this patch.
>>
>> On 8/25/22 14:22, Richard Fitzgerald wrote:
>>> Rearrange sdw_handle_slave_status() so that any peripherals
>>> on device #0 that are given a device ID are reported as
>>> unattached. The ensures that UNATTACH status is not lost.
>>>
>>> Handle unenumerated devices first and update the
>>> sdw_slave_status array to indicate IDs that must have become
>>> UNATTACHED.
>>>
>>> Look for UNATTACHED devices after this so we can pick up
>>> peripherals that were UNATTACHED in the original PING status
>>> and those that were still ATTACHED at the time of the PING but
>>> then reverted to unenumerated and were found by
>>> sdw_program_device_num().
>>
>> Are those two cases really lost completely? It's a bit surprising, I do
>> recall that we added a recheck on the status, see the 'update_status'
>> label in cdns_update_slave_status_work
>>
> 
> Yes they are. We see this happen extremely frequently (like, almost
> every time) when we reset out peripherals after a firmware change.
> 
> I saw that "try again" stuff in cdns_update_slave_status_work() but
> it's not fixing the problem. Maybe because it's looking for devices
> still on #0 but that isn't the problem.
> 
> The cdns_update_slave_status_work() is running in one workqueue thread,
> child drivers in other threads. So for example:
> 
> 1. Child driver #1 resets #1
> 2. PING: #1 has reverted to #0, #2 still ATTACHED
> 3. cdns_update_slave_status() snapshots the status. #2 is ATTACHED
> 4. #1 has gone so mark it UNATTACHED
> 5. Child driver #2 gets some CPU time and reset #2
> 5. PING: #2 has reset, both now on #0 but we are handling the previous
> PING
> 6. sdw_handle_slave_status() - snapshot PING (from step 3) says #2 is
> attached
> 7. Device on #0 so call sdw_program_device_num()
> 8. sdw_program_device_num() loops until no devices on #0, #1 and #2
> are both reprogrammed, return from sdw_handle_slave_status()
> 10. PING: #1 and #2 both attached
> 11. cdns_update_slave_status() -> sdw_handle_slave_status()
> 12. #1 has changed UNATTACHED->ATTACHED, but we never got a PING with
>      #2 unattached so its slave->status==ATTACHED, "it hasn't changed"
>      (wrong!)
> 
> Now, at step 10 the Cadence IP may have accumlated both UNATTACH and
> ATTACH flags, and perhaps it should be smarter about deciding what
> to report if there are multiple states. HOWEVER.... that's the behaviour
> of Cadence IP, other IP may be different so it's probably unwise to
> assume that the IP has "remembered" the UNATTACH state before it was 
> reprogrammed.
> 

After I wrote that I remembered why I rejected that solution. We don't
know what order multiple events happened, so it's not valid to report
a backlogged UNATTACH just becuse it's more "important". It's not
necessarily accurate.

I would worry about this:

Real-world order:

PING: UNATTACH
See device on #0 and program new device ID
PING: ATTACHED

But because of the delay in handling PINGs the software sees:

See device on #0 and program new device ID
PING: UNATTACH
PING: ATTACHED

Giving a false UANATTACH. We know it's unattached if we found it on #0
so setting its state to UNATTACHED ensures our state is accurate.

>> The idea of detecting first devices that become unattached - and later
>> deal with device0 when they re-attach - was based on the fact that
>> synchronization takes time. The absolute minimum is 16 frames per the
>> SoundWire spec.
>>

My expectation was it was to ensure that the slave->dev was marked
UNATTACHED before trying to re-enumerate it. Either way I think it's not
taking into account that we don't know when the workqueue function will
run or how long it will take. There's two chained workqueue functions to
get to the point of handling a PING. So we can't be sure we'll handle a
PING with the device unattaching before we see it on #0.

>> I don't see how testing for the status[0] first in
>> sdw_handle_slave_status() helps, the value is taken at the same time as
>> status[1..11]. If you really want to take the last information, we
>> should re-read the status from a new PING frame.
>>
>>
> 
> The point is to deal with unattached devices second, not first.
> If we do it first we might find some more that are unattached since
> the ping. Moving the unattach check second means we don't have to
> do it twice.
> 

To clarify: the point was that if we check for unattaches first, when
sdw_program_device_num() updates other slaves to UNATTACHED, we would
then have to run the UNATTACHED loop again to deal with those. If we
check for UNATTACHED second, it can pick up all new UNATTACHED in the
one loop. There's no point checking for UNATTACH first since we can't
rely on the old PING showing the unattach before we see that device on
#0.

There is another possible implementation that we only reprogram a device
on #0 if the slave->state == UNATTACHED. I didn't really like that
partly because we're leaving devices on #0 instead of enumerating them,
but also because I worried that it might carry a risk of race
conditions. But if you prefer that option I can try it.
