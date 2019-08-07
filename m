Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A38536F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 21:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C599B851;
	Wed,  7 Aug 2019 21:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C599B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565204954;
	bh=jhUD1eWaMIQOFcg03G4zVdSNEYKHkB+cK6sBQdSsbkg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fnTnCJYsO6AW8bpM1J81Yrzy4CSEhi6OlJ8T2IRBCIR+j++T2SASFY+uGeE2nc0NG
	 loku7tqWZDKBDQx+k4rmjFfKZm1yJB1/+ZER+dIR0tDUlU1fpFlXgzg95kbor2cdNJ
	 +vVLlBJ+4MB420ibpNy1JwNzAgM1CgvWXPIJDxmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 031EDF804CA;
	Wed,  7 Aug 2019 21:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E6F7F80290; Wed,  7 Aug 2019 21:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5766AF800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 21:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5766AF800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 12:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="176284367"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.6.17])
 ([10.252.6.17])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 12:07:18 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
 <20190807150203.26359-5-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <ac41ec50-6484-cce1-2e41-c42e6bb541ef@intel.com>
Date: Wed, 7 Aug 2019 21:07:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807150203.26359-5-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 4/6] ASoC: SOF: Intel: byt: Refactor fw
 ready / mem windows creation
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

On 2019-08-07 17:02, Pierre-Louis Bossart wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>

> So we are basically moving code from intel/byt.c to loader.c keeping
> in mind that mbox_offset is a per platform constant so we need to
> use newly introduced snd_sof_dsp_get_mailbox_offset /
> snd_sof_dsp_get_window_offset in order to get the correct
> mbox offset / window offset value.

You've already explained your goal. These details are unnecessary.

> 
> Also, bar is a per platform constant so we use snd_sof_dsp_get_bar_index
> instead of the hardcoded BYT_DSP_BAR.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/sof/intel/byt.c | 164 +++++--------------------------------
>   sound/soc/sof/loader.c    | 168 ++++++++++++++++++++++++++++++++++++++
>   sound/soc/sof/sof-priv.h  |   2 +
>   3 files changed, 189 insertions(+), 145 deletions(-)

Hmm, even the commit message mentions two steps, not one. Splitting this 
commit into two - introduction of new generic functions and byt 
alignment towards the newly added approach - seems reasonable. Bdw & hda 
followups already make good examples.

Czarek

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
