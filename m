Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0460CEFD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 16:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52D5502E;
	Tue, 25 Oct 2022 16:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52D5502E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666708189;
	bh=5lf9HXnuZmAIrUwqX/AP3lotJnWhdB2O4yFZG3cNmME=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfyCamIPgsmdxP2qh96EMDdq+ihpl73W/x8syrlQAyJchYDCZVBREbA9sNK0NY1bN
	 eUlm3wEyvJ3fpWyj7SCARdqGLpsYZt6cKEMNpvwjtg0bLburEDQTFjHcB73X/3CFHU
	 K+Trsq6v/NPZageryK7xwE2qMb1EgHRF1OYXSzo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F0FF80448;
	Tue, 25 Oct 2022 16:28:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DA2F80431; Tue, 25 Oct 2022 16:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20B92F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 16:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20B92F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BWSThaWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666708129; x=1698244129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5lf9HXnuZmAIrUwqX/AP3lotJnWhdB2O4yFZG3cNmME=;
 b=BWSThaWqj573VN9/tU3IFKuYzfBsFIj1ACjMnVDgbhaEw5dlws29uTK1
 eAYjRcgacplOby8zBFOQ46AdWCoNrrQpwZQMZgYtpDH6l4qmJoYvruxjL
 7U0U4EW4etFJQO9mrpJuOiUy/u5DxqHcuPVLkSKL7Yl8H/NBuNFgL+Tdj
 mIJx/VsKh7CHaKghs8JN/dvhYwEMdzGFmUkjbiqBs6j/OJGF1jqz5/Sy7
 G447yhwN46kuFk7DZvurkD79AbmL6YC/F20mzTVaAdxM1VNSje4QtTbgr
 1nsUVbfkvjp/tU2TDrmG2xRwEeBUdPrjU9xJc3cMDaPbSVq4shgbD5uAf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308783196"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="308783196"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 07:27:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="634116437"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="634116437"
Received: from pperezji-mobl.amr.corp.intel.com (HELO [10.212.98.192])
 ([10.212.98.192])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 07:27:32 -0700
Message-ID: <24d084e1-700d-da77-d93e-2d330aac2f63@linux.intel.com>
Date: Tue, 25 Oct 2022 09:27:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH AUTOSEL 6.0 07/44] ALSA: hda: Fix page fault in
 snd_hda_codec_shutdown()
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20221009234932.1230196-1-sashal@kernel.org>
 <20221009234932.1230196-7-sashal@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221009234932.1230196-7-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 mkumard@nvidia.com
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



On 10/9/22 18:48, Sasha Levin wrote:
> From: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> [ Upstream commit f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 ]

This commit on linux-stable seems to have broken a number of platforms.

6.0.2 worked fine.
6.0.3 does not

reverting this commit solves the problem, see
https://github.com/thesofproject/linux/issues/3960 for details.

Are we missing a prerequisite patch for this commit?


> If early probe of HDAudio bus driver fails e.g.: due to missing
> firmware file, snd_hda_codec_shutdown() ends in manipulating
> uninitialized codec->pcm_list_head causing page fault.
> 
> Initialization of HDAudio codec in ASoC is split in two:
> - snd_hda_codec_device_init()
> - snd_hda_codec_device_new()
> 
> snd_hda_codec_device_init() is called during probe_codecs() by HDAudio
> bus driver while snd_hda_codec_device_new() is called by
> codec-component's ->probe(). The second call will not happen until all
> components required by related sound card are present within the ASoC
> framework. With firmware failing to load during the PCI's deferred
> initialization i.e.: probe_work(), no platform components are ever
> registered. HDAudio codec enumeration is done at that point though, so
> the codec components became registered to ASoC framework, calling
> snd_hda_codec_device_init() in the process.
> 
> Now, during platform reboot snd_hda_codec_shutdown() is called for every
> codec found on the HDAudio bus causing oops if any of them has not
> completed both of their initialization steps. Relocating field
> initialization fixes the issue.
> 
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Link: https://lore.kernel.org/r/20220816111727.3218543-7-cezary.rojewski@intel.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/pci/hda/hda_codec.c | 41 +++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index 384426d7e9dd..4ae8b9574778 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -931,8 +931,28 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
>  	}
>  
>  	codec->bus = bus;
> +	codec->depop_delay = -1;
> +	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
> +	codec->core.dev.release = snd_hda_codec_dev_release;
> +	codec->core.exec_verb = codec_exec_verb;
>  	codec->core.type = HDA_DEV_LEGACY;
>  
> +	mutex_init(&codec->spdif_mutex);
> +	mutex_init(&codec->control_mutex);
> +	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
> +	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
> +	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
> +	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
> +	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
> +	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
> +	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
> +	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
> +	INIT_LIST_HEAD(&codec->conn_list);
> +	INIT_LIST_HEAD(&codec->pcm_list_head);
> +	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
> +	refcount_set(&codec->pcm_ref, 1);
> +	init_waitqueue_head(&codec->remove_sleep);
> +
>  	return codec;
>  }
>  EXPORT_SYMBOL_GPL(snd_hda_codec_device_init);
> @@ -985,29 +1005,8 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
>  	if (snd_BUG_ON(codec_addr > HDA_MAX_CODEC_ADDRESS))
>  		return -EINVAL;
>  
> -	codec->core.dev.release = snd_hda_codec_dev_release;
> -	codec->core.exec_verb = codec_exec_verb;
> -
>  	codec->card = card;
>  	codec->addr = codec_addr;
> -	mutex_init(&codec->spdif_mutex);
> -	mutex_init(&codec->control_mutex);
> -	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
> -	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
> -	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
> -	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
> -	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
> -	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
> -	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
> -	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
> -	INIT_LIST_HEAD(&codec->conn_list);
> -	INIT_LIST_HEAD(&codec->pcm_list_head);
> -	refcount_set(&codec->pcm_ref, 1);
> -	init_waitqueue_head(&codec->remove_sleep);
> -
> -	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
> -	codec->depop_delay = -1;
> -	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
>  
>  #ifdef CONFIG_PM
>  	codec->power_jiffies = jiffies;
