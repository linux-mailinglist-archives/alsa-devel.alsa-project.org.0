Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93924D3D1C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187EF17F1;
	Wed,  9 Mar 2022 23:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187EF17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646865554;
	bh=Pt3G+LMoguhb3zRVdOjdVLDjxYvvEm5wjOk/yg1D2ro=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mnchLghZ9JPkMlMjS4tbL+DT7E6LfCcO8pk7T++VeA3CnvDzmw4d/XW/WhBNowq5a
	 dgXQ7FaJBKEgUxb/H1t22pvNe3TcZFzIllGsNwSHfWCISNF8VKacb+4jz5oukM7Snb
	 /efMTUHfsNW+APsN0VWLOdvCt3x08H/ci05nDw6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABCBF80517;
	Wed,  9 Mar 2022 23:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E0BF80236; Wed,  9 Mar 2022 23:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C07AF80236
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C07AF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fh/c1HC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646865451; x=1678401451;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Pt3G+LMoguhb3zRVdOjdVLDjxYvvEm5wjOk/yg1D2ro=;
 b=fh/c1HC+UfC6x1vDAvnadj7TP3YBafI/Q9Dw/aEAvtNGepF1dk/SRknP
 b8RPJSSiqmZrYoNj5dBuxnnZH/Mn1n+joS2sLOxi9RZBSIaa3ZBTKpzoO
 pT91mlgiP75BvjJ18ca/RM/SRCuliGtDO3hgwnLQmu3KGYBo1GjIKAbL2
 uBvwYZtMqFm0DYIklWjO/W0iJJhQPLn7cmQx8Iwh1b5hIs0svvVMYdlo2
 SklxYP9GFsKF7/eviBQKEFd7QqLWYuuj/JnnX9weW2az+mhk4FQqiGXOo
 ERoUj+oVymf77L2U/J74H2izVpy/SllfmrEKRwPeqnyzDwLE9/WfK/f7I Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252677393"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="252677393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="688449494"
Received: from nhaouati-mobl2.amr.corp.intel.com (HELO [10.212.216.252])
 ([10.212.216.252])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:25 -0800
Message-ID: <0ec3041d-1e67-e1bf-03b7-688cdd6fd51d@linux.intel.com>
Date: Wed, 9 Mar 2022 16:16:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-8-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220309204029.89040-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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


> +/*
> + * avs_ipc_delete_instance - Delete module instance
> + *
> + * @adev: Driver context
> + * @module_id: Module-type id
> + * @instance_id: Unique module instance id
> + *
> + * Argument verification, as well as pipeline state checks are done by the
> + * firmware.
> + *
> + * Note: only standalone modules i.e. without a parent pipeline shall be
> + * deleted using this IPC message. In all other cases, pipeline owning the
> + * modules peforms cleanup automatically when it is deleted.

typo: performs

checkpatch.pl --strict --codespell would detect all this for you.

> + */
> +int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8 instance_id)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.module_id = module_id;
> +	msg.instance_id = instance_id;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "delete instance", ret);
> +
> +	return ret;
> +}

