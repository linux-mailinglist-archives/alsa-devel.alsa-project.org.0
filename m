Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A71CE9F9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D5886F;
	Tue, 12 May 2020 03:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D5886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589245653;
	bh=dXiaKbBRlDP7/MIfltARTPNfmH3L+CaAbKR5BTYym9M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7icY7wzlMHj8lYB2M1X2gdbEPbCcz4wCJol6Ss/8p100OxGv+CplzHacIHaEGoJO
	 06HIjmUBV2lHEBbYu+i1Bx8FDY6ggKoQeuQt+JJ2KmVE87rp8Moj3oIpER0ViN9WeZ
	 pTDdIbEwEEoquKi5Twe6NKDpGEtXukxlxPg3dTu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8F7F802A0;
	Tue, 12 May 2020 00:38:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B5A2F8028E; Tue, 12 May 2020 00:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA894F8022D
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA894F8022D
IronPort-SDR: l+PyI0lUVodGN7peRfo17eMmxY2E4GWThMqOdZvy8hQAALz6Cl7sw9rRLUz8MeRAIvmRpltRh4
 VsxgR1QgpOUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 15:37:48 -0700
IronPort-SDR: FpyUbbhO7b+rTkUsWdnC4dDRLIseVni1y0nhUT4jYNMZHhJ3zTqFPV4c4MFriYwleXaddBTjes
 21Kb2FIMwBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="252717114"
Received: from xshi16-mobl2.amr.corp.intel.com (HELO [10.254.96.249])
 ([10.254.96.249])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2020 15:37:47 -0700
Subject: Re: [PATCH v2 13/14] ASoC: amd: RN machine driver using dmic
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-14-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c6b037b5-ef02-8919-a3c9-6b1a53f1cc0c@linux.intel.com>
Date: Mon, 11 May 2020 17:37:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511212014.2359225-14-alexander.deucher@amd.com>
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




> +static int acp_pdm_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *hw_params)
> +{
> +	return 0;
> +}

is this needed?

> +
> +static struct snd_soc_ops acp_pdm_ops = {
> +	.hw_params = acp_pdm_hw_params,
> +};
> +
> +static int acp_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	return 0;
> +}

is this needed?


> +static struct platform_driver acp_mach_driver = {
> +	.driver = {
> +		.name = "acp_pdm_mach",
> +		.pm = &snd_soc_pm_ops,
> +	},
> +	.probe = acp_probe,
> +};
> +
> +static int __init acp_audio_init(void)
> +{
> +	platform_driver_register(&acp_mach_driver);
> +	return 0;
> +}
> +
> +static void __exit acp_audio_exit(void)
> +{
> +	platform_driver_unregister(&acp_mach_driver);
> +}
> +
> +module_init(acp_audio_init);
> +module_exit(acp_audio_exit);

use module_platform_driver() - was already feedback on v1...

