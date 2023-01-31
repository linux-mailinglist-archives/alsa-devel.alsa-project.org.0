Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B011F682B04
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 12:00:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017AC1ED;
	Tue, 31 Jan 2023 11:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017AC1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675162819;
	bh=4TWrsVCmBQF5WueRrKzL04oJ1kYYKxMNsRVt+ZKRXnU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XbkS9Fa06vMwl4l4JMSgsojrwenTbFVvaekPe/TWjeaQZ2Z+BUfMmFOtmcz3kEvK8
	 HSYzGTqDLMflQ65X2qjiVPIvxzJ87OMSgWxqQN557TzcXW1R6bnS9oI9RKAWtR1eAh
	 i02SyBO2d7aZLl46bAelkaw5j2eqigIBmk96oE7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FB9F800A7;
	Tue, 31 Jan 2023 11:59:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC9BF804C2; Tue, 31 Jan 2023 11:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4026F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 11:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4026F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KGzHZ0Qv
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UNkO9X023205; Tue, 31 Jan 2023 04:59:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=9boA8iptxDfgoZ9SKfJYw1mGe0Am7bSlHuTzTVyY+jo=;
 b=KGzHZ0QveEWc4xVPiug3sZfUpCZWenFTcxTea28xCPgXWz93vUN2LaZjcOCq4xpUfOTg
 sLXX8WaquewOj51cdZD4F3Q4TUiNl/KAfhxb9GknkfdKqSFCNowjSg9C38AUpKBPI6pl
 CW7i6XEayqfgFT92M1kzXWRrH27ZNJfYAPljZII1s+7W+qSXFqoaKZ1CCBt6hF2lijTM
 1ZZWswmBs73SlJFYEi9SixfO5j+uc4xStMcCTIk2KINPPejuhzTXQfhuRSdTRdcaM7QA
 AvBVnR06gLaC2Qw2lUIo+PZsHttn3WQJTDsoEjhtfRsNT0lrxdg72B+CUFyCiohT+bE1 Ng== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nd10t4wvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 04:59:05 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Tue, 31 Jan
 2023 04:59:03 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Tue, 31 Jan 2023 04:59:03 -0600
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 781942A1;
 Tue, 31 Jan 2023 10:59:03 +0000 (UTC)
Message-ID: <fe70d83a-dc5c-3d5a-1162-dacd2d2c6039@opensource.cirrus.com>
Date: Tue, 31 Jan 2023 10:59:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 6/8] ASoC: cs42l42: Add SoundWire support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-7-sbinding@opensource.cirrus.com>
 <7b61ac00-74af-5816-79bb-39eb208ab738@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <7b61ac00-74af-5816-79bb-39eb208ab738@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IahGeBx8gnw6ykP_wcV0seGFms7MTpRE
X-Proofpoint-ORIG-GUID: IahGeBx8gnw6ykP_wcV0seGFms7MTpRE
X-Proofpoint-Spam-Reason: safe
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/01/2023 16:39, Pierre-Louis Bossart wrote:
> 
> 
> On 1/27/23 10:51, Stefan Binding wrote:
>> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>>
>> This adds support for using CS42L42 as a SoundWire device.
>>
>> SoundWire-specifics are kept separate from the I2S implementation as
>> much as possible, aiming to limit the risk of breaking the I2C+I2S
>> support.
>>
>> There are some important differences in the silicon behaviour between
>> I2S and SoundWire mode that are reflected in the implementation:
>>
>> - ASP (I2S) most not be used in SoundWire mode because the two interfaces
>>    share pins.
>>
>> - The SoundWire capture (record) port only supports 1 channel. It does
>>    not have left-to-right duplication like the ASP.
>>
>> - DP2 can only be prepared if the HP has powered-up. DP1 can only be
>>    prepared if the ADC has powered-up. (This ordering restriction does
>>    not exist for ASPs.) The SoundWire core port-prepare step is
>>    triggered by the DAI-link prepare(). This happens before the
>>    codec DAI prepare() or the DAPM sequence so these cannot be used
>>    to enable HP/ADC. Instead the HP/ADC enable/disable are done during
>>    the port_prep callback.
>>
>> - The SRCs are an integral part of the audio chain but in silicon their
>>    power control is linked to the ASP. There is no equivalent power link
>>    to SoundWire DPs so the driver must take "manual" control of SRC power.
>>
>> - The SoundWire control registers occupy the lower part of the SoundWire
>>    address space so cs42l42 registers are offset by 0x8000 (non-paged) in
>>    SoundWire mode.
>>
>> - Register addresses are 8-bit paged in I2C mode but 16-bit unpaged in
>>    SoundWire.
>>
>> - Special procedures are needed on register read/writes to (a) ensure
>>    that the previous internal bus transaction has completed, and
>>    (b) handle delayed read results, when the read value could not be
>>    returned within the SoundWire read command.
>>
>> There are also some differences in driver implementation between I2S
>> and SoundWire operation:
>>
>> - CS42L42 I2S does not runtime_suspend, but runtime_suspend/resume support
>>    has been added into the driver in SoundWire mode as the most convenient
>>    way to power-up the bus manager and to handle the unattach_request
>>    condition, though the CS42L42 chip does not itself suspend or resume.
>>
>> - Intel SoundWire host controllers have a low-power clock-stop mode that
>>    requires resetting all peripherals when resuming. This means that the
>>    interrupt registers will be reset in between the interrupt being
>>    generated and the interrupt being handled, and since the interrupt
>>    status is debounced, these values may not be accurate immediately,
>>    and may cause spurious unplug events before settling.
>>
>> - As in I2S mode, the PLL is only used while audio is active because
>>    of clocking quirks in the silicon. For SoundWire the cs42l42_pll_config()
>>    is deferred until the DAI prepare(), to allow the cs42l42_bus_config()
>>    callback to set the SCLK.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
>> +static int cs42l42_sdw_dai_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
>> +					  int direction)
>> +{
>> +	if (!sdw_stream)
>> +		return 0;
>> +
>> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
>> +		dai->playback_dma_data = sdw_stream;
>> +	else
>> +		dai->capture_dma_data = sdw_stream;
> 
> This may need to be updated to
> snd_soc_dai_dma_data_set(dai, direction, stream);
> 
> which is being introduced by Morimoto-san
> 
> To avoid dependencies this could be updated later.
> 
We'll do it later. As you say, to avoid dependencies.
I've thought a few times about making a function for this but
couldn't decide what to call it to distinguish from the existing
snd_soc_dai_set_dma_data().
My preference was to create a SoC function that does exactly the same as
cs42l42_sdw_dai_set_sdw_stream() so if that's all you need you can
point your snd_soc_dai_ops directly at it.
