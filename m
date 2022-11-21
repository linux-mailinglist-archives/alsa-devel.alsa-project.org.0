Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99130632830
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 16:30:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20FD51663;
	Mon, 21 Nov 2022 16:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20FD51663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669044635;
	bh=hmUeJSPh09Jubfw1IUABE9ly3/pSqqDlpMLqJZKKr5M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uq4aACuhX2QhISZxFMBE1l9w7iAKBWWowLwJnUwSgykZpTAP0SAAAkA4HTvDhaVrX
	 2AI5e1qJO2hw5KfLMv3pdF6cjQd8ji5f8wfMkOByxHVJmTkTw0KSWOvT3BTxpOxBgb
	 UxVnTGr69AvnCr6pXwYg2t3BOTmAuLSs78apRcGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4F9F804AB;
	Mon, 21 Nov 2022 16:29:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EDBDF8028D; Mon, 21 Nov 2022 16:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71874F80115
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 16:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71874F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kGFUn22u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669044575; x=1700580575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hmUeJSPh09Jubfw1IUABE9ly3/pSqqDlpMLqJZKKr5M=;
 b=kGFUn22usAsxgRIHJ30u00ImNAoqIpcsQkkvlXsB9+xzZsd5E8buvEfl
 89+kt6DrGsFtOQou34Cd2BnZC6+D1zAm3Iy791w+BRnEbwln8tK1cU/Bp
 LzH2Z0fGmPtDKkQFdnzxkF5p9Uxbkqfl/cvTRHl7XcKrXn9JfVFa/afyF
 JH4YCJqWzfsFm5/aL2sPMEbE/KDsxqqZdpEICz/GoMmouKWF+XxJ14vGR
 tWx7Zoym6WwdLlWr83gF7aRrVgB4eKEodrwcbGPeIrK/23se4VNsstSNL
 Khovtqz2KK43QIwjRNerlkw3/znGaH3NYYJwU8/hllYWB3J5a5MhTofva w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="312287173"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="312287173"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 07:29:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635214318"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="635214318"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.40])
 ([10.99.241.40])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 07:29:22 -0800
Message-ID: <7b383dde-e391-b4c8-1087-fd6105bfb852@linux.intel.com>
Date: Mon, 21 Nov 2022 16:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Unable to open hostless PCM device after introduction of commit -
 ASoC: Stop dummy from overriding hwparams
Content-Language: en-US
To: Patrick Lai <quic_plai@quicinc.com>, Mark Brown <broonie@kernel.org>
References: <6b152096-608c-1b3c-e1bc-f83149af1198@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <6b152096-608c-1b3c-e1bc-f83149af1198@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 srinivas.kandagatla@linaro.org, vinod.koul@linaro.org,
 quic_rohkumar@quicinc.com
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

On 11/18/2022 6:17 PM, Patrick Lai wrote:
> Hi Amadeusz,
> 
> On the product I am working on, a hostless PCM device is defined for 
> purpose of activating CODEC driver to setup the path inside CODEC. So, 
> CPU DAI and PCM Platform are defined to use dummy dai & DMA supplied by 
> sound/soc/soc-utils.c.
> 
> After upgrading to newer kernel, hostless PCM device failed to open. 
> After doing a bit of digging, the root cause is that dummy_dma_hardware 
> is not set in dummy_dma_open() due to new conditional check logic 
> introduced in this commit - 6c504663ba2ee2abeaf5622e27082819326c1bd4.
> 
> In order to fix problem I am encountering properly without regressing 
> your scenario, I would like to get a better understanding of problem you 
> were addressing. My understanding, from looking through other drivers 
> under sound/soc, is that pcm hardware info is usually set by PCM 
> platform/DMA drivers. For your scenario, do you have other component e.g 
> CPU/CODEC DAI, set PCM hardware definition? I am not sure conditional 
> check logic from 6c504663ba2ee2abeaf5622e27082819326c1bd4 guarantees 
> that other component would be setting pcm hardware info. Appreciate if 
> you can provide more insight to your scenario?
> 
> Thanks
> Patrick

Hi Patrick,

Call path is: ... -> __soc_pcm_open() -> soc_pcm_components_open -> 
snd_soc_component_open -> open callback, where for dummy device open 
callback is dummy_dma_open.

Expanding on the issue in question which was cause of the patch.

With following debug log:
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e12f8244242b..b086ec05da25 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -290,6 +290,8 @@ int snd_soc_component_open(struct snd_soc_component 
*component,
  {
         int ret = 0;

+       pr_err("%s\n", component->name);
+
         if (component->driver->open)
                 ret = component->driver->open(component, substream);

that's what I get in dmesg on one of our test platforms:
[   95.522577] avs_rt274.1-platform
[   95.526019] i2c-INT34C2:00
[   95.528837] snd_soc_core:dpcm_fe_dai_startup:  audio: ASoC: open FE audio
[   95.528849] avs_rt274.1-platform
[   95.532249] snd-soc-dummy
[   95.534989] snd-soc-dummy
[   95.537800] snd_soc_avs:avs_dai_fe_startup: snd_soc_avs 0000:00:1f.3: 
avs_dai_fe_startup fe STARTUP tag 1 str 0000000064defd29

"avs_rt274.1-platform" component is handled in sound/soc/intel/avs/pcm.c 
it calls avs_component_open() which sets hwparams to generic set 
supported by i2s devices in AVS driver.

"i2c-INT34C2:00" is codec driver sound/soc/codecs/rt274.c it does not 
have open callback.

And finally "snd-soc-dummy" which as mentioned above calls 
dummy_dma_open which originally overridden hwparams set in 
avs_component_open() with its own limited ones.

(When topology is loaded it also creates FEs, which further limit 
allowed hwparams, they are a subset of the ones set above).

As mentioned in the patch:
"Alternative approach would be to copy whole dummy handling and rename 
it to "snd-soc-null" or something similar. And remove hwparams 
assignment to make it really do nothing."

However, looking at it again, I would consider the existence of 
dummy_dma_open() to be scope creep. If component is really a dummy one 
it should not affect any other components in any way. And if any drivers 
depends on dummy setting parameters for it, I would consider it 
partially broken. And would say that issue should rather be fixed on 
driver side by making a dedicated component for it instead of using a 
dummy one.

I hope that I cleared up situation a bit.

Thanks,
Amadeusz

