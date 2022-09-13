Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044B5B6AB9
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 11:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40A41799;
	Tue, 13 Sep 2022 11:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40A41799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663061453;
	bh=3sb/zPnQLNiN+Dfglsp8V4aQoIdIS64koNU4xp9I7zk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDT8dcT54nGfJzrC7khuB52YXBf2L5Ww3FGUIsjfp5pmORR8qB6bDpk3ZfxIVJV3r
	 URmLHsJwp8zruVNsqo0Eiwcp1jsoEPZoRp2uZiLCEi4cjShKRVExjd8tlueJx/aC4+
	 yKLMejJe8GTp95ORuZqMsHTtpT1BfpDTik6MvB20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E70F80154;
	Tue, 13 Sep 2022 11:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A82A7F80224; Tue, 13 Sep 2022 11:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E51B4F801EC;
 Tue, 13 Sep 2022 11:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51B4F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fj9g+idn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D6ssnw011959;
 Tue, 13 Sep 2022 04:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=cxJEoBEl4Vi+BihLQdSoluZlTabtxlkV9KL4mlVwNPw=;
 b=fj9g+idnhP89LHmyMvrW01Ya2ALSSWkYmvh85XH4Z1CS90/NpcOrSY0oXokHG0VPGHV9
 VCLHmWRDY/dgOcjwNSvcUrGd7+pIzAGq2/3oiugXlzfXRFngCRRmp1GSoQZULi64CgNd
 7cxpScDx13uYBy7xrXEt4OY7LJFIN3hKBjZ8fQDI6iRtqh0WYt97LamwSdBN3pruovy5
 FlJv9w+ZQ8MDGRZwkdCq+GwKTPyRsy6/+r9S+Z9mbSvDueK38AgKruVcwEDt5/i8qhl9
 ntxIW2MnzOHa8oejJjXZo3nUow2x/bZS1JLLgCC/TZIVfSA6pC7cg9CMzfLCU3Bykltt MA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jgr01umgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 04:29:40 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 13 Sep
 2022 04:29:38 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Tue, 13 Sep 2022 04:29:38 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 65277468;
 Tue, 13 Sep 2022 09:29:38 +0000 (UTC)
Message-ID: <d0f32ac9-1de3-5047-b01a-04a68934a8a2@opensource.cirrus.com>
Date: Tue, 13 Sep 2022 10:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] soundwire: intel: Don't disable interrupt until
 children are removed
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <daniel.baluta@nxp.com>, <sanyog.r.kale@intel.com>, <broonie@kernel.org>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
 <20220907101402.4685-6-rf@opensource.cirrus.com>
 <c83fb25e-ef59-63e1-4223-648dab9885ea@linux.intel.com>
 <9de21235-c77d-f53f-3426-4a5927f484c9@opensource.cirrus.com>
 <9055c565-8616-8480-ea49-8db1b8707b34@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <9055c565-8616-8480-ea49-8db1b8707b34@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HXhpxVpPyXMEw5PzUMSjeFyU8M-pK2SG
X-Proofpoint-ORIG-GUID: HXhpxVpPyXMEw5PzUMSjeFyU8M-pK2SG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On 12/09/2022 18:12, Pierre-Louis Bossart wrote:
> 
> 
> On 9/12/22 17:36, Richard Fitzgerald wrote:
>> On 12/09/2022 11:53, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 9/7/22 12:14, Richard Fitzgerald wrote:
>>>> The cadence_master code needs the interrupt to complete message
>>>> transfers.
>>>> When the bus driver is being removed child drivers are removed, and
>>>> their
>>>> remove actions might need bus transactions.
>>>>
>>>> Use the sdw_master_ops.remove callback to disable the interrupt handling
>>>> only after the child drivers have been removed.
>>>>
>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>> ---
>>>>    drivers/soundwire/intel.c | 9 ++++++++-
>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
>>>> index 01be62fa6c83..d5e723a9c80b 100644
>>>> --- a/drivers/soundwire/intel.c
>>>> +++ b/drivers/soundwire/intel.c
>>>> @@ -1255,6 +1255,13 @@ static int intel_prop_read(struct sdw_bus *bus)
>>>>        return 0;
>>>>    }
>>>>    +static void intel_bus_remove(struct sdw_bus *bus)
>>>> +{
>>>> +    struct sdw_cdns *cdns = bus_to_cdns(bus);
>>>> +
>>>> +    sdw_cdns_enable_interrupt(cdns, false);
>>>
>>> don't you need to check for any on-going transactions on the bus?
>>>
>>
>> As all the child drivers have removed, I think the only other place that
>> can generate bus transactions is the PING handler but
>> sdw_cdns_enable_interrupt(false) calls cancel_work_sync() to
>> cancel the cdns->work and it sets a flag so that it will not be
>> re-queued.
>>
>>> I wonder if there could be a corner case where there are no child
>>> devices but still a device physically attached to the bus. I am not sure
>>> if the 'no devices left' is a good-enough indication of no activity on
>>> the bus.
>>>
>>
>> As above - yes there could, but sdw_cdns_enable_interrupt(false) will
>> cancel the work and stop it being re-queued.
> 
> Ah yes, I forgot that part, thanks!
> 

... but I have noticed that there is a bug in
sdw_cdns_enable_interrupt(). It doesn't ensure that the
IRQ thread has seen the cdns->interrupt_enabled = false.
I'll add a patch to fix that when I re-push this chain.
