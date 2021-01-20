Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E972FD051
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 13:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544AF181E;
	Wed, 20 Jan 2021 13:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544AF181E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611147468;
	bh=IwYDTbgv7l8gfAq2lBYWWwHBmn5X2suTvokBBEdEnJQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GX0fy3+aUYgmcw1cPQ2GuXYpNlWqwzKfXNoup2Mvmxbze55LbF8NyyjVNhHCqUpZI
	 yzqftxFTdEqTpCYMLEOAyIubprbG94z/CHwTeegDTEEg5+TYUYwlKDKJZjG1yZs34I
	 5JIiRsJw0vn9zVaXyEjz6mikBpPb8hANNKbb/6Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACD0AF8019B;
	Wed, 20 Jan 2021 13:56:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C141DF8016E; Wed, 20 Jan 2021 13:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F6CAF80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 13:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F6CAF80164
IronPort-SDR: 9OaP5ovc31gOqBlRDiWEN9vk+z93IDPdw3MbVp3WqzUCY1R/zsXt6SBkToRy5nP5eWO1U7b+/2
 Li6jCgVTs0bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="178320728"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="178320728"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 04:56:00 -0800
IronPort-SDR: 1v99U5vq/F+smE783HMvfPtX7hpqVEE/qe85bfTe/fYFyjtygxB6VnFGzBowwF7L08pMAbi/dq
 4/apgEH3lvbA==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="384825706"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.157.238])
 ([10.249.157.238])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 04:55:58 -0800
Subject: Re: [PATCH] ASoC: topology: Fix memory corruption in
 soc_tplg_denum_create_values()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <YAf+8QZoOv+ct526@mwanda>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <5d5cce3b-916a-97ba-1c13-7ba5eba9bf38@linux.intel.com>
Date: Wed, 20 Jan 2021 13:55:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YAf+8QZoOv+ct526@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

On 1/20/2021 10:59 AM, Dan Carpenter wrote:
> The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
> so it leads to memory corruption later in the function when the data is
> initialized.
> 
> Fixes: 5aebe7c7f9c2 ("ASoC: topology: fix endianness issues")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis, not from testing.  Obviously we don't
> want memory corruption, so my patch is an improvement.  But I feel like
> a better approach might be to change the type of dvalues[] to u32.  I
> took the less risky approach because I'm not an expert and can't test
> it.  But if someone else can take a look at it, then I'll redo the
> patch.
> 
>   sound/soc/soc-topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 950c45008e24..37a5d73e643b 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -902,7 +902,7 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
>   		return -EINVAL;
>   
>   	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
> -					   sizeof(u32),
> +					   sizeof(*se->dobj.control.dvalues),
>   					   GFP_KERNEL);
>   	if (!se->dobj.control.dvalues)
>   		return -ENOMEM;
> 

Looks good to me. And yes as we store already parsed value, dvalues 
could be changed to u32, but I would still change the sizeof as you did 
above.
