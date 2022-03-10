Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAC4D47E7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 14:17:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A39A1914;
	Thu, 10 Mar 2022 14:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A39A1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646918237;
	bh=LO8u2Afk182eT+azNF0XyZj9u2g4BjVD1xWRqwk+HHU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N7+1zzaK/iuyFbttDpd7DHHg4JDJm607TGCyl285AL2yVZ3VzuYiOThaGp76EaTUa
	 4OIaS9jQye+dJYdPvr+lluaJKPGDL2MjE/ADqKi4mBgvR6Y0Ncs/ga9IPsvnX7XT6z
	 GYU+UBZ/ilSweYPD1zNAKQvDgG/ymdh6L2Kw5/2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E50B3F800D2;
	Thu, 10 Mar 2022 14:16:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDCA5F80137; Thu, 10 Mar 2022 14:16:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HK_RANDOM_ENVFROM,HK_RANDOM_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44399F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44399F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IQ4eFtXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646918162; x=1678454162;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LO8u2Afk182eT+azNF0XyZj9u2g4BjVD1xWRqwk+HHU=;
 b=IQ4eFtXsEcC4XMtb5Qy5P2TOT8t7rW2wgcMaTBZavaJdqC9f+v9m7ZAv
 CFGJ1SOO7sGMcnQH6HHYIqfY29nKjXhMcjcbqGQTV0EXksu4rhdfVDk+9
 dSzjMHV1mHjZCGL2nJZnTx3dszQRTrB/9vb7zszJ93uWpyfDarRyKTYqo
 bo7pwYMXYQFJvCe5+ZCJgLSpeHwi72BWzO3SqltHVNdwzl/9IgrBbMWyl
 YnMEVhiNnCKEqXVx/OKWeQXzdgpaqT7gZC9/IvZuyha3grJe8mzYKCbah
 GlRqF412Vr2TEt39eZxPgkZLRS/t3eBpLth3sz+yQet2UXRpIakGQYQtp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254075036"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="254075036"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 05:15:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="548007889"
Received: from npalmass-mobl1.amr.corp.intel.com (HELO [10.213.186.207])
 ([10.213.186.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 05:15:56 -0800
Message-ID: <9cb04727-971d-842f-db79-dcc10d70532b@linux.intel.com>
Date: Thu, 10 Mar 2022 13:15:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] ALSA: hda/i915 - avoid hung task timeout in i915 wait
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20220309182439.1053856-1-kai.vehmanen@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220309182439.1053856-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ramalingam C <ramalingam.c@intel.com>, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, amadeuszx.slawinski@linux.intel.com
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


On 09/03/2022 18:24, Kai Vehmanen wrote:
> If kernel is built with hung task detection enabled and
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT set to less than 60 seconds,
> snd_hdac_i915_init() will trigger the hung task timeout in case i915 is
> not available and taint the kernel.
> 
> Use wait_for_completion_killable_timeout() for the wait to
> avoid this problem.
> 
> Co-developed-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/hda/hdac_i915.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Changes V2->V3:
>   - drop the loop and just use
>     wait_for_completion_killable_timeout() (feedback from Tvrtko Ursulin)
>   - new approach, so dropped the previous reviewed-by tags
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 454474ac5716..efe810af28c5 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -160,8 +160,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
>   		if (!IS_ENABLED(CONFIG_MODULES) ||
>   		    !request_module("i915")) {
>   			/* 60s timeout */
> -			wait_for_completion_timeout(&acomp->master_bind_complete,
> -						    msecs_to_jiffies(60 * 1000));
> +			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
> +							     msecs_to_jiffies(60 * 1000));
>   		}
>   	}
>   	if (!acomp->ops) {

Works for me, as discussed I think this is more correct.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> base-commit: 3a0099a1909dea6022690b0ae496938dd2e5771c
