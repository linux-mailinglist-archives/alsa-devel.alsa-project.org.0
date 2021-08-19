Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7823F1BA1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 16:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602551681;
	Thu, 19 Aug 2021 16:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602551681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629383557;
	bh=xOMozrX6bsutuK07v/c8+fqqeb5KY7vqYTpK1ntXWNo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JC1mo213go1HkV6gPOlTetpAY0Cr+PMQfXQDyKHpsWSZLkib2/HVGjK/JA/Ee06mY
	 GaDxLjJhsdU00YA2Bh7ZA8srciKAhldHSdSldKSKlAv+mdbVWBHyWSIS4wUJVDW4TL
	 KzBShls/TsXQJ3KmAFBQraubtqmx95a9+kePheCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 969CBF80272;
	Thu, 19 Aug 2021 16:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E88F8026D; Thu, 19 Aug 2021 16:31:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA449F800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 16:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA449F800F8
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="238684731"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="238684731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 07:31:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="489687511"
Received: from mmdandap-mobl.amr.corp.intel.com (HELO [10.213.172.210])
 ([10.213.172.210])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 07:31:02 -0700
Subject: Re: [PATCH v2] ASoC: Intel: Fix platform ID matching for
 kbl_da7219_max98373
To: Lukasz Majczak <lma@semihalf.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20210819082414.39497-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <87736cce-a96f-064e-6d60-71645ba46f13@linux.intel.com>
Date: Thu, 19 Aug 2021 09:30:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819082414.39497-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org,
 upstream@semihalf.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 8/19/21 3:24 AM, Lukasz Majczak wrote:
> Sparse warnings triggered truncating the IDs of some platform device
> tables. Unfortunately kbl_da7219_max98373 was also truncated.
> This patch is reverting the original ID.
> Tested on Atlas chromebook.

Instead of reverting, how about changing the remaining occurrences of
the old name in the machine driver?

sound/soc/intel/boards/kbl_da7219_max98927.c:   if (!strcmp(pdev->name,
"kbl_da7219_max98373") ||
sound/soc/intel/boards/kbl_da7219_max98927.c:           .name =
"kbl_da7219_max98373",


> 
> Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
> Cc: <stable@vger.kernel.org> # 5.4+
> Tested-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> index 741bf2f9e081..8cab91a00b1a 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> @@ -113,7 +113,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
>  	},
>  	{
>  		.id = "DLGS7219",
> -		.drv_name = "kbl_da7219_mx98373",
> +		.drv_name = "kbl_da7219_max98373",
>  		.fw_filename = "intel/dsp_fw_kbl.bin",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &kbl_7219_98373_codecs,
> 
