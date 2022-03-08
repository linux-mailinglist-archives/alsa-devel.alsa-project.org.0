Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913E4D1D30
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA46C176B;
	Tue,  8 Mar 2022 17:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA46C176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646757070;
	bh=W9dElgi4Wx08lrXUpbo7Hw/HPCKx7EyX1sVOO6YHXpY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZOqpURrll5IxS0C5CrN/2Da22oewfHJ3+Qs5wszGySc4aAB6AkEw0aQEtoAbOCaD
	 CFyaiuDtVQRlpGDtrP5z9PxyCjP7hIL/KuPI7iALI1YuNq7/Z9cTA2uUmxE1gmvGjb
	 nKkxKnDSpW0shzpZW5j/c7D3m3fXIi2a0oKRtEIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A34BF800D1;
	Tue,  8 Mar 2022 17:30:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA326F8026A; Tue,  8 Mar 2022 17:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E946F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E946F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IWqPnRY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646756994; x=1678292994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=W9dElgi4Wx08lrXUpbo7Hw/HPCKx7EyX1sVOO6YHXpY=;
 b=IWqPnRY/uNPG3dCLp4KLFAA84entEO0fAt/j+2W5BBUOqxyrEA4k0jlc
 w0BtuPjJCghInQlPgTBkQ12zT4KCA090CoenysGtNXk6F6yMg5HxVC9TF
 lkrU/xd2OGV0HeciB3pxvreO4kKzxVuNqvQ68+1NKI3kBoqcqvaxNMa+V
 hRMq5jf8agK+RMa2jH0oYUd+fPaLhcv8CdiOFryCGokB/YEe+R9DmQRgD
 kcKg36w0ILSOV4jL8c3XrYawpT3PlsAeJ78PU/PyoD4/P1awHVcKUOLKV
 ukHwf7mk+L+fVn7B4jYagYhkIRtmyKfyJh7ZqX1bESLyXLB4GbPIWjS6z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234685393"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="234685393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:29:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="553685100"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.183])
 ([10.99.249.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:29:23 -0800
Message-ID: <bc7f076d-e4b7-d995-391b-63cbdd2901f2@linux.intel.com>
Date: Tue, 8 Mar 2022 17:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ALSA: hda/i915 - avoid hung task timeout in i915 wait
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20220308141112.880662-1-kai.vehmanen@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220308141112.880662-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ramalingam C <ramalingam.c@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
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

On 3/8/2022 3:11 PM, Kai Vehmanen wrote:
> If kernel is built with hung task detection enabled and
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT set to less than 60 seconds,
> snd_hdac_i915_init() will trigger the hung task timeout in case i915 is
> not available and taint the kernel.
> 
> Split the 60sec wait into a loop of smaller waits to avoid this.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/hda/hdac_i915.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 454474ac5716..6219de739b56 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -143,7 +143,8 @@ static bool i915_gfx_present(void)
>   int snd_hdac_i915_init(struct hdac_bus *bus)
>   {
>   	struct drm_audio_component *acomp;
> -	int err;
> +	unsigned long wait = 0;

I'm not sure if it is best name for variable that is set to 0 ("false"), 
maybe `done` would be better? Especially looking at condition in the 
following for loop.

> +	int err, i;
>   
>   	if (!i915_gfx_present())
>   		return -ENODEV;
> @@ -159,9 +160,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
>   	if (!acomp->ops) {
>   		if (!IS_ENABLED(CONFIG_MODULES) ||
>   		    !request_module("i915")) {
> -			/* 60s timeout */
> -			wait_for_completion_timeout(&acomp->master_bind_complete,
> -						    msecs_to_jiffies(60 * 1000));
> +			/* max 60s timeout */
> +			for (i = 0; !wait && i < 60; i++)
> +				wait = wait_for_completion_timeout(&acomp->master_bind_complete,
> +								   msecs_to_jiffies(1000));
>   		}
>   	}
>   	if (!acomp->ops) {
> 
> base-commit: fd7698cf0858f8c5e659b655109cd93c2f15cdd3

