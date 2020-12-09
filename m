Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FC2D452E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 16:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648D916BB;
	Wed,  9 Dec 2020 16:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648D916BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607526966;
	bh=bgs0cnwDX4fh0MtcMFM3rlVqpuNBlzhOX6iLXU7bKx4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOTMp2G6bbhBlrXiiNDQI2ewY9ghDLnmKHPpvaZ9OHqUT+DblLwn9bAL9p8m9ICZr
	 reLdnU33jFf98UHUlEBzF/i9PR2dTglNy6JR/S0dusFOEeprVCCR16zRE8cxlFZ8pz
	 dAdqCWDAc3riqkMzgDfoK61dDsAfa3GGZ4hsxskc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D21FF800E1;
	Wed,  9 Dec 2020 16:14:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F27F8020D; Wed,  9 Dec 2020 16:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BIGNUM_EMAILS,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3178AF800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 16:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3178AF800EF
IronPort-SDR: 2gQ8W7D5AdorSafq1QAIPbzv83UKc//Ou9h+1ZIkZsWb1Mri/6W5LpLpdxhUqZBQ2Es+2wOtmQ
 TSqSXX0h+eLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="170581642"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="170581642"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 07:14:23 -0800
IronPort-SDR: ekkyn1leLVdzqegcL2ktRQjEv14N8bEWo+w5WNyXue7cxhCXKV7cAhyXQM3xmh9x4CxhuKw6JD
 TzE8/t2MxYSA==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="408090897"
Received: from ljclardy-mobl1.amr.corp.intel.com (HELO [10.212.205.179])
 ([10.212.205.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 07:14:20 -0800
Subject: Re: [bug report] ASoC: topology: fix endianness issues
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <X9B0eDcKy+9B6kZl@mwanda>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5d0d7992-49fa-21b4-d301-6456a11c13a9@linux.intel.com>
Date: Wed, 9 Dec 2020 08:30:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9B0eDcKy+9B6kZl@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

Thanks Dan for the bug report.

On 12/9/20 12:53 AM, Dan Carpenter wrote:
> [ This bug is way older than your patch but you might know the answer.
>    -dan ]
> 
> Hello Pierre-Louis Bossart,
> 
> The patch 5aebe7c7f9c2: "ASoC: topology: fix endianness issues" from
> Apr 4, 2019, leads to the following static checker warning:
> 
> 	sound/soc/soc-topology.c:903 soc_tplg_denum_create_values()
> 	warn: potential pointer math issue ('se->dobj.control.dvalues' is a 64 bit pointer)
> 
> sound/soc/soc-topology.c
>     887  static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
>     888                                          struct snd_soc_tplg_enum_control *ec)
>     889  {
>     890          int i;
>     891
>     892          if (le32_to_cpu(ec->items) > sizeof(*ec->values))
> 
> The warning is from this line where Smatch starts to think that
> "ec->items" is the number of bytes, but later in the function we treat
> it was the number of elements.
> 
> I do think probably this should be if:
> 
> 		if (le32_to_cpu(ec->items) > ARRAY_SIZE(ec->values))
> 			return -EINVAL;
> 
> The ec->values[] is an array of u32:
> 
> 	__le32 values[SND_SOC_TPLG_NUM_TEXTS * SNDRV_CTL_ELEM_ID_NAME_MAXLEN / 4];
> 
> so this code will return -EINVAL for anything larger than 4.  Changing
> it to ARRAY_SIZE() would raise the limit to 176.

I agree with your analysis, even in the initial code the pattern was

if (ec->items > sizeof(*ec->values))

and that's indeed a clear confusion between number of elements and total 
number of bytes.

Ranjani and Amadeusz are more familiar than me with the topology code, 
let's see if they concur?

> 
>     893                  return -EINVAL;
>     894
>     895          se->dobj.control.dvalues = devm_kzalloc(tplg->dev, le32_to_cpu(ec->items) *
>     896                                             sizeof(u32),
>     897                                             GFP_KERNEL);
>     898          if (!se->dobj.control.dvalues)
>     899                  return -ENOMEM;
>     900
>     901          /* convert from little-endian */
>     902          for (i = 0; i < le32_to_cpu(ec->items); i++) {
>     903                  se->dobj.control.dvalues[i] = le32_to_cpu(ec->values[i]);
>     904          }
>     905
>     906          return 0;
>     907  }
> 
> regards,
> dan carpenter
> 
