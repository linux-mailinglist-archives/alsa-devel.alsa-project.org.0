Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1ED2177F6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC9E16B1;
	Tue,  7 Jul 2020 21:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC9E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594150179;
	bh=ikF7IXJwMwLoetiK/VETF4x0VJvDPMI7CtwJJtRP8oM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odKpbkU0npD2bsW4+bwOqVNf6HJqCGQi0UNjghMDbTkO5pu7SpM3LzO19EDirGfqT
	 HreoB20GCKk91poWqCXQ3mNRiB/poBd+j6zGz0NyJ1kWiHi6/1QTeuUGSRxV+a59pn
	 +MAeN9U65EigEHhd65GLtXHqotO+RzfQHZw6IVro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FE6FF802BC;
	Tue,  7 Jul 2020 21:26:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34C36F80274; Tue,  7 Jul 2020 21:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AB5EF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB5EF8011F
IronPort-SDR: UIR2hbyR5pMtXhnrqMZS6C4Kfz6QiFxkMUHDZ4T3s68oeDVzZ16Z59nVFWiO4Lngs8wWa0+ZfB
 z3g7J9fUF6pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146751732"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="146751732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:49 -0700
IronPort-SDR: w9lL4KLb6oitgxodPkM7v7cQh/LYMpU/kacWdpwAN5ZOZTn3GFeUT44qcp6dwirJ3UmRaQC9IG
 zi47uV7izF/w==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="297493442"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO [10.254.77.62])
 ([10.254.77.62])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:26:48 -0700
Subject: Re: [PATCH 07/11] ASoC: q6asm: add support to gapless flag in asm open
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-8-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b05e5503-6a47-5b52-1339-f1243d952cea@linux.intel.com>
Date: Tue, 7 Jul 2020 11:57:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707163641.17113-8-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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


> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index c3558288242a..8c214436a2c2 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -258,7 +258,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
>   				       FORMAT_LINEAR_PCM,
> -				       0, prtd->bits_per_sample);
> +				       0, prtd->bits_per_sample, false);

nit-pick: it's a bit ironic that is_gapless is false for PCM, when there 
is no gap in the first place..

>   	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>   		ret = q6asm_open_read(prtd->audio_client, prtd->stream_id,
>   				      FORMAT_LINEAR_PCM,
> @@ -685,7 +685,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   	if (dir == SND_COMPRESS_PLAYBACK) {
>   		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
>   				       params->codec.id, params->codec.profile,
> -				       prtd->bits_per_sample);
> +				       prtd->bits_per_sample, true);
