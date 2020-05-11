Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947401CEA02
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 433D486E;
	Tue, 12 May 2020 03:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 433D486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589245815;
	bh=SLII3i8Y40eOzVmCGKb5aD3inDMUGlkZaLUK1lBO4Qs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnPwqgp1omYzIgdv+wDwk+1eaA3gNvJjHwsCOUJlpDOEy84hCOF60cuGvj6EHijWQ
	 CM1Uh/isoiqBjOc6I95ywQLduQgs9bk26IJk4xqBqq+LBHTPs4rm7pu4pN1xUeznjX
	 yqSnCPXTv6VIHKEffu7hP853SuSWxk9jGSFsukUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9290F80290;
	Tue, 12 May 2020 00:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B2B7F80157; Tue, 12 May 2020 00:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B284CF80157
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B284CF80157
IronPort-SDR: u6IKjYxRXIwKEVp4qRJg61TxbsSV5pDOYHSXY3IletM3+SzKfcSAqcJPs5l4gTkk+1S45Uf49p
 1ArIy7CKUBDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 15:37:46 -0700
IronPort-SDR: 6zRhe0n0QgcQSTZ2KaLDGKYgrAvY/3jflOaAwo2NZOfN952ukN19yMri4zOi6cnt83t0zIO4Wj
 znoQz/IIGejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="252717104"
Received: from xshi16-mobl2.amr.corp.intel.com (HELO [10.254.96.249])
 ([10.254.96.249])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2020 15:37:45 -0700
Subject: Re: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
Date: Mon, 11 May 2020 17:28:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511212014.2359225-10-alexander.deucher@amd.com>
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


> @@ -233,6 +234,11 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>   		ret = PTR_ERR(adata->pdev);
>   		goto unregister_devs;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&pci->dev);
> +	pm_runtime_allow(&pci->dev);
> +	pm_runtime_mark_last_busy(&pci->dev);
> +	pm_runtime_put_autosuspend(&pci->dev);

usually there is a pm_runtime_put_noidle() here?

[...]

>   static void snd_rn_acp_remove(struct pci_dev *pci)
>   {
>   	struct acp_dev_data *adata;
> @@ -260,6 +302,9 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
>   	ret = rn_acp_deinit(adata->acp_base);
>   	if (ret)
>   		dev_err(&pci->dev, "ACP de-init failed\n");
> +	pm_runtime_put_noidle(&pci->dev);
> +	pm_runtime_get_sync(&pci->dev);
> +	pm_runtime_forbid(&pci->dev);

doing a put_noidle() followed by a get_sync() and immediately forbid() 
is very odd at best.
Isn't the recommendation to call get_noresume() here?



>   	pci_disable_msi(pci);
>   	pci_release_regions(pci);
>   	pci_disable_device(pci);
> @@ -278,6 +323,9 @@ static struct pci_driver rn_acp_driver  = {
>   	.id_table = snd_rn_acp_ids,
>   	.probe = snd_rn_acp_probe,
>   	.remove = snd_rn_acp_remove,
> +	.driver = {
> +		.pm = &rn_acp_pm,
> +	}
>   };
>   
>   module_pci_driver(rn_acp_driver);
> diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
> index a4f654cf2df0..6e1888167fb3 100644
> --- a/sound/soc/amd/renoir/rn_acp3x.h
> +++ b/sound/soc/amd/renoir/rn_acp3x.h
> @@ -40,6 +40,8 @@
>   #define TWO_CH 0x02
>   #define DELAY_US 5
>   #define ACP_COUNTER 20000
> +/* time in ms for runtime suspend delay */
> +#define ACP_SUSPEND_DELAY_MS	2000
>   
>   #define ACP_SRAM_PTE_OFFSET	0x02050000
>   #define PAGE_SIZE_4K_ENABLE     0x2
> 
