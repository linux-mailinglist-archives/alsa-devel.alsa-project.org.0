Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD91D48EC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 10:57:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FED21671;
	Fri, 15 May 2020 10:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FED21671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589533045;
	bh=0H0csaOPoV/TsgAJYpomXTRHtmRbxy/+oUYHmyKgzEg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwWb3xcTP9cHRGKbuYx/AjizyX7kAokvL5Av72aGkx5MI3Xd+sSHSpMYbnegCnn/W
	 OuadAm5E0qA1gnxqPQgHUFeEUFnyRFHZIy1+vjN50y1rb/Om8dfMjmzre3GlZEf7de
	 UW0XL5n2e6vQ/1YmuH/EaDOeCkFFPItrvTpBPzP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C38DF80101;
	Fri, 15 May 2020 10:55:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6140F80253; Fri, 15 May 2020 10:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2174F80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 10:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2174F80101
IronPort-SDR: zdHfnyyUmweB0M12NHVEyiNHcRmxe2P3wmVdC9CW/0cFXszGpOVwu+xKcXbR534I9lYJbzGf5k
 kaOH/st0n4mg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 01:55:32 -0700
IronPort-SDR: OYcxG3Hc1inxMMHokdwKAoRJFGHINEKQZADBDL6g6wNsD60i/EgCStuggwLLw0fNjKEphWEfac
 TathJfso66vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; d="scan'208";a="410405904"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.20.127])
 ([10.213.20.127])
 by orsmga004.jf.intel.com with ESMTP; 15 May 2020 01:55:30 -0700
Subject: Re: [RESEND PATCH v2] ALSA: hda: Allow SST driver on SKL and KBL
 platforms with DMIC
To: Takashi Iwai <tiwai@suse.de>
References: <20200515084934.28156-1-cezary.rojewski@intel.com>
 <s5h7dxdo9yg.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <77fcab56-b3fc-c839-f61b-2659b98aa513@intel.com>
Date: Fri, 15 May 2020 10:55:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5h7dxdo9yg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On 2020-05-15 10:53 AM, Takashi Iwai wrote:
> On Fri, 15 May 2020 10:49:34 +0200,
> Cezary Rojewski wrote:
>>
>> Update intel-dspcfg with FLAG_SST_ONLY_IF_DMIC option and use it for
>> Skylake and Kabylake platforms when DMIC is present.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The patch was already merged in for-next branch in the last week.
> 
> 
> thanks,
> 
> Takashi
> 

Sorry for spam then, Takashi.
Seen "Applied" from Mark, guess I missed the hda part.

Thanks,
Czarek
