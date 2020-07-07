Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637322177F4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001C116C1;
	Tue,  7 Jul 2020 21:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001C116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594150116;
	bh=NCkkHF4yGJ+7ImZr3PdtS+aj4laPMgr9bqloWCFEFI8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9A0Elvknf6kn1rsdIBJyUwCN2uT/kLpF79Ix/i3iuvguA3ZJp3OE7qOu7/atFH48
	 n/U3ADqkzxCbTj5a99e4mBPAnpDtQMJbBmyi645AtM/9Kb9nVobKCi3/mkISLAxmSc
	 5gg52TeUL9Xx8xPPL5O7dcn/oJvlyc7ifDIuW9pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D4B7F8027C;
	Tue,  7 Jul 2020 21:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4CA3F80257; Tue,  7 Jul 2020 21:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2B92F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B92F8011F
IronPort-SDR: HKm3Xh2YCi+GIg73jKUXgjx8rskXgPgVfwBgZrtVZgFp4vpUCBssARK70SsN4VfTetb0XL3v7G
 x1tspihri/PQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146751728"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="146751728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:45 -0700
IronPort-SDR: PJ2Pr9HKoJiDzpm/sNxhX0XcUkS+HhvcTX+0P0ERPRiYihnaaibWyQwnIrx3s0BYd+UwH1DFjt
 row3O05nQZsA==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="297493428"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO [10.254.77.62])
 ([10.254.77.62])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:44 -0700
Subject: Re: [PATCH 03/11] ASoC: q6asm: make commands specific to streams
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ff595b4-1093-36c8-f27f-f097e24657a0@linux.intel.com>
Date: Tue, 7 Jul 2020 11:52:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707163641.17113-4-srinivas.kandagatla@linaro.org>
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




> @@ -184,8 +186,8 @@ static void event_handler(uint32_t opcode, uint32_t token,
>   	switch (opcode) {
>   	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			q6asm_write_async(prtd->audio_client,
> -				   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
> +			q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +				   prtd->pcm_count, 0, 0, 0);

sound/soc/qcom/qdsp6/q6asm.h:#define NO_TIMESTAMP    0xFF00

is the change on the previous line intentional?

>   		break;
>   	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
>   		prtd->state = Q6ASM_STREAM_STOPPED;
> @@ -194,8 +196,8 @@ static void event_handler(uint32_t opcode, uint32_t token,
>   		prtd->pcm_irq_pos += prtd->pcm_count;
>   		snd_pcm_period_elapsed(substream);
>   		if (prtd->state == Q6ASM_STREAM_RUNNING)
> -			q6asm_write_async(prtd->audio_client,
> -					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
> +			q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +					   prtd->pcm_count, 0, 0, 0);

ditto for the timestamp change?


> @@ -501,8 +514,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
>   	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
>   		spin_lock_irqsave(&prtd->lock, flags);
>   		if (!prtd->bytes_sent) {
> -			q6asm_write_async(prtd->audio_client, prtd->pcm_count,
> -					  0, 0, NO_TIMESTAMP);
> +			q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +					  prtd->pcm_count, 0, 0, 0);

and here as well.

>   			prtd->bytes_sent += prtd->pcm_count;
>   		}
>   
> @@ -527,8 +540,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
>   		avail = prtd->bytes_received - prtd->bytes_sent;
>   
>   		if (avail >= prtd->pcm_count) {
> -			q6asm_write_async(prtd->audio_client,
> -					   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
> +			q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +					   prtd->pcm_count, 0, 0, 0);

and here.

