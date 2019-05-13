Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF061B8CB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 16:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C0916EF;
	Mon, 13 May 2019 16:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C0916EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557758610;
	bh=cN+a7Ag6m8b8DIz3100Y2i5weDHC4Zh5Sh6+GO8ulg4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csE4x2exqWZSvO5SxW+gjV0vk4grIQqMXlEdzTe5NlFAl1kyyEmONOAuxXoDhAwL6
	 /r8Hsz8yBbZtc7rDJztGnSsb8JyVfBDH3GzA/iPS2vkyXlrs8HRO79HCnYuUkqkgVq
	 IgwyNtpxvp2XGNq63qtQPDYR5UU2l9f5XQmSr5rU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796C2F89633;
	Mon, 13 May 2019 16:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE19CF8968A; Mon, 13 May 2019 16:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827A2F8961A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 16:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827A2F8961A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 07:41:35 -0700
X-ExtLoop1: 1
Received: from younghwa-mobl.amr.corp.intel.com (HELO [10.254.176.76])
 ([10.254.176.76])
 by fmsmga005.fm.intel.com with ESMTP; 13 May 2019 07:41:34 -0700
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20190510102559.76137-1-yuhsuan@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bb4f797a-9719-ec77-629c-46622c6fc2ea@linux.intel.com>
Date: Mon, 13 May 2019 08:31:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510102559.76137-1-yuhsuan@chromium.org>
Content-Language: en-US
Cc: cychiang@chromium.org, alsa-devel@alsa-project.org, dgreid@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98090: remove 24-bit format
	support
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



On 5/10/19 5:25 AM, Yu-Hsuan Hsu wrote:
> Remove 24-bit format support because it doesn't work now. We can revert
> this change after it really supports.
> (https://patchwork.kernel.org/patch/10783561/)
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

As discussed in the previous thread, the data sheet explicitly mentions 
24 bit support for the input in RJ mode. It'd be odd to remove support 
for 24 bits without clarifying in which modes it's not supported.

Also you'd need to clarify which platform you tested on, there are known 
issues with Maxim devices when using e.g. a 19.2 MHz clock and trailing 
bits (25-bit slots with 24-bit data).

> ---
>   sound/soc/codecs/max98090.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index 7619ea31ab50..b25b7efa9118 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -2313,7 +2313,7 @@ int max98090_mic_detect(struct snd_soc_component *component,
>   EXPORT_SYMBOL_GPL(max98090_mic_detect);
>   
>   #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
> -#define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
> +#define MAX98090_FORMATS SNDRV_PCM_FMTBIT_S16_LE
>   
>   static const struct snd_soc_dai_ops max98090_dai_ops = {
>   	.set_sysclk = max98090_dai_set_sysclk,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
