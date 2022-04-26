Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11110510C06
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B258F173C;
	Wed, 27 Apr 2022 00:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B258F173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011948;
	bh=RzvBlYdy+ddNr5PMtaZ70BBddqA9WRgKj63nVnlbPmU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shulrd7kf6G6OMJU0oxN61fEYX7hG9T9G0kqK9of4vL6cDqiIvrKSSBXV87EAFr2j
	 nm6Vt0aRjExv8pe/R17Zc7FCRBI7vLaU5/jakQF+bjqVSf7D3hQ7GnFJfxEuFP4rNV
	 53pbtPKWYj60KPaFcwlG3SZ0HmHCk4HmXwweTOB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8224DF8052E;
	Wed, 27 Apr 2022 00:23:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B2DF80152; Wed, 27 Apr 2022 00:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C430BF80171
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C430BF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Nop9WLCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011802; x=1682547802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RzvBlYdy+ddNr5PMtaZ70BBddqA9WRgKj63nVnlbPmU=;
 b=Nop9WLCaEmj6+uM6jj/FYYMBLjUv+qlUzd5sHvlYJpZ2IY2+V7csgG95
 t62UcPpDDFFEzjyud2flssFZIcdq+HuL8TgwzwfOt4ZjOTjKoWPTOWx4E
 RLZvvQPLyCM0HPvd0JUvCUZRXQU8YyI2fvoorFeVNJNenaJ8BG9JPeGdL
 mqNT7bBzhfBCms4s5C6JV/l6BoxljpXCnqkFmaH4gMWnDJeOGIuepzlJl
 cmt3mxJy7F9ZtLIKrg9hcslrreOYBNZtwUpLjNfvKPEa4Yc3HvQwP7T1t
 mEdWxNZ2C3XPYsNpk2gMKbRUNb4DiPmtkIuMZnzOOQTrt25TevHHaakhC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660720"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660720"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888614"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:16 -0700
Message-ID: <d80075c7-3658-52e0-b09f-35182961d5df@linux.intel.com>
Date: Tue, 26 Apr 2022 16:53:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 06/14] ASoC: Intel: avs: Coredump and recovery flow
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-7-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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



On 4/26/22 12:23, Cezary Rojewski wrote:
> In rare occassions, under stress conditions or hardware malfunction, DSP

occasions

> firmware may fail. Software is notified about such situation with
> EXCEPTION_CAUGHT notification. IPC timeout is also counted as critical
> device failure. More often than not, driver can recover from such
> situations by performing full reset: killing and restarting ADSP.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/Kconfig        |  1 +
>  sound/soc/intel/avs/avs.h      |  4 ++
>  sound/soc/intel/avs/ipc.c      | 95 +++++++++++++++++++++++++++++++++-
>  sound/soc/intel/avs/messages.h |  5 ++
>  4 files changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index c364ddf22267..05ad6bdecfc5 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -218,6 +218,7 @@ config SND_SOC_INTEL_AVS
>  	select SND_HDA_EXT_CORE
>  	select SND_HDA_DSP_LOADER
>  	select SND_INTEL_NHLT
> +	select WANT_DEV_COREDUMP
>  	help
>  	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
>  	  capabilities. This includes Skylake, Kabylake, Amberlake and
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index e628f78d1864..02c2aa1bcd5c 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -42,6 +42,7 @@ struct avs_dsp_ops {
>  	int (* const load_basefw)(struct avs_dev *, struct firmware *);
>  	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
>  	int (* const transfer_mods)(struct avs_dev *, bool, struct avs_module_entry *, u32);
> +	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
>  };
>  
>  #define avs_dsp_op(adev, op, ...) \
> @@ -164,12 +165,15 @@ struct avs_ipc {
>  	struct avs_ipc_msg rx;
>  	u32 default_timeout_ms;
>  	bool ready;
> +	bool recovering;
>  
>  	bool rx_completed;
>  	spinlock_t rx_lock;
>  	struct mutex msg_mutex;
>  	struct completion done_completion;
>  	struct completion busy_completion;
> +
> +	struct work_struct recovery_work;
>  };
>  
>  #define AVS_EIPC	EREMOTEIO
> diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
> index 68aaf01edbf2..84cb411c82fa 100644
> --- a/sound/soc/intel/avs/ipc.c
> +++ b/sound/soc/intel/avs/ipc.c
> @@ -14,6 +14,87 @@
>  
>  #define AVS_IPC_TIMEOUT_MS	300
>  
> +static void avs_dsp_recovery(struct avs_dev *adev)
> +{
> +	struct avs_soc_component *acomp;
> +	unsigned int core_mask;
> +	int ret;
> +
> +	if (adev->ipc->recovering)
> +		return;
> +	adev->ipc->recovering = true;

don't you need some sort of lock to test/clear this flag?

> +
> +	mutex_lock(&adev->comp_list_mutex);
> +	/* disconnect all running streams */
> +	list_for_each_entry(acomp, &adev->comp_list, node) {
> +		struct snd_soc_pcm_runtime *rtd;
> +		struct snd_soc_card *card;
> +
> +		card = acomp->base.card;
> +		if (!card)
> +			continue;
> +
> +		for_each_card_rtds(card, rtd) {
> +			struct snd_pcm *pcm;
> +			int dir;
> +
> +			pcm = rtd->pcm;
> +			if (!pcm || rtd->dai_link->no_pcm)
> +				continue;
> +
> +			for_each_pcm_streams(dir) {
> +				struct snd_pcm_substream *substream;
> +
> +				substream = pcm->streams[dir].substream;
> +				if (!substream || !substream->runtime)
> +					continue;
> +
> +				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
> +			}
> +		}
> +	}
> +	mutex_unlock(&adev->comp_list_mutex);
> +
> +	/* forcibly shutdown all cores */
> +	core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
> +	avs_dsp_core_disable(adev, core_mask);
> +
> +	/* attempt dsp reboot */
> +	ret = avs_dsp_boot_firmware(adev, true);
> +	if (ret < 0)
> +		dev_err(adev->dev, "dsp reboot failed: %d\n", ret);
> +
> +	pm_runtime_mark_last_busy(adev->dev);
> +	pm_runtime_enable(adev->dev);
> +	pm_request_autosuspend(adev->dev);

there are zero users of this routine in the entire sound/ tree, can you clarify why this is needed or what you are trying to do?

> +
> +	adev->ipc->recovering = false;
> +}
