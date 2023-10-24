Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DD7D53F3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 16:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3A3193A;
	Tue, 24 Oct 2023 16:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3A3193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698157588;
	bh=WwFLxwlK3z/Xf+xApxGXXQp0naSbrNazBZ+qab2Rats=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gF+I+Eb7ye04Rx/6/iKJUL5R83QS3L2yvd+8hL8pe5kCy0KyucsEKMRWhITRH2EtK
	 +Fl0HvhNFhn71FYodV4w+HtJVCjQXakl9eSU8Mho7pckHwa/VRLibXkr2t1UJN5evD
	 KlH+QT8G9xZZKx3FZ1OkSCaXa21vnygTcOjGc1Yo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8679FF80537; Tue, 24 Oct 2023 16:25:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 479A0F80165;
	Tue, 24 Oct 2023 16:25:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3555F80165; Tue, 24 Oct 2023 16:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16875F80152
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 16:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16875F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fzoBhwkC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698157530; x=1729693530;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WwFLxwlK3z/Xf+xApxGXXQp0naSbrNazBZ+qab2Rats=;
  b=fzoBhwkCNt9Tpk2B99+gtNeS8rBLkZ84b1F7oomNHGzPQTo7LYXB3/Pc
   jvpXagkavZ1VRmuRah7Hm9rzgHfcwM2HH5P4MBzfju1idaA7BGl+d8hPZ
   sbPLqaWvQusI9/6upoSc6prNe+RQgRJRJEF/QTkMdgP7Mb6YrQTSALJUf
   RghiQ8TL9hNO2j0IabK4wO1jfoXXbW8/u/OT79HPhnnpRqVfKESTO4h/X
   kKTC8emwOqAr/w/EhOCSUl4WhmF1GEqCLtqdCFzBq7C+s6e1+xWMufvv0
   eNBtkaXYQtSnghyosTU4s0D7zNJtz6shMjvlukloLdTeoGlfhk1CLhfS4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386873938"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200";
   d="scan'208";a="386873938"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758491622"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200";
   d="scan'208";a="758491622"
Received: from pwali-mobl.amr.corp.intel.com (HELO [10.209.188.4])
 ([10.209.188.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 07:25:24 -0700
Message-ID: <efa9cdd0-4e5b-4b54-a4ea-7ec735224f44@linux.intel.com>
Date: Tue, 24 Oct 2023 08:35:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 34/34] ASoC: usb: Rediscover USB SND devices on USB
 port add
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-35-quic_wcheng@quicinc.com>
 <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
 <6409c486-7393-4352-489c-ecd488597c4c@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6409c486-7393-4352-489c-ecd488597c4c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YZWA5CVZD52A5AM5SDI7W2YY6W4NYSEV
X-Message-ID-Hash: YZWA5CVZD52A5AM5SDI7W2YY6W4NYSEV
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZWA5CVZD52A5AM5SDI7W2YY6W4NYSEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/23/23 16:54, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 10/17/2023 4:11 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/17/23 15:01, Wesley Cheng wrote:
>>> In case the USB backend device has not been initialized/probed, USB SND
>>> device connections can still occur.  When the USB backend is eventually
>>> made available, previous USB SND device connections are not
>>> communicated to
>>> the USB backend.  Call snd_usb_rediscover_devices() to generate the
>>> connect
>>> callbacks for all USB SND devices connected.  This will allow for the
>>> USB
>>> backend to be updated with the current set of devices available.
>>>
>>> The chip array entries are all populated and removed while under the
>>> register_mutex, so going over potential race conditions:
>>>
>>> Thread#1:
>>>    q6usb_component_probe()
>>>      --> snd_soc_usb_add_port()
>>>        --> snd_usb_rediscover_devices()
>>>          --> mutex_lock(register_mutex)
>>>
>>> Thread#2
>>>    --> usb_audio_disconnect()
>>>      --> mutex_lock(register_mutex)
>>>
>>> So either thread#1 or thread#2 will complete first.  If
>>>
>>> Thread#1 completes before thread#2:
>>>    SOC USB will notify DPCM backend of the device connection.  Shortly
>>>    after, once thread#2 runs, we will get a disconnect event for the
>>>    connected device.
>>>
>>> Thread#2 completes before thread#1:
>>>    Then during snd_usb_rediscover_devices() it won't notify of any
>>>    connection for that particular chip index.
>> Looks like you are assuming the regular USB audio stuff is probed first?
>>
>> What if it's not the case? Have you tested with a manual 'blacklist' and
>> "modprobe" sequence long after all the DSP stuff is initialized?
>>
>> It really reminds me of audio+display issues, and the same opens apply
>> IMHO.
> 
> Not necessarily...if the USB audio driver is not probed, then that is
> the same scenario as when there is no USB audio capable device plugged
> in, while the offload path is waiting for the connect event. I think
> this is the standard scenario.
> 
> In the situation where the platform sound card hasn't probed yet and USB
> audio devices are being identified, then that is basically the scenario
> that would be more of an issue, since its USB SND that notifies of the
> connection state (at the time of connect/disconnect).

Not following if this scenario is covered?

> I've tried with building these drivers as modules and probing them at
> different times/sequences, and I haven't seen an issue so far.

The scenario I have in mind is this:

the platform driver is on the deny list, the USB driver detects a
device. When the platform driver probes at a later time (with a manual
modprobe to make delays really long), how would the notification be handled?

Between audio and display, we use the 'drm_audio_component' layer to
model these sort of run-time binding between independent driver stacks.
It's not used here but we need a moral equivalent, don't we?

It would really help if you documented a bit more the dependencies or
timing assumptions, to make sure we have a stable solution to build on.

