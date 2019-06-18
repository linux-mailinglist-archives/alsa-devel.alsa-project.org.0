Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F249DB7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 11:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB67E16F8;
	Tue, 18 Jun 2019 11:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB67E16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560851187;
	bh=vLxxh/3ldhCNSrxX9d1vwh1I16PO3D7W0+auFbs/69U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6kotMSTvad+gooEw8VOcuo/vIyekL2frd0Tg90cXso7RINYbISnbSCUblIVe2WOT
	 qgTBS/j+YH6RDyV4Ag6R2hHr43gxLKfhDyWcZny6E3BL+bSsA/BQgF/j9aF/xioEnA
	 zXrNLIsz9GsONmFzrNys85zKwpdPXC1WW/4BY+iU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 180D9F89682;
	Tue, 18 Jun 2019 11:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3314F896F4; Tue, 18 Jun 2019 11:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E189F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 11:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E189F89682
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 02:44:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; d="scan'208";a="357798676"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2019 02:44:32 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 31E3958028E;
 Tue, 18 Jun 2019 02:44:30 -0700 (PDT)
To: "Chiang, Mac" <mac.chiang@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1560836926-27055-1-git-send-email-mac.chiang@intel.com>
 <c084b10a-ecb5-19ad-379f-b79e723fe3d5@linux.intel.com>
 <5B37778DAAD9B04DA049B4A421B9B3EE71EB73A9@PGSMSX112.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2cd4888f-7fd8-b177-4ad5-6dc953e5833c@linux.intel.com>
Date: Tue, 18 Jun 2019 11:44:30 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5B37778DAAD9B04DA049B4A421B9B3EE71EB73A9@PGSMSX112.gar.corp.intel.com>
Content-Language: en-US
Cc: "N, Harshapriya" <harshapriya.n@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Zhi, Yong" <yong.zhi@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format
 constraint
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/18/19 10:41 AM, Chiang, Mac wrote:
>> Which platforms is this needed for? IIRC this machine driver is shared with SOF-based solutions - which typically sets DMIC configs with topology - and I'd like to make sure there's no impact.
> Hi Pierre, this is for APL platform.

ok. please don't top-post and copy/paste...

> 
> -----Original Message-----
> From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
> Sent: Tuesday, June 18, 2019 2:56 PM
> To: Chiang, Mac <mac.chiang@intel.com>; alsa-devel@alsa-project.org
> Cc: N, Harshapriya <harshapriya.n@intel.com>; broonie@kernel.org; Zhi, Yong <yong.zhi@intel.com>
> Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format constraint
> 
> On 6/18/19 7:48 AM, mac.chiang@intel.com wrote:
>> From: Mac Chiang <mac.chiang@intel.com>
>>
>> platform dmic recording fixup 16bits
> 
> Which platforms is this needed for? IIRC this machine driver is shared with SOF-based solutions - which typically sets DMIC configs with topology - and I'd like to make sure there's no impact.
> Thanks!
> 
>>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>

This change is only for front-ends that are overridden by SOF, so 
assuming the rest of the Chrome folks are aligned on this:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

>> ---
>>    sound/soc/intel/boards/bxt_da7219_max98357a.c | 3 +++
>>    1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> index 5cadb7f..ac06408 100644
>> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> @@ -330,6 +330,9 @@ static int broxton_dmic_startup(struct snd_pcm_substream *substream)
>>    	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
>>    			&constraints_channels_quad);
>>    
>> +	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
>> +	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
>> +
>>    	return snd_pcm_hw_constraint_list(substream->runtime, 0,
>>    			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
>>    }
>>
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
