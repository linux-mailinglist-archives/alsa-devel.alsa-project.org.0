Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EAC524F7D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:10:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12211ABD;
	Thu, 12 May 2022 16:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12211ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364636;
	bh=Zi8Pic5CJM9KyS0pkVNYuX6w9wNDHDJL2ofCVifXfuM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOY9426zevVCyy3t2oFQQvsU8rZHk7COOoWHoJJ8nJGWdlsEXlh2bzwldASj/amEi
	 zv1G0obFOAKjtnytU+pXKIqWXnUNHK58zNcHSsmR6Z1/Bvmbqyi1g/tzor/uu6ZnjQ
	 mR36nd19QHRtvSMY6um8cFPHID5MowuJid/QTCT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E3C5F8010B;
	Thu, 12 May 2022 16:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67665F80245; Thu, 12 May 2022 16:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A08E8F800BB;
 Thu, 12 May 2022 16:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A08E8F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a70nsN5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652364573; x=1683900573;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zi8Pic5CJM9KyS0pkVNYuX6w9wNDHDJL2ofCVifXfuM=;
 b=a70nsN5bXEUBuk/eBvTzo0zZLh2bnvl13JVwRvH93gIQU3CY2B8J3TJx
 DQ66KKHciMYtldgFaR3ZTs5hz3lSug2dQXYjQs7YgNH69qLxv8TP9XrHP
 Vig9sKD/z5/wFiXITLjPikTtXlMbuIvb+F2xwzhr2xWbbkf41MpbnI6wh
 PM3/yrcDOgARLlBBoaW+fyiWkoFzy2xGpxMfKQ5liEn2QvfEiX/oULhyO
 E8FLqfWJwrUv3jUHwqDsFVeJvnawhbbljRyrZSOFFMwiYFIvXKcJ0+0iw
 uNhDNjp1j/lFgJdCFKO7LUWplI55YQeqTgM8W8auprjtsN7YP8ieWGD7A w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="252061614"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="252061614"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 07:09:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="566702128"
Received: from jainamit-mobl.amr.corp.intel.com (HELO [10.212.194.29])
 ([10.212.194.29])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 07:09:26 -0700
Message-ID: <6a18ce53-c5c8-5ba9-fe7c-199bd9b4bff6@linux.intel.com>
Date: Thu, 12 May 2022 08:13:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH -next] ASoC: SOF: amd: add missing
 platform_device_unregister in acp_pci_rn_probe
Content-Language: en-US
To: Zheng Bin <zhengbin13@huawei.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220512013728.4128903-1-zhengbin13@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220512013728.4128903-1-zhengbin13@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: gaochao49@huawei.com
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



On 5/11/22 20:37, Zheng Bin wrote:
> acp_pci_rn_probe misses a call platform_device_unregister in error path,
> this patch fixes that.
> 
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>

Thanks for the patch, nice catch

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/amd/pci-rn.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
> index b8910bb7f27c..d5d9bcc2c997 100644
> --- a/sound/soc/sof/amd/pci-rn.c
> +++ b/sound/soc/sof/amd/pci-rn.c
> @@ -101,6 +101,7 @@ static int acp_pci_rn_probe(struct pci_dev *pci, const struct pci_device_id *pci
>  	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * ARRAY_SIZE(renoir_res), GFP_KERNEL);
>  	if (!res) {
>  		sof_pci_remove(pci);
> +		platform_device_unregister(dmic_dev);
>  		return -ENOMEM;
>  	}
> 
> --
> 2.31.1
> 
