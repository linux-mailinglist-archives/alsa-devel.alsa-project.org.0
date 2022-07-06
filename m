Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6706568477
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D2016BF;
	Wed,  6 Jul 2022 12:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D2016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657101676;
	bh=v5Jtw8TNJ86g2xK++XtxFf439WA0tQUMSwkUzcPYJD8=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kk81Bu6oXm9XJkImlaPrSzCoHMD2YBUYMqyxi9uJV6H911fh2+1LIpgRfHjRkcK4z
	 OvQsxTcwSYFTx/qdUFFSiYe+aKlJEMtR/FgiHiIzqhlj1zpwYMpMKCMr/kinM1hDqp
	 Aa6WHtbQbilq2msb1z2jXXvKh83+4OSYMrmvFMWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5DB5F804B4;
	Wed,  6 Jul 2022 12:00:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66027F8032B; Wed,  6 Jul 2022 12:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77393F8012A;
 Wed,  6 Jul 2022 12:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77393F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iq+IiRE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657101622; x=1688637622;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=v5Jtw8TNJ86g2xK++XtxFf439WA0tQUMSwkUzcPYJD8=;
 b=iq+IiRE/3EAfpdqkR2Pjp0m7nzU/8eM6iKOLOQELG5bW19dd9zs3MByH
 I4Wzbpbmvxn0qXMxLhAWulVJX2CnSzETZO/enyYvIdsAHyyM0VdLLdJlg
 8KeqOdTFjQjSAImpG01+nxOHEtap/pG5UKdrLTXYgrKbGFAzgie8zwQJf
 ZF/qLrNyLmu7ZVDDjRNG+DObYGEZHkHq+lJiQaWzZmmsNPIp3q5VKI9IX
 8VS7G5DaBJAHan5NA1e5HgtakVFxlVIpKcZDN1nHbsMe1cBwWULDLyyRt
 TDJf3zTrmx/J+ZHmZnTZxX1T+TyHzjcrDFdHtbXzs9ASMtzSU4F7IOSLK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="282452676"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="282452676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:00:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920098852"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 02:59:58 -0700
Message-ID: <61def9b6-b6bf-c2c0-2a75-54d10003c7ca@linux.intel.com>
Date: Wed, 6 Jul 2022 13:00:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
In-Reply-To: <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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



On 06/07/2022 12:05, Péter Ujfalusi wrote:
> 
> 
> On 06/07/2022 10:23, Dan Carpenter wrote:
>> This function tries to return the number of bytes that it was able to
>> copy to the user.  However, because there are multiple calls to
>> copy_to_user() in a row that means the bytes are not necessarily
>> consecutive so it's not useful.  Just return -EFAULT instead.
> 
> The function is copying data from a circular buffer to a use buffer.
> The single copy_to_user() is used when we don't have wrapping, the
> 'double' copy_to_user() is when we wrap, so first copy is from the end
> of the buffer then we copy the data from the start of the buffer to get
> all data.

What I wanted to say is that the original code is correct, this patch
would break the functionality.

> 
>> Fixes: 3dc0d7091778 ("ASoC: SOF: Convert the generic probe support to SOF client")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  sound/soc/sof/sof-client-probes.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
>> index 1f1ea93a7fbf..679bc7d371fc 100644
>> --- a/sound/soc/sof/sof-client-probes.c
>> +++ b/sound/soc/sof/sof-client-probes.c
>> @@ -385,7 +385,6 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>>  	struct snd_compr_runtime *rtd = cstream->runtime;
>>  	unsigned int offset, n;
>>  	void *ptr;
>> -	int ret;
>>  
>>  	if (count > rtd->buffer_size)
>>  		count = rtd->buffer_size;
>> @@ -395,14 +394,15 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>>  	n = rtd->buffer_size - offset;
>>  
>>  	if (count < n) {
>> -		ret = copy_to_user(buf, ptr, count);
>> +		if (copy_to_user(buf, ptr, count))
>> +			return -EFAULT;
>>  	} else {
>> -		ret = copy_to_user(buf, ptr, n);
>> -		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
>> +		if (copy_to_user(buf, ptr, n))
>> +			return -EFAULT;
>> +		if (copy_to_user(buf + n, rtd->dma_area, count - n))
>> +			return -EFAULT;
>>  	}
>>  
>> -	if (ret)
>> -		return count - ret;
>>  	return count;
>>  }
>>  
> 

-- 
Péter
