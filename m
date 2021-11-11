Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B144DB40
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 18:48:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA7B1666;
	Thu, 11 Nov 2021 18:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA7B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636652911;
	bh=7/lkSEIi4mVVhkjaMWePBv8p9oFx/ReZV4Bk9YfoUbE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B31FhjixRZrlgsBY9YUccf3VVE1quuIANU6YHRuGeTwQ3WVJ7HgrwGpJoQaSweCtM
	 FkD1iYafiIPui6aEQ8LZ4eBtWY2mdH7YiIXOtFUIwKVqp7vt2EdAXiBT14bc6KM8Wj
	 EZ++V5T7MI1BQSa5a9BmexF1EmEZRqUsTwaf72Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8DEF80086;
	Thu, 11 Nov 2021 18:47:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56631F802D2; Thu, 11 Nov 2021 18:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD28DF800C1
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 18:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD28DF800C1
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220186477"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="220186477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 09:46:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="602695718"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 09:46:57 -0800
Date: Thu, 11 Nov 2021 19:39:36 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: fix general protection fault in
 azx_runtime_idle
In-Reply-To: <s5h1r3m6csi.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2111111920450.3554566@eliteleevi.tm.intel.com>
References: <20211110210307.1172004-1-kai.vehmanen@linux.intel.com>
 <s5hzgqb65h0.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2111110015250.3554566@eliteleevi.tm.intel.com>
 <s5h1r3m6csi.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, mahesh.meena@intel.com
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

Hi,

On Thu, 11 Nov 2021, Takashi Iwai wrote:

> A potential problem with the current code is that it doesn't disable
> the runtime PM at the release procedure.  Could you try the patch
> below?  You can put WARN_ON(!chip) at azx_runtime_idle(), too, for
> catching the invalid runtime call.
[...]
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1347,8 +1347,13 @@ static void azx_free(struct azx *chip)
>  	if (hda->freed)
>  		return;
>  
> -	if (azx_has_pm_runtime(chip) && chip->running)
> +	if (azx_has_pm_runtime(chip) && chip->running) {
>  		pm_runtime_get_noresume(&pci->dev);
> +		pm_runtime_forbid(&pci->dev);
> +		pm_runtime_dont_use_autosuspend(&pci->dev);
> +		pm_runtime_disable(&pci->dev);
> +	}
> +
>  	chip->running = 0;

Tested with next-20211019 (first next tag where I've seen test failures) 
and your patch, and this seems to do the trick. I didn't have my drvdata 
patch included when I ran the test. No rpm_idle() calls 
anymore after azx_remove(), so the bug is not hit.

>  	azx_del_card_list(chip);
> @@ -2320,6 +2325,7 @@ static int azx_probe_continue(struct azx *chip)
>  	set_default_power_save(chip);
>  
>  	if (azx_has_pm_runtime(chip)) {
> +		pm_runtime_enable(&pci->dev);
>  		pm_runtime_use_autosuspend(&pci->dev);

This does generate warnings
[   13.495059] snd_hda_intel 0000:00:1f.3: Unbalanced pm_runtime_enable!

And later
[   54.770701] Enabling runtime PM for inactive device (0000:00:1f.3) with active children
[   54.770718] WARNING: CPU: 0 PID: 10 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0x98/0xb0

Adding a "pm_runtime_set_active(&pci->dev)" to both azx_free() and 
azx_probe_continue() seems to help and fix still works.

Br, Kai
