Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B080E21274F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EBF16DF;
	Thu,  2 Jul 2020 17:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EBF16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593702425;
	bh=ef4IRCrG5LRI+9TTl0mjXUAljJwhIoJuPJ5EJFvehiE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oi4Bity4a4QmrH2MDo7GetC9nkK8GxjXEf4Biy8k6RStQ0Nn16AftciTi5HlewcFl
	 nJZC+4nxOkvCLye3B0aLIzzyHAm2Wh80e9WL7e199OVecmnIxHYmlfVQSgjypH7lt3
	 0+0oWWUf83xqVIs7YFH6bd0LDXcyeJJI2O/z253Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9809CF8027B;
	Thu,  2 Jul 2020 17:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9B63F80252; Thu,  2 Jul 2020 17:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7B6F80247
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7B6F80247
IronPort-SDR: W7txVLkIEn0J/dwR/i4xjyM3/YKKTbvMq4HNsn5Orvo2FYiY3sJXG4SI6oWPBtaaynn851700j
 docXrwVCuoCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="208444085"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="208444085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:04:27 -0700
IronPort-SDR: TPoOZLKWWscAdeq43MEnPjQ/PY0uq4smMb7EGrpSdmGfBg8yH7+mpWHT5LV+B8GJ14TPDVJ+nM
 cMbaa1O7+Y7w==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="425976201"
Received: from pmaziarx-mobl.ger.corp.intel.com (HELO [10.249.153.178])
 ([10.249.153.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:04:25 -0700
Subject: Re: [PATCH alsa-lib 8/8] topology: Make buffer for saving dynamic size
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <1593083026-7501-8-git-send-email-piotrx.maziarz@linux.intel.com>
 <d764d947-ed85-1d66-ed4f-701b30d1e0a7@linux.intel.com>
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Message-ID: <6b738835-3d9d-ae99-0ebb-b8c0215fb4bc@linux.intel.com>
Date: Thu, 2 Jul 2020 17:04:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d764d947-ed85-1d66-ed4f-701b30d1e0a7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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

On 2020-06-25 16:31, Pierre-Louis Bossart wrote:
> 
> 
> On 6/25/20 6:03 AM, Piotr Maziarz wrote:
>> Some fields can exceed size limit, e.g. private data has no size
>> restriction. Therefore it needs to be dynamically increased.
>>
>> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
>> ---
>>   src/topology/save.c | 36 ++++++++++++++++++++++++++++++------
>>   1 file changed, 30 insertions(+), 6 deletions(-)
>>
>> diff --git a/src/topology/save.c b/src/topology/save.c
>> index 4ecf86c..d6ee8b6 100644
>> --- a/src/topology/save.c
>> +++ b/src/topology/save.c
>> @@ -19,22 +19,43 @@
>>   #include "tplg_local.h"
>>   #define SAVE_ALLOC_SHIFT    (13)    /* 8192 bytes */
>> +#define PRINT_BUF_SIZE        (1024)
>> +#define PRINT_BUF_SIZE_MAX    (1024 * 1024)
>>   int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
>>   {
>>       va_list va;
>> -    char buf[1024], *s;
>> -    size_t n, l, t, pl;
>> +    char *buf, *s;
>> +    size_t n, alloc_size = PRINT_BUF_SIZE, l, t, pl;
>> +    int ret = 0;
>> +
>> +    buf = malloc(alloc_size);
>> +    if (!buf)
>> +        return -ENOMEM;
>>       if (pfx == NULL)
>>           pfx = "";
>> +again:
>>       va_start(va, fmt);
>> -    n = vsnprintf(buf, sizeof(buf), fmt, va);
>> +    n = vsnprintf(buf, alloc_size, fmt, va);
>>       va_end(va);
>> -    if (n >= sizeof(buf))
>> -        return -EOVERFLOW;
>> +    if (n >= PRINT_BUF_SIZE_MAX) {
>> +        ret = -EOVERFLOW;
>> +        goto end;
>> +    }
> 
> what this patch does is change the allocation limit from 1KB to 1MB, but 
> the data still has no size restriction. At what point do we decide to 
> throw an error?
> 
If needed size is bigger than PRINT_BUF_SIZE_MAX there will be an error 
thrown so I don't know what should I change here. Or do you mean that 
private data size in binary should be restricted?

