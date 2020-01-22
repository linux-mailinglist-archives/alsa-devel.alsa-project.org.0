Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E712145ECE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 23:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83130168F;
	Wed, 22 Jan 2020 23:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83130168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579733537;
	bh=iqR2fYWTDShJQ29A79dL0YHxXuMx44p64KRLTSuQhtc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dX3vvX8Gbo+NUTKdT5v/Vre8EUP5bxx+J70YONE05HwTTF9wFIOe6BdeX6H+h2+R6
	 0uWzr4QtqvZlS46pH2wNjcmIYq4eC/QUPtHQwYzS/jge+y75O3QS+WFPxIq54uMzix
	 ghKsZ9t2rPS46ceAzwXC3LkFyyXwy1SdFkDxuoC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A6FF80229;
	Wed, 22 Jan 2020 23:50:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 276F2F80217; Wed, 22 Jan 2020 23:50:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B39A8F800BA
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 23:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39A8F800BA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 14:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,351,1574150400"; d="scan'208";a="229541509"
Received: from jovercas-mobl1.amr.corp.intel.com (HELO [10.254.105.26])
 ([10.254.105.26])
 by orsmga006.jf.intel.com with ESMTP; 22 Jan 2020 14:50:22 -0800
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
References: <20200122190752.3081016-1-perex@perex.cz>
 <26ae4dbd-b1b8-c640-0dc0-d8c2bbe666e2@linux.intel.com>
 <20200122202530.GG3833@sirena.org.uk>
 <045401f5-8d4c-cdc3-12fb-cf35148411e5@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <67f2a1cf-fe62-76fa-ccdb-869e2b0daee2@linux.intel.com>
Date: Wed, 22 Jan 2020 15:47:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <045401f5-8d4c-cdc3-12fb-cf35148411e5@perex.cz>
Content-Language: en-US
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, Sasha Levin <sashal@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: topology: fix
 soc_tplg_fe_link_create() - link->dobj initialization order
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


>>> I am not following. Is this a fix for linux-5.4-y only, or is it 
>>> needed on
>>> Mark's tree? In the latter case, what is broken? We've been using Mark's
>>> tree without issues, wondering what we missed?
>>
>> He's saying it's a fix for stable but it's just a cleanup and robustness
>> improvement in current kernels - when the patch 76d270364932 (ASoC:
>> topology: Check return value for snd_soc_add_dai_link()) was backported
>> by the bot the bot missed some other context which triggered bugs.
> 
> Exactly. It's because the commit 
> 237d19080cd37e1ccf5462e63d8577d713f6da46 ("ASoC: soc-core: remove 
> topology specific operation") removed the link->dobj checks, but this 
> commit was not picked to the stable kernels.
> 
> The initialization reordering is fine for all kernels (and makes sense), 
> so I would like to apply it everywhere.

ok, thanks for the precisions.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
