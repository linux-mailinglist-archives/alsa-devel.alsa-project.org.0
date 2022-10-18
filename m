Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBB602BE2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810408C4D;
	Tue, 18 Oct 2022 14:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810408C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096813;
	bh=giPaWporJzaRR2g2HKcRZLktOUCyZc8bAJgdIBRoTe4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZjOczYjITTds/SKDm6MBoIpUfa5cmWPL2MzCccHx3HXn2gffT0V44UG7BuaDMpzk
	 LZ11PT+4dqGpep4qh8O5XyH0qD3Nn5Mvh7VMdqZw8DxVJ6dQLQV5vO2wZ7NtknuA7I
	 PSJJt91tbObMKbbSiXR9CvrcJNYu62ikaZ5wWHow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F158FF804BD;
	Tue, 18 Oct 2022 14:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A24F0F8024C; Tue, 18 Oct 2022 14:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E71F800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E71F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hLnQ4l+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096752; x=1697632752;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=giPaWporJzaRR2g2HKcRZLktOUCyZc8bAJgdIBRoTe4=;
 b=hLnQ4l+hIW5LoSibqR2IvHMmnUfKmKYuGLf9tCGM+x05RSM1hO3Hx+1h
 DmDiqkKB/ZVWFBmQ7g+Hnx0R5mkxuFMQfk4IxPi2SYc3nyb6KRJnabOvG
 Zji6mv80huVUzpICz19TeUVWNR3AWyLL8CVnHIlltM6FNqO+RsAvdanFg
 R019sNq31K9vkQ6rW6Giwtz2pzeIHZbU/NB8O6VoTyJf8O/YKv3stTAfD
 6X4mPHiLVwKaiqZ8lgx8yVUpY901gPt/UTFy+eoWhulna1kpLgEBG/xus
 xeGaCkZmqYxKt9QR06by2EbK591SNltRTvXT9hVLWa/bbW3frwXa+Nd4T g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="332634146"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="332634146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:38:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="628697928"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="628697928"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.36])
 ([10.99.241.36])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:38:49 -0700
Message-ID: <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
Date: Tue, 18 Oct 2022 14:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, chao.song@intel.com
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

On 10/18/2022 2:09 PM, Peter Ujfalusi wrote:
> The default path for the external firmware libraries are:
> intel/avs-lib/<platform>
> or
> intel/sof-ipc4-lib/<platform>
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Chao Song <chao.song@intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/sof/intel/pci-apl.c |  6 ++++++
>   sound/soc/sof/intel/pci-cnl.c |  9 +++++++++
>   sound/soc/sof/intel/pci-icl.c |  6 ++++++
>   sound/soc/sof/intel/pci-mtl.c |  3 +++
>   sound/soc/sof/intel/pci-tgl.c | 21 +++++++++++++++++++++
>   5 files changed, 45 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
> index 998e219011f0..69279dcc92dc 100644
> --- a/sound/soc/sof/intel/pci-apl.c
> +++ b/sound/soc/sof/intel/pci-apl.c
> @@ -33,6 +33,9 @@ static const struct sof_dev_desc bxt_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/apl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/apl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -61,6 +64,9 @@ static const struct sof_dev_desc glk_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/glk",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/glk",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
> index c797356f7028..8db3f8d15b55 100644
> --- a/sound/soc/sof/intel/pci-cnl.c
> +++ b/sound/soc/sof/intel/pci-cnl.c
> @@ -34,6 +34,9 @@ static const struct sof_dev_desc cnl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/cnl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -62,6 +65,9 @@ static const struct sof_dev_desc cfl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/cnl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -91,6 +97,9 @@ static const struct sof_dev_desc cml_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/cnl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
> index 48f24f8ace26..d6cf75e357db 100644
> --- a/sound/soc/sof/intel/pci-icl.c
> +++ b/sound/soc/sof/intel/pci-icl.c
> @@ -34,6 +34,9 @@ static const struct sof_dev_desc icl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/icl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/icl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -62,6 +65,9 @@ static const struct sof_dev_desc jsl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/jsl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/jsl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
> index 899b00d53d64..84445daf33af 100644
> --- a/sound/soc/sof/intel/pci-mtl.c
> +++ b/sound/soc/sof/intel/pci-mtl.c
> @@ -34,6 +34,9 @@ static const struct sof_dev_desc mtl_desc = {
>   	.default_fw_path = {
>   		[SOF_INTEL_IPC4] = "intel/sof-ipc4/mtl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/sof-ipc4-lib/mtl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_INTEL_IPC4] = "intel/sof-ace-tplg",
>   	},
> diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
> index 2d63cc236a68..f9cbf3ad85b3 100644
> --- a/sound/soc/sof/intel/pci-tgl.c
> +++ b/sound/soc/sof/intel/pci-tgl.c
> @@ -34,6 +34,9 @@ static const struct sof_dev_desc tgl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/tgl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/tgl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -62,6 +65,9 @@ static const struct sof_dev_desc tglh_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/tgl-h",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/tgl-h",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -90,6 +96,9 @@ static const struct sof_dev_desc ehl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/ehl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/ehl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -118,6 +127,9 @@ static const struct sof_dev_desc adls_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/adl-s",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/adl-s",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -146,6 +158,9 @@ static const struct sof_dev_desc adl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/adl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/adl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -174,6 +189,9 @@ static const struct sof_dev_desc rpls_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/rpl-s",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/rpl-s",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",
> @@ -202,6 +220,9 @@ static const struct sof_dev_desc rpl_desc = {
>   		[SOF_IPC] = "intel/sof",
>   		[SOF_INTEL_IPC4] = "intel/avs/rpl",
>   	},
> +	.default_lib_path = {
> +		[SOF_INTEL_IPC4] = "intel/avs-lib/rpl",
> +	},
>   	.default_tplg_path = {
>   		[SOF_IPC] = "intel/sof-tplg",
>   		[SOF_INTEL_IPC4] = "intel/avs-tplg",


I'm not sure that I understand the rationale here, can't libraries be 
kept in the same directory as FW, as far as I know they are version 
locked to FW anyway. In avs driver when we decided on intel/avs/platform 
path we planned to keep FW related libaries there...

Also adding Czarek to CC.
