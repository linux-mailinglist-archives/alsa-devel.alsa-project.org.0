Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF64C3BD6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44CF91B1C;
	Fri, 25 Feb 2022 03:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44CF91B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756970;
	bh=TJpmQK1FhUpf2DVpogbMHbQBqvaWPDVsgtivF9qTdmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELHX6/nOa0tdkH5yoZOCxRMTFhNgueK6X4A/h6ejOVWqAeoXEuQQaverNMXfLxmF6
	 qCOOBxxwIv+eCxZaYIFPBrXCMq5dNqPtX9LsNWKWgxajNDtovIP+7mXdkXe+FZo1h9
	 yQMzzSyLS+liQCxJHvWm/LvitxY54DBjBzaMzM3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA93EF80536;
	Fri, 25 Feb 2022 03:39:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2159F80517; Fri, 25 Feb 2022 03:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A48F2F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48F2F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZB3PTCVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756770; x=1677292770;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TJpmQK1FhUpf2DVpogbMHbQBqvaWPDVsgtivF9qTdmQ=;
 b=ZB3PTCVlcOW1obRYgJA32auivz+/U0enYt7ELYUCtIEndbcJ6uMv3N1D
 wcvZgzeDNAXZKjZE0FrcvbpYz4IOueUnmsH8kIq1jVhCdFbdi7ULm9gLd
 rh7+0y58kOPU0IAoIdzfPsqhKWOBrMOfQpcZTxhG9Hnhyz0Q3qxesILKM
 IehBsJrDUsrW1XPQ5D4Wyf6wSFgYbh5sWJWPyWAJ+MAE8b7HK81xhy1St
 bh+kcVUcs8gibRw5EcudjdluBFd7HfQFX5m6G5/ZhTh8767gFJajZcQs0
 P1jCHn9MWQVbzqis0dwpQDN751443ucilAftC482wTtxpT9HekyxGCxrA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036175"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036175"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832690"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:25 -0800
Message-ID: <c7a06bdf-5ad5-3d58-bd6b-4a533b8e7d8a@linux.intel.com>
Date: Thu, 24 Feb 2022 20:02:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-14-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-14-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


> +static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
> +{
> +	u32 mask;
> +	int ret;
> +
> +	ret = avs_dsp_core_enable(adev, core_mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	mask = core_mask & ~AVS_MAIN_CORE_MASK;

so here BIT(MAIN_CORE) is zero in mask

> +	if (!mask)
> +		/*
> +		 * without main core, fw is dead anyway
> +		 * so setting D0 for it is futile.

I don't get the comment, you explicitly discarded the main core with
your logical AND above, so this test means that all other non-main cores
are disabled.

> +		 */
> +		return 0;
> +
> +	ret = avs_ipc_set_dx(adev, mask, true);
> +	return AVS_IPC_RET(ret);
> +}
> +
> +static int avs_dsp_disable(struct avs_dev *adev, u32 core_mask)
> +{
> +	int ret;
> +
> +	ret = avs_ipc_set_dx(adev, core_mask, false);
> +	if (ret)
> +		return AVS_IPC_RET(ret);
> +
> +	return avs_dsp_core_disable(adev, core_mask);
> +}
> +
> +static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
> +{
> +	u32 mask;
> +	int ret;
> +
> +	mask = BIT_MASK(core_id);
> +	if (mask == AVS_MAIN_CORE_MASK)
> +		/* nothing to do for main core */
> +		return 0;
> +	if (core_id >= adev->hw_cfg.dsp_cores) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	adev->core_refs[core_id]++;
> +	if (adev->core_refs[core_id] == 1) {
> +		ret = avs_dsp_enable(adev, mask);
> +		if (ret)
> +			goto err_enable_dsp;
> +	}
> +
> +	return 0;
> +
> +err_enable_dsp:
> +	adev->core_refs[core_id]--;
> +err:
> +	dev_err(adev->dev, "get core failed: %d\n", ret);

you should log which core could not be enabled

> +	return ret;
> +}
> +
> +static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
> +{
> +	u32 mask;
> +	int ret;
> +
> +	mask = BIT_MASK(core_id);
> +	if (mask == AVS_MAIN_CORE_MASK)
> +		/* nothing to do for main core */
> +		return 0;
> +	if (core_id >= adev->hw_cfg.dsp_cores) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	adev->core_refs[core_id]--;
> +	if (!adev->core_refs[core_id]) {
> +		ret = avs_dsp_disable(adev, mask);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	dev_err(adev->dev, "put core failed: %d\n", ret);

put core %d

> +	return ret;
> +}

>  MODULE_LICENSE("GPL v2");

"GPL"

