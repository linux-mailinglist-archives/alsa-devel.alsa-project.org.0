Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1FB4DC8A6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 15:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918FE1918;
	Thu, 17 Mar 2022 15:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918FE1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647526867;
	bh=U6rXM0bflcprHQwN2TgyP68VKWMmXe8T0RivNVIeLO4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0J5E+9cvd/k6XttxIIgbsxc5uLEd59IUl+ybZiCgACcdFK1xy4qxe8YQaNFJXXaz
	 dJhiL6NbOZ/XAQcGanFH3AYaNYhxWvz503XirzE6nHTf487Z53Dk7jKAVLRhG3JB4l
	 PkO9ANW4uTyLH5lUW/2qdOVu/iRKdTbDhynYmxeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D240F8014C;
	Thu, 17 Mar 2022 15:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F26C1F80132; Thu, 17 Mar 2022 15:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 075BAF80124;
 Thu, 17 Mar 2022 15:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075BAF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wto7U3OJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647526787; x=1679062787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U6rXM0bflcprHQwN2TgyP68VKWMmXe8T0RivNVIeLO4=;
 b=Wto7U3OJJHYS8sfbUt0Jah/RZWh/yyzlsoret/1FUx/IJFuQb9tVLFML
 qfuCTy78AHa+yZGY2k1yh6xdquNBKK6wF//pmMRg/LeDu24yS9w1ZxbLk
 BVDYsQQ0bpbaidne7b9CRKflWF9CyTcPfocswmhNM+0mTPkUaCh9KSMft
 jnzqX2dvVCjxOow6No3Y835IgJlZv5yOQyjvVO8bVAjjm4KEOHlguKL/8
 kvpaS3wD51AqX9XvB27L8FrCJk6avYsNICqOR5AYvmijNNfegQjCAEuwv
 PV4KDQHzNL21Z32UpqRbosLCjzuTvFjdg8MoROBPEVzDJtoTcpCr3cA8W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="255703773"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="255703773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541385197"
Received: from knavalgu-mobl1.gar.corp.intel.com (HELO [10.251.29.221])
 ([10.251.29.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:19:41 -0700
Message-ID: <1b955086-94d0-d524-4cd4-b177df56f71c@linux.intel.com>
Date: Thu, 17 Mar 2022 08:21:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: topology: Use kmemdup() to replace kzalloc +
 memcpy
Content-Language: en-US
To: Yihao Han <hanyihao@vivo.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220317093841.3414-1-hanyihao@vivo.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220317093841.3414-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kernel@vivo.com
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



On 3/17/22 04:38, Yihao Han wrote:
> fix memdup.cocci warning:
> sound/soc/sof/topology.c:876:19-26: WARNING opportunity for kmemdup
> 
> Generated by: scripts/coccinelle/api/memdup.cocci
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>

Thanks for the patch

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/topology.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 367fbe2d5b31..369693cc6d10 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -873,11 +873,10 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
>   
>   	/* copy the private data */
>   	if (priv_size > 0) {
> -		scontrol->priv = kzalloc(priv_size, GFP_KERNEL);
> +		scontrol->priv = kmemdup(control->priv.data, priv_size, GFP_KERNEL);
>   		if (!scontrol->priv)
>   			return -ENOMEM;
>   
> -		memcpy(scontrol->priv, control->priv.data, priv_size);
>   		scontrol->priv_size = priv_size;
>   	}
>   
