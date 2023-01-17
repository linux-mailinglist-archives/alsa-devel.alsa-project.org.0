Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50366E2B8
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 16:49:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740D269EC;
	Tue, 17 Jan 2023 16:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740D269EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673970564;
	bh=aQNnCgCTCv7oYi79GibXtLZZMfELsbt+tuXGwSNhq/s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MqNVvDrEYcHP5xFJ9hzVYv/TuA28QHVJ40E4D/iB+qzrmMjBrvqLo7POGYUbmCbRk
	 4Gn+LV7UHlx2OIS/+Qbh/4i3NrQyqF2CjKs+AqxCV5LVK6qLzwtFp253uLkrsC7wD6
	 RwBM056a0vH48dc7+t5Y8OuPsZMkfflvBp+smjYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B43ABF804E6;
	Tue, 17 Jan 2023 16:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123ABF8047B; Tue, 17 Jan 2023 16:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B6DF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 16:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B6DF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J8pXYJ2m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673970509; x=1705506509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aQNnCgCTCv7oYi79GibXtLZZMfELsbt+tuXGwSNhq/s=;
 b=J8pXYJ2mzKgxXTZrtYPH6dEk0aPswYRKiqgxjgsOb1SV1gYcd3xuYKSU
 BoYIA1rsO4MQ3ARSBwPHBCCtFCutblpVhh31DQQKFVDn4SJVccZZvGBlw
 PICQc4UUKltUSewAfy5BFNL4jupHoT8aVWlC7uPiyqaR8QURciPtzLIjC
 5+QwFkTJjj4hCR78boz5wrKVakZ9zxPI7OlZIWZoSZQJ6/3LvxxCV+BMm
 YLU67ileSy3wYsDcUAO1dihEZcu9/2tjmHWJMWztk54i6MIwsxBKGvltO
 LNvd5y91+/aRjByrSudOAWHboHvCiqfK1ys7CRficzWjkVIjJ8X4WuSlo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351972898"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="351972898"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 07:48:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801780631"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="801780631"
Received: from tdnguye2-mobl.amr.corp.intel.com (HELO [10.212.127.230])
 ([10.212.127.230])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 07:48:20 -0800
Message-ID: <c4c5c2b6-7a73-eea0-e249-73441a6434d7@linux.intel.com>
Date: Tue, 17 Jan 2023 09:48:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.com
References: <20230117154734.950487-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230117154734.950487-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/17/23 09:47, Cezary Rojewski wrote:
> Several functions that take part in codec's initialization and removal
> are re-used by ASoC codec drivers implementations. Drivers mimic the
> behavior of hda_codec_driver_probe/remove() found in
> sound/pci/hda/hda_bind.c with their component->probe/remove() instead.
> 
> One of the reasons for that is the expectation of
> snd_hda_codec_device_new() to receive a valid struct snd_card pointer
> what cannot be fulfilled on ASoC side until a card is attempted to be

very hard to follow.
Is there a spurious 'what' to be removed?
Or is there missing text?
Please consider rewording with simpler sentences.

> bound and its component probing is triggered.
> 
> As ASoC sound card may be unbound without codec device being actually
> removed from the system, unsetting ->preset in 
> snd_hda_codec_cleanup_for_unbind() interferes with module unload -> load
> scenario causing null-ptr-deref. Preset is assigned only once, during
> device/driver matching whereas ASoC codec driver's module reloading may
> occur several times throughout the lifetime of an audio stack.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> This is a continuation of a discussion that begun in the middle of 2022
> [1] and was part of a larger series addressing several HDAudio topics.
> 
> Single rmmod on ASoC's codec driver module is enough to cause a panic.
> Given our results, no regression shows up with modprobe/rmmod on
> snd_hda_intel side with this patch applied.
> 
> [1]: https://lore.kernel.org/alsa-devel/20220706120230.427296-2-cezary.rojewski@intel.com/
> 
>  sound/pci/hda/hda_codec.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index edd653ece70d..ac1cc7c5290e 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -795,7 +795,6 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
>  	snd_array_free(&codec->cvt_setups);
>  	snd_array_free(&codec->spdif_out);
>  	snd_array_free(&codec->verbs);
> -	codec->preset = NULL;
>  	codec->follower_dig_outs = NULL;
>  	codec->spdif_status_reset = 0;
>  	snd_array_free(&codec->mixers);
