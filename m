Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D724FFC5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 16:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A6A61675;
	Mon, 24 Aug 2020 16:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A6A61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598279201;
	bh=T5w5W+qUE1Ge+hFdoZnsuYhWoAD3l8JMgigJXOzoSM4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgFOMbKifTTnEkx+KURMphxQa4wP5DmyYbc8ZAgfLVnyop+FUw2erFraw35UMLPp8
	 7B6CidBzUDyhfjunrsyS2Dogb4tEDLoYwgxwIKTFOfCk60nNl/jW7wa033MnCRsoRu
	 A4CY8nrxiI76xZvaK8IUkAWE7+aaTjuGmtmp7IGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BCEAF800B8;
	Mon, 24 Aug 2020 16:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99376F801D9; Mon, 24 Aug 2020 16:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C4DF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 16:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C4DF800B8
IronPort-SDR: saOh4G0wj0NBGs8aDTVZ6kQm3dbW9fxNYIiF5FWmkIrQcsw37ys45CMxeaHbjk01VXnhLXxMZk
 hlKL0XEE7e+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="220175518"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="220175518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 07:24:48 -0700
IronPort-SDR: sZyNW0oLJeJcWdFPgfbpUGv+4wtxU/1lt2fiNpGa/8Ev8yfBzWN0w0UBdAY1bQl2TE+R5Oq5cR
 4jOnBuv08JIQ==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="294619008"
Received: from bpjohn-mobl.amr.corp.intel.com (HELO [10.212.174.18])
 ([10.212.174.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 07:24:32 -0700
Subject: Re: [PATCH 06/14] ASoC: Intel: tgl_max98373: fix a runtime pm issue
 in multi-thread case
To: Mark Brown <broonie@kernel.org>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
 <20200821195603.215535-7-pierre-louis.bossart@linux.intel.com>
 <20200821215550.GK4870@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9f8dca62-36b0-7ded-92f4-485441f900fc@linux.intel.com>
Date: Mon, 24 Aug 2020 09:24:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821215550.GK4870@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


>> When the playback & capture streams are stopped simultaneously, the
>> SOF PCI device will remain pm_runtime active. The root-cause is a race
>> condition with two threads reaching the trigger function at the same
>> time. They see another stream is active so the dapm pin is not
>> disabled, so the codec remains active as well as the parent PCI
>> device.
>>
>> For max98373, the capture stream provides feedback when playback is
>> working and it is unused when playback is stopped. So the dapm pin
>> should be set only when playback is active.
> 
> Should this be sent as a fix?

Ah yes, good point. I thought it was a SoundWire-only patch but no it 
also applies to the TDM configuration.

These should be a tag:

Fixes: 94d2d08974746 ('ASoC: Intel: Boards: tgl_max98373: add 
dai_trigger function')

Do you want me to resend with the tag, or can you apply it directly?


