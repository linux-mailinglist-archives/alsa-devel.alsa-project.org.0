Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B763F8EB3
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 21:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE7816CD;
	Thu, 26 Aug 2021 21:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE7816CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630005951;
	bh=02BcOVNPw9nfhu4aiA3EUrz4RnTHIjePdXanbpmKlzg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uLbMi91Qj+z9JVWEMViC78pcRGqEHYwskcz+PXeC6fbZYhgz9X7MRzHkePBAR5TSk
	 /1NQwrc+Uj1ey8bq2Wd1cUqKzaKpHGoPSAe7wYmh2Psho1RkGiJnMYKf2T3nezosIe
	 y9QvfBt2btjxsSnsgPJMmJzLt1E/rPXdeYpJsLhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3899DF800FD;
	Thu, 26 Aug 2021 21:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E727F801D8; Thu, 26 Aug 2021 21:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E1D7F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 21:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E1D7F80054
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="204959549"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="204959549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 12:24:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="474321237"
Received: from hjasuja-mobl.amr.corp.intel.com (HELO [10.251.134.37])
 ([10.251.134.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 12:24:22 -0700
Subject: Re: [RFC PATCH 1/2] ASoC: soc-pcm: protect BE dailink state changes
 in trigger
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20210817164054.250028-1-pierre-louis.bossart@linux.intel.com>
 <20210817164054.250028-2-pierre-louis.bossart@linux.intel.com>
 <163000225499.699341.16303629557242399115.b4-ty@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27b9fe7a-18cc-61ee-1e4d-72282d8eaa82@linux.intel.com>
Date: Thu, 26 Aug 2021 14:24:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163000225499.699341.16303629557242399115.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Brown@sirena.org.uk, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, Mark@sirena.org.uk
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



On 8/26/21 1:30 PM, Mark Brown wrote:
> From: Mark Brown,,, <broonie@kernel.org>
> 
> On Tue, 17 Aug 2021 11:40:53 -0500, Pierre-Louis Bossart wrote:
>> When more than one FE is connected to a BE, e.g. in a mixing use case,
>> the BE can be triggered multiple times when the FE are opened/started
>> concurrently. This race condition is problematic in the case of
>> SoundWire BE dailinks, and this is not desirable in a general
>> case. The code carefully checks when the BE can be stopped or
>> hw_free'ed, but the trigger code does not use any mutual exclusion.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/2] ASoC: soc-pcm: protect BE dailink state changes in trigger
>       commit: 0c75fc7193387776c10f7c7b440d93496e3d5e21
> [2/2] ASoC: soc-pcm: test refcount before triggering
>       commit: 6479f7588651cbc9c91e61c20ff39119cbc8feba

Ah sorry, there were still some issues in this RFC, we did more testing
and came up with a lot of improvements. The intent of the RFC status was
also to make sure it wasn't applied before the merge window.

Can this be reverted in your branch Mark?
