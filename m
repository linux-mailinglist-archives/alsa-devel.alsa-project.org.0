Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F322F74A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 20:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1218516A0;
	Mon, 27 Jul 2020 20:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1218516A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595873225;
	bh=SW8556s/Sql2Sdx7dBoywa8oBTAdi94qyw0Xkhi4sWM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIdtv+C0oahSfm5AeV9Y3hjW49roxL66NQYxbGqI7Arz/9LYyEucO2ISwC3GmcgfG
	 hDA2DAvNqHrCh0qOxzE+BdCKVXVggC46moCf4qgD6HBnhp/H8vUVtAh1YlGZv0jwBm
	 sd+NLdZEhz1LQvgcrGvIJoDMpMZN+0+WJpgnIOnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD74F8013C;
	Mon, 27 Jul 2020 20:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CDFF80171; Mon, 27 Jul 2020 20:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9169F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 20:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9169F8013C
IronPort-SDR: Yuji7rXxc9mQrrtyqTkDj0EB6AMzEObM9Tu/RRe1jkHdt/s1KLUb98aL7uJ7SsLezyZNe+0TEC
 i5NFXAfzcwuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="235948483"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="235948483"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:05:08 -0700
IronPort-SDR: gRkhWGoMtwk5AWqvFA8+AivguboLUr7BpOdCPPsfXbreJqCszLpKPToeB7c+4z9LJR/vr6vrF4
 CHKeuG3jHL/Q==
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="464149097"
Received: from pdewan-mobl1.amr.corp.intel.com (HELO [10.255.228.220])
 ([10.255.228.220])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:05:08 -0700
Subject: Re: [PATCH] ALSA: hda: Workaround for spurious wakeups on some Intel
 platforms
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200727164443.4233-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad7b6d05-4266-a04e-5d21-31fb835a7d95@linux.intel.com>
Date: Mon, 27 Jul 2020 13:05:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727164443.4233-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 7/27/20 11:44 AM, Takashi Iwai wrote:
> We've received a regression report on Intel HD-audio controller that
> wakes up immediately after S3 suspend.  The bisection leads to the
> commit c4c8dd6ef807 ("ALSA: hda: Skip controller resume if not
> needed").  This commit replaces the system-suspend to use
> pm_runtime_force_suspend() instead of the direct call of
> __azx_runtime_suspend().  However, by some really mysterious reason,
> pm_runtime_force_suspend() causes a spurious wakeup (although it calls
> the same __azx_runtime_suspend() internally).

Right, but __azx_runtime_suspend() is called after enabling a wake-up 
event, which is fine for pm_runtime but probably not so good for S3?

static int azx_runtime_suspend(struct device *dev)
{
	struct snd_card *card = dev_get_drvdata(dev);
	struct azx *chip;

	if (!azx_is_pm_ready(card))
		return 0;
	chip = card->private_data;

	/* enable controller wake up event */
	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0) {
		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
			   STATESTS_INT_MASK);
	}

	__azx_runtime_suspend(chip);
	trace_azx_runtime_suspend(chip);
	return 0;
}



> 
> As an ugly workaround for now, revert the behavior to call
> __azx_runtime_suspend() and __azx_runtime_resume() for those old Intel
> platforms that may exhibit such a problem, while keeping the new
> standard pm_runtime_force_suspend() and pm_runtime_force_resume()
> pair for the remaining chips.
> 
> Fixes: c4c8dd6ef807 ("ALSA: hda: Skip controller resume if not needed")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208649
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/pci/hda/hda_controller.h |  2 +-
>   sound/pci/hda/hda_intel.c      | 17 ++++++++++++++---
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
> index fe171685492d..be63ead8161f 100644
> --- a/sound/pci/hda/hda_controller.h
> +++ b/sound/pci/hda/hda_controller.h
> @@ -41,7 +41,7 @@
>   /* 24 unused */
>   #define AZX_DCAPS_COUNT_LPIB_DELAY  (1 << 25)	/* Take LPIB as delay */
>   #define AZX_DCAPS_PM_RUNTIME	(1 << 26)	/* runtime PM support */
> -/* 27 unused */
> +#define AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP (1 << 27) /* Workaround for spurious wakeups after suspend */
>   #define AZX_DCAPS_CORBRP_SELF_CLEAR (1 << 28)	/* CORBRP clears itself after reset */
>   #define AZX_DCAPS_NO_MSI64      (1 << 29)	/* Stick to 32-bit MSIs */
>   #define AZX_DCAPS_SEPARATE_STREAM_TAG	(1 << 30) /* capture and playback use separate stream tag */
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 9ba1fb8f0b7f..fb65450d8de1 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -297,7 +297,8 @@ enum {
>   /* PCH for HSW/BDW; with runtime PM */
>   /* no i915 binding for this as HSW/BDW has another controller for HDMI */
>   #define AZX_DCAPS_INTEL_PCH \
> -	(AZX_DCAPS_INTEL_PCH_BASE | AZX_DCAPS_PM_RUNTIME)
> +	(AZX_DCAPS_INTEL_PCH_BASE | AZX_DCAPS_PM_RUNTIME |\
> +	 AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
>   
>   /* HSW HDMI */
>   #define AZX_DCAPS_INTEL_HASWELL \
> @@ -1026,7 +1027,14 @@ static int azx_suspend(struct device *dev)
>   	chip = card->private_data;
>   	bus = azx_bus(chip);
>   	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
> -	pm_runtime_force_suspend(dev);
> +	/* An ugly workaround: direct call of __azx_runtime_suspend() and
> +	 * __azx_runtime_resume() for old Intel platforms that suffer from
> +	 * spurious wakeups after S3 suspend
> +	 */
> +	if (chip->driver_caps & AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
> +		__azx_runtime_suspend(chip);
> +	else
> +		pm_runtime_force_suspend(dev);
>   	if (bus->irq >= 0) {
>   		free_irq(bus->irq, chip);
>   		bus->irq = -1;
> @@ -1055,7 +1063,10 @@ static int azx_resume(struct device *dev)
>   	if (azx_acquire_irq(chip, 1) < 0)
>   		return -EIO;
>   
> -	pm_runtime_force_resume(dev);
> +	if (chip->driver_caps & AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
> +		__azx_runtime_resume(chip, false);
> +	else
> +		pm_runtime_force_resume(dev);
>   	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
>   
>   	trace_azx_resume(chip);
> 
