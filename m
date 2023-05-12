Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6ED70076A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB9651E3;
	Fri, 12 May 2023 14:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB9651E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683892957;
	bh=ng03Ghd9voRZ1kwDcUw9+GeFOMdL+OoMA9V0ESA4QyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUH64PbVEeyN+1Wn6GUIYLcEr4QdZ/7Od1Atx4LBjzVuV3VZ4yyXKZlP3XIvNCeuG
	 8wiNVMGLldfF/NUunf0KxMzqnjvk+cXNfs3XLqqXC5dU9fIhLSMh05UKYjgRseXaqk
	 hJiU0SI3CDC8zfVJjCeQwvb1eoBwAUEAxLkFyO6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88283F80549; Fri, 12 May 2023 14:01:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD646F8032D;
	Fri, 12 May 2023 14:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED109F8052E; Fri, 12 May 2023 14:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D10BDF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10BDF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SQYLA50H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683892887; x=1715428887;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ng03Ghd9voRZ1kwDcUw9+GeFOMdL+OoMA9V0ESA4QyU=;
  b=SQYLA50Hw39UlTX4mjqO8zerIZ8BZqcxHeCJXgcWekQDN0pujPNnNdjc
   0sHTRm9HjXw+aY8g3OH7kzETyFNzpOm4B4JMfLPEDiNb+gc09h720PPVh
   O6eN33SYFq2Q9P0iHHTVbdu7gQwr6syRnT50enGcZWT6rZaqg3gvdMuqk
   SxZs5aMdH/THvnvEFj5a7CBAHsPfCNbwC7grAp79yqXJ5yNPv3eccbTi/
   TI2Bc46REQuqHlURKuC4HUlSdrW7OubuYEgYSEMDFhewSVNX6wgVRtgZ7
   8KCKydBkceQUO8+k2/twhC3zfcaS8hUHVQTvDoQXvIiUTKBgbIfqo78g3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416405534"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="416405534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 05:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824336214"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="824336214"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 05:00:56 -0700
Message-ID: <7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
Date: Fri, 12 May 2023 14:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: HDA, power saving and recording
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
 <878rdwjs1s.wl-tiwai@suse.de>
 <cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
 <87jzxe5084.wl-tiwai@suse.de>
 <41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
 <87ilcxaj3u.wl-tiwai@suse.de> <87fs81ainl.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87fs81ainl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RW42IYSV4AWW4YUYK76DFSFYTDIYGO4L
X-Message-ID-Hash: RW42IYSV4AWW4YUYK76DFSFYTDIYGO4L
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RW42IYSV4AWW4YUYK76DFSFYTDIYGO4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/12/2023 1:33 PM, Takashi Iwai wrote:
> On Fri, 12 May 2023 13:23:49 +0200,
> Takashi Iwai wrote:
>>
>> On Thu, 11 May 2023 19:20:17 +0200,
>> Amadeusz Sławiński wrote:
>>>
>>> On 5/11/2023 5:58 PM, Takashi Iwai wrote:
>>>> On Thu, 11 May 2023 17:31:37 +0200,
>>>> Amadeusz Sławiński wrote:
>>>>>
>>>>> On 5/10/2023 2:21 PM, Takashi Iwai wrote:
>>>>>> On Tue, 09 May 2023 12:10:06 +0200,
>>>>>> Amadeusz Sławiński wrote:
>>>>> Then capture stream starts and seems to assume that
>>>>> registers were already set, so it doesn't write them to hw.
>>>>
>>>> ... it seems this didn't happen, and that's the inconsistency.
>>>>
>>>> So the further question is:
>>>> At the point just before you start recording, is the codec in runtime
>>>> suspended?  Or it's running?
>>>>
>>>> If it's runtime-suspended, snd_hda_regmap_sync() must be called from
>>>> alc269_resume() via runtime-resume, and this must write out the
>>>> cached values.  Then the bug can be along with that line.
>>>>
>>>> Or if it's running, it means that the previous check of
>>>> snd_hdac_keep_power_up() was bogus (or racy).
>>>>
>>>
>>> Well, it is in... let's call it semi powered state. When snd_hda_intel
>>> driver is loaded with power_save=X option it sets timeout to X seconds
>>> and problem only happens when I start the stream before those X
>>> seconds pass and it runs first runtime suspend. After it suspends it
>>> then uses standard pm_runtime_resume and works correctly. That's why
>>> the pm_runtime_force_suspend(&codec->core.dev);  mentioned in first
>>> email in thread "fixes" the problem, as it forces it to be instantly
>>> suspended instead of waiting for timeout and then later normal
>>> resume-play/record-suspend flow can be followed.
>>
>> Hm, then maybe it's a bad idea to rely on the usage count there.
>> Even if the usage is 0, the device can be still active, and the update
>> can be missed.
>>
>> How about the patch like below?
> 
> Scratch that, it returns a wrong value.
> A simpler version like below works instead?
> 

Yes it was broken, arecord didn't even start capturing ;)

> 
> Takashi
> 
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -611,10 +611,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
>   int snd_hdac_keep_power_up(struct hdac_device *codec)
>   {
>   	if (!atomic_inc_not_zero(&codec->in_pm)) {
> -		int ret = pm_runtime_get_if_in_use(&codec->dev);
> -		if (!ret)
> +		if (!pm_runtime_active(&codec->dev))
>   			return -1;
> -		if (ret < 0)
> +		if (pm_runtime_get_sync(&codec->dev) < 0)
>   			return 0;
>   	}
>   	return 1;


This one seems to work, as in I'm able to record before first suspend 
hits. However device stays in D0 when no stream is running...
# cat /sys/devices/pci0000\:00/0000\:00\:0e.0/power_state
D0

