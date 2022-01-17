Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732EE49100B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 19:08:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F011925;
	Mon, 17 Jan 2022 19:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F011925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642442891;
	bh=XXFdFLVJY5KBBZp6WHS4dhJVYZEvhL9b7ul4U2y0o8U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AC1PaLbzl9Ww1c3EEYFHIAME+a6oUESuTlM3WmGrapXn41QG+zoKGF1oFdnwHLQI2
	 nJy75d451RSO3r1W5IpCle4tuZXCaJlZQ4mg7+hBv/s+yly0NhOggR206eSKAFd4nN
	 ZAxsTXQ02T387bTHfZatLZ/kNE8zWurDHtcnYTZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40349F80254;
	Mon, 17 Jan 2022 19:07:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F01BF80249; Mon, 17 Jan 2022 19:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD5F9F80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 19:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD5F9F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iMGT3A9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642442821; x=1673978821;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XXFdFLVJY5KBBZp6WHS4dhJVYZEvhL9b7ul4U2y0o8U=;
 b=iMGT3A9JajKCxYkIOhfPA3sA2Zl/L7J+tFpjtAscVzX2SkWjqoLwXxAv
 uDJILUTFOWS0AOBd/g/KmPjtMJEBSJccZG3FgNfRJzN+4Xc7JU9zV5yxb
 zlXjU8WBKoBOWG8iot9VNzM8+nZw6S44SMqgY6h/PcbJXvO99E3lZsvE5
 OGRB53sbV1FmQ2f2o+5FkFsqXp203N3IhapbBHLui3iRBMO6pvnEreZbz
 Rr6WBIQejIKGLmAxpB8v1UMSIvYmNZ8X2YL99P/Yxr/o0B6G5ayySXfan
 Jm9rPqgyiQB1J6Qilvgb7aiLAggXQj0qmeZtMTKFMNVLFFcpkjiZ0Jf7e w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="232030221"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="232030221"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 10:06:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="625260176"
Received: from pthompso-mobl1.amr.corp.intel.com (HELO [10.213.168.97])
 ([10.213.168.97])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 10:06:54 -0800
Subject: Re: [PATCH] ASoC: soc-pcm: use GFP_ATOMIC in
 dpcm_create_debugfs_state()
To: Takashi Iwai <tiwai@suse.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <ed322b8821fa787907c1a4cce879564d1281b69d.1642331884.git.christophe.jaillet@wanadoo.fr>
 <s5hwniy21cl.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bbe18490-fba4-9307-fe5f-b02c00433d07@linux.intel.com>
Date: Mon, 17 Jan 2022 11:11:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <s5hwniy21cl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 1/17/22 2:49 AM, Takashi Iwai wrote:
> On Sun, 16 Jan 2022 12:18:17 +0100,
> Christophe JAILLET wrote:
>>
>> The commit below states that dpcm_be_connect() may be called from atomic
>> context. It changes a GFP_KERNEL into a GFP_ATOMIC to deal with it.
>>
>> Another memory allocation is done in dpcm_create_debugfs_state() which is
>> called by dpcm_be_connect(). Also use GFP_ATOMIC there to be consistent
>> and be compliant with atomic context.
>>
>> Fixes: d8a9c6e1f676 ("ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Not clear to me how dpcm_be_connect() can be called from an atomic context,
>> though. But better safe than sorry.
> 
> I don't think this no longer valid for the very latest code.
> The commit b7898396f4bb dropped the spurious dpcm_lock spinlock, so
> the code path you touched must be always sleepable.
> 
> Similarly, the commit d8a9c6e1f676 can be reverted now.

Can we really revert d8a9c6e1f676?

We did propagate the non-atomic FE property to the BE, but if both FE
and BE are both atomic that constraint would be required, no?


> 
> thanks,
> 
> Takashi
> 
>> ---
>>  sound/soc/soc-pcm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 7abfc48b26ca..1a536a2b9dc3 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -212,7 +212,7 @@ static void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm, int stream)
>>  {
>>  	char *name;
>>  
>> -	name = kasprintf(GFP_KERNEL, "%s:%s", dpcm->be->dai_link->name,
>> +	name = kasprintf(GFP_ATOMIC, "%s:%s", dpcm->be->dai_link->name,
>>  			 stream ? "capture" : "playback");
>>  	if (name) {
>>  		dpcm->debugfs_state = debugfs_create_dir(
>> -- 
>> 2.32.0
>>
