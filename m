Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39268204C
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 01:01:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7117BE78;
	Tue, 31 Jan 2023 01:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7117BE78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675123289;
	bh=NxMa5bJdffBaqxCEjJ47Ei59YQ+ioElnc5bDUaZ3lyo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HIZdn6ZCgtRg3f8kXUALbeVhXhlf6osDQjyE9MGwdFE/wpiCqONiwJd2FE2TGvyjQ
	 WnfmJ+3EgXh911Zc7yMjbxt4feTxEDgxdmNrl+0/5kpAQCn3rshMmSEYyUXwjx2c7W
	 qwBuWAI/crskr6awCbCfCQJAevypFwckTGpZG3xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF0AF800A7;
	Tue, 31 Jan 2023 01:00:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 557CCF80423; Tue, 31 Jan 2023 01:00:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FDBF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 01:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FDBF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D0yzNFM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675123223; x=1706659223;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NxMa5bJdffBaqxCEjJ47Ei59YQ+ioElnc5bDUaZ3lyo=;
 b=D0yzNFM6cAPmcQ0NdgWwHTxlMRnT6dL7JZEDE0ytrTEHLhzeKrKVyeb/
 w+/9R9/gPJQO9amIMG2GGyPjop3cJu8tt7NCgalZ6CDYI1ItE4fLwdzIb
 TwKf4WNzgjWgq86cGbXQ5g5JNbe6r0lunMqSDeUA2M13tiFsqq9O30z1u
 8M1cdgIePc+uqbtKsQmZXsS8YDTq018/ZFca5LcUj6wejmCMuIDtcbToU
 xFBRYBXTO9yaY0xEvKyY0EssYUTOSSlt4OjY3338ZcULC5n3A/kwJpEHd
 8zAK5FCKQoKFFjvHlzTr5kypXVQKv9OVA7aaUlayF2QZJpzhIvoFT3chT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327726700"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="327726700"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 16:00:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="614227900"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="614227900"
Received: from inuber-mobl5.amr.corp.intel.com (HELO [10.212.58.60])
 ([10.212.58.60])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 16:00:15 -0800
Message-ID: <8f827e42-e5d8-1190-b5ae-2f99c71fbeee@linux.intel.com>
Date: Mon, 30 Jan 2023 17:50:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 11/22] ASoC: qcom: Add USB backend ASoC driver for
 Q6
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-12-quic_wcheng@quicinc.com>
 <7f471960-0909-4680-e192-261d1fdfe6d7@linux.intel.com>
 <4a255518-6fbb-122a-ba97-1e995785c35f@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4a255518-6fbb-122a-ba97-1e995785c35f@quicinc.com>
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


>>> +static struct snd_soc_dai_driver q6usb_be_dais[] = {
>>> +    {
>>> +        .playback = {
>>> +            .stream_name = "USB BE RX",
>>> +            .rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
>>> +                SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
>>> +                SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
>>> +                SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
>>> +                SNDRV_PCM_RATE_192000,
>>> +            .formats = SNDRV_PCM_FMTBIT_S16_LE |
>>> SNDRV_PCM_FMTBIT_S16_BE |
>>> +                SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
>>> +                SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
>>> +                SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
>>> +            .channels_min = 1,
>>> +            .channels_max = 2,
>>> +            .rate_max =     192000,
>>> +            .rate_min =    8000,
>>> +        },
>>> +        .id = USB_RX,
>>> +        .name = "USB_RX_BE",
>>> +        .ops = &q6usb_ops,
>>> +    },
>>> +};
>>
>> ... here I see a single DAI, so presumably ONE endpoint can be supported?
>>
> 
> One USB audio device can be supported.
> one AFE port = one USB audio device
> 
>> I didn't see in the rest of the code how a card with multiple endpoint
>> would be rejected, nor how the capabilities are checked?
>>
> 
> Need to take a look at this query a bit more.  Let me try to pass in a
> format that can't be supported by the audio DSP, and see if the formats
> specified in this structure will not allow userspace to start the session.
> 
> When you say a "card with multiple endpoints" are you referring to a USB
> device that exposes multiple data (ISOC let's say) eps for its data
> interface?  I haven't run into a device like that.

A headset will typically only have two isoc endpoints for playback and
capture respectively, but while that's a very large market USB audio is
far from restricted to this configuration. It's not uncommon for the pro
or prosumer market to see devices with multiple input/output
capabilities and run-time mixing on the host.
