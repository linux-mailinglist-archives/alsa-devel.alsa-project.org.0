Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8145D9958B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 15:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFB41690;
	Thu, 22 Aug 2019 15:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFB41690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566482104;
	bh=b8+lLB0Hz9FA9p9db3ZlYOM6CL1oFTL0gKIukWKu2xw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vuZaemVNk2zov94W4baupOSJhaAbkeR8UBSRc5LMoWUYc2ewXEf+KgUQkzcedshj8
	 CVBpDWdmG1EgwibgBnVCUhbe7gJpcKd4/ufs1H6orUjmYLb2Wt2BufQAg1KDke0GHj
	 7U6JIm7xI6KvKsPY2xj+1QAGGytex/PRmeEUnw5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6260F8036D;
	Thu, 22 Aug 2019 15:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 688AFF8036E; Thu, 22 Aug 2019 15:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D7E1F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7E1F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 06:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="203417795"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 06:53:09 -0700
Received: from tcwomach-mobl1.amr.corp.intel.com (unknown [10.255.34.51])
 by linux.intel.com (Postfix) with ESMTP id ABF455803A5;
 Thu, 22 Aug 2019 06:53:06 -0700 (PDT)
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
 <20190822071835.GA30262@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f73796d6-fcfa-97c8-69ae-0a183edbbd97@linux.intel.com>
Date: Thu, 22 Aug 2019 08:53:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822071835.GA30262@ubuntu>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 4/5] ASoC: SOF: Intel: hda: add
 SoundWire stream config/free callbacks
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

Thanks for the review Guennadi

>> +static int sdw_config_stream(void *arg, void *s, void *dai,
>> +			     void *params, int link_id, int alh_stream_id)
> 
> I realise, that these function prototypes aren't being introduced by these
> patches, but just wondering whether such overly generic prototype is really
> a good idea here, whether some of those "void *" pointers could be given
> real types. The first one could be "struct device *" etc.

In this case the 'arg' parameter is actually a private 'struct 
snd_sof_dev', as shown below [1]. We probably want to keep this 
relatively opaque, this is a context that doesn't need to be exposed to 
the SoundWire code.

The dai and params are indeed cases where we could use stronger types, 
they are snd_soc_dai and hw_params respectively. I don't recall why the 
existing code is this way, Vinod and Sanyog may have the history of this.

> 
>> +{
>> +	struct snd_sof_dev *sdev = arg;
>> +	struct snd_soc_dai *d = dai;
[1]

>> +	struct sof_ipc_dai_config config;
>> +	struct sof_ipc_reply reply;
>> +	int ret;
>> +	u32 size = sizeof(config);
>> +
>> +	memset(&config, 0, size);
>> +	config.hdr.size = size;
>> +	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
>> +	config.type = SOF_DAI_INTEL_ALH;
>> +	config.dai_index = (link_id << 8) | (d->id);
>> +	config.alh.stream_id = alh_stream_id;
> 
> Entirely up to you, in such cases I usually do something like
> 
> +	struct sof_ipc_dai_config config = {
> +		.type = SOF_DAI_INTEL_ALH,
> +		.hre = {
> +			.size = sizeof(config),
> +			.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG,
> +			...
> 
> which then also avoids a memset(). But that's mostly a matter of personal
> preference, since this is on stack, the compiler would probably internally
> anyway translate the above initialisation to a memset() with all the
> following assignments.

I have no preference, so in this case I will go with consistency with 
existing code, which uses the suggested style for all IPCs.

> 
>> +
>> +	/* send message to DSP */
>> +	ret = sof_ipc_tx_message(sdev->ipc,
>> +				 config.hdr.cmd, &config, size, &reply,
>> +				 sizeof(reply));
>> +	if (ret < 0) {
>> +		dev_err(sdev->dev,
>> +			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",
> 
> Are readers really expected to understand what "dai->id" means? Wouldn't
> "DAI ID" be friendlier, although I understand you - who might not know
> what "x->y" stands for?.. ;-)

I was trying to avoid a confusion here, we have config->dai_index which 
are shared concepts between topology and firmware, and dai->id which is 
shared between topology and machine driver (which refers to the dai in 
the dai_link which has its own .id). In topology files we have the three 
indices and of course after a couple of weeks I can't recall which one 
maps to what.
I am afraid DAI ID might be confused with dai_index. If there are 
suggestions on this I am all ears, all I care about is avoiding 
ambiguity and having to ask Ranjani what index this really is :-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
