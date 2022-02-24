Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469484C344E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 19:07:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8DD91943;
	Thu, 24 Feb 2022 19:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8DD91943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645726022;
	bh=hxBAdTR0owOoMKt0GpG1ZgSex/03IjMwvi0Jz7GXfd8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLwYYMKgInJXpSpoLZ3mVwODo5+crP2KHkTKLzg8ZG245Xr4y5ELsecyTD+MHU12Q
	 XOivIj1DHLVc9AzWTIWdFCycv9TxBUtb7f5efaKJRlmio8F6TtSR3MPdgeiDs8iXb5
	 5jIIryo1tKb4evxebRN6rWl9zxLPjlgDn2bFvmDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 334A2F80310;
	Thu, 24 Feb 2022 19:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10AB9F80118; Thu, 24 Feb 2022 19:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46B6FF80118;
 Thu, 24 Feb 2022 19:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B6FF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bRHOywwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645725949; x=1677261949;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hxBAdTR0owOoMKt0GpG1ZgSex/03IjMwvi0Jz7GXfd8=;
 b=bRHOywwDLe/cDCtZ+tOilpSN/IQpKI3WT9FAAk9xTkycfNG0K+rHNyJQ
 Qih6VmxRfdf/Y6j7Rgh8/IcHQh/EyBVS81xl1dH2LEAuAL7pbMsnVMGpP
 aKwfJb6IWvAfeMhvJ5qfWebLPhMys+1GB9svvja+bQ5/09iCGIFiYDWnu
 iksJ7ifwRQTq38tzYu/jLsZpLqKRI0VOdSOGJTO/kD7GMh6HFjV0m5OE9
 1Z0kLDUe/E8kduQ0/0xA10zotg4xc+eSx7UJjclQE7gqA6UfpfyTSj9SV
 KZz25PbFkNltIP6vUWBrKaKV49bYf+Io4kQPM1JrHhj9E6hp2CMsUgZYL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252039189"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252039189"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 10:05:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="533236249"
Received: from ronakmeh-mobl1.amr.corp.intel.com (HELO [10.212.97.131])
 ([10.212.97.131])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 10:05:40 -0800
Message-ID: <04e79b9c-ccb1-119a-c2e2-34c8ca336215@linux.intel.com>
Date: Thu, 24 Feb 2022 12:05:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>, Mark Brown <broonie@kernel.org>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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


>> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
>>
>> Do not call snd_dma_free_pages() when snd_dma_alloc_pages() returns
>> -ENOMEM because it leads to a NULL pointer dereference bug.
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks for this patch. looks good and tested by our CI, so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


