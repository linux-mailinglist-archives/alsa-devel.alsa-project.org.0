Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A86BF51
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 17:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A2A1683;
	Wed, 17 Jul 2019 17:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A2A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563378596;
	bh=GwoElviSCn49ad5noF3YeU5xqRNo1XYzJHhV/2S7H4I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pr416efEj3AMksi4zSCoE9MmYp9Y9+G8LLOvx0q0IX+3SAixYWjEjWgiqwkqjhByP
	 TWWZJBLuzwoLzku+GIzgF+RKGetqfy+NNX2AmmE14/UMHvdzPnT0HKYgbok2nbRfdF
	 nS3Zza2zwfrivxHTdsaPF72HyqsKWe5dielgDfuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14087F80363;
	Wed, 17 Jul 2019 17:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60AECF80363; Wed, 17 Jul 2019 17:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D0BF8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 17:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D0BF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 08:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,274,1559545200"; d="scan'208";a="172903625"
Received: from szrederp-mobl.amr.corp.intel.com (HELO [10.252.199.30])
 ([10.252.199.30])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2019 08:48:03 -0700
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <323bbf08-c6dd-a95c-761d-c464ddf7275f@linux.intel.com>
Date: Wed, 17 Jul 2019 10:48:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190703151023.30313-1-yang.jie@linux.intel.com>
Content-Language: en-US
Cc: ranjani.sridharan@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position
	update ipc
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



On 7/3/19 10:10 AM, Keyon Jie wrote:
> From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> 
> In some cases, FW might need use the host_period_bytes even no position
> update ipc reqiured from driver, here add another flag for position update,
> and preserve host_period_bytes for FW to use.

please fix the commit message, e.g. with the suggested edit below

In some cases, FW might need to use the host_period_bytes field to fetch 
data over DMA but the driver does not need any position information 
returned over the IPC channel by the firmware. The current IPC 
definition prevents this capability, so add new field.

> 
> This might require corresponding FW change and ABI alignment.

remove this statement, this is already handled in backwards compatible mode.

> 
> Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> ---
>   include/sound/sof/stream.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
> index 643f175cb479..44acfa62fa69 100644
> --- a/include/sound/sof/stream.h
> +++ b/include/sound/sof/stream.h
> @@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
>   	uint16_t sample_valid_bytes;
>   	uint16_t sample_container_bytes;
>   
> -	/* for notifying host period has completed - 0 means no period IRQ */
>   	uint32_t host_period_bytes;
> +	uint16_t no_period_irq; /* 1 means period IRQ mode OFF */

I'd like this field to be renamed as 'no_position_update'. This really 
has nothing to do with no period_irq in general, even when you do use 
the no_irq mode you can still retrieve the position information from the 
HDaudio DMA registers.

> -	uint32_t reserved[2];
> +	uint16_t reserved[3];
>   	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map - SOF_CHMAP_ */
>   } __packed;
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
