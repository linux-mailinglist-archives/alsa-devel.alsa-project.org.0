Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1108E3DB9D8
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 15:57:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0E91934;
	Fri, 30 Jul 2021 15:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0E91934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627653443;
	bh=XrkLhksby1UvE4zfBY/uhnZJHNpPUaA4odpI0TQd6sg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzj0Qhd+yA5vp+u2/eA8U/GVnhSMszd7Fe3s3DGdEBg8N1fZbu7p11ena3t1/K9QY
	 uAjfHXTULmvlgM/C16u2v0oOXFfBi1NAazp3VcgNz11kC7wAm562TjwbrupFGObBC4
	 OYMuhRqjV+eCX14MWVWJLiHG1q49arVFr2toKiow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF1DF8025A;
	Fri, 30 Jul 2021 15:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B90F80253; Fri, 30 Jul 2021 15:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB977F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 15:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB977F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212827300"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="212827300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:55:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="518953369"
Received: from spichard-mobl1.amr.corp.intel.com (HELO [10.212.106.239])
 ([10.212.106.239])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 06:55:43 -0700
Subject: Re: [PATCH v1] ASoC: Intel: kbl_da7219_max98357a: fix drv_name
To: Lukasz Majczak <lma@semihalf.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20210730115906.144300-1-lma@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <58b46549-9b42-1832-b1e1-680d56c3f393@linux.intel.com>
Date: Fri, 30 Jul 2021 08:55:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730115906.144300-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 7/30/21 6:59 AM, Lukasz Majczak wrote:
> platform_id for kbl_da7219_max98357a was shrunk for kbl_da7219_mx98357a,
> but the drv_name was changed for kbl_da7219_max98373. Tested on a
> Pixelbook (Atlas).
> 
> Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
> Cc: <stable@vger.kernel.org> # 5.4+
> Reported-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Tested-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
>  sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> index ba5ff468c265..8cab91a00b1a 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> @@ -87,7 +87,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
>  	},
>  	{
>  		.id = "DLGS7219",
> -		.drv_name = "kbl_da7219_max98357a",
> +		.drv_name = "kbl_da7219_mx98357a",

that one is correct, that was a miss

>  		.fw_filename = "intel/dsp_fw_kbl.bin",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &kbl_7219_98357_codecs,
> @@ -113,7 +113,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
>  	},
>  	{
>  		.id = "DLGS7219",
> -		.drv_name = "kbl_da7219_mx98373",
> +		.drv_name = "kbl_da7219_max98373",

this one is wrong though? The correct name was already present, you're
reverting back to the wrong name.

there's another one that I missed, do you mind changing this as well?

soc-acpi-intel-cml-match.c:             .drv_name = "cml_da7219_max98357a",

Should be "cml_da7219_mx98357a"


>  		.fw_filename = "intel/dsp_fw_kbl.bin",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &kbl_7219_98373_codecs,
> 
