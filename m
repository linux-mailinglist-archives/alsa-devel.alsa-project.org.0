Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1EC57669F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 20:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26DD1825;
	Fri, 15 Jul 2022 20:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26DD1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657909063;
	bh=9rlnQNRcwnBVxMSyW59wfkr1i31mCoDreu2jF/XyTAQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cXqcWxTGXQwTqZs6c3hZsV4H4zkhiptFlC3ejqCcBe1mwhlBdjs81M2QgzLeSzLll
	 IaAx5dITaah6yyDKdbAv7Od7NUyO7uceTZOrVfDLOzeMhXbSgO4UddOXFpb9d07Z8D
	 fzJlfko70zsPhjEl/S3WeZ4Ri1c4+m14AVfzGWUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57989F800AA;
	Fri, 15 Jul 2022 20:16:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D1DDF8015B; Fri, 15 Jul 2022 20:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7034AF800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 20:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7034AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RtdgCHHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657908995; x=1689444995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9rlnQNRcwnBVxMSyW59wfkr1i31mCoDreu2jF/XyTAQ=;
 b=RtdgCHHwR/4/WsBnFEAGI0/LF9PZgcS+TIuk/RyOw+Z8mEqT7qQ4S4T5
 085ri7kG+exwRBRKDuvpKnAcVRW04Cfye7/YOObHnc0Q3tXbnz+t3Oh6q
 0DIDzb/Gy23SPy7yyPrmczO+X1NOTqZVePNINMXPFyiWMn092ggUes4Ry
 dMh0hav9EjfBZE174QZ//Esxe1PiASLW3LZLo2ZKs4GwB0ZBNU+kkFIpi
 aRX2THwVfRdChDAVXZB3hYH+2cTLyMh/5LVaBeuyZGqUwFIVLnToCZ9Bo
 ub1HumLE+fAiEFf8N5LEWq4A4u+iCoE1jUD/sdvReiG43a4FOze2A37qh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="287008108"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="287008108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 11:16:16 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="723175312"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO [10.212.14.184])
 ([10.212.14.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 11:16:15 -0700
Message-ID: <3c40df55-3aee-1e08-493b-7b30cd84dc00@linux.intel.com>
Date: Fri, 15 Jul 2022 13:16:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 6/9] ALSA: hda: Fix page fault in snd_hda_codec_shutdown()
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.com
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-7-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220706120230.427296-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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



On 7/6/22 07:02, Cezary Rojewski wrote:
> If early probe of HDAudio bus driver fails e.g.: due to missing
> firmware file, snd_hda_codec_shutdown() ends in manipulating
> uninitialized codec->pcm_list_head causing page fault.
> 
> Iinitialization of HDAudio codec in ASoC is split in two:
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
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

This patch causes an across-the-board regression on all SOF platforms
using an HDaudio or iDISP codec. Only 'nocodec' platforms are
unaffected, see results at
https://sof-ci.01.org/linuxpr/PR3763/build394/devicetest/

Reverting this commit seems to fix the issue.

Upstream merge:
https://github.com/thesofproject/linux/pull/3763

Issue and bisect results
https://github.com/thesofproject/linux/issues/3764

I don't know what this was supposed to fix on the shutdown path but it's
clearly having side effects on the probe/init path.

> ---
>  sound/pci/hda/hda_codec.c | 41 +++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index 75e85bf58681..677d0a78f19c 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -930,8 +930,28 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
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
> @@ -984,29 +1004,8 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
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
