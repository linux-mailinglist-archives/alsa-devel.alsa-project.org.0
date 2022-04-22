Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56050B964
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 16:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1C617F1;
	Fri, 22 Apr 2022 16:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1C617F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650636141;
	bh=PlsHfpZO6LMPx+kkz3KZX+a9kGVfkwbRuAXqnjt832c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C87Ghv82E4Buy8uxthK3+S3lOAN3ePMtqIRTktso5nFPHElE9x0xLBwyOAB4NES/x
	 eoRcp2+Zjscos5dXlXc2LmpokRem3F47mw/80ba+HB01Que8vrcVAVps5FKU92jPOe
	 DzDAQhrh+kDPvZjvwL01oCbrOJTPIPjoZZTnN5cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7DF3F80134;
	Fri, 22 Apr 2022 16:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D91BDF80245; Fri, 22 Apr 2022 16:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FCE3F800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 16:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCE3F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="amfkg9K7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650636071; x=1682172071;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PlsHfpZO6LMPx+kkz3KZX+a9kGVfkwbRuAXqnjt832c=;
 b=amfkg9K7EjVlg0FpHEEjARtQ4DhzLMOvgq9rWLHQKAKPmMVAG6Z+I8SN
 YhXLvFSa/o9M4lS6x45hVYhCrpZr9SegoLwbAREQjZjZMAYVCxUTcwGQe
 KONw5zfuunszgbA+n/xeQlc194TgJWfi4H5+VfFg/4bUnrEK8LFpeE6pj
 EdUXSbslikGvO5j0an4QvanRCmfR71S9R4FQp0JZNMSsxINBmVsnJZK1U
 Hf8SFOY7L6X57k/5to/s16KbcVqiASwfkc5anxDxdsQmAGWlaq5GB5ETK
 B5uABWmZe7G4zV9Okbsm6IU9iIUtQeiujneFsPuBlYgA2EB5TaMbt7qp/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264456511"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="264456511"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:01:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="806000502"
Received: from jbarbe2x-mobl.amr.corp.intel.com (HELO [10.252.134.44])
 ([10.252.134.44])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:01:04 -0700
Message-ID: <200ad3a6-5f4e-b625-c91c-4b0edc3c4dbf@linux.intel.com>
Date: Fri, 22 Apr 2022 09:01:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: bump SOF_ABI_MINOR
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
 <8de8d416-922f-ee62-0a62-513658edf49f@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8de8d416-922f-ee62-0a62-513658edf49f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 4/22/22 02:38, Amadeusz Sławiński wrote:
> On 4/21/2022 6:26 PM, Pierre-Louis Bossart wrote:
>> Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
>> did not update the SOF_ABI_MINOR, bump to version 20 before new
>> changes are added.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> ---
>>   include/uapi/sound/sof/abi.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
>> index e052653a6e4cc..42227d4cb92c5 100644
>> --- a/include/uapi/sound/sof/abi.h
>> +++ b/include/uapi/sound/sof/abi.h
>> @@ -26,7 +26,7 @@
>>     /* SOF ABI version major, minor and patch numbers */
>>   #define SOF_ABI_MAJOR 3
>> -#define SOF_ABI_MINOR 19
>> +#define SOF_ABI_MINOR 20
>>   #define SOF_ABI_PATCH 1
>>     /* SOF ABI version number. Format within 32bit word is MMmmmppp */
> 
> Seeing as you include hash id in commit message it should probably have Fixes tag, so if someone pulls the other commit they know to also back port this one?

No, there's no need for a Fixes tag and backport, this is not really a functional issue.

I added this patch to make a follow-up addition by Mediatek less confusing, in the initial version it came with two increments of the ABI version because of that earlier miss.

see https://github.com/thesofproject/linux/pull/3353 for details.


