Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDD63F2F0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 15:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065A61736;
	Thu,  1 Dec 2022 15:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065A61736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669905214;
	bh=k7OhKkdgwWFslS374nApqtCnxV9vaVptKbiGdBkUsuA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gawy3pd6C1z55pGRx+2hwtIQB8obc5kzTnmatlt8zaX2cfIbbG+8gDqQjJIVS2yd1
	 BVh7TZfTVXGpscDtGCfsy/2I97sRRXBjT4jr681YWESFWkcqzM+0RLsd1fZV1KRC5F
	 7Xt7P3PbbTNgyXNXnBUgS9Zy4aqmeLJqu8YKAdkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B00F80162;
	Thu,  1 Dec 2022 15:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668E4F804B1; Thu,  1 Dec 2022 15:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,PRX_BODY_76,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C88F80166
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 15:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C88F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pLmoXcqh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1C03I3004892; Thu, 1 Dec 2022 08:32:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=4Mk0JQC39nSI9XL0sOekd6+AGqV0DLXrES81Z0s62sQ=;
 b=pLmoXcqhyCxMJxanUyStfSB6g7n7sBHeX80/8o12PFTbOUg+w/rrOxdiGETEMfSQ26zK
 6fHdKtOzC0RosOfzRo4CPRI9bbhQ9TSHV4rwVWw5maRgPpS3PT5HJ6oDTkw72QEZ0cde
 t1aPsAFmhzymVRyLcIgkTWXToi02kAV6LfEteWSysrKTdVsg4tQWqWJrrWp7wxCv/w+D
 ttB0R9ecmty/f5YOf116/QJMwHMjVFHWw0N29HhZ5TaGYpVp32GhmacPFT9ZBbZ4g4MC
 GXHrf0S1njJk0MVSX3W1XpGBujjv7RvKvhzeJrnZJ77esdwqOqfve3n1EH1kDoy86+va oQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k2vrkku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 08:32:28 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 08:32:27 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 08:32:27 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3B693B10;
 Thu,  1 Dec 2022 14:32:27 +0000 (UTC)
Message-ID: <34319214-5641-a99c-aea1-4c604a18c7eb@opensource.cirrus.com>
Date: Thu, 1 Dec 2022 14:32:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] soundwire: bus_type: Avoid lockdep assert in
 sdw_drv_probe()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <20221121162453.1834170-1-rf@opensource.cirrus.com>
 <2d207a51-d415-726b-3bc1-8788df2f06fd@linux.intel.com>
 <ea8c3ce8-b625-d70a-07f9-4470aec2cb17@opensource.cirrus.com>
 <0984eae3-438c-b382-6681-cddcc37dd47a@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <0984eae3-438c-b382-6681-cddcc37dd47a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CBOZQJVeqpPcAUAIo_NowHFP5qSws_0O
X-Proofpoint-ORIG-GUID: CBOZQJVeqpPcAUAIo_NowHFP5qSws_0O
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

On 29/11/2022 15:44, Pierre-Louis Bossart wrote:
> 
> 
>>>> Don't hold sdw_dev_lock while calling the peripheral driver
>>>> probe() and remove() callbacks.
>>>>
>>>> Holding sdw_dev_lock around the probe() and remove() calls
>>>> causes a theoretical mutex inversion which lockdep will
>>>> assert on. The peripheral driver probe will probably register
>>>> a soundcard, which will take ALSA and ASoC locks. During
>>>
>>> It's extremely unlikely that a peripheral driver would register a sound
>>> card, this is what machine drivers do.
>>>
>>> Which leads me to the question: is this a real problem?
>>>
>>
>> Yes, try turning on lockdep checking and you will get an assert.
>> During probe the existing code takes sdw_dev_lock and then calls the
>> codec driver probe, so you will get a mutex sequence like:
>>
>> sdw_dev_lock -> controls_rw_sem -> pcm_mutex
>>
>> but in normal operation the ALSA/ASoC code will take its mutexes first
>> and call runtime_resume which then takes the sdw_dev_lock, so you get
>>
>> pcm_mutex -> sdw_dev_lock
>>
>> and lockdep will assert on that opposite ordering.
>> The full assert is at the end of this email.
> 
> Humm, you lost me with the reference to runtime_resume. I don't fully
> understand how it's possible to invoke pm_runtime during probe.
> pm_runtime should only enabled during the codec update_status() which
> can only be done once the probe completes.
> 
> I am fine with the changes that you are suggesting, the introduction of
> the sdw_dev_lock was probably too conservative and it'd be fine to only
> protect what is required.
> 
> However we do have lockdep enabled
> 

I wonder whether this is because the Cirrus devices use full DP prepare,
so there will be a DP prepare interrupt during the attempt to prepare
the dailink. The lockdep assert was when sdw_update_slave_status() tried
to take sdw_dev_lock.

If the Realtek codecs only use Soundwire interrupts for jack detect you
probably won't see a sdw_dev_lock inside a pcm_mutex.
