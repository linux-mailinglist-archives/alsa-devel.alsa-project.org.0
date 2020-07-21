Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CB228CDB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 01:48:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62441678;
	Wed, 22 Jul 2020 01:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62441678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595375320;
	bh=G9dwiYjk0rVDcfyLezB8ucF72JaHfCIV0t6W+rcM/gU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7Vrl2gNVPngvuwgcbY5EeVT1RBLJJd5YEqiM86j5aTktAp8mfzCZ71Tnh8p57K81
	 XYcKmLQ+yNl8i7VpN6qt/Hg+p6VikxTCLC6ueuBTVmKvEHRyuQYUm/kXkNF7e9ysRT
	 8umyT+YfQwcMX1yj8O9oK00stSGjIWNZt86JsXxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61308F8028C;
	Wed, 22 Jul 2020 01:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB03EF80278; Wed, 22 Jul 2020 01:46:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E68F8024A
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E68F8024A
IronPort-SDR: w/hVm+o6GwEkjmqz77jMiI7rufrfQqZQgQ0i0ER7YDZLVkb2B5BxgatfjYXob5qN1y3HCxPD5A
 0NNrAqXLOmRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151576924"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="151576924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:06 -0700
IronPort-SDR: 0xLtgHHJOzzRc95f2kjcdPpW6Ib8fQaUUy4cYYiK9FUL41OzMeYpNocbp6tYml5MSEvN77aelG
 +X7Ab/L1y5Sg==
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="362539378"
Received: from krlloyd-mobl.amr.corp.intel.com (HELO [10.255.231.6])
 ([10.255.231.6])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:05 -0700
Subject: Re: [PATCH v2 9/9] ASoC: q6asm-dai: add support to copy callback
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
 <20200721165306.29082-10-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e3ad122c-d560-33f6-1bff-ea2b16fe47b5@linux.intel.com>
Date: Tue, 21 Jul 2020 14:54:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721165306.29082-10-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
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



> +static int q6asm_compr_copy(struct snd_soc_component *component,
> +			    struct snd_compr_stream *stream, char __user *buf,
> +			    size_t count)
>   {
>   	struct snd_compr_runtime *runtime = stream->runtime;
>   	struct q6asm_dai_rtd *prtd = runtime->private_data;
>   	unsigned long flags;
> +	u32 wflags = 0;
> +	int avail, bytes_in_flight = 0;
> +	void *dstn;
> +	size_t copy;
> +	u32 app_pointer;
> +	u32 bytes_received;
> +
> +	bytes_received = prtd->bytes_received;
> +
> +	/**

/*

> +	 * Make sure that next track data pointer is aligned at 32 bit boundary
> +	 * This is a Mandatory requirement from DSP data buffers alignment
> +	 */
> +	if (prtd->next_track)
> +		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
> +
> +	app_pointer = bytes_received/prtd->pcm_size;
> +	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
> +	dstn = prtd->dma_buffer.area + app_pointer;
> +
> +	if (count < prtd->pcm_size - app_pointer) {
> +		if (copy_from_user(dstn, buf, count))
> +			return -EFAULT;
> +	} else {
> +		copy = prtd->pcm_size - app_pointer;
> +		if (copy_from_user(dstn, buf, copy))
> +			return -EFAULT;
> +		if (copy_from_user(prtd->dma_buffer.area, buf + copy,
> +				   count - copy))
> +			return -EFAULT;
> +	}

