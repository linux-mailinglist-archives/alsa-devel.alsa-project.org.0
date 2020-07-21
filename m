Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64088228CD7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 01:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD66166E;
	Wed, 22 Jul 2020 01:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD66166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595375276;
	bh=7AIwifWzud53J8zjgtZacR9EhiJh6kmjjGdpnRJ+7nU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZxTu+5HeY/gcG/2rQMTH1VBmGaT/00QwNQjUWTNkZz3yYOCqw3BGqhJsPQ1KI3nT
	 0TgbDRmlsbYYPa6Exctv4oo++M8tV7f3d11ZXKiD9GaXZSGnq8UmGTwyL7MsSRPXC8
	 OqH27drXEgFfXRit1D1UvEbd2kjsQFAfK6D3BfDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1927F80278;
	Wed, 22 Jul 2020 01:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BBA0F80274; Wed, 22 Jul 2020 01:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEE3FF80117
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE3FF80117
IronPort-SDR: Sit8ma7ilnGXW3HkyaQCN8HUINq0wEsn8ssBdk6m9wRELhJWEtvEWmCjk2noojQzUG8c/ZUF8v
 mTQ6poT27M9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="151576914"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="151576914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:03 -0700
IronPort-SDR: iz40N4/yb9B5d6SJZ7L8QhpD0FXcHb8KUoqwc5Y4Vocc8cfpIZzsN8mQTjG3yVvkQzYTfkyk7z
 wqYdOdJ4zEDw==
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="362539360"
Received: from krlloyd-mobl.amr.corp.intel.com (HELO [10.255.231.6])
 ([10.255.231.6])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 16:46:01 -0700
Subject: Re: [PATCH v2 2/9] ASoC: q6asm: make commands specific to streams
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
 <20200721165306.29082-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <52075b51-2053-573a-4cd0-685d3d469bdf@linux.intel.com>
Date: Tue, 21 Jul 2020 14:31:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721165306.29082-3-srinivas.kandagatla@linaro.org>
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




> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 941f3216399c..fb0488e7beb9 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -67,6 +67,8 @@ struct q6asm_dai_rtd {
>   	uint16_t bits_per_sample;
>   	uint16_t source; /* Encoding source bit mask */
>   	struct audio_client *audio_client;
> +	/* Active */

nit-pick: what does this 'Active' comment try to say? the stream_id 
seems to be used for RUN/EOS/CLOSE operations.

> +	uint32_t stream_id;
>   	uint16_t session_id;
>   	enum stream_state state;
>   };
> @@ -184,8 +186,8 @@ static void event_handler(uint32_t opcode, uint32_t token,
>   	switch (opcode) {
>   	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			q6asm_write_async(prtd->audio_client,
> -				   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
> +			q6asm_write_async(prtd->audio_client, prtd->stream_id,
> +				   prtd->pcm_count, 0, 0, 0);

In the V1 review we discussed this

"
 > sound/soc/qcom/qdsp6/q6asm.h:#define NO_TIMESTAMP    0xFF00
 >
 > is the change on the previous line intentional?

May be not!

Plan is that the users of these apis will send flags directly instead of 
boiler plating this!

This change should go as part of next patch("[PATCH 04/11] ASoC: q6asm: 
use flags directly from asm-dai") which would make it much clear!
"

doesn't look like there was a change here?


