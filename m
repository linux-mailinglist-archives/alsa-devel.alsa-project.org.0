Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA6013AAAB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:21:55 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00922E82;
	Tue, 14 Jan 2020 12:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00922E82
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E024F8014D;
	Tue, 14 Jan 2020 12:18:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C9E0F8014E; Tue, 14 Jan 2020 12:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A74CDF800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 12:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74CDF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 03:18:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; d="scan'208";a="397478197"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga005.jf.intel.com with ESMTP; 14 Jan 2020 03:18:32 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200113114054.9716-1-cezary.rojewski@intel.com>
 <f8e6c1b8-5508-fc5e-57ce-fc2c54e23414@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6bf3ef29-aed8-d69d-8bb6-9e81253e5547@intel.com>
Date: Tue, 14 Jan 2020 12:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f8e6c1b8-5508-fc5e-57ce-fc2c54e23414@linux.intel.com>
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

On 2020-01-13 16:30, Pierre-Louis Bossart wrote:
> On 1/13/20 5:40 AM, Cezary Rojewski wrote:
>> With fourth pin added for iDisp for skl_dai, update SOF_SKL_DAI_NUM to
>> account for the change. Without this, dais from the bottom of the list
>> are skipped. In current state that's the case for 'Alt Analog CPU DAI'.
> 
> Can you clarify if you are fixing an issue on TGL - which isn't 
> supported in the mainline? Or fixing an issue with SKL w/ HDaudio support?

This is not strictly connected to TGL but to any platform making use of 
'skl_dai[]' within /sof/intel. Encountered this issue when playing with 
probes - my BEs added at the bottom of the list were omitted during 
component registration. Once debug flags in asoc were enabled, 
root-cause presented itself clearly.

> FWIW, I couldn't make HDaudio codec support work on KBL, with the 
> changes in ASoC core, the HDaudio support is broken with the SKL driver 
> (or depends on an unreleased topology). See traces at:
> 
> https://github.com/thesofproject/linux/pull/1667/commits/ae584cf633f232d9cf828bb599a1b620cd0b4fe0 
> 

We do have working cAVS 1.5 machines (e.g.: SKL, KBL, KBL-R, ABL..) with 
HDA on our end.
Will checkout the existing "vanilla skylake" to filter the least amount 
of changes needed to enable it. However, this can lead to topology 
binary needed to be updated.

Czarek

> 
>>
>> Fixes: ac42b142cd76 ("ASoC: SOF: Intel: hda: Add iDisp4 DAI")
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
