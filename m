Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75169B7AF
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3BC81674;
	Fri, 23 Aug 2019 22:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3BC81674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592306;
	bh=xDiGo12JoqDl8twMcNulgdtb8s8IbeAlxArOVWeDjVA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uaGngx+NW913fyHBzHhYF+agTKqkLo3Td+YFAN51IlMBKwrL0wnY7PeMnAh2kFI2y
	 r130C94nAq6Mn6l5r2GT3oYewJLgWFu40RSSV5RCVp75zdn53piVgbIpoN6EHku06H
	 y9OFbutFfhJqP8j+v3wl07Q3JnI31RJ5FnUk1RYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B64F80634;
	Fri, 23 Aug 2019 22:28:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB09F805FD; Fri, 23 Aug 2019 22:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C83F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C83F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718165"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:28:01 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-12-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4ecd54e1-a7c1-fec9-3487-9b0ef8442293@linux.intel.com>
Date: Fri, 23 Aug 2019 13:54:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-12-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 11/35] ASoC: Intel: Merge sst_dsp_device
 into sst_pdata
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


> @@ -203,13 +192,15 @@ struct sst_pdata {
>   
>   	/* DSP */
>   	u32 id;
> +	const char *fw_name;
> +	struct sst_ops *ops;
> +	struct snd_soc_acpi_mach *boards;
>   	void *dsp;
>   };

You already have the fw_name inside of struct snd_soc_acpi_mach:

/* Descriptor for SST ASoC machine driver */
struct snd_soc_acpi_mach {
	const u8 id[ACPI_ID_LEN];
	const char *drv_name;
	const char *fw_filename;
	const char *board;
	struct snd_soc_acpi_mach * (*machine_quirk)(void *arg);
	const void *quirk_data;
	void *pdata;
	struct snd_soc_acpi_mach_params mach_params;
	const char *sof_fw_filename;
	const char *sof_tplg_filename;
};
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
