Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C3215A47
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 17:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528FC166E;
	Mon,  6 Jul 2020 17:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528FC166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594047912;
	bh=N3mjiEdu6UpxcD7uc35235j2jeVGa1VI1eAyhWT6Uwk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4ESxNEkIZoTlSn/LehUq4QlD27Z8rKIf3BNupmBNsLhdCMsFmJFi7upLGd50mvpR
	 eeHMb5uJJPiJIhR2e9NuJYWe2Af3x/agRplB5GAyNnaLxe5gxUbKmyFeMhyWsD8hhR
	 xHsERRupWsoKzPUSHWGvl823Htojhq0PCJmkR0ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE7AF8011F;
	Mon,  6 Jul 2020 17:03:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1875DF8015A; Mon,  6 Jul 2020 17:03:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E24F80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 17:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E24F80125
IronPort-SDR: jvgMVA3pVbjhVtV1CNKlWaPk7qPCEgMqRltTCUXbSyNNz1679LmMX+XhAH3uMizdckJSyTFgqp
 +w0QV57425Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="147434763"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="147434763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 08:03:16 -0700
IronPort-SDR: L2Z3VR5sFl9G4jx008pgy5I4rdrzbvcEZVVZuOT1zJtYIDuouKToK++PVl7NF1i3/4++i90Gb7
 TBDYFAOfGVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; d="scan'208";a="313986367"
Received: from aislam-mobl1.amr.corp.intel.com ([10.212.167.133])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 08:03:15 -0700
Subject: Re: [PATCH 3/8] ASoC: samsung: pcm: fix kernel-doc
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, alsa-devel@alsa-project.org
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <CGME20200702165920eucas1p236c3c4c82424ea459ea88ebacf9b8a6e@eucas1p2.samsung.com>
 <20200702165901.164100-4-pierre-louis.bossart@linux.intel.com>
 <d6980967-5def-58c9-39a9-239a5c671f3f@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7b485413-98f1-fb13-2e82-4eeacbfff6dc@linux.intel.com>
Date: Mon, 6 Jul 2020 10:03:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <d6980967-5def-58c9-39a9-239a5c671f3f@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 broonie@kernel.org
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

On 7/3/20 1:47 PM, Sylwester Nawrocki wrote:
> On 02.07.2020 18:58, Pierre-Louis Bossart wrote:
>> Fix W=1 warnings - missing fields in structure
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   sound/soc/samsung/pcm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
>> index a5b1a12b3496..86eefbc89e9e 100644
>> --- a/sound/soc/samsung/pcm.c
>> +++ b/sound/soc/samsung/pcm.c
>> @@ -104,8 +104,13 @@
> 
> Thank you for the patch, I have some suggestions to improve the comments.
> 
>>   /**
>>    * struct s3c_pcm_info - S3C PCM Controller information
>> + * @lock: Spin lock
> 
> @lock: Spin lock to serialize access to the device registers and @idle_clk
> 
>>    * @dev: The parent device passed to use from the probe.
>>    * @regs: The pointer to the device register block.
>> + * @sclk_per_fs: number of sclk per frame sync
>> + * @idleclk: Whether to keep PCMSCLK enabled even when idle(no active xfer)
> 
> How about adding space before the opening parenthesis?
> 
>> + * @pclk: the pclk pointer
> 
> @pclk: the PCLK_PCM (pcm) clock pointer
> 
>> + * @cclk: the clck pointer
> 
> @cclk: the SCLK_AUDIO (audio-bus) clock pointer
> 
>>    * @dma_playback: DMA information for playback channel.
>>    * @dma_capture: DMA information for capture channel.
>>    */
>   
> With above changes feel free to add:
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I wasn't really happy with the lame comments I added for pclk and cclk, 
thanks for suggesting a better wording. Will fix in a v2.

