Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322108BC29
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 16:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C931680;
	Tue, 13 Aug 2019 16:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C931680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565708066;
	bh=bp1V1zo4BD5A7+xnUa+Ci4mh2n4DgGeOTKtbwrHoARg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlpztdQ3OGvGcwCkoPVbsoQKfwMgRwT6acfsyjCmqHujNGx6e/ffoPojQkdDDk5ZY
	 Y4hQhf4kxA5hNF6ImpdtSBY3pcwb+pd8djXvWISkQrwdBxvlOTDo+2EGsQXWbMgHop
	 8e1qKBshIzHPRG3GYGgsOKUczzmtkH3yXl81xn8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A536F8026A;
	Tue, 13 Aug 2019 16:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0A4F80273; Tue, 13 Aug 2019 16:52:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54FE4F8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 16:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54FE4F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 07:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="177821802"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 07:52:34 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id 5B0FA580238;
 Tue, 13 Aug 2019 07:52:33 -0700 (PDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>
References: <20190621113116.47525-1-andriy.shevchenko@linux.intel.com>
 <20190813144253.GG30120@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <39ce9fc6-c3e8-e7ed-af1c-6f612b831180@linux.intel.com>
Date: Tue, 13 Aug 2019 09:52:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813144253.GG30120@smile.fi.intel.com>
Content-Language: en-US
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Print constant
 literals from format specifier
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

On 8/13/19 9:42 AM, Andy Shevchenko wrote:
> On Fri, Jun 21, 2019 at 02:31:16PM +0300, Andy Shevchenko wrote:
>> Instead of using two additional "%s" specifiers, put the constant string
>> literals directly to the format specifier.
>>
> 
> Pierre, does it look good to you?

LGTM but Cezary should chime in for changes to the Skylake driver.

> 
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   sound/soc/intel/skylake/skl-sst.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
>> index 13c636dece56..f3e1399450db 100644
>> --- a/sound/soc/intel/skylake/skl-sst.c
>> +++ b/sound/soc/intel/skylake/skl-sst.c
>> @@ -421,8 +421,7 @@ static int skl_load_module(struct sst_dsp *ctx, u16 mod_id, u8 *guid)
>>   	int ret = 0;
>>   	char mod_name[64]; /* guid str = 32 chars + 4 hyphens */
>>   
>> -	snprintf(mod_name, sizeof(mod_name), "%s%pUL%s",
>> -					     "intel/dsp_fw_", guid, ".bin");
>> +	snprintf(mod_name, sizeof(mod_name), "intel/dsp_fw_%pUL.bin", guid);
>>   
>>   	module_entry = skl_module_get_from_id(ctx, mod_id);
>>   	if (module_entry == NULL) {
>> -- 
>> 2.20.1
>>
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
