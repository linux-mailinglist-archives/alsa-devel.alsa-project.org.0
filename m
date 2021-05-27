Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978A392C7C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 13:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31513170C;
	Thu, 27 May 2021 13:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31513170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622114267;
	bh=Nf2M2VG1AeYxPmLpx7JUZlO+fkXzNdhSaXlrAiJTEzg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPM2C7+J92ESTqlJmz4cGdddvDh0CfKINDVOiynS5c1yhMxSwL7nykJuZBbga8TH3
	 ffPrP6pHLxRi5ReuwZ5F3IaI6ZVJxeqy0RjDs6jTSuuHNysZUnIDTRi4OvitjHKORQ
	 bKdIh9eEUM7ahsvC8EZqN3MdWgWVJ3m4DRqYF39A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C94AF80149;
	Thu, 27 May 2021 13:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31E0BF80147; Thu, 27 May 2021 13:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28927F800F9
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 13:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28927F800F9
IronPort-SDR: PqTaY4taoZcjAZQwSceSpaLoU/NGTwEMm9CBcV0YEoeFP1oNFmOJArok9ALfEvJSL7SI6Nyv5Q
 favwA8txe0qQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202715869"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202715869"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:16:07 -0700
IronPort-SDR: 6CbIEesmm+lUth9+uOM2iluGxfBnGVTzU9qVQb/DsibTzqEGflwjzxR/ovtXWKSRFVRLs6l3F1
 iY5NTHEqI3cA==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547761583"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.9.95])
 ([10.213.9.95])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:16:04 -0700
Subject: Re: [PATCH -next] ASoC: Intel: Skylake: use DEVICE_ATTR_RO macro
To: YueHaibing <yuehaibing@huawei.com>, pierre-louis.bossart@linux.intel.com, 
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20210524115506.35724-1-yuehaibing@huawei.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <11235207-1b76-fbfd-316e-a4f6f885d928@intel.com>
Date: Thu, 27 May 2021 13:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524115506.35724-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 2021-05-24 1:55 PM, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Thanks for your input.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Regards,
Czarek

>   sound/soc/intel/skylake/skl-nhlt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
> index 87c891c46291..64226072f0ee 100644
> --- a/sound/soc/intel/skylake/skl-nhlt.c
> +++ b/sound/soc/intel/skylake/skl-nhlt.c
> @@ -149,8 +149,8 @@ int skl_nhlt_update_topology_bin(struct skl_dev *skl)
>   	return 0;
>   }
>   
> -static ssize_t skl_nhlt_platform_id_show(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> +static ssize_t platform_id_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
>   {
>   	struct pci_dev *pci = to_pci_dev(dev);
>   	struct hdac_bus *bus = pci_get_drvdata(pci);
> @@ -166,7 +166,7 @@ static ssize_t skl_nhlt_platform_id_show(struct device *dev,
>   	return sprintf(buf, "%s\n", platform_id);
>   }
>   
> -static DEVICE_ATTR(platform_id, 0444, skl_nhlt_platform_id_show, NULL);
> +static DEVICE_ATTR_RO(platform_id);
>   
>   int skl_nhlt_create_sysfs(struct skl_dev *skl)
>   {
> 
