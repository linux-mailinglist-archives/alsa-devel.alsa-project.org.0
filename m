Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EE34D3D1F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D8F1832;
	Wed,  9 Mar 2022 23:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D8F1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646865580;
	bh=F1ORqsSBTY+1LQNr8cu8lVyGyYsJ6CPM179wwDZkg2g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BTP1r/BZBH5WzKKMh27dWFh3gWcxv7RE2h1nH9ouasllSh+OtREM+/4yzYecFca5V
	 novzdNF2/XYEnFD+cQPZpxFwhmrlCSuLpxi2bUlUFXXgJZjBCnz5ftK9X0C4KGplwd
	 o+7sbNQl0HK0ITQK3jqT4pJygwNti5+xTVedm52U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC0BF8051F;
	Wed,  9 Mar 2022 23:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A96F80516; Wed,  9 Mar 2022 23:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18581F8028D
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18581F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GeMaR2L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646865456; x=1678401456;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F1ORqsSBTY+1LQNr8cu8lVyGyYsJ6CPM179wwDZkg2g=;
 b=GeMaR2L9r3N0vmZd4Yacrco40ptgNGAkT7pmVY3XxUCfClKts2m1I5U/
 9/gkcavR44gGophJA4jcDGezQVNu1UNH6mfTUXOdwWWtM9SMuXYOlSIOa
 gF8EPrzWyRQUIPb7X1BvKU/dExLVf2UofMK7dmKLHjMh593Kv9twiOegX
 s4fVvbNZGgHfhnpU85G8WE9/Csf7v2mQvKcODVbsXj5iiXvsMPuvx3UdC
 xeXNKfzQvaQZ8ZrrrYyDDhHK9sEjMjXfJIzir7Ld9a9eQAhIcA5djUZvm
 95QXAJKGTUKifvMXHYele/lohZwY4d5FJ7RBudFoNO3L+G5ubKHIthD2P w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="279840333"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="279840333"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="688449523"
Received: from nhaouati-mobl2.amr.corp.intel.com (HELO [10.212.216.252])
 ([10.212.216.252])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:29 -0800
Message-ID: <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
Date: Wed, 9 Mar 2022 16:36:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220309204029.89040-12-cezary.rojewski@intel.com>
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


>   /*
>    * struct avs_dev - Intel HD-Audio driver data
>    *
>    * @dev: PCI device
>    * @dsp_ba: DSP bar address
>    * @spec: platform-specific descriptor
> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG message
> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG message
> + * @mods_info: Available module-types, obtained through MODULES_INFO message

is this just for the base firmware? If this includes the extensions, how 
are the module types defined?

> + * @mod_idas: Module instance ID pool, one per module-type
> + * @modres_mutex: For synchronizing any @mods_info updates
> + * @ppl_ida: Pipeline instance ID pool
> + * @fw_list: List of libraries loaded, including base firmware
>    */
>   struct avs_dev {
>   	struct hda_bus base;
> @@ -68,6 +82,14 @@ struct avs_dev {
>   	const struct avs_spec *spec;
>   	struct avs_ipc *ipc;
>   
> +	struct avs_fw_cfg fw_cfg;
> +	struct avs_hw_cfg hw_cfg;
> +	struct avs_mods_info *mods_info;
> +	struct ida **mod_idas;
> +	struct mutex modres_mutex;
> +	struct ida ppl_ida;
> +	struct list_head fw_list;
> +
>   	struct completion fw_ready;
>   };

> +/* Caller responsible for holding adev->modres_mutex. */
> +static int
> +avs_module_ida_alloc(struct avs_dev *adev, struct avs_mods_info *newinfo, bool purge)
> +{
> +	struct avs_mods_info *oldinfo = adev->mods_info;
> +	struct ida **ida_ptrs;
> +	u32 tocopy_count = 0;
> +	int i;
> +
> +	if (!purge && oldinfo) {
> +		if (oldinfo->count >= newinfo->count)
> +			dev_warn(adev->dev, "refreshing %d modules info with %d\n",
> +				 oldinfo->count, newinfo->count);
> +		tocopy_count = oldinfo->count;
> +	}
> +
> +	ida_ptrs = kcalloc(newinfo->count, sizeof(*ida_ptrs), GFP_KERNEL);
> +	if (!ida_ptrs)
> +		return -ENOMEM;
> +
> +	if (tocopy_count)
> +		memcpy(ida_ptrs, adev->mod_idas, tocopy_count * sizeof(*ida_ptrs));
> +
> +	for (i = tocopy_count; i < newinfo->count; i++) {
> +		ida_ptrs[i] = kzalloc(sizeof(**ida_ptrs), GFP_KERNEL);
> +		if (!ida_ptrs[i]) {
> +			while (i--)
> +				kfree(ida_ptrs[i]);

it's a bit hairy to play with the loop counter, I would jump to an error 
handling label to make it clearer.
> +
> +			kfree(ida_ptrs);
> +			return -ENOMEM;
> +		}
> +
> +		ida_init(ida_ptrs[i]);
> +	}
> +
> +	/* If old elements have been reused, don't wipe them. */

the comment is very odd, there's either a free() or a destroy() 
happening below...

> +	if (tocopy_count)
> +		kfree(adev->mod_idas);
> +	else
> +		avs_module_ida_destroy(adev);
> +
> +	adev->mod_idas = ida_ptrs;
> +	return 0;
> +}

> +int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
> +{
> +	int ret, idx, max_id;
> +
> +	mutex_lock(&adev->modres_mutex);
> +
> +	idx = avs_module_id_entry_index(adev, module_id);
> +	if (idx == -ENOENT) {
> +		WARN(1, "invalid module id: %d", module_id);

dev_err() seems to be more than enough, why would you add a complete 
call trace?

> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +	max_id = adev->mods_info->entries[idx].instance_max_count - 1;
> +	ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
> +exit:
> +	mutex_unlock(&adev->modres_mutex);
> +	return ret;
> +}
> +
> +void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id)
> +{
> +	int idx;
> +
> +	mutex_lock(&adev->modres_mutex);
> +
> +	idx = avs_module_id_entry_index(adev, module_id);
> +	if (idx == -ENOENT) {
> +		WARN(1, "invalid module id: %d", module_id);

same WARN is over-engineered.

> +		goto exit;
> +	}
> +
> +	ida_free(adev->mod_idas[idx], instance_id);
> +exit:
> +	mutex_unlock(&adev->modres_mutex);
> +}
> +
> +/*

I am running out of time and will resume this review next week.
