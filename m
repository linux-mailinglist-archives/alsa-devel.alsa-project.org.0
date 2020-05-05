Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CD1C6337
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE941749;
	Tue,  5 May 2020 23:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE941749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588714779;
	bh=bjztD8TC/SQCyw6i3lyw+0Y5CnwWYtvQlVkUHMNQnkc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQntIQvdp0L9jSbg9bryr8ss4oI4AT6Ki5u7QnapM5iXxEEIGAvpbt9YTPFdoeSBa
	 4Ps5C2mMN68pomgxqSGfykOe2qDBJ/Rdc2qCfM2v4KkLNB6eY5XiLjHOvbYMrHtuW9
	 8uZvuKKkpmhIhDTDemJ4amfRDukhFrVbH1gR+aPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5A0F80162;
	Tue,  5 May 2020 23:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1769EF8015F; Tue,  5 May 2020 23:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE95FF800AD
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 23:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE95FF800AD
IronPort-SDR: DlbRLDysxWZKSyKC+x2fmQD8zE90dUvy9L52zoiwb/B0cHbkk/1NHmppvoeKlPl4JWWyMDK3U9
 XaGajiWmCSzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 14:37:43 -0700
IronPort-SDR: P5AEYaNTz4fsEDKgt5psjCxQ1CzS4Ux+L5LE8yhmf/wceQgV3j5swCHADsPLsWnxndvDL5dm2/
 Vu8f0Yq3ffOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,356,1583222400"; d="scan'208";a="278017251"
Received: from krogers-mobl1.amr.corp.intel.com (HELO [10.255.229.42])
 ([10.255.229.42])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2020 14:37:42 -0700
Subject: Re: [PATCH 13/14] ASoC: amd: RN machine driver using dmic
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-14-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <262fb234-f940-d3be-4a9b-9f3263cced54@linux.intel.com>
Date: Tue, 5 May 2020 16:37:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505205327.642282-14-alexander.deucher@amd.com>
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



> +static int acp_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct acp_pdm *machine = NULL;
> +	struct snd_soc_card *card;
> +
> +	card = &acp_card;
> +	acp_card.dev = &pdev->dev;
> +
> +	platform_set_drvdata(pdev, card);
> +	snd_soc_card_set_drvdata(card, machine);
> +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"snd_soc_register_card(%s) failed: %d\n",
> +			acp_card.name, ret);
> +		return ret;
> +	}
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"snd_soc_register_card(%s) failed: %d\n",
> +			acp_card.name, ret);
> +		return ret;
> +	}

copy-paste mistake here, the same block appears twice?

> +	return 0;
> +}
> +
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

module_platform_driver(acp_mach_driver) does all this __init and __exit 
for you.

> +
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRV_NAME);
> 
