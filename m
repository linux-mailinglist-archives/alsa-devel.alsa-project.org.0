Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559E23AA84
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 18:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990541663;
	Mon,  3 Aug 2020 18:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990541663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596472411;
	bh=9QyDcjGpQo7jn4gABs+/RWSqVFRW/Sjv+0tYXIWgIx4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cU5yZ1YsyJ4Mo2I4K01bGaFQ1EWf8PPspCkLdZYpRBx+JhYX96e4M2FexNmcwXjaV
	 aI0/jKx+htM+42/IroEPoALuDqXpISNIUcGxIcICr63YVK8s/0SKKt27vrshJwSrK9
	 Gibk/jLH4Eb45ZMd9UTdb1449kJ9prN2GIkh+KjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129B6F80259;
	Mon,  3 Aug 2020 18:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACBB3F80218; Mon,  3 Aug 2020 18:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37A38F801F7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 18:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A38F801F7
IronPort-SDR: RgfieBdSVCt67TUebudQX94WwSf8JNHh7ZKFG/R0lwM2w2qT6z+QyFJh1EQjvlHvTBxkr2CCRh
 apJGEkOEzd8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="140078788"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="140078788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 09:30:42 -0700
IronPort-SDR: aPqtZPAbukrGaO0VjBpclcqc6FoDcQQVprCkGldxPYo3FkJW5044mbUsE2KR0jSU2sROR4ItC9
 /BjGdYdaHMTA==
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; d="scan'208";a="274054350"
Received: from ksramesh-mobl.amr.corp.intel.com (HELO [10.252.128.191])
 ([10.252.128.191])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 09:30:41 -0700
Subject: Re: [PATCH] Revert "ALSA: hda: call runtime_allow() for all hda
 controllers"
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20200803064638.6139-1-hui.wang@canonical.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0db4f5fe-7895-2d00-8ce3-96f1245000ab@linux.intel.com>
Date: Mon, 3 Aug 2020 10:27:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803064638.6139-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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



On 8/3/20 1:46 AM, Hui Wang wrote:
> This reverts commit 9a6418487b56 ("ALSA: hda: call runtime_allow()
> for all hda controllers").
> 
> The reverted patch already introduced some regressions on some
> machines:
>   - on gemini-lake machines, the error of "azx_get_response timeout"
>     happens in the hda driver.
>   - on the machines with alc662 codec, the audio jack detection doesn't
>     work anymore.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208511
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/pci/hda/hda_intel.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index e699873c8293..e34a4d5d047c 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2352,7 +2352,6 @@ static int azx_probe_continue(struct azx *chip)
>   
>   	if (azx_has_pm_runtime(chip)) {
>   		pm_runtime_use_autosuspend(&pci->dev);
> -		pm_runtime_allow(&pci->dev);
>   		pm_runtime_put_autosuspend(&pci->dev);
>   	}

Do I get this right that this permanently disables pm_runtime on all 
Intel HDaudio controllers?

