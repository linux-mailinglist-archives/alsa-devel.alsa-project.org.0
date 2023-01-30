Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD368204F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 01:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9B8E87;
	Tue, 31 Jan 2023 01:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9B8E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675123318;
	bh=WUwUPxlnqbiRmgDhKOibNerjH9tu78jzKFyyYvm0Dns=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ga+lSy55q6SBPsvNgZkZMo2f2Q08xDY3FzGbSzFDEgyryOYEKQFmXozEZAhaKXb6L
	 Xm7MWcNH0+9Hk89bbmLoVwQqbi9K95rakCKwM8g/MnnEk+y9trrK1Ycw2GzUO9lwow
	 7BoNN6bZm9eSDBjxCZL0+/H7Fe9DksgNBSIxaUjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A16C2F80494;
	Tue, 31 Jan 2023 01:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADC2CF8032B; Tue, 31 Jan 2023 01:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3911F80236
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 01:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3911F80236
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MWpLPONR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675123227; x=1706659227;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WUwUPxlnqbiRmgDhKOibNerjH9tu78jzKFyyYvm0Dns=;
 b=MWpLPONROYX358cipgo9KHDR5fRoVozpFNrYm51jOWwAqyasll90WofG
 Mp7oqgQl1jhmqiZc2gJT6IxpHWWRBl9D/XwFhu5zAsSdYmDChSzk1EsJE
 JIV363uTXy5BOR+3RwhbCFv2eJrND7SMes0NCpIdXdNr6VBL2BnUil1Vt
 u4Pc9IHuryGiY3yI3xywbuSIj9OBZR2VZ8CkSb+t9PnreEd0YQw2arg4B
 mQ/WcmjBYNPsUIEucOVjH3qw6rwJMuvicXavgSnsLndrtKr5LR6OrVw/o
 nw/OGRR85ovtcst8dIPz7zFI2fOnie1sx55xqkZJeDcw6kWYqKQXMNDSF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327726722"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="327726722"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 16:00:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="614227920"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="614227920"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 16:00:18 -0800
Message-ID: <ebf8ebed-ef79-bf18-4635-360f916877a6@linux.intel.com>
Date: Mon, 30 Jan 2023 17:59:26 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5dec443d-9894-2d06-1798-c56b8f2e1e5e@quicinc.com>
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



On 1/30/23 16:54, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 1/26/2023 7:38 AM, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/25/23 21:14, Wesley Cheng wrote:
>>> The QC ADSP is able to support USB playback endpoints, so that the main
>>> application processor can be placed into lower CPU power modes.  This
>>> adds
>>> the required AFE port configurations and port start command to start an
>>> audio session.
>>>
>>> Specifically, the QC ADSP can support all potential endpoints that are
>>> exposed by the audio data interface.  This includes, feedback endpoints
>>> (both implicit and explicit) as well as the isochronous (data)
>>> endpoints.
>>> The size of audio samples sent per USB frame (microframe) will be
>>> adjusted
>>> based on information received on the feedback endpoint.
>>
>> I think you meant "support all potential endpoint types"
>>
>> It's likely that some USB devices have more endpoints than what the DSP
>> can handle, no?
>>
> 
> True, as we discussed before, we only handle the endpoints for the audio
> interface.  Other endpoints, such as HID, or control is still handled by
> the main processor.

The number of isoc/audio endpoints can be larger than 1 per direction,
it's not uncommon for a USB device to have multiple connectors on the
front side for instruments, mics, monitor speakers, you name it. Just
google 'motu' or 'rme usb' and you'll see examples of USB devices that
are very different from plain vanilla headsets.

>> And that brings me back to the question: what is a port and the
>> relationship between port/backend/endpoints?
>>
>> Sorry for being picky on terminology, but if I learned something in days
>> in standardization it's that there shouldn't be any ambiguity on
>> concepts, otherwise everyone is lost at some point.
>>
> 
> No worries, I can understand where you're coming from :).  After
> re-reading some of the notations used, I can see where people may be
> confused.
> 
>>
>>>   static struct afe_port_map port_maps[AFE_PORT_MAX] = {
>>> +    [USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
>>>       [HDMI_RX] = { AFE_PORT_ID_MULTICHAN_HDMI_RX, HDMI_RX, 1, 1},
>>>       [SLIMBUS_0_RX] = { AFE_PORT_ID_SLIMBUS_MULTI_CHAN_0_RX,
>>>                   SLIMBUS_0_RX, 1, 1},
>>
>> And if I look here a port seems to be a very specific AFE concept
>> related to interface type? Do we even need to refer to a port in the USB
>> parts?
>>
> 
> Well, this is a design specific to how the Q6 AFE is implemented.  There
> is a concept for an AFE port to be opened.  However, as mentioned
> earlier, the "port" term used in soc-usb should be more for how many USB
> devices can be supported.
> 
> If there was a case the audio DSP would support more than one USB
> device, I believe another AFE port would need to be added.


would the suggested infrastructure work though, even if the DSP could
deal with multiple endpoints on different devices ? You have static
mutexes and ops, can that scale to more than one USB device?
