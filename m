Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11575589A21
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 11:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F7DB851;
	Thu,  4 Aug 2022 11:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F7DB851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659606770;
	bh=1mAFulNWoLFTDJufnr4AN2fWHLLvDVf708xkkVeQJ1E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbg5QgmeDhUPR2/K/Kj2yctWj9SLCbSw+ZYDcQSivkg8D4+oxhd5VMmGM1EUrl+sC
	 CUG6B9CuH3+WI0sb2xrKKvp2Wc7HfNpGLWRB6HKrVqB9G1o3WlZAzcprvjPS1TZDT8
	 DRNGs9BaQKLiHtm0A54EAg6TZQQ06/fvoM0CoGqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0097F80212;
	Thu,  4 Aug 2022 11:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45A0BF8016A; Thu,  4 Aug 2022 11:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D832F8013D;
 Thu,  4 Aug 2022 11:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D832F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FoqAMTey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659606705; x=1691142705;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1mAFulNWoLFTDJufnr4AN2fWHLLvDVf708xkkVeQJ1E=;
 b=FoqAMTeybc+RcLa1+QtsF5whZ04zmyRaYqX+P2DGc1yFLqDTtbX5EuED
 02jm/BxaccmqjgTc/9kz26QcVkUmw4CiT4ExLGaIHDMazySRMUGIW5QwZ
 mGYw3ypTtb942I1W5OXbXccHrsWCiMQKCbvfA/SAmLa+IpGMlSbcgPvQr
 v1x735+5UXEjqOlVIn5p9lyoOC64/UTd8C94kG4+QDRedr0/nvAZDzSyc
 WKqmEOwOMurS/IUGhyPmKk38YGDi1+YyM8G5eUqBuZH3rDXAl+FsHXJ+f
 yHWU7N0UAXdnu9ZDajqu1qRTiu8GQCglq61DCBFyWv7dSZcmGQxf46hwX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="269666605"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="269666605"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:51:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="745405452"
Received: from mpcastil-mobl2.amr.corp.intel.com (HELO [10.249.40.52])
 ([10.249.40.52])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:51:34 -0700
Message-ID: <43ada0d7-f094-7f63-3717-30c64834edd6@linux.intel.com>
Date: Thu, 4 Aug 2022 11:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH resend] ASoC: SOF: ipc3-topology: Fix clang -Wformat
 warning
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Justin Stitt <justinstitt@google.com>
References: <20220803204442.2996580-1-justinstitt@google.com>
 <Yure82N7/4NLEMsW@dev-arch.thelio-3990X>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yure82N7/4NLEMsW@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 8/3/22 15:47, Nathan Chancellor wrote:
> On Wed, Aug 03, 2022 at 01:44:42PM -0700, Justin Stitt wrote:
>> When building with Clang we encounter these warnings:
>> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
>> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
>> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
>>
>> Use correct format specifier `%d` since args are of type int.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/378
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Justin Stitt <justinstitt@google.com>
> 
> Thanks for resending!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>> ---
>> Note: resending with the subject corrected, this patch fixes a build
>> warning that will break the Clang build when CONFIG_WERROR=y.
>>
>> Original patch: https://lore.kernel.org/all/20220721211218.4039288-1-justinstitt@google.com/
>> Reported by Nathan here: https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
>>
>>  sound/soc/sof/ipc3-topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
>> index b2cc046b9f60..65923e7a5976 100644
>> --- a/sound/soc/sof/ipc3-topology.c
>> +++ b/sound/soc/sof/ipc3-topology.c
>> @@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
>>  	}
>>  
>>  	dev_info(scomp->dev,
>> -		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
>> +		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
>>  		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
>>  		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>>  
>> -- 
>> 2.37.1.359.gd136c6c3e2-goog
>>
