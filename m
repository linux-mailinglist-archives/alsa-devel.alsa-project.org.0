Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82882218DBE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B960D15E5;
	Wed,  8 Jul 2020 18:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B960D15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227623;
	bh=AoB6DXtO+RUOBI3dCNGxGiKDaPealoFfoomAYYQDeYg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tg8O6iTljgxq5YvDv1xjzMTKDM0cOLsrSlxDh35owKP8TZuwySdpMfLWNwZCWvzGw
	 GRbHwuTRUGYzBxrk7QsVNXeJ5ZOoaRkjX9YLxg3EOxno61D8hr3k3hgsjuiIpkYajT
	 PdapxThWEG3/xZclBwFD/A9Pkt9RmrcZNfi1HJDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB7C9F8015C;
	Wed,  8 Jul 2020 18:58:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD96BF80115; Wed,  8 Jul 2020 18:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79DA6F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79DA6F80115
IronPort-SDR: J7iFcazbyDtAtCpkib9J/y5YopSxUBNn87SrgAZxqOyt2QdqwNaNQ149qhCLFL3t0njKnaGn68
 JGHSgSMlxC7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="135313526"
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="135313526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 09:58:23 -0700
IronPort-SDR: roGAQ+C7dQ+FJJZSqTi34AQnhgyYC0DtG4s6q1coKI7tPOCpFfdRkjC2CATJp7RkOUcJVllJ5L
 f+1n0hQF6NXA==
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="358162394"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 09:58:23 -0700
Subject: Re: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
 <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
 <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
 <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
 <e6d10009-d01e-d506-1aa3-a915ef42a693@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b0aa1cff-33c9-a44d-b17b-d2e4e42d60f1@linux.intel.com>
Date: Wed, 8 Jul 2020 11:58:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e6d10009-d01e-d506-1aa3-a915ef42a693@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org
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


>> right, but the key point is 'switch between streams'. That means a 
>> more complex/capable implementation that should be advertised as such 
>> to applications. This is not the default behavior assumed initially: 
>> to allow for minimal implementations in memory-constrained devices, we 
>> assumed gapless was supported with a single decoder.
>>
>> Maybe the right way to do this is extend the snd_compr_caps structure:
>>
>> /**
>>   * struct snd_compr_caps - caps descriptor
>>   * @codecs: pointer to array of codecs
>>   * @direction: direction supported. Of type snd_compr_direction
>>   * @min_fragment_size: minimum fragment supported by DSP
>>   * @max_fragment_size: maximum fragment supported by DSP
>>   * @min_fragments: min fragments supported by DSP
>>   * @max_fragments: max fragments supported by DSP
>>   * @num_codecs: number of codecs supported
>>   * @reserved: reserved field
>>   */
>> struct snd_compr_caps {
>>      __u32 num_codecs;
>>      __u32 direction;
>>      __u32 min_fragment_size;
>>      __u32 max_fragment_size;
>>      __u32 min_fragments;
>>      __u32 max_fragments;
>>      __u32 codecs[MAX_NUM_CODECS];
>>      __u32 reserved[11];
>> } __attribute__((packed, aligned(4)));
>>
>>
>> and use a reserved field to provide info on capabilities, and filter 
>> the set_codec_params() addition based this capability - i.e. return 
>> -ENOTSUP in 'traditional' implementations based on a single 
>> 'stream'/decoder instance.

I think this is also what Mark was referring to earlier.

> Sounds good!
> I will give it a go and see how it ends up!

Glad to see this discussion progressing.

We may also want to document the 3 possible ways of supporting gapless 
playback while we are at it:
a) with the existing single decoder assumption
b) with your suggested solution with a switch at the DSP level
c) with 2 streams at the userspace level and a switch/x-fade at the DSP 
level - which may simplify userspace quite a bit and was the initial 
design in a non-Linux OS.
