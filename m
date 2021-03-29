Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBB34D96B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 23:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D4D1673;
	Mon, 29 Mar 2021 23:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D4D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617052031;
	bh=W3pl/AJ0ss/aE0xHLxRSvK+o0k5VU76NXnpApq+pWEE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ix/wTz/NGIXGTH+VM0CbYdtARl5wzSurt/FnQpuuMdfGKxrZ3CAqdzRnBLItrRA5k
	 Y2QsJyzhK1xvWhPvDWV/uso3fIM4Hokc4R2rf0an6DveSJi0ydeZv/RemXHPBJOYJz
	 kp/veknDmK7Ls/FKZOtrnO60taXDlTMpWOsiBAJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23345F800DD;
	Mon, 29 Mar 2021 23:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A552AF8015A; Mon, 29 Mar 2021 23:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D878F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 23:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D878F80141
IronPort-SDR: wDH6lycPepWP3MtFkaosC40KZaFAEKyxn0X4Vu8N8p+jD4z5pcUg9BNT+vNZDt69GXXXkMrG5V
 8JfNSSv5auCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="189378621"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="189378621"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 14:05:26 -0700
IronPort-SDR: eZxlxYzkUBJXxJSAki5wl2ZBl6GSY8ol5sYtTanxPSCz0iS64eqddULqCe+GFY75lS7rpt9Ksn
 l8E41wDL318w==
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="393331288"
Received: from cwrobert-mobl2.amr.corp.intel.com (HELO [10.212.42.35])
 ([10.212.42.35])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 14:05:24 -0700
Subject: Re: [PATCH] ASoC: Intel: add max98390 echo reference support
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1616757689-22014-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d8b769d3-de09-26ac-80c0-21efc489f8d0@linux.intel.com>
Date: Mon, 29 Mar 2021 16:05:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616757689-22014-1-git-send-email-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: bard.liao@intel.com, broonie@kernel.org, brent.lu@intel.com,
 kai.vehmanen@linux.intel.com
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



On 3/26/21 6:21 AM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> load new topology file with speaker capture pipeline.
> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>

this matches the topology updates at 
https://github.com/thesofproject/sof/pull/3971

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks!

> ---
>   sound/soc/intel/common/soc-acpi-intel-cml-match.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> index 2161b3b..7f6ef82 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> @@ -79,7 +79,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
>   		.machine_quirk = snd_soc_acpi_codec_list,
>   		.quirk_data = &max98390_spk_codecs,
>   		.sof_fw_filename = "sof-cml.ri",
> -		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
> +		.sof_tplg_filename = "sof-cml-da7219-max98390.tplg",
>   	},
>   	{},
>   };
> 
