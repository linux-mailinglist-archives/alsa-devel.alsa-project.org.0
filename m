Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6116782B7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 18:16:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4ED8A4A;
	Mon, 23 Jan 2023 18:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4ED8A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674494162;
	bh=Q3vu9XO0gKz6Uxgceu5AtyzyzUc1TW97E45eVBoVQU0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ARHRf8tWtUirZLf704ic8MEgmye8e3fROFN1BdApaQD6aQQu3FN1AymjdM0URtvRY
	 rnFDTBVX80hdcUaSOiXWhgU0xy8QowXtz1RpBUj/6Z/nsIKsRbxDfR9vdM7O5QJ1ZH
	 sF6U3Apz1Lr1kyALnMvGUevVQZnBEj3skWlW2MQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B1C7F804C2;
	Mon, 23 Jan 2023 18:15:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14F5F804A9; Mon, 23 Jan 2023 18:15:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C07EF800FB
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 18:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C07EF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cj9qy9F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674494101; x=1706030101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q3vu9XO0gKz6Uxgceu5AtyzyzUc1TW97E45eVBoVQU0=;
 b=cj9qy9F11cTbMpfsiA/zQm1oLutYWvRd9Js9sq9FT8bs/s+Sa1EET+ow
 NiCiiKp9K2ICMA67G9KoZOGmVHGRxecgDDu2Cd1TD/9oh/FbkEHyigI/W
 CddolEdlfR5eIvyTfMEpSJe3KtlKmtw6GoLLyDKlalb09MpejaR71GZyW
 ChcnuG+vsdnLVv4+0QX47S/iTefwogbx64z582eSO+/JtfvpptvJtN23G
 NbPvCJLmBio6O2UY90rYGFniumnsbq2mo1EnVd1LrnbwNGXuPGmmSDjxI
 jTapsFw5l+nXu4NF899Q1rI3y0Rsq0WyzhUfoZ9kwBjLCFwEGTdp/WHmE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305752531"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="305752531"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:09:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="730347256"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="730347256"
Received: from rgrachek-mobl.amr.corp.intel.com (HELO [10.212.113.123])
 ([10.212.113.123])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:09:08 -0800
Message-ID: <6a5131ee-bce2-968a-8371-10ce7772f449@linux.intel.com>
Date: Mon, 23 Jan 2023 09:44:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: Question about DPCM private_data of soc-compress.c
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87tu0i6j7j.wl-kuninori.morimoto.gx@renesas.com>
 <20230123120134.GW36097@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230123120134.GW36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/23/23 06:01, Charles Keepax wrote:
> On Mon, Jan 23, 2023 at 03:08:49AM +0000, Kuninori Morimoto wrote:
>>
>> Hi ALSA ML
>>
>> I'm not familiar with soc-compress.c, but I think dpcm_capture case don't need "else" ?
>> I think it is same as soc-pcm.c :: soc_new_pcm().
>> I'm happy to post patch if someone acknowledge this question.
>>
>> 	--- soc-compress.c --------
>> 	int snd_soc_new_compress(...)
>> 	{
>> 		...
>> 		if (rtd->dai_link->dynamic) {
>> 			...
>> 			if (rtd->dai_link->dpcm_playback)
>> 				be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
>> -			else if (rtd->dai_link->dpcm_capture)
>> +			if (rtd->dai_link->dpcm_capture)
>> 				be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
>> 			...
>> 		}
>> 		...
>> 	}
>>
>> 	--- soc-pcm.c ---------------
>> 	int soc_new_pcm(...)
>> 	{
>> 		...
>> 		if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
>> 			if (playback)
>> 				pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
>> =>			if (capture)
>> 				pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
>> 			goto out;
>> 		}
>> 		...
>> 	}
>>
> 
> I would certainly agree, pretty sure the else is redundant.

Agree as well on paper, but the two cases are different.

For the soc-pcm.c case, the configuration is for a Back-End (BE). We do
have usages where both .dpcm_playback and .dpcm_capture are set.

In the soc-compress.c case, the configuration is for a Front-End (FE). I
am not sure if there are any FE dailinks with both capture and playback
support or if there are any hidden restrictions?

We'd need to check that this has no impact on platforms with compressed
support - Srinivas and Vinod can you chime in?

At any rate this change would need a Fixes tag

Fixes: d3268a40d4b1 ("ASoC: soc-compress.c: fix NULL dereference")
