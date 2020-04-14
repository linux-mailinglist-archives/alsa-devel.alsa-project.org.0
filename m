Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE271A818C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC401687;
	Tue, 14 Apr 2020 17:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC401687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586877077;
	bh=oFMy1k18mvmf4OUSUBrAoalbWKdnhowqEDmrwSF7/J8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvGNrgmqLlSplDQ/D2o1OkEUllM5bFEIiOBrL/ZwLPC/UrI7ccu2iHixGpnhzwtO5
	 x7ggQwq2Wf5mseD3EoJ/5EPKlEhIAHSzke3cDr7R2bsNRtBxnUBuBYS21XGBinNJ94
	 aH++B5nzFcDflA8n/D/jGD4qFzUZAjlmNlCPSBMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2FCBF802A1;
	Tue, 14 Apr 2020 16:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17483F802A0; Tue, 14 Apr 2020 16:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75637F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75637F800F5
IronPort-SDR: HAui0ScrFw/ipP2kYCbVwFlJ1+skFfpzJov1NPlJsFpM756YJV3i16mhci1WJZBwX4GcOkQUOf
 9noXTq/YQOzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 07:50:26 -0700
IronPort-SDR: oa2zvcLMiMYunwJX3n9IURpRxFu+jBxtLqXxgNWnLVssizVt+6mI3tJD51M0AcDg3FlHIzddx0
 hJZpPg6b0YGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="288238064"
Received: from bjkulkar-mobl.amr.corp.intel.com (HELO [10.212.152.71])
 ([10.212.152.71])
 by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2020 07:50:24 -0700
Subject: Re: [PATCH] ASoC: Intel: sst: ipc command timeout
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
Date: Tue, 14 Apr 2020 09:50:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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



On 4/10/20 3:18 AM, Brent Lu wrote:
> After sending an ipc command to DSP, the host waits for the reply message
> which will be read from SST_IPCD register in sst_byt_irq_thread() to
> complete the transaction. Sometimes the value read from SST_IPCD register
> is still the reply message for previous command instead of the waiting
> command so ipc command timeout happens.
> 
> In an experiment we read the same SST_IPCD register again when the defect
> happens and found the value of second read is different from previous one
> and is the correct reply message. It suggests the DSP is okay but the way
> we read the register may be the cause.
> 
> Currently the driver is using memcpy_fromio() to read the value of 64-bit
> registers. This function is based on __builtin_memcpy() call and depends
> on the implementation of compiler. Since this issue happens right after
> the toolchain switched from clang 10 to clang 11, we replace the register
> read with two readl() function calls to avoid all optimization from
> compiler's library.

I have mixed feelings about this.

One one hand, this looks simple enough.

But on the other hand we have other users of memcpy_fromio(), including 
SOF drivers, so what are the odds we have the same problems in other 
places? Wouldn't it be safer to either change this function so that it's 
behavior is not ambiguous or compiler-dependent, or fix the compiler?

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/common/sst-dsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/sst-dsp.c b/sound/soc/intel/common/sst-dsp.c
> index ec66be2..12af7aa 100644
> --- a/sound/soc/intel/common/sst-dsp.c
> +++ b/sound/soc/intel/common/sst-dsp.c
> @@ -42,7 +42,7 @@ u64 sst_shim32_read64(void __iomem *addr, u32 offset)
>   {
>   	u64 val;
>   
> -	memcpy_fromio(&val, addr + offset, sizeof(val));
> +	sst_memcpy_fromio_32(NULL, &val, addr + offset, sizeof(val));
>   	return val;
>   }
>   EXPORT_SYMBOL_GPL(sst_shim32_read64);
> 
