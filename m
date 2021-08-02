Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A13DD1B1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 10:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15CB17A1;
	Mon,  2 Aug 2021 10:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15CB17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627891734;
	bh=d+TXwj/L+6iNsdhTeU5LVMqxUls2jQM4JFfvV0lSc6U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2KiEKrClfVikL/6eqUxRzJEzfDmNDweZCVbn8wwp1WYef8BPNje3/mECmOGYHwrW
	 0iam4rf4yJXEzxrNPyT0oW8Hys5Vak+iQbROySESSke19pGAHMUovKEid2QFu0NiUW
	 AttWFKENahNhewGLcTOeecSP3OTc/tB9v0zGldJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 072ABF80268;
	Mon,  2 Aug 2021 10:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 145F1F8025F; Mon,  2 Aug 2021 10:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B980F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 10:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B980F800BF
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="274476646"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="274476646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 01:07:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="509970262"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.13.140])
 ([10.213.13.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 01:07:15 -0700
Subject: Re: [PATCH] ASoC: intel: skylake: Drop superfluous mmap callback
To: Takashi Iwai <tiwai@suse.de>
References: <20210728141930.17740-1-tiwai@suse.de>
 <0157301f-d0c1-a4a6-ad3f-4e4ad01441f6@intel.com>
 <s5hbl6j7jfa.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e7c95cc1-f73b-34c2-e399-03e28f44626f@intel.com>
Date: Mon, 2 Aug 2021 10:07:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <s5hbl6j7jfa.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2021-07-30 8:20 PM, Takashi Iwai wrote:
> On Fri, 30 Jul 2021 15:59:54 +0200,
> Cezary Rojewski wrote:

...

>>
>> Thanks for the input, Takashi.
>> While I welcome the change, have two quick questions:
>>
>> 1) Does this impact hw_support_mmap() and its user behavior? i.e. is
>> there some implicit behavior change that skylake-users may experience
>> along the way?
> 
> hw_support_mmap() must return true for this case as long as you've set
> up the buffer in the right way (either preallocation or managed).

hw_support_mmap() has an 'if' checking substream->ops->mmap. ASoC 
framework won't assign snd_soc_pcm_component_mmap as mmap-ops in 
soc_new_pcm() if component_driver didn't provided custom handler.

This makes me believe function's behavior may change but I might as well 
be missing something here.

>> 2) Since snd_pcm_mmap_data() defaults to snd_pcm_lib_default_mmap()
>> why not update ops assignment - snd_pcm_set_ops() - in such a way that
>> if/else is no longer needed in the former?
> 
> Simply put: when the buffer is allocated via
> snd_pcm_set_managed_buffer*(), you can omit the mmap callback.
> The only case you need the mmap callback is only when a special buffer
> is used or it needs a special way of mmap itself.

Comment of my was more of a suggestion i.e. snd_pcm_mmap_data() has an 
if-statement:

if (substream->ops->mmap)
	err = substream->ops->mmap(substream, area);
else
	err = snd_pcm_lib-default_mmap(substream, area);

I believe this could be replaced by one-liner with snd_pcm_set_ops() 
modified: do the validity check + default assignment there instead.


Czarek
