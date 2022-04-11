Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4C4FC237
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 18:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9961708;
	Mon, 11 Apr 2022 18:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9961708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649694294;
	bh=ltUQurSEf7syUrN+loaIb4/tJxXmlbA0TKblHJomdWg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXPi0b72Xzz987XLjk0wPST2COayJxnhqXo6PgS/n1e5fTYSVIth68jg2QplCs7ij
	 OxULKxnoqXQssVt+xkGlYsmllRG1f3AUjzKinOulVkGsvYxro15k/zmvnG3SUVgxnh
	 3owLdyElHdyKezC1/LIcQm+uKR6gtTIqIeZwwqg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B50F804E4;
	Mon, 11 Apr 2022 18:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C176FF800E8; Mon, 11 Apr 2022 18:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBD7F800E8;
 Mon, 11 Apr 2022 18:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBD7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E227KpKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649694228; x=1681230228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ltUQurSEf7syUrN+loaIb4/tJxXmlbA0TKblHJomdWg=;
 b=E227KpKFdrpxZe06RICmYteN3p2YsX3kbhtF9wAwLZwAvUUnnyk4cfyD
 apTTkU8RGmWb3+GRVw/pOqVar0E5QktxfigvVU1OB3OpzLK9Cs1GtYZIw
 68vP++Gt+BnDIMEAroEkUiaKxYmrHcHKe2AOc8fULXjqugwQPqKOKvFVy
 JMfELqQLapThHhSQMOXyb9rTUFOi43dbvJjs8y7xcybdXNIkQxpz+aIxg
 ay9LauJ8zRwM2OrQxRE73xzsEYdQG6bPEpfXmvhCss2grp4g+cw5Y9Nc9
 YMfGUEc5jAGHka4rztaQw3BCU8bEEkG8KjMOQ9NAJ6A0LzmZ+gyXgDtXh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="287165362"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="287165362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:23:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572279148"
Received: from prposam-mobl.amr.corp.intel.com (HELO [10.212.162.151])
 ([10.212.162.151])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:23:26 -0700
Message-ID: <18cb711a-de2a-69e3-d753-7012a67bf2a7@linux.intel.com>
Date: Mon, 11 Apr 2022 10:28:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Check the bar size before remapping
Content-Language: en-US
To: Zheyu Ma <zheyuma97@gmail.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 peter.ujfalusi@linux.intel.com
References: <20220409143950.2570186-1-zheyuma97@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220409143950.2570186-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 4/9/22 09:39, Zheyu Ma wrote:
> The driver should use the pci_resource_len() to get the actual length of
> pci bar, and compare it with the expect value. If the bar size is too
> small (such as a broken device), the driver should return an error.
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  sound/soc/sof/intel/pci-tng.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
> index 6efef225973f..7d502cc3ca80 100644
> --- a/sound/soc/sof/intel/pci-tng.c
> +++ b/sound/soc/sof/intel/pci-tng.c
> @@ -75,7 +75,11 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
>  
>  	/* LPE base */
>  	base = pci_resource_start(pci, desc->resindex_lpe_base) - IRAM_OFFSET;
> -	size = PCI_BAR_SIZE;
> +	size = pci_resource_len(pci, desc->resindex_lpe_base);
> +	if (size < PCI_BAR_SIZE) {
> +		dev_err(sdev->dev, "error: I/O region is too small.\n");
> +		return -ENODEV;
> +	}

May I ask how you found this issue?

I am not clear on why there's a patch dedicated for a single device, but the same pattern in hda.c and in the HDaudio legacy driver exists.

>  
>  	dev_dbg(sdev->dev, "LPE PHY base at 0x%x size 0x%x", base, size);
>  	sdev->bar[DSP_BAR] = devm_ioremap(sdev->dev, base, size);
