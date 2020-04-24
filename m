Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07B1B76E9
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 15:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE121682;
	Fri, 24 Apr 2020 15:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE121682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587734712;
	bh=4IpDB0pM7alidlb450/JmG+QN0Jougp5+gx3AIlG804=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VakizdI/3BBOrjtR9OIQE9r+dfJWaWnCdCb3nxVf+VNrTt3eBosl5EFcNEQ3nAr2p
	 CzrRqflAp6EOJgecEQyfwrlnYwJ9ser4yDy2GFb11uVBCR5RhrR4SyPzb0PyeKhE98
	 I0bNGCI7BmLqQajvZ/J5WObTTz/kdtWn5HxnlHIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A088F80121;
	Fri, 24 Apr 2020 15:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C257AF80142; Fri, 24 Apr 2020 15:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B473CF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 15:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B473CF800BE
IronPort-SDR: YGjL3x1p9T5nUNZBOr/VRm3i73tslgPStitiIXdTvz0ClTVAQZen01UIgCj3HFIWbzK4l451Rp
 Hx+l+H24RPUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 06:23:22 -0700
IronPort-SDR: Cez/pMlOKqPaMhc1EvaxqeI/yndB4s8i6ZJRDL7b82N8seRtBbQzRWhZQpvW1KgzhuIZ8kpIZx
 5TOAc6Xm3AjA==
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="366345474"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.209.18.202])
 ([10.209.18.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 06:23:20 -0700
Subject: Re: [PATCH v3 2/3] ASoC: Intel: Multiple I/O PCM format support for
 pipe
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200423111148.6977-1-mateusz.gorski@linux.intel.com>
 <20200423111148.6977-3-mateusz.gorski@linux.intel.com>
 <e13f51b7-da52-ad7a-d000-1c0099cbf21d@linux.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <1b3afeed-09aa-9eca-be96-529696239711@linux.intel.com>
Date: Fri, 24 Apr 2020 15:23:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e13f51b7-da52-ad7a-d000-1c0099cbf21d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, broonie@kernel.org, tiwai@suse.com,
 Pavan K <pavan.k.s@intel.com>
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


> maybe one nit-pick is that there is a one-line difference between the 
> _set and _get functions, and it might be simpler to use a common 
> helper with a boolean flag used at the end to do this:
>
> > +    ucontrol->value.enumerated.item[0]  = pipe->pipe_config_idx;
>
> or that:
>
> > +    pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];


Thanks for this hint, adressed in v4 together with comment about access 
rights.

Mateusz

