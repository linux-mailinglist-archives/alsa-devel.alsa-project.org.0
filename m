Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864727D2ED
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 17:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A381818;
	Tue, 29 Sep 2020 17:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A381818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601393978;
	bh=cjoHGY1W/tvheF4P+Sb6EaXD96tgmol/c0xnuAyiofM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUaW4E3Se84Atrh97h+lUdL5VgOXCOzG9wMgpzw2SYo5yaiudMKliFcgVm1MKd5wT
	 kKcioTfhNC5Sk+KGI4OlwG/9/AqSc9az5VP/ZqXWvX8t0VdqN+036k94jVlYKPBOMI
	 Lam/sDZLR7e8n7RCC05h9SoMBYYouJKZPt70Zc2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884B0F801DB;
	Tue, 29 Sep 2020 17:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856C3F8020C; Tue, 29 Sep 2020 17:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81544F80115
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 17:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81544F80115
IronPort-SDR: CHYXgJLqGHkiT2hfp+C1JGoTyH5JDz+/Bma77/93urkAaQAxqoPFn/TgJos0QPGLklmeXrmpWa
 hX4csARDcklw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159592391"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="159592391"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 08:37:44 -0700
IronPort-SDR: u7zGSKpjL66lO6ha/ka5RsQpPa+zXCvTTE2FEr3Ybgrxkfb88LmlWyXSc2u6lON9y7VOJN+DPH
 4dzsPVeHimmA==
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="294299052"
Received: from sinayosx-desk3.amr.corp.intel.com (HELO [10.212.155.136])
 ([10.212.155.136])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 08:37:44 -0700
Subject: Re: [PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
To: Takashi Iwai <tiwai@suse.de>
References: <20200918212832.249184-1-pierre-louis.bossart@linux.intel.com>
 <s5hlfgtkq4r.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <70ed2326-3271-e237-323e-09e17d501b7f@linux.intel.com>
Date: Tue, 29 Sep 2020 08:44:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hlfgtkq4r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
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


>> The SOF (Sound Open Firmware) tree contains a lot of references in
>> topology files to 'codec_slave'/'codec_master' terms, which in turn
>> come from alsa-lib and ALSA/ASoC topology support at the kernel
>> level. These terms are no longer compatible with the guidelines
>> adopted by the kernel community [1] and need to change in
>> backwards-compatible ways.
>>
>> The main/secondary terms typically suggested in guidelines don't mean
>> anything for clocks, this patchset suggests instead the use of
>> 'provider' and 'consumer' terms, with the 'codec' prefix kept to make
>> it clear that the codec is the reference. The CM/CS suffixes are also
>> replaced by CP/CC.
>>
>> It can be argued that the change of suffix is invasive, but finding a
>> replacement that keeps the M and S shortcuts has proven difficult in
>> quite a few contexts.
>>
>> The previous definitions are kept for backwards-compatibility so this
>> change should not have any functional impact. It is suggested that new
>> contributions only use the new terms but there is no requirement to
>> transition immediately to the new definitions for existing code. Intel
>> will however update all its past contributions related to bit
>> clock/frame sync configurations immediately.
>>
>> This suggestion is easier to review first at the alsa-lib level, and
>> if agreed follow-up contributions for the Linux kernel [2] and SOF
>> firmware [3] will be provided.
> 
> It's OK from alsa-lib POV; although the uapi header change isn't 100%
> safe, the user of this header is really our ones, so it's practically
> acceptable, I suppose.
> 
> Could you submit the changes for kernel, so that it can be merged in
> time?  Basically alsa-lib is synced with kernel, so the kernel should
> be changed at first.

Ack, will do, thanks for the review.
