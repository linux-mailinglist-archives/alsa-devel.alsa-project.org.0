Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77819E5D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 15:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ADAE1A96;
	Fri, 10 May 2019 15:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ADAE1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557495551;
	bh=MryepiYxf6TaDA1kaT4tNNTnWwIiO++w7TUpXKq/jJE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgclU9/w6EA2mWS5ngnATWtQIgv/ERaOoFH5tDDPhDNPdAN5SvJfAOHGxMWKZrnfX
	 R71egk5qMf0Js0pPZX+tbX6LaGQqRps+0ug5izYCpGxBGN7IDsaKdk54sx7XNOSgb5
	 AuKN11wUWQYWQKg9FMwNIsJEatvZDgM/xeA7CVQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BAFF896FD;
	Fri, 10 May 2019 15:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CCB5F896FD; Fri, 10 May 2019 15:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 352E3F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352E3F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 06:37:19 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 10 May 2019 06:37:19 -0700
Received: from khbyers-mobl2.amr.corp.intel.com (unknown [10.251.29.37])
 by linux.intel.com (Postfix) with ESMTP id 700A5580482;
 Fri, 10 May 2019 06:37:18 -0700 (PDT)
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, rdunlap@infradead.org
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <20190510132940.28184-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9284cd65-98e3-5f7e-1427-8245dd84edcd@linux.intel.com>
Date: Fri, 10 May 2019 08:36:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510132940.28184-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: SOF: Fix build error with
 CONFIG_SND_SOC_SOF_NOCODEC=m
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

On 5/10/19 8:29 AM, YueHaibing wrote:
> Fix gcc build error while CONFIG_SND_SOC_SOF_NOCODEC=m
> 
> sound/soc/sof/core.o: In function `snd_sof_device_probe':
> core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'
> 
> Change IS_ENABLED to IS_REACHABLE to fix this.

this just hides the issue instead of fixing it.
please send the config+sha1 so that we can check.

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> V2: use IS_REACHABLE
> ---
>   sound/soc/sof/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 32105e0..38e22f4 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -259,7 +259,7 @@ int snd_sof_create_page_table(struct snd_sof_dev *sdev,
>   static int sof_machine_check(struct snd_sof_dev *sdev)
>   {
>   	struct snd_sof_pdata *plat_data = sdev->pdata;
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
> +#if IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
>   	struct snd_soc_acpi_mach *machine;
>   	int ret;
>   #endif
> @@ -267,7 +267,7 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
>   	if (plat_data->machine)
>   		return 0;
>   
> -#if !IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
> +#if !IS_REACHABLE(CONFIG_SND_SOC_SOF_NOCODEC)
>   	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
>   	return -ENODEV;
>   #else
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
