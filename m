Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58705AE003
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 22:43:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA88E1668;
	Mon,  9 Sep 2019 22:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA88E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568061816;
	bh=0vHYmi+Ia7x4C2HT9LVlH1YGfHPCWleWABkC2dO2gUc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkyNZLtuo6Znz0QT0AlGP6ifTRnQhRAHEau2gcFnR0GEKei7ttlLA5Svejdz9MpUU
	 q0sjynpPyhwvPoveBzCJy2ZrZggQSjwftBt23NGEf/C96d9zOgvXhHaqluzw+RBE25
	 NyK8wfLs02MQckWCmNkw8AT5GqGOdE4bJQRCxsxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB02FF804FD;
	Mon,  9 Sep 2019 22:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C64F80323; Mon,  9 Sep 2019 22:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C1AFF80094
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 22:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1AFF80094
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 13:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="268191536"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 09 Sep 2019 13:38:59 -0700
Received: from wkhong-mobl2.amr.corp.intel.com (unknown [10.255.34.248])
 by linux.intel.com (Postfix) with ESMTP id 16E405807F9;
 Mon,  9 Sep 2019 13:38:57 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20190909195159.3326134-1-arnd@arndb.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3b69e0ec-63cb-4888-9faa-acb7638d71dc@linux.intel.com>
Date: Mon, 9 Sep 2019 15:38:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909195159.3326134-1-arnd@arndb.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: work around
 snd_hdac_aligned_read link failure
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

On 9/9/19 2:51 PM, Arnd Bergmann wrote:
> When CONFIG_SND_HDA_ALIGNED_MMIO is selected by another driver
> (i.e. Tegra) that selects CONFIG_SND_HDA_CORE as a loadable
> module, but SND_SOC_SOF_HDA_COMMON is built-in, we get a
> link failure from some functions that access the hda register:
> 
> sound/soc/sof/intel/hda.o: In function `hda_ipc_irq_dump':
> hda.c:(.text+0x784): undefined reference to `snd_hdac_aligned_read'
> sound/soc/sof/intel/hda-stream.o: In function `hda_dsp_stream_threaded_handler':
> hda-stream.c:(.text+0x12e4): undefined reference to `snd_hdac_aligned_read'
> hda-stream.c:(.text+0x12f8): undefined reference to `snd_hdac_aligned_write'
> 
> Add an explicit 'select' statement as a workaround. This is
> not a great solution, but it's the easiest way I could come
> up with.

Thanks for spotting this, I don't think anyone on the SOF team looked at 
this. Maybe we can filter with depends on !TEGRA or 
!SND_HDA_ALIGNED_MMIO at the SOF Intel top-level instead?

If you can share your config off-list I can try to simplify this further.

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/sof/intel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 479ba249e219..9180184026e1 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -248,6 +248,7 @@ config SND_SOC_SOF_HDA_COMMON
>   	tristate
>   	select SND_SOC_SOF_INTEL_COMMON
>   	select SND_SOC_SOF_HDA_LINK_BASELINE
> +	select SND_HDA_CORE if SND_HDA_ALIGNED_MMIO
>   	help
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
