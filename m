Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E91C6344
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AC91760;
	Tue,  5 May 2020 23:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AC91760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588714890;
	bh=daqwcvGA13tNv2s+FfYoKUhpgVmsuGzYsEYYJNMOUgU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t44udtmf3te1DGDWCKSUdbwSDucVN0Rk3CiUF9A74lJbgdSOgJ334ZC9bHoT2Ii36
	 FIrpl8kWk5TYHgZPdnHI46KaIR63DxuH84pfIFiS7TdAzcFuJidpYP+BRYGB7vDl07
	 L+KuZ24g7uegyW8KPTALjRhrIk0QYB3+T4IqwIPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC32F80162;
	Tue,  5 May 2020 23:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56BB9F80162; Tue,  5 May 2020 23:39:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E053F800EE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 23:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E053F800EE
IronPort-SDR: 4sHTnWuO9eTA5YeDjy1AvlraV+iSySGIzaIaYaIuwD2RsovQIqKl2+EdxxAMuImbBcwjwbc+rp
 oK0ZbIyvN9iQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 14:39:38 -0700
IronPort-SDR: cEhPzXxwHFs4muXPr5TCifwZ0/TzXtKh5OI6TRNLoEhubHxg4TRhNr0SCkB/3Ab+VNfW/RK5kf
 di5tYD1gRGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,356,1583222400"; d="scan'208";a="278017616"
Received: from krogers-mobl1.amr.corp.intel.com (HELO [10.255.229.42])
 ([10.255.229.42])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2020 14:39:37 -0700
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
Date: Tue, 5 May 2020 16:39:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505205327.642282-15-alexander.deucher@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alex Deucher <alexander.deucher@amd.com>
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



> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index 5f57a47382b4..77ffdb41bee5 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -42,3 +42,10 @@ config SND_SOC_AMD_RENOIR
>   	depends on X86 && PCI
>   	help
>   	 This option enables ACP support for Renoir platform
> +
> +config SND_SOC_AMD_RENOIR_MACH
> +	tristate "AMD Renoir support for DMIC"
> +	select SND_SOC_DMIC

there could be a missing dependency if GPIOLIB is not selected 
(SND_SOC_DMIC depends on it).

> +	depends on SND_SOC_AMD_RENOIR
> +	help
> +	 This option enables machine driver for DMIC
