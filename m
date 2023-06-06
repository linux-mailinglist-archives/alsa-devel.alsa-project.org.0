Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426672480F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B4374C;
	Tue,  6 Jun 2023 17:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B4374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066189;
	bh=JJbvRmCCUFV7p9M3l0n0kZA62PxQNfMx1/Z0AS4CdW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hekRiTL6whjvHKPwPfpQAWNgsMT/NjTBmTir1+dsq0TEhJVl+I+oVOLrZeZTrYlYE
	 KkRGyjjC0y0+4X/gxMFi2++kpkRNMM2Xow3SaJlY32c05vJWxO+CVGbbDw7okPbkCw
	 QgWd5M2R7j+raAxtYSV5BzLxS4QlIcMQqJE7LwvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7933DF805AE; Tue,  6 Jun 2023 17:41:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D6D9F800C8;
	Tue,  6 Jun 2023 17:41:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B044F805AA; Tue,  6 Jun 2023 17:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F52F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F52F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kO6+7+Z3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686066037; x=1717602037;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JJbvRmCCUFV7p9M3l0n0kZA62PxQNfMx1/Z0AS4CdW4=;
  b=kO6+7+Z3O+HjgfII5oVlxtoKVK80aZp8KVURxjb0MIye7CWvyDHIM8qB
   zNVZ2z0T0m3tiHITKCvm4dmMqxBYDVWX6Fdq7pL1Pn8vC7GKEdUDiSMxm
   mf61eUW28l6D5PQpvYwlmTmjTMl7fE37yOv+JPjbHUcaTv+gcnabSmSov
   WQr0btaujP/id3jnO1kzanpuXi07IA4QjFOMeOmtSr/a9iYo8HiRc4q4m
   WU2xSvzVTuZPNSeL9iCTIlJ0R1tcxmn+R2WIwoGc8xTEaaA2kNCNzPIXr
   gIVX4Bb7lwS/manzmw1y0/k5FeQTtuV/kNxcpXT4qqr8qppmo8uRtzCNL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422550270"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="422550270"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="955816530"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="955816530"
Received: from pdonvalk-mobl2.amr.corp.intel.com (HELO [10.255.231.168])
 ([10.255.231.168])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:15 -0700
Message-ID: <b9487589-7149-cdbe-59f3-d5279f25b02e@linux.intel.com>
Date: Tue, 6 Jun 2023 10:06:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V3 9/9] ASoC: amd: ps: Add SoundWire specific checks in
 pci driver in pm ops.
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
 <20230606060724.2038680-10-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230606060724.2038680-10-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FNHMMOL3HFA5WMQ6YYN3KE7MIKHNO53M
X-Message-ID-Hash: FNHMMOL3HFA5WMQ6YYN3KE7MIKHNO53M
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNHMMOL3HFA5WMQ6YYN3KE7MIKHNO53M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/6/23 01:07, Vijendar Mukunda wrote:
> AMD SoundWire manager supports different power modes.
> In case of SoundWire Power off Mode, ACP pci parent driver
> should invoke acp de-init and init sequence during suspend/resume
> callbacks.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/pci-ps.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index daf54fe9cafd..5802a701b3b1 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -662,10 +662,15 @@ static int snd_acp63_probe(struct pci_dev *pci,
>  static int __maybe_unused snd_acp63_suspend(struct device *dev)
>  {
>  	struct acp63_dev_data *adata;
> -	int ret;
> +	int ret = 0;
>  
>  	adata = dev_get_drvdata(dev);
> -	ret = acp63_deinit(adata->acp63_base, dev);
> +	if (adata->pdev_mask & ACP63_SDW_DEV_MASK) {

And now back to my comment from the first patch, you are using a
bit-wise operation with an enum which is not explicitly defined as a
mask. This test would be true for ACP63_SDW_PDM_DEV_MASK as well.

+enum acp_pdev_mask {
+	ACP63_PDM_DEV_MASK = 1,
+	ACP63_SDW_DEV_MASK,
+	ACP63_SDW_PDM_DEV_MASK,
+};

> +		if (adata->acp_reset)
> +			ret = acp63_deinit(adata->acp63_base, dev);
> +	} else {
> +		ret = acp63_deinit(adata->acp63_base, dev);
> +	}
>  	if (ret)
>  		dev_err(dev, "ACP de-init failed\n");
>  	return ret;
> @@ -674,10 +679,15 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
>  static int __maybe_unused snd_acp63_resume(struct device *dev)
>  {
>  	struct acp63_dev_data *adata;
> -	int ret;
> +	int ret = 0;
>  
>  	adata = dev_get_drvdata(dev);
> -	ret = acp63_init(adata->acp63_base, dev);
> +	if (adata->pdev_mask & ACP63_SDW_DEV_MASK) {
> +		if (adata->acp_reset)
> +			ret = acp63_init(adata->acp63_base, dev);
> +	} else {
> +		ret = acp63_init(adata->acp63_base, dev);
> +	}
>  	if (ret)
>  		dev_err(dev, "ACP init failed\n");
>  	return ret;
