Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4C10EEB0
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:43:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6A61165E;
	Mon,  2 Dec 2019 18:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6A61165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575308633;
	bh=H7e51Mheg3sWjLDoB5FqyFwPrNwzFcls/ZTlmACx0Ss=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQ6S2j301KOtBPLmGMf8xX+HtKVSqeI6zRtc3ZcW+wgZGAS3rwZOzEsMJ6zy+aG8v
	 XfLPfD4XPjVI9s0RZo3uJeCXonk9lZMpfxTSpO+IHhcachP2YMWyYQlaPiWNunOqqK
	 QkXJ3VasCCEvuJ714EhGLKpTTQhssK/dMX11LpLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 881F2F80240;
	Mon,  2 Dec 2019 18:40:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678CEF8023F; Mon,  2 Dec 2019 18:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D23C1F800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D23C1F800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 09:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="208164928"
Received: from svedurlx-mobl.amr.corp.intel.com (HELO [10.251.129.241])
 ([10.251.129.241])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2019 09:40:26 -0800
To: YueHaibing <yuehaibing@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 gregkh@linuxfoundation.org, allison@lohutok.net, tglx@linutronix.de,
 alexios.zavras@intel.com
References: <20191128135853.8360-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <62e5bb2c-14a9-66d0-c89e-c38b5550fb86@linux.intel.com>
Date: Mon, 2 Dec 2019 11:32:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191128135853.8360-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: sst: Add missing include
 <linux/io.h>
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



On 11/28/19 7:58 AM, YueHaibing wrote:
> Fix build error:
> 
> sound/soc/intel/atom/sst/sst.c: In function intel_sst_interrupt_mrfld:
> sound/soc/intel/atom/sst/sst.c:93:5: error: implicit declaration of function memcpy_fromio;
>   did you mean memcpy32_fromio? [-Werror=implicit-function-declaration]
>       memcpy_fromio(msg->mailbox_data,
>       ^~~~~~~~~~~~~
>       memcpy32_fromio
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

that looks legit, we had similar reports for SoundWire.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/atom/sst/sst.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
> index fbecbb7..68bcec5 100644
> --- a/sound/soc/intel/atom/sst/sst.c
> +++ b/sound/soc/intel/atom/sst/sst.c
> @@ -14,6 +14,7 @@
>   #include <linux/module.h>
>   #include <linux/fs.h>
>   #include <linux/interrupt.h>
> +#include <linux/io.h>
>   #include <linux/firmware.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_qos.h>
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
