Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B14C3BCB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92EE718F6;
	Fri, 25 Feb 2022 03:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92EE718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756827;
	bh=GLY8lsfGm8BuHyUp9qmlY0M4OPq1dUFmnu12QK3HFxw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IP+XBCRQTHKBmhbMmiH33f+RkMzKTeq5eENWXyaq94OqvaN3acNacwE/XQZRW5AJU
	 KPrmggpnuHLMRTyRvWYYW/xKFWIZ8l0hjVu6pVL9MPmEue94jZZUDT7sm6Y8Z/goAK
	 T/cEV9sGF+n9pJfSL6ch5Cu60ktcHiap/ylHYc64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17CC2F804FC;
	Fri, 25 Feb 2022 03:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341F8F80310; Fri, 25 Feb 2022 03:39:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FDC0F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FDC0F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GOOAMa6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756758; x=1677292758;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GLY8lsfGm8BuHyUp9qmlY0M4OPq1dUFmnu12QK3HFxw=;
 b=GOOAMa6gXb2RQvicRZIm72YfPyC+6GoOoqcRNbWYgAMb+fh9EWbQ33YG
 vRpXFRo/6aWkCxXS3gUqxBDgSB5rGXaD1xpnPBx23kDTo7y98QYbxV5dp
 F/uc5R/achAAWvvl7ezpTa4IEypw0XtIjXx7pElR2d13s0kGAOZ/4JFpv
 fbjHgTPkQZcBYNDqqT6Z84U9cN5+J0gDBqXnetG6UF08ODSvlFmx+tdLX
 p9GphidaAS2swKvTXPfTC2sbWCzwvorYaRVRkoT0I5YVeaIeru3sbSMvd
 v3+qYzavOhVWUvdw2LzQZqv+E05UnahbWlkcxWzviRmseMV66BkI6I5OL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036146"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832622"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:13 -0800
Message-ID: <b3b95859-d3a7-7159-3806-1beac558828b@linux.intel.com>
Date: Thu, 24 Feb 2022 19:02:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 05/17] ASoC: Intel: avs: Add code loading requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-6-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-6-cezary.rojewski@intel.com>
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


> +#define AVS_CL_TIMEOUT_MS	5000

it's not clear where this comes from, and it's also unclear why both
types of code loading would have the same timeout when the hardware is
so fundamentally different.

> +
> +int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_MULTIPLE_MODULES);
> +	struct avs_ipc_msg request;
> +	int ret;
> +
> +	msg.load_multi_mods.mod_cnt = num_mod_ids;
> +	request.header = msg.val;
> +	request.data = mod_ids;
> +	request.size = sizeof(*mod_ids) * num_mod_ids;
> +
> +	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "load multiple modules", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(UNLOAD_MULTIPLE_MODULES);
> +	struct avs_ipc_msg request;
> +	int ret;
> +
> +	msg.load_multi_mods.mod_cnt = num_mod_ids;
> +	request.header = msg.val;
> +	request.data = mod_ids;
> +	request.size = sizeof(*mod_ids) * num_mod_ids;
> +
> +	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "unload multiple modules", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_LIBRARY);
> +	struct avs_ipc_msg request = {0};

I've asked this before and I don't recall by this case requires an
initialization to zero?

> +	int ret;
> +
> +	msg.load_lib.dma_id = dma_id;
> +	msg.load_lib.lib_id = lib_id;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "load library", ret);
> +
> +	return ret;

