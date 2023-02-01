Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B68685DA7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 04:03:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4244482C;
	Wed,  1 Feb 2023 04:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4244482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675220605;
	bh=EJ4JUH5pSDFS8MtjQJnMxa4tle/XV/p3rfbid78+jAw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UZtOQJLgh2W/KTzcUDNGwY0K8UFaJcMMpnxEdlOGKJUZrO01YtLFnrpswOpnR1C99
	 qwRt5ZlSKwB1TbBzfuye1o/8io0+FJ5WQBhgTx8FrbLmJq2nBLd3SQoCV+bgpqJEUY
	 4bzq+0/L2riGBqg+WJjOikFo1MdmKT7fPvK+eEyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC616F80155;
	Wed,  1 Feb 2023 04:02:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D620F80423; Wed,  1 Feb 2023 04:02:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB34F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 04:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB34F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EDiaB56+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675220537; x=1706756537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EJ4JUH5pSDFS8MtjQJnMxa4tle/XV/p3rfbid78+jAw=;
 b=EDiaB56+Yatxb5anfKixsJCJhsVcnmphZcS+YBEAyYTOCUn//50EoJes
 Umwa/3TYsQD06VE+VM7OYhjuNHLldgeFDe1QGF4NZ/s+9EoOtF7r88JNC
 w0YgRyUdArUkOuzZn3M00wxWVafre4IPp2XO10cO85IW0UKkths4gz5Ek
 xeq/ct+AOqokQm0OK3ufNgCiv6vJ6rvNGPdjP/hwL6GrIcCrs2MrO8iJi
 8FroxIT9InWIYTD0OhG2pgSicT/BxqCr/h+/vTN9GhkdcN6UzXWO0L2aq
 O0eHd/WNL2Sb/T4Cd7MRQUrVdUo5YHjW5xW4iZVyFJm2aETO/qIaQHrVe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311649054"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="311649054"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 19:02:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664724627"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="664724627"
Received: from ncollins-mobl.amr.corp.intel.com (HELO [10.212.85.244])
 ([10.212.85.244])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 19:02:10 -0800
Message-ID: <de03c6b1-b6d6-0045-ea60-6ae800913e95@linux.intel.com>
Date: Tue, 31 Jan 2023 21:02:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 09/22] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-10-quic_wcheng@quicinc.com>
 <dea77277-6971-fe27-1ae0-ed551e84b6e4@linux.intel.com>
 <5dec443d-9894-2d06-1798-c56b8f2e1e5e@quicinc.com>
 <ebf8ebed-ef79-bf18-4635-360f916877a6@linux.intel.com>
 <fa35124c-682f-8045-6733-c71f9ce8df9e@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fa35124c-682f-8045-6733-c71f9ce8df9e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/31/23 20:40, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 1/30/2023 3:59 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/30/23 16:54, Wesley Cheng wrote:
>>> Hi Pierre,
>>>
>>> On 1/26/2023 7:38 AM, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>> On 1/25/23 21:14, Wesley Cheng wrote:
>>>>> The QC ADSP is able to support USB playback endpoints, so that the
>>>>> main
>>>>> application processor can be placed into lower CPU power modes.  This
>>>>> adds
>>>>> the required AFE port configurations and port start command to
>>>>> start an
>>>>> audio session.
>>>>>
>>>>> Specifically, the QC ADSP can support all potential endpoints that are
>>>>> exposed by the audio data interface.  This includes, feedback
>>>>> endpoints
>>>>> (both implicit and explicit) as well as the isochronous (data)
>>>>> endpoints.
>>>>> The size of audio samples sent per USB frame (microframe) will be
>>>>> adjusted
>>>>> based on information received on the feedback endpoint.
>>>>
>>>> I think you meant "support all potential endpoint types"
>>>>
>>>> It's likely that some USB devices have more endpoints than what the DSP
>>>> can handle, no?
>>>>
>>>
>>> True, as we discussed before, we only handle the endpoints for the audio
>>> interface.  Other endpoints, such as HID, or control is still handled by
>>> the main processor.
>>
>> The number of isoc/audio endpoints can be larger than 1 per direction,
>> it's not uncommon for a USB device to have multiple connectors on the
>> front side for instruments, mics, monitor speakers, you name it. Just
>> google 'motu' or 'rme usb' and you'll see examples of USB devices that
>> are very different from plain vanilla headsets.
>>
> 
> Thanks for the reference.
> 
> I tried to do some research on the RME USB audio devices, and they
> mentioned that they do have a "class compliant mode," which is for
> compatibility w/ Linux hosts.  I didn't see a vendor specific USB SND
> driver matching the USB VID/PID either, so I am assuming that it uses
> the USB SND driver as is.(and that Linux doesn't currently support their
> vendor specific mode)  In that case, the device should conform to the
> UAC2.0 spec (same statement seen on UAC3.0), which states in Section
> 4.9.1 Standard AS Interface Descriptor Table 4-26:
> 
> "4 bNumEndpoints 1 Number Number of endpoints used by this
> interface (excluding endpoint 0). Must be
> either 0 (no data endpoint), 1 (data
> endpoint) or 2 (data and explicit feedback
> endpoint)."
> 
> So each audio streaming interface should only have 1 data and
> potentially 1 feedback.  However, this device does expose a large number
> of channels (I saw up to 18 channels), which the USB backend won't be
> able to support.  I still need to check how ASoC behaves if I pass in a
> profile that the backend can't support.
> 
> Maybe in the non-class compliant/vendor based class driver, they have
> the support for multiple EPs per data interface?  I don't have one of
> these devices on hand, so I can't confirm that.

Look at Figure 3-1 in the UAC2 spec, it shows it's perfectly legal to
have multiple Audio Streaming interfaces - but one Audio Control
interface only.

The fact that there is a restriction to 1 or 2 endpoints per Audio
Streaming interface does not really matter if in the end there are
multiple endpoints and concurrent isoc transfers happening to/from the
same USB device.
