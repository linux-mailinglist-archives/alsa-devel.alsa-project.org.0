Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD2660A86
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 00:59:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C19014C82;
	Sat,  7 Jan 2023 00:58:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C19014C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673049553;
	bh=5YAuWiDjAal/uJrXM9ILONLLrQCsDzm/BE7yygN0SAs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fYySQHEaEnzlVNncDJBbwbpHPEDoiutKVPOKnCD/qyM6O4uGFlk/xLZCZcZIf514U
	 8UQcW/12ZaxKETT5yV6ljnO+sgKHkaOJDsnDQ3umyGoaS+c0uTNC9K6Wu+PT7W0Q6d
	 N4YZyyyOaelX1ejA/ffVwpCKVQCQkBOiQWtbeUb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD8FF800C0;
	Sat,  7 Jan 2023 00:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12CB2F8024E; Sat,  7 Jan 2023 00:57:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DATE_IN_PAST_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1790F80217
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 00:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1790F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ar8+4HJQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673049458; x=1704585458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5YAuWiDjAal/uJrXM9ILONLLrQCsDzm/BE7yygN0SAs=;
 b=ar8+4HJQAKtjzeA0wkJkzxgOpyxwotB2q10TnuF+BGrByGurwpsqgavL
 zJg7duwhMIwOvCriTSwz9KpAo4ldP/TDtnJ9pbzAFblsMElzNTYmQnC4Q
 OTLkn2V1IvD1ITBWIuj92yps0QBQ36JBfqacJBuvV+XGOlwe3ZIk+IZgE
 1W9fGooDbuUcOoorB2J3OAcLUOERCkVHtrF/pKeteI6triusnTvOaIo34
 +WaolAkrQngGxM1hf7hxV58i5TQtiQ857TAtJ5JGCGB26D5ZpbA6cL5aN
 hfYHGPxC9ei7+AlrYYjYP2IWwOjZn+G1OhRtt1dJ6KNCB6v/YbyI8INXa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387047030"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="387047030"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 15:57:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="984817926"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="984817926"
Received: from apbaezbo-mobl2.amr.corp.intel.com (HELO [10.212.60.153])
 ([10.212.60.153])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 15:57:31 -0800
Message-ID: <65820e0e-be8b-c574-98d0-a2e60ee4be76@linux.intel.com>
Date: Fri, 6 Jan 2023 10:09:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 02/14] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-3-quic_wcheng@quicinc.com>
 <5babccd6-9796-7613-cf82-cc859f338448@linux.intel.com>
 <6e13521a-84bf-f8a6-e8cc-5b90ff4bd675@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6e13521a-84bf-f8a6-e8cc-5b90ff4bd675@quicinc.com>
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


>>> The QC ADSP is able to support USB playback and capture, so that the
>>> main application processor can be placed into lower CPU power modes. 
>>> This
>>> adds the required AFE port configurations and port start command to
>>> start
>>> an audio session.
>>
>> It would be good to clarify what sort of endpoints can be supported. I
>> presume the SOF-synchronous case is handled, but how would you deal with
>> async endpoints with feedback (be it explicit or implicit)?
>>
> 
> Sure, both types of feedback endpoints are expected to be supported by
> the audio DSP, as well as sync eps.  We have the logic there to modify
> the audio sample size accordingly.

did you mean modify samples per USB frame (or uframe), so as to change
the pace at which data is transferred? If yes it'd be the same for Intel.

>>>     static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
>>> +    {"USB Playback", NULL, "USB_RX"},
>>
>> ... but here RX means playback?
>>
>> I am not sure I get the convention on directions and what is actually
>> supported?
>>
> 
> The notation is based on the direction of which the audio data is
> sourced or pushed on to the DSP.  So in playback, the DSP is receiving
> audio data to send, and capture, it is transmitting audio data received.
> (although we do not support capture yet)

ok, it'd be good to add a comment on this convention. Usually RX/TX is
bus-centric.

> 
>>> +struct afe_param_id_usb_cfg {
>>> +/* Minor version used for tracking USB audio device configuration.
>>> + * Supported values: AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
>>> + */
>>> +    u32                  cfg_minor_version;
>>> +/* Sampling rate of the port.
>>> + * Supported values:
>>> + * - AFE_PORT_SAMPLE_RATE_8K
>>> + * - AFE_PORT_SAMPLE_RATE_11025
>>> + * - AFE_PORT_SAMPLE_RATE_12K
>>> + * - AFE_PORT_SAMPLE_RATE_16K
>>> + * - AFE_PORT_SAMPLE_RATE_22050
>>> + * - AFE_PORT_SAMPLE_RATE_24K
>>> + * - AFE_PORT_SAMPLE_RATE_32K
>>> + * - AFE_PORT_SAMPLE_RATE_44P1K
>>> + * - AFE_PORT_SAMPLE_RATE_48K
>>> + * - AFE_PORT_SAMPLE_RATE_96K
>>> + * - AFE_PORT_SAMPLE_RATE_192K
>>> + */
>>> +    u32                  sample_rate;
>>> +/* Bit width of the sample.
>>> + * Supported values: 16, 24
>>> + */
>>> +    u16                  bit_width;
>>> +/* Number of channels.
>>> + * Supported values: 1 and 2
>>
>> that aligns with my feedback on the cover letter, if you connect a
>> device that can support from than 2 channels should the DSP even expose
>> this DSP-optimized path?
>>
> 
> My assumption is that I programmed the DAIs w/ PCM formats supported by
> the DSP, so I think the ASoC core should not allow userspace to choose
> that path if the hw params don't fit/match.

Right, but the point I was trying to make is that if the device can do
more, why create this DSP path at all?

> 
>> Oh and I forgot, what happens if there are multiple audio devices
>> connected, can the DSP deal with all of them? If not, how is this
>> handled?
>>
> 
> This is one topic that we were pretty open ended on.  At least on our
> implementation, only one audio device can be supported at a time.  We
> choose the latest device that was plugged in or discovered by the USB
> SND class driver.

Similar case for Intel. I have to revisit this, I don't recall the details.

>>> +    u32                  dev_token;
>>> +/* endianness of this interface */
>>> +    u32                   endian;
>>
>> Is this a USB concept? I can't recall having seen any parts of the USB
>> audio class spec that the data can be big or little endian?
>>
> 
> No, this is probably just something our audio DSP uses on the AFE
> commands that it receives.

ok.


