Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A490241B22
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31371665;
	Tue, 11 Aug 2020 14:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31371665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597149966;
	bh=AgS6py54o7Drbgbaqg5aKP+vVEY1n3QTFFuGbpGBikI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPl0On9oSbIg0uBvATCXjOskg7ZoqEZdXgobZrcjrLa0/TNaskHWMxOClIEIC7Wi2
	 J2yL7nd8MlHYO9gJurmF+xwJqT45CbKCoRe+d8BPlHl1NrEzyEXymphyXRIzA7hqsH
	 j4EskEwxIlGnrp7/qGGgSVKKqUAKNiO4ff3uchL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1996BF80161;
	Tue, 11 Aug 2020 14:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FAD4F8015B; Tue, 11 Aug 2020 14:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F0FF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F0FF800BC
IronPort-SDR: 7QC/tiEVaI+Ca3J5Qv0AEz6LMScPLDfw5WYtAdVYfUbz46NbtZV3ZHItCR0Kb5Vk8Yony7CcPM
 fyMsIxpw24yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="151391948"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="151391948"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:44:10 -0700
IronPort-SDR: Xm7yXlEcLxk7qLCkJK9H2iGg+T2aTTNrj2Ja8etK7nnD6SLuBMuaMbOZ0cUe/V7xePX9U5I1t+
 Wt9xmqk2HAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="317713090"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.31.191])
 ([10.213.31.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 05:44:06 -0700
Subject: Re: [PATCH v2 06/13] ASoC: Intel: catpt: PCM operations
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-7-cezary.rojewski@intel.com>
 <e02fc6e7-20aa-4977-d2a3-a78e3e696df2@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <63853493-bbf4-f9f7-b892-ad1c485a6860@intel.com>
Date: Tue, 11 Aug 2020 14:44:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e02fc6e7-20aa-4977-d2a3-a78e3e696df2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-11 2:17 PM, Amadeusz Sławiński wrote:
> 
> 
> On 8/11/2020 12:00 PM, Cezary Rojewski wrote:
>> DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
>> i.e. all pipelines are already defined within firmware and host is
>> relegated to allocing stream for predefined pins. This is represented by
>> 'catpt_topology' member.
>>
>> Implementation covers all available pin types:
>> - system playback and capture
>> - two offload streams
>> - loopback (reference)
>> - bluetooth playback and capture
>>
>> PCM DAI operations differentiate between those pins as some (mainly
>> offload) are to be handled differently - DSP expects wp updates on each
>> notify_position notification.
>>
>> System playback has no volume control capability as it is routed to
>> mixer stream directly. Other primary streams - capture and two offloads
>> - offer individual volume controls.
>>
>> Compared to sound/soc/intel/haswell this configures SSP device format
>> automatically on pcm creation.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
> 
> ...
> 
>> +
>> +static int catpt_set_ctlvol(struct catpt_dev *cdev, u8 stream_id, 
>> long *ctlvol)
>> +{
>> +    u32 dspvol;
>> +    int ret, i;
>> +
>> +    if (ctlvol[0] == ctlvol[1]) {
> 
> This check seems bit suspicious to me, as CATPT_CHANNELS_MAX is 4 and 
> you only check 2 of possible values here, while in else part, you loop 
> over all possible 4 to set them? So there is chance that ctlvol[0] is 
> equal to ctlvol[1], but ctlvol[2] and ctlvol[3] are different, what 
> happens then?
> 

Check is simplified as majority of configurations make use of stereo 
only. Maybe it shouldn't have been. Will fix in v3.
