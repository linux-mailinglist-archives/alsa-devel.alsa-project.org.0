Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6B63AE18
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C31716FB;
	Mon, 28 Nov 2022 17:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C31716FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669654229;
	bh=CgPF6MKTnegmRDmcI5KCYgm3Dojtw3BD/LAsoXreVzA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETyIXPTUjfDzxU6P9R+DFjNDLeXkXykyMclFI6xZz6s+iYYDhXPvKAf6SS8Q/v/Hg
	 4D72wMaZflWFandLFnt8u4AePDG2ULSCblPcJJX7vFVOC9Hmoqm8o7709p+Pw5Hr+Q
	 6sw8aiSCFl4d96kooioAznevdJ4fIveYk/IMBEvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D61F8024C;
	Mon, 28 Nov 2022 17:49:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E183AF8020D; Mon, 28 Nov 2022 17:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3574AF800B6;
 Mon, 28 Nov 2022 17:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3574AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RrQIQ22K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669654167; x=1701190167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CgPF6MKTnegmRDmcI5KCYgm3Dojtw3BD/LAsoXreVzA=;
 b=RrQIQ22K6wHOWCHhsV+Ixq9vWohvHTLxWhNivMgzDo0S8OIj/tM2EEvo
 q6XrRK4qPUZAYS/hSfCkp80K70/rJpmiUIPOjwoeI9XK6bY/IY4U9xH0a
 PhZ8TKtApPF6+ea79wRycPdVAuj/HMhCv580/HZX5g+ZDySsK0GV6tgLW
 s+Huvt5mHkhrKO3hVN6h//jSRMkF/2tjHrOwFTFUxlnTgK6boymkTarQ2
 leSllOo1Eu/KBmScTJ46akxeZE31Kua6IlhRHuyrhbjojgygmnka61szJ
 BEiAPIeEAWxhnZcadPEN3k91YZXwRchvGkqtqcJL+YDFiNVIF9JyjJ3a2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="379144202"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="379144202"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 08:49:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="768104564"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="768104564"
Received: from kschjaer-mobl.amr.corp.intel.com (HELO [10.212.114.246])
 ([10.212.114.246])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 08:49:21 -0800
Message-ID: <5171929e-b750-d2f1-fec9-b34d76c18dcb@linux.intel.com>
Date: Mon, 28 Nov 2022 10:49:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v4] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, sound-open-firmware@alsa-project.org
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



On 11/28/22 07:42, Ricardo Ribalda wrote:
> During kexec(), the userspace is frozen. Therefore we cannot wait for it
> to complete.
> 
> Avoid running snd_sof_machine_unregister during shutdown.
> 
> This fixes:
> 
> [   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) done.
> [  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 seconds.
> [  246.819035] Call Trace:
> [  246.821782]  <TASK>
> [  246.824186]  __schedule+0x5f9/0x1263
> [  246.828231]  schedule+0x87/0xc5
> [  246.831779]  snd_card_disconnect_sync+0xb5/0x127
> ...
> [  246.889249]  snd_sof_device_shutdown+0xb4/0x150
> [  246.899317]  pci_device_shutdown+0x37/0x61
> [  246.903990]  device_shutdown+0x14c/0x1d6
> [  246.908391]  kernel_kexec+0x45/0xb9
> 
> And:
> 
> [  246.893222] INFO: task kexec-lite:4891 blocked for more than 122 seconds.
> [  246.927709] Call Trace:
> [  246.930461]  <TASK>
> [  246.932819]  __schedule+0x5f9/0x1263
> [  246.936855]  ? fsnotify_grab_connector+0x5c/0x70
> [  246.942045]  schedule+0x87/0xc5
> [  246.945567]  schedule_timeout+0x49/0xf3
> [  246.949877]  wait_for_completion+0x86/0xe8
> [  246.954463]  snd_card_free+0x68/0x89
> ...
> [  247.001080]  platform_device_unregister+0x12/0x35
> 
> Cc: stable@vger.kernel.org
> Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> To: Liam Girdwood <lgirdwood@gmail.com>
> To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> To: Daniel Baluta <daniel.baluta@nxp.com>
> To: Mark Brown <broonie@kernel.org>
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc: sound-open-firmware@alsa-project.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> ---
> Changes in v4:
> - Do not call snd_sof_machine_unregister from shutdown.
> - Link to v3: https://lore.kernel.org/r/20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org
> 
> Changes in v3:
> - Wrap pm_freezing in a function
> - Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org
> 
> Changes in v2:
> - Only use pm_freezing if CONFIG_FREEZER 
> - Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org
> ---
>  sound/soc/sof/core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 3e6141d03770..9616ba607ded 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -475,19 +475,16 @@ EXPORT_SYMBOL(snd_sof_device_remove);
>  int snd_sof_device_shutdown(struct device *dev)
>  {
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> -	struct snd_sof_pdata *pdata = sdev->pdata;
>  
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>  		cancel_work_sync(&sdev->probe_work);
>  
>  	/*
> -	 * make sure clients and machine driver(s) are unregistered to force
> -	 * all userspace devices to be closed prior to the DSP shutdown sequence
> +	 * make sure clients are unregistered prior to the DSP shutdown
> +	 * sequence.
>  	 */
>  	sof_unregister_clients(sdev);
>  
> -	snd_sof_machine_unregister(sdev, pdata);
> -

The comment clearly says that we do want all userspace devices to be
closed. This was added in 83bfc7e793b5 ("ASoC: SOF: core: unregister
clients and machine drivers in .shutdown") precisely to avoid a platform
hang if the devices are used after the shutdown completes.

So you are not fixing 83bfc7e793b5, just re-adding a problem to fix
another one...
