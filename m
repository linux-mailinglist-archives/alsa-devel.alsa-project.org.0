Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB24C1862
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 17:20:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B82D1AD4;
	Wed, 23 Feb 2022 17:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B82D1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645633207;
	bh=kdFETTBddN7EdBnhGYgG52WV2uKpzlnZnEFWwu9QLo0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAYrsBy6sCaVDvEp1uMxj/MzyLL3vigwNhUHdNsCJz7UYTjeNHQFS1fORcb/3yNUD
	 q8O43XanKAkZ6Kba87WW39l3ZxTmYoP9I5Vq9IQX56D1aKe3GSNcHSe8uncEaF9E15
	 zNMtW+sr+uVm4tovgCbWG9/DUs4Mvxlulz8UxQmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3775F800B6;
	Wed, 23 Feb 2022 17:19:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94ED0F800B6; Wed, 23 Feb 2022 17:18:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85FCF800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 17:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85FCF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mGc0ygNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645633134; x=1677169134;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kdFETTBddN7EdBnhGYgG52WV2uKpzlnZnEFWwu9QLo0=;
 b=mGc0ygNtSLIE/6R7e7a2SNNryA9/OlkXo8GhTefbimtWz/OjPGRgOvrK
 b968O62lq9BtAxgxO4p4RBQ6cS79luFc6DOGgLR5Rk45iHSzFu3M1eK0+
 k3i69oH91x1KMtYPa2d2j7j8f11eLdBKi14HYenD3n9qeSO1VSqwoV5XC
 iUTuVmuv34vuG80Sxj47hKbOcAz4KGbwoIkCVwycHJTzUgeENROwKXo7e
 srQhhjYZa/6wbleO9nDeAdrS3xDnnpBwMsiAw84JwU2lBz4pu9/V3dq9B
 m1JttYMydXqvz+ycySzqe3mC8OH7VqOmN9RVp1IdGLOP1sEFaus/WTHMj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="249585676"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="249585676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 08:10:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="548312807"
Received: from vermaama-mobl.ger.corp.intel.com (HELO [10.252.44.244])
 ([10.252.44.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 08:09:57 -0800
Message-ID: <16567e15-2ea5-60cc-74bd-97475b793a57@linux.intel.com>
Date: Wed, 23 Feb 2022 18:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: SOF: pcm: Add compress_ops for SOF platform
 component driver
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org
References: <20220223153849.84471-1-daniel.baluta@oss.nxp.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220223153849.84471-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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



On 23/02/2022 17:38, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Now that sof_compressed_ops initial implementation was merged
> we can enable it in SOF platform component driver.

and fixes the following sparse error:
sound/soc/sof/compress.c:310:25: error: symbol 'sof_compressed_ops' was
not declared. Should it be static?

> This partially reverts commit
> 8a720724589e ("ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS reference")

Back at that time there were _no_ sof_compressed_ops in the tree...

> Reported-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/pcm.c      | 4 ++++
>  sound/soc/sof/sof-priv.h | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 137f8ed71677..a312ed855f1a 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -922,6 +922,10 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
>  	pd->pointer = sof_pcm_pointer;
>  	pd->ack = sof_pcm_ack;
>  
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
> +	pd->compress_ops = &sof_compressed_ops;
> +#endif
> +
>  	pd->pcm_construct = sof_pcm_new;
>  	pd->ignore_machine = drv_name;
>  	pd->be_hw_params_fixup = sof_pcm_dai_link_fixup;
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index 2c8e556cd5cc..886787a9997f 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -556,6 +556,11 @@ int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
>  		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
>  		const char *name, enum sof_debugfs_access_type access_type);
>  
> +/*
> + * Platform specific ops.
> + */
> +extern struct snd_compress_ops sof_compressed_ops;

This is not really platform ops?

> +
>  /*
>   * DSP Architectures.
>   */

-- 
Péter
