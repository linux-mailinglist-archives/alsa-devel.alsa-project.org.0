Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16C1C78E0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 20:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E44317AD;
	Wed,  6 May 2020 20:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E44317AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588788270;
	bh=pVpK8yYX3pH6yHHM6RwU150iHkc07wgVxC6sVr6+MMw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uLF91SgZRD/eKfSZVhcaYH/JWPv1ji6UC0Sv+MsUIjxtrNLKCr3Sb0m+jbpMva4dV
	 s95030jYF3VaKPNCQu1T0+5JqJsnBzW3GSCVrPJfw2M+ZBV57pwhi+jCGrgeARQjLU
	 LrZgd0Ed4eZ6Bp6jkQH5L+sHYMkoMv7lZ+ng+THQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0B1F800DE;
	Wed,  6 May 2020 20:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A0D7F80249; Wed,  6 May 2020 20:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08E03F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 20:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E03F800DF
IronPort-SDR: gPvD2iqB79OQI+u1PBNIdjN7IQKWJCC4ifrRx3/ZV9Ce35k10TszejeQzffi4Ztr9kayWm5OBI
 yLY3slHdbCwQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 11:02:39 -0700
IronPort-SDR: c7cY8iDB0BZai8MeFOQXAmakAM+4zvQ1VM4y+inxP9fK6WsKXfXgm8fu2sTX9qMljvok4SaALR
 gSIN03jQ2XEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249835278"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 11:02:38 -0700
Subject: Re: [PATCH 07/14] ASoC: amd: add acp3x pdm driver dma ops
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-8-alexander.deucher@amd.com>
 <fa130cbb-412d-768e-db71-15463fa58ab1@linux.intel.com>
 <DM6PR12MB26333FCDC930138DC47CC20397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13385ae5-eb6c-fa85-6177-3e7fbb39c35d@linux.intel.com>
Date: Wed, 6 May 2020 13:02:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB26333FCDC930138DC47CC20397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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




>>> +static const struct snd_pcm_hardware acp_pdm_hardware_capture = {
>>> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
>>> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>> +		SNDRV_PCM_INFO_BATCH | SNDRV_PCM_INFO_MMAP |
>>> +		SNDRV_PCM_INFO_MMAP_VALID |
>>> +	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
>>
>> Can you actually resume from the same position? this seems odd when
>> combined with INFO_BATCH which means the position is only precise at
>> period boundaries.
>>
> We used similar flag in Raven APU acp dma driver well.

Takashi clarified during the early SOF days that if you cannot resume 
from the same position, then the ALSA core will attempt a prepare and 
restart. So if you don't support a restart from the same point, it's 
fine to remove this flag.

> As per my understanding INFO_BATCH is more about providing period granularity when hw_ptr is queried.
> But PDM driver DMA pointer callback returns precise hw_ptr when queried.
> Correct me, if understanding is wrong.

No, INFO_BATCH means the hw_ptr is only updated with a large 
granularity, possibly as large as a period. if you can support precise 
position you should not use this flag.
