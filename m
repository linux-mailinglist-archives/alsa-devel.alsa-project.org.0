Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FA13B15E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 18:52:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A131821;
	Tue, 14 Jan 2020 18:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A131821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579024332;
	bh=Ji9UJLEN6KApxu/eoSOfFx0JfcIRO5ZqPU0FpNtWzC8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLvVChsG0LaESVWiI7RXmZW5cYgVLC8lSij7/LyIHPjRN6hCwYLxH0+uFNFTMoNPq
	 6evoUnDgMwgNbL5SE5UnCANxefM+dSOT95+xY5XAnLly7AYNUFKMmAFs6ddFUtUP90
	 u85yrpkolcVnsRX6NRxF4DtKtAZ+15uouAtNI/Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E76EF80277;
	Tue, 14 Jan 2020 18:48:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76C8DF8014E; Tue, 14 Jan 2020 18:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C239F8014D
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 18:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C239F8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 09:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,319,1574150400"; d="scan'208";a="225285571"
Received: from snathamg-mobl.amr.corp.intel.com (HELO [10.252.136.159])
 ([10.252.136.159])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2020 09:48:26 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200113114054.9716-1-cezary.rojewski@intel.com>
 <f8e6c1b8-5508-fc5e-57ce-fc2c54e23414@linux.intel.com>
 <6bf3ef29-aed8-d69d-8bb6-9e81253e5547@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2870108c-0484-ce5e-f04c-ce353f939e98@linux.intel.com>
Date: Tue, 14 Jan 2020 10:13:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6bf3ef29-aed8-d69d-8bb6-9e81253e5547@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: Fix SKL dai count
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



On 1/14/20 5:18 AM, Cezary Rojewski wrote:
> On 2020-01-13 16:30, Pierre-Louis Bossart wrote:
>> On 1/13/20 5:40 AM, Cezary Rojewski wrote:
>>> With fourth pin added for iDisp for skl_dai, update SOF_SKL_DAI_NUM to
>>> account for the change. Without this, dais from the bottom of the list
>>> are skipped. In current state that's the case for 'Alt Analog CPU DAI'.
>>
>> Can you clarify if you are fixing an issue on TGL - which isn't 
>> supported in the mainline? Or fixing an issue with SKL w/ HDaudio 
>> support?
> 
> This is not strictly connected to TGL but to any platform making use of 
> 'skl_dai[]' within /sof/intel. Encountered this issue when playing with 
> probes - my BEs added at the bottom of the list were omitted during 
> component registration. Once debug flags in asoc were enabled, 
> root-cause presented itself clearly.

ok.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>> FWIW, I couldn't make HDaudio codec support work on KBL, with the 
>> changes in ASoC core, the HDaudio support is broken with the SKL 
>> driver (or depends on an unreleased topology). See traces at:
>>
>> https://github.com/thesofproject/linux/pull/1667/commits/ae584cf633f232d9cf828bb599a1b620cd0b4fe0 
>>
> 
> We do have working cAVS 1.5 machines (e.g.: SKL, KBL, KBL-R, ABL..) with 
> HDA on our end.
> Will checkout the existing "vanilla skylake" to filter the least amount 
> of changes needed to enable it. However, this can lead to topology 
> binary needed to be updated.

yes, that's the problem I faced, and since I don't have a clue how to 
change the topology on SKL I commented out the hard-coded parts in the 
machine driver.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
