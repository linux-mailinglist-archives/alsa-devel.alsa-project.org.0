Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC5218DC7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9627B1665;
	Wed,  8 Jul 2020 19:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9627B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227669;
	bh=nbkABA7xjzZEqrtvcCaEOd9lZJXaldjUeFJcnLjs9QQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+bx7Z7zWeFK7nZ+hHqqlx19I5EC1mYzIoXbDM6+HGxTRpLW36zgl5YBD7N8XgE3W
	 66CEq6Q17RxPthb+Nshmghfk4i2uYOH7vPUkKojDbratJCkOxEaVspfZ0BPXIrEzkw
	 OISC4EnX6HYtWx+xU/yVx8e8k7l68yML3yJ6kKXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B19DF8011F;
	Wed,  8 Jul 2020 18:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C25F80161; Wed,  8 Jul 2020 18:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28091F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28091F8011F
IronPort-SDR: 6bwGbftZtzE3wq5g5LxEzI74D01x5P6M5jVFWEo69CnHRPPbtQ23u6ESyPN5XYYI9twDSPd/Hl
 1o3B2O6xnwcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="212788415"
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="212788415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 09:59:07 -0700
IronPort-SDR: kFxAkyRZGP2s9lj6bOziRFXiFM+MAvLo2tFBLf34lH7tCYQJ9/JigrBIL2ez0zWI667l1PP8Wm
 v6lJIG+KEZ5w==
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="358162602"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 09:59:07 -0700
Subject: Re: [PATCH 0/3] ASoC: more fixes for dpcm checks
To: Mark Brown <broonie@kernel.org>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
 <20200708115349.GK4655@sirena.org.uk>
 <4290a302-e8a7-9b9b-7625-91f81a19aaf1@linux.intel.com>
 <20200708155321.GU4655@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d43a2721-5d21-1ed4-2ec0-b807e90dd312@linux.intel.com>
Date: Wed, 8 Jul 2020 11:59:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708155321.GU4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 7/8/20 10:53 AM, Mark Brown wrote:
> On Wed, Jul 08, 2020 at 07:49:58AM -0500, Pierre-Louis Bossart wrote:
> 
>> I wasn't sure which branch to use to be honest. It's late in the cycle for
>> 5.8, the addition of the helper is new. I am happy to resubmit for 5.8 if
>> you prefer it this way.
> 
> They applied fine as-is so it's fine.

Great, thanks!
