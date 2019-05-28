Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59882D12B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 23:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5442515E4;
	Tue, 28 May 2019 23:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5442515E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559080060;
	bh=OdBwqzpgXXX/BkrFeCoW93K4u8ZSm/RmPs0SMRc5hY0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m227ISN615dpg4QJA0G+FRvhGgRGcSzbqlYxJkG9/oZ/BB/d1P6FgO46bpJQTEjkE
	 agkJfomkSty6pHcBKlfm5Pm714ozp98TG2lGLoBYVJJF9xh6gtYTQITwVzoYLOrrZP
	 cabiPTkzfVNLoHahBU5u6Q2A6ij3I6AzaCe4d5AI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D347BF89708;
	Tue, 28 May 2019 23:45:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BC3F89706; Tue, 28 May 2019 23:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8611F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 23:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8611F896B8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 14:45:47 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 28 May 2019 14:45:47 -0700
Received: from msakib-mobl2.amr.corp.intel.com (unknown [10.254.189.121])
 by linux.intel.com (Postfix) with ESMTP id B0DDA580372;
 Tue, 28 May 2019 14:45:46 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190528200206.2793-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2baa9302-3e1d-6710-ed3e-13122094f8b8@linux.intel.com>
Date: Tue, 28 May 2019 16:45:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528200206.2793-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: uapi headers - add missing
 include for stdint.h
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

Hi Jaroslav,

On 5/28/19 3:02 PM, Jaroslav Kysela wrote:
> The modified header files depend on types defined in <stdint.h>.

Humm, not an objection but more a question: may I ask in which cases the 
compilation would fail or what types were problematic? I see stdint.h 
being used by only 3 files in include/uapi so not sure if we missed 
something?
Also we removed some of those files recently since they were not used by 
the kernel, we only have abi.h, fw.h, header.h and tokens.h in this 
directory, so that patch would not apply against Mark's tree.

> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>   include/uapi/sound/sof/eq.h       | 4 ++++
>   include/uapi/sound/sof/fw.h       | 4 ++++
>   include/uapi/sound/sof/header.h   | 4 ++++
>   include/uapi/sound/sof/manifest.h | 4 ++++
>   include/uapi/sound/sof/trace.h    | 4 ++++
>   5 files changed, 20 insertions(+)
> 
> diff --git a/include/uapi/sound/sof/eq.h b/include/uapi/sound/sof/eq.h
> index 666c2b6a3229..106d56e357e0 100644
> --- a/include/uapi/sound/sof/eq.h
> +++ b/include/uapi/sound/sof/eq.h
> @@ -9,6 +9,10 @@
>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
>   #define __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
>   
> +#ifndef __KERNEL__
> +#include <stdint.h>
> +#endif
> +
>   /* FIR EQ type */
>   
>   #define SOF_EQ_FIR_IDX_SWITCH	0
> diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
> index 1afca973eb09..4f2de19a3b86 100644
> --- a/include/uapi/sound/sof/fw.h
> +++ b/include/uapi/sound/sof/fw.h
> @@ -13,6 +13,10 @@
>   #ifndef __INCLUDE_UAPI_SOF_FW_H__
>   #define __INCLUDE_UAPI_SOF_FW_H__
>   
> +#ifndef __KERNEL__
> +#include <stdint.h>
> +#endif
> +
>   #define SND_SOF_FW_SIG_SIZE	4
>   #define SND_SOF_FW_ABI		1
>   #define SND_SOF_FW_SIG		"Reef"
> diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
> index 7868990b0d6f..6a62ae8f0eb9 100644
> --- a/include/uapi/sound/sof/header.h
> +++ b/include/uapi/sound/sof/header.h
> @@ -9,6 +9,10 @@
>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
>   #define __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
>   
> +#ifndef __KERNEL__
> +#include <stdint.h>
> +#endif
> +
>   /*
>    * Header for all non IPC ABI data.
>    *
> diff --git a/include/uapi/sound/sof/manifest.h b/include/uapi/sound/sof/manifest.h
> index 2009ee30fad0..d57aa2bc4764 100644
> --- a/include/uapi/sound/sof/manifest.h
> +++ b/include/uapi/sound/sof/manifest.h
> @@ -9,6 +9,10 @@
>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
>   #define __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
>   
> +#ifndef __KERNEL__
> +#include <stdint.h>
> +#endif
> +
>   /* start offset for base FW module */
>   #define SOF_MAN_ELF_TEXT_OFFSET		0x2000
>   
> diff --git a/include/uapi/sound/sof/trace.h b/include/uapi/sound/sof/trace.h
> index ffa7288a0f16..1652bc08d576 100644
> --- a/include/uapi/sound/sof/trace.h
> +++ b/include/uapi/sound/sof/trace.h
> @@ -9,6 +9,10 @@
>   #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
>   #define __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
>   
> +#ifndef __KERNEL__
> +#include <stdint.h>
> +#endif
> +
>   /*
>    * Host system time.
>    *
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
