Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4D63EBF5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 10:06:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C52D168F;
	Thu,  1 Dec 2022 10:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C52D168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669885587;
	bh=v7Pv5GvsnRCoGfNqd6OZfahTWZAr3UlME0JbK+tDt9s=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mT5QkzIA9BWva6jJ3STOYImAabQOQCEdT4siitsF6aKi1sVuh9KPVPYFOk4y4sBOM
	 rqfp/K0mEro+PtHA2XQ5eq0jJS5rFsoQ1E0xfqrgtDK9ot8Oi/8jVDkWkM/e5p+jhf
	 a5xin35GQWKrjQV1PBSRQ4p8LIwferA6L5bUYt+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01690F804B1;
	Thu,  1 Dec 2022 10:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ACFBF8028D; Thu,  1 Dec 2022 10:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1E6F80118;
 Thu,  1 Dec 2022 10:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1E6F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SeLrwh6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669885461; x=1701421461;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=v7Pv5GvsnRCoGfNqd6OZfahTWZAr3UlME0JbK+tDt9s=;
 b=SeLrwh6ii4HX9PdPE7n8vKZe/Y6/voTtQdJtDv7e7nmm7EeYSa5V7Vsk
 KuC5U4ryTjgkGypDaUvszLSTUSMl2xopJntL0sFG6dE1sq8qTYpFM+oGV
 +YDsQVTai95igs8V7bz0RRmMlsOWueLcnUKPuggBXxQ3gfFgi/U7ia0VO
 kGDOBeHU79hPJaX3RtvkAlAZbGtTUaiXHN89WMH1Q3wUUSb9FuKnVpGVl
 LDDvFiXl7UfPNrJAqrsi2IduSwoCtbAN0Q98KKTKMYRpQ78cD4JAbJB6K
 mu+YMKu7o9NkVNVIiNkFQS1/PRM3jOknafCht0ucgTZdTGyTVOQiT5tFM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="317492460"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="317492460"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:04:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="750716088"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="750716088"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:03:59 -0800
Date: Thu, 1 Dec 2022 11:03:46 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v7 2/2] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
In-Reply-To: <20221127-snd-freeze-v7-2-127c582f1ca4@chromium.org>
Message-ID: <alpine.DEB.2.22.394.2212011053540.3532114@eliteleevi.tm.intel.com>
References: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
 <20221127-snd-freeze-v7-2-127c582f1ca4@chromium.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kexec@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Chromeos Kdump <chromeos-kdump@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, stable@vger.kernel.org,
 sound-open-firmware@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>
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

On Wed, 30 Nov 2022, Ricardo Ribalda wrote:

> During kexec(), the userspace might frozen. Therefore we cannot wait
> for it to complete.
[...]
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -9,6 +9,7 @@
>  //
>  
>  #include <linux/firmware.h>
> +#include <linux/kexec.h>
>  #include <linux/module.h>
>  #include <sound/soc.h>
>  #include <sound/sof.h>
> @@ -484,7 +485,8 @@ int snd_sof_device_shutdown(struct device *dev)
>  	 * make sure clients and machine driver(s) are unregistered to force
>  	 * all userspace devices to be closed prior to the DSP shutdown sequence
>  	 */
> -	sof_unregister_clients(sdev);
> +	if (!kexec_with_frozen_processes())
> +		sof_unregister_clients(sdev);
>  
>  	snd_sof_machine_unregister(sdev, pdata);

I think the case you hit was specifically snd_card_disconnect_sync() that 
gets called via snd_sof_machine_unregister(), right, so you'd have to skip 
both sof_unregister_clients() and the machine_unregister().

Skipping ok might be an ok solution here. There's clearly a problem and we 
cannot just drop these calls in the general case (when we are going to 
S5), but in the specific case of kexec, this is probably safe. And I agree 
one way or another this needs to be fixed. Pierre and others what do you 
think?

Br, Kai
