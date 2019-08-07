Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402E7853A0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 21:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0B986F;
	Wed,  7 Aug 2019 21:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0B986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565206324;
	bh=V2uDyZk+sN7nlhv1Vu4yGITgig+yeTR2pJ6T3Qystag=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pw+kqSvmAQqff8zv2Hl0jhMj2n3bc5Sah5JfSQ8AACUjU/vv5JKRRdFl+R1IZksXO
	 oD9PBp9J0q94c3/Uu+WOGbGt/Cm41QaHrvTYnsKC7JHtfM+zAitd/J3kniS9Bel/DA
	 kLdN6sOCdqeTJhEZMatTMnTPpzOcidQk/XbMWOtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2460BF80290;
	Wed,  7 Aug 2019 21:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E62F80290; Wed,  7 Aug 2019 21:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9361F800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 21:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9361F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 12:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="176290614"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.6.17])
 ([10.252.6.17])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 12:30:09 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190807145227.26216-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <07fe0e09-6984-76c9-da7c-a1992e7f7b64@intel.com>
Date: Wed, 7 Aug 2019 21:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807145227.26216-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Jaska Uimonen <jaska.uimonen@intel.com>, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: use set_get_data in
 process load
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

On 2019-08-07 16:52, Pierre-Louis Bossart wrote:
> From: Jaska Uimonen <jaska.uimonen@intel.com>

>   	process = kzalloc(ipc_size, GFP_KERNEL);
> -	if (!process)
> +	if (!process) {
> +		kfree(wdata);
>   		return -ENOMEM;
> +	}
>   
>   	/* configure iir IPC message */
>   	process->comp.hdr.size = ipc_size;
> @@ -1835,7 +1890,9 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
>   	if (ret != 0) {
>   		dev_err(sdev->dev, "error: parse process.cfg tokens failed %d\n",
>   			le32_to_cpu(private->size));
> -		goto err;
> +		kfree(wdata);
> +		kfree(process);
> +		return ret;
>   	}
>   

> @@ -1886,10 +1916,36 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
>   
>   	ret = sof_ipc_tx_message(sdev->ipc, process->comp.hdr.cmd, process,
>   				 ipc_size, r, sizeof(*r));
> -	if (ret >= 0)
> +
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "error: create process failed\n");
> +		kfree(wdata);
> +		kfree(process);
>   		return ret;
> -err:
> -	kfree(process);
> +	}
> +
> +	/* we sent the data in single message so return */
> +	if (ipc_data_size) {
> +		kfree(wdata);
> +		return ret;
> +	}
> +
> +	/* send control data with large message supported method */
> +	for (i = 0; i < widget->num_kcontrols; i++) {
> +		wdata[i].control->readback_offset = 0;
> +		ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, wdata[i].control,
> +						    wdata[i].ipc_cmd,
> +						    wdata[i].ctrl_type,
> +						    wdata[i].control->cmd,
> +						    true);
> +		if (ret != 0) {
> +			dev_err(sdev->dev, "error: send control failed\n");
> +			kfree(process);
> +			break;
> +		}
> +	}
> +
> +	kfree(wdata);
>   	return ret;
>   }

On several occasions you've added individual error paths instead of a 
unified one. Personally I don't find it easier to read and understand 
function's flow at all.

<ifs with goto err>

err:
	kfree(process);
	kfree(wdata);
	return ret;

doesn't look that bad..
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
