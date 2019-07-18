Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A40526C804
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 05:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EB41680;
	Thu, 18 Jul 2019 05:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EB41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563421068;
	bh=vnuf4sI25u4k0yhWvopMuOfQTkyi12KPL1sZm/eqvXc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tfMcoBrHXOt1gzssIv2gIU9ibA+mybLjZl9DCup3fuI1zE08LST+NKQ8C+AmWF8b8
	 0LxWcvNr1J5F0sv09eLXErvhkgpTjLz98PtjYaKw4R7+YyP4s/xBX2tjk2KAJxG75b
	 ChMfYh9B2ZYl5EQjpnenbzjud70ao66q2rDR1Jcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F8CCF802BC;
	Thu, 18 Jul 2019 05:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2870F80362; Thu, 18 Jul 2019 05:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ACCFF800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 05:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ACCFF800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 20:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="191472764"
Received: from mnarusze-mobl.sc.intel.com (HELO [10.252.136.189])
 ([10.252.136.189])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2019 20:35:52 -0700
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
Date: Wed, 17 Jul 2019 22:35:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718031113.25040-1-yang.jie@linux.intel.com>
Content-Language: en-US
Cc: marcin.rajwa@intel.com, Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: add flag for position
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



On 7/17/19 10:11 PM, Keyon Jie wrote:
> From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> 
> In some cases, FW might need to use the host_period_bytes field to
> synchronize the DMA copying (with host side) but the driver does not

it's your right to edit my suggested wording, but the notion of 
'synchronization' is far from clear. it's my understanding that the 
host_period_bytes defines the DMA transfer size requested by the 
firmware, which isn't a value that matters to the host except for rewind 
usages.

> need any position information returned over the IPC channel by the
> firmware. The current IPC definition prevents this capability, so add
> new field.
> 
> Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   include/sound/sof/stream.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
> index 643f175cb479..06af4ecb2584 100644
> --- a/include/sound/sof/stream.h
> +++ b/include/sound/sof/stream.h
> @@ -83,10 +83,10 @@ struct sof_ipc_stream_params {
>   	uint16_t sample_valid_bytes;
>   	uint16_t sample_container_bytes;
>   
> -	/* for notifying host period has completed - 0 means no period IRQ */
>   	uint32_t host_period_bytes;
> +	uint32_t no_position_ipc; /* 1 means no IPC for position upadte */

typo: update

>   
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
