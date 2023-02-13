Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF1694AFF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 16:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360C61E1;
	Mon, 13 Feb 2023 16:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360C61E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676301837;
	bh=o1K01OkpQ3fIZqS1M8k1+ZQBGAiuytgzdT2n9GoXrQg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0tCr3igG+tmw7nzXY7OYj1B5gD2YvS/KR+F8wLmO3jUnDl4QBEbpjF02HJD424hu
	 Dl8trp5MwijGqGZRvl0mHBXE51/E1vH1cws5T9NK6d96PXKmhGaDHGzm8qJWuDcjtV
	 olLX2VCNXLL89FC7F9eHbqaPalL1tJ/vHAwULEHY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63AB4F804B0;
	Mon, 13 Feb 2023 16:23:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 694A0F804B4; Mon, 13 Feb 2023 16:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A3EFF80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 16:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3EFF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nasez7BM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676301777; x=1707837777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o1K01OkpQ3fIZqS1M8k1+ZQBGAiuytgzdT2n9GoXrQg=;
  b=nasez7BMjPqQm54ilu2rGsvBlY0JuOru9xZldE/eU0P2W04l9gsjUr14
   5UNBOqBv3ZYmfT/2B+JyOdF5cA1469RX8dR4OGbehqXkbwA2suxOf5kaH
   QKvovVUms9MekzegY4kmpo5mFQ8McyZ1epUjjqmu4jXQehGIHkJzjQZBg
   PpUfA9dBPxO98UldmaNyJJTFsQAPozzoF7Tffp+ZyHFUVo14fwa+RnktK
   TCWxyYvSfNcVKYMIfcFD9Sf4cPJCoK279kBv10am1nJwlIqOmbi0IyQM/
   bT99Motbf+KOilHvkqAgyLCwzdr4dLWS9EvRfWMFUwaw4YJwlojqo+sQ3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332220167"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="332220167"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:22:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="737547368"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="737547368"
Received: from eatoledo-mobl.amr.corp.intel.com (HELO [10.212.18.132])
 ([10.212.18.132])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:22:49 -0800
Message-ID: <2c398ffb-6dd8-d43a-f99c-2033519a36be@linux.intel.com>
Date: Mon, 13 Feb 2023 09:22:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 20/22] sound: usb: Prevent starting of audio stream
 if in use
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-21-quic_wcheng@quicinc.com>
 <557f8f76-38f5-5e07-905e-774e03120bd2@linux.intel.com>
 <b26c9e4c-5a9c-a2ff-19a7-78419c6b81df@quicinc.com>
 <b532bf7b-e1fb-3a9d-1b88-02f3159be47d@linux.intel.com>
 <60e42db4-1bbc-beea-d87d-6f93871b70c7@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <60e42db4-1bbc-beea-d87d-6f93871b70c7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M2AFAZW7RWPLGZYD4X5NZJ3VMTULFSNR
X-Message-ID-Hash: M2AFAZW7RWPLGZYD4X5NZJ3VMTULFSNR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2AFAZW7RWPLGZYD4X5NZJ3VMTULFSNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/11/23 03:52, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 2/7/2023 5:29 AM, Pierre-Louis Bossart wrote:
>>
>>
>> On 2/6/23 19:15, Wesley Cheng wrote:
>>> Hi Pierre,
>>>
>>> On 1/26/2023 8:12 AM, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>> On 1/25/23 21:14, Wesley Cheng wrote:
>>>>> With USB audio offloading, an audio session is started from the ASoC
>>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>>> still
>>>>> readily available for use, in case the non-offload path is
>>>>> desired.  In
>>>>> order to prevent the two entities from attempting to use the USB bus,
>>>>> introduce a flag that determines when either paths are in use.
>>>>>
>>>>> If a PCM device is already in use, the check will return an error to
>>>>> userspace notifying that the stream is currently busy.  This ensures
>>>>> that
>>>>> only one path is using the USB substream.
>>>>
>>>> It's good to maintain mutual exclusion, but it's still very hard for an
>>>> application to figure out which card can be used when.
>>>>
>>>> Returning -EBUSY is not super helpful. There should be something like a
>>>> notification or connection status so that routing decisions can be made
>>>> without trial-and-error.
>>>>
>>>
>>> The USB offload driver does have access to the USB substream that is
>>> being utilized/offloaded.  Maybe in addition to this check, we can also
>>> set the PCM runtime state as well (for that particular substream)?  That
>>> way userspace can fetch information about if the stream is busy or not.
>>
>> You're missing the point. When a card is exposed but the PCM devices may
>> or may not be usable (consuming data with no sound rendered or returning
>> an error), it's much better to provide a clear connection status to
>> userspace.
>>
>> Let me give you an example. Intel drivers can expose 3 HDMI/DP PCM
>> devices. Userspace has no idea which one to use, so there's a jack
>> control that tells userspace whether there is a receiver connected so
>> that the audio server can use the relevant PCM device.
>>
>> Audio routing based on trial and error is really problematic, errors can
>> happen but they should be exceptional (e.g. xruns), not a means of
>> driver-userspace communication on the device status.
> 
> Thanks for clarifying.  The example helped me understand a bit more on
> how the potential use of the SND control interface.  Since we're dealing
> with multiple sound cards here (platform sound card (offload) and USB
> SND card (legacy)), what do you think about creating a SND control on
> both the USB backend (platform card) and the USB SND card listing the
> PCM device status?
> 
> That way at least userspace can have the information about which PCM dev
> (USB substream) is available (and not offloaded, or vice versa).  So the
> USB SND control will contain the PCM devices (exposed by the card) and
> if any are offloaded (if so mark them as unavailable).  Likewise, for
> the USB backend, if the legacy path is being used, mark them as
> unavailable for offloading.

We definitively need a control to indicate that a PCM offload device is
available or not.
There's still a very large open with the notion of having separate cards
for the same audio device. Not only would it duplicate the control parts
for e.g. volume control, but it would introduce the need to tag devices
across two cards are being the same physical device.
I still think the least-bad option is to have a single card and an
optional PCM device for offload.
