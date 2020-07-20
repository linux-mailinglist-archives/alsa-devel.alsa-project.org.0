Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B69225AE9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 11:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44E91615;
	Mon, 20 Jul 2020 11:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44E91615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595236432;
	bh=n2Srtb3aXiKVmAzEBvFZE888tFwsgdJ+aaDFpXgn0ho=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCgU+NbSKxbH0Bt5aksRilUjjmktPP9VYUAwp+o65e3OJMKXRSrL5JmO2CfuO+mhe
	 7Z1KDU9Iqh2b0ZSsK3KRU1V9N3aRsKma4B/hU8IWfFHDSmuvUO9MRy51FvEuqTHI6S
	 CqG5JbOk2p0rulKmcSLwjhdONnxfOvZznroR+MhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09016F800E0;
	Mon, 20 Jul 2020 11:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B27CF800F5; Mon, 20 Jul 2020 11:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B184F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 11:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B184F800BF
IronPort-SDR: MM14064ENBN0nLYU3k9l/4BiHIGwXW08WNMVbIOebmfVRT0BERCLnQJ3+Kl+swV7nD3IkPJiGq
 ofIMnBnY+SEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="129445404"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="129445404"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 02:11:54 -0700
IronPort-SDR: pgu1xTEsiN9BK2ImwxhixSfL4hoV3HEGEtCY7woIl8RAd5vFr8ZEeHUC+XXMtfc9THbNrAL7sD
 i8GdFOg8f8Sg==
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="431547307"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.147.69])
 ([10.249.147.69])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 02:11:52 -0700
Subject: Re: [PATCH][next] ASoC: Intel: Skylake: Avoid the use of one-element
 array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20200717215500.GA13910@embeddedor>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <25892fe8-2ec4-9105-851b-8a0520756057@linux.intel.com>
Date: Mon, 20 Jul 2020 11:11:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717215500.GA13910@embeddedor>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Looks ok and tests on our side also pass.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

On 7/17/2020 11:55 PM, Gustavo A. R. Silva wrote:
> One-element arrays are being deprecated[1]. Replace the one-element
> array with a simple value type 'u8 reserved'[2], once it seems this
> is just a placeholder for alignment.
> 
> [1] https://github.com/KSPP/linux/issues/79
> [2] https://github.com/KSPP/linux/issues/86
> 
> Tested-by: kernel test robot <lkp@intel.com>
> Link: https://github.com/GustavoARSilva/linux-hardening/blob/master/cii/0-day/skylake-20200717.md
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   sound/soc/intel/skylake/skl-topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index 9889f728752c..5e93ad85e06d 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -97,7 +97,7 @@ struct skl_audio_data_format {
>   	u8 number_of_channels;
>   	u8 valid_bit_depth;
>   	u8 sample_type;
> -	u8 reserved[1];
> +	u8 reserved;
>   } __packed;
>   
>   struct skl_base_cfg {
> 
