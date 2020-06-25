Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B920A4E5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 20:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D661938;
	Thu, 25 Jun 2020 20:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D661938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593109611;
	bh=MY6MhfsjPVvhoH3Ix0tgOdUbj1A8DhSRsAhZ5n8THmo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETC2HbRt+brGSUjs28QY4gjZ4K60FggUTem8oEYubtsfhpIwMA53TPMpzHztSAhlh
	 iHRTS/Mg2g/yiB2qQRDrNf5HOM7UO5igwAwZAf+ZemO0JoS9JGgTuzcpDDa3uZUix0
	 G6vh621DbJ+uaWgyzoMV4EVcKBr/i/DzyLgsd1RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A11DF8023E;
	Thu, 25 Jun 2020 20:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC0DF80234; Thu, 25 Jun 2020 20:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 437CAF800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 20:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437CAF800B2
IronPort-SDR: xIbGc9EV3h8DXMn17bENuLjGtIEmDgI6ml6DyZ9Rdwzu7J1fWi5VorqIkWBPECxX7TRu+cx+eq
 jk8yvtb1jP3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="206545342"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="206545342"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:24:57 -0700
IronPort-SDR: V8IOjMpTLbPFvbxmv1/405sAAaTKlrVNn7q8YTLhgre83kmJBzSBDFSy64cfuFir2ItUpeY6UM
 sdc7AcJfQeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354547591"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.11.151])
 ([10.213.11.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 11:24:55 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: sof_sdw: add missing .owner field
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
 <20200625180635.3563-4-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1298226b-183c-af59-7be8-98e98149ef0c@intel.com>
Date: Thu, 25 Jun 2020 20:24:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625180635.3563-4-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On 2020-06-25 8:06 PM, Pierre-Louis Bossart wrote:
> This field is required for ASoC cards. Not setting it will result in a
> module->name pointer being NULL and generate problems such as
> 
> cat /proc/asound/modules
>   0 (efault)
> 
> Reported-by: Jaroslav Kysela <perex@perex.cz>
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Fixes: 52db12d193d4 ('ASoC: Intel: boards: add sof_sdw machine driver')
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/intel/boards/sof_sdw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index e1c1a8ba78e6..d26b82526163 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -893,7 +893,7 @@ static const char sdw_card_long_name[] = "Intel Soundwire SOF";
>   
>   static struct snd_soc_card card_sof_sdw = {
>   	.name = "soundwire",
> -	.late_probe = sof_sdw_hdmi_card_late_probe,

Deletion of .late_probe looks off in this patch. Typo?

> +	.owner = THIS_MODULE,
>   	.codec_conf = codec_conf,
>   	.num_configs = ARRAY_SIZE(codec_conf),
>   };
> 
