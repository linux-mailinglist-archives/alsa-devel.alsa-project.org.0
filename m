Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA1510C03
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898471841;
	Wed, 27 Apr 2022 00:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898471841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011907;
	bh=b3BQ1wKTjQRhfACrX1mPyrOU5bEd9mMG8twKfvDzcAU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dz70u0+GlNr9hFNLyWGSAUndF0l3gJzEclUAEOLmxTBpe8YVCDPeZOOcJw5ReJr95
	 wug0hQgnWbu0FFqAUruXO/wiuSqVd/oOa0vPW0+Q+Uz3YDytAOpDx6thaSSissuNt4
	 D7L6MwydmU8/AuCqi94wHGmjEkDoF9oOx2wXs6Nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CF8F80152;
	Wed, 27 Apr 2022 00:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 590D9F80507; Wed, 27 Apr 2022 00:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73E23F80105
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E23F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mTqGMDlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011800; x=1682547800;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b3BQ1wKTjQRhfACrX1mPyrOU5bEd9mMG8twKfvDzcAU=;
 b=mTqGMDlIxiBJN8dP9Z3vuihvkS13temepVQFY4JftXaVT10YAMBC7doC
 jeVuByRpViJceMFLmA5R+mnnlNfbxXA+dcmP6/5BhxEOiDv9NWsmEcnq9
 bbxQkd8DaFm+eDL8942ouag2kvIt/LOLtpIQ9P1KyuoQFSOri6Wtvy3LE
 pEaUCuRICidbn+KMkaeP/yfnSa1dGscAI3+jjFl5eRvjI6fWdarQI3EFe
 +f91wamyviRGG71NdeqlG9cwndVdId2PpsyB8w+SiDWG56gUbV82R4YIW
 aqsaltUG9kLuRQEcDwWc3F/eF8bfTbh8QSoGyVVAAG1ghXGApcEatxYtT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660705"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888590"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:10 -0700
Message-ID: <9854d2e1-63da-2377-3fd1-120adfb4d381@linux.intel.com>
Date: Tue, 26 Apr 2022 16:21:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] ASoC: Intel: avs: Account for libraries when
 booting basefw
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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



On 4/26/22 12:23, Cezary Rojewski wrote:
> Not all modules are part of base firmware. Some are part of loadable
> libraries. These need to be loaded after base firmware reports ready
> status through FW_READY notification.
> 
> Their loading process is similar to the base firmware's one. Request the
> binary file, verify and strip the manifest and load the actual code into
> DSP memory with help of CLDMA or HD-Audio render stream, depending on
> audio device generation.
> 
> List of libraries needed for loading is obtained through the topology -
> vendor sections specifying the name of firmware files to request.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/avs.h    |  3 ++
>  sound/soc/intel/avs/loader.c | 79 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index c57a07a18d8e..14b4a780a91c 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -19,6 +19,8 @@
>  
>  struct avs_dev;
>  struct avs_tplg;
> +struct avs_tplg_library;
> +struct avs_soc_component;
>  
>  /*
>   * struct avs_dsp_ops - Platform-specific DSP operations
> @@ -241,6 +243,7 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable);
>  void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable);
>  void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable);
>  
> +int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs, u32 num_libs);
>  int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge);
>  int avs_dsp_first_boot_firmware(struct avs_dev *adev);
>  
> diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
> index c47f85161d95..de98f4c3adf8 100644
> --- a/sound/soc/intel/avs/loader.c
> +++ b/sound/soc/intel/avs/loader.c
> @@ -15,6 +15,7 @@
>  #include "cldma.h"
>  #include "messages.h"
>  #include "registers.h"
> +#include "topology.h"
>  
>  #define AVS_ROM_STS_MASK		0xFF
>  #define AVS_ROM_INIT_DONE		0x1
> @@ -466,6 +467,70 @@ int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
>  	return 0;
>  }
>  
> +int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs, u32 num_libs)
> +{
> +	int start, id, i = 0;
> +	int ret;
> +
> +	/* Calculate the id to assign for the next lib. */
> +	for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
> +		if (adev->lib_names[id][0] == '\0')
> +			break;
> +	if (id + num_libs >= adev->fw_cfg.max_libs_count)
> +		return -EINVAL;

use ida_alloc_max() ?

> +
> +	start = id;
> +	while (i < num_libs) {
> +		struct avs_fw_manifest *man;
> +		const struct firmware *fw;
> +		struct firmware stripped_fw;
> +		char *filename;
> +		int j;
> +
> +		filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, adev->spec->name,
> +				     libs[i].name);
> +		if (!filename)
> +			return -ENOMEM;
> +
> +		ret = avs_request_firmware(adev, &fw, filename);
> +		kfree(filename);
> +		if (ret < 0)
> +			return ret;
> +
> +		stripped_fw = *fw;
> +		ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, NULL);
> +		if (ret) {
> +			dev_err(adev->dev, "invalid library data: %d\n", ret);
> +			goto release_fw;
> +		}
> +
> +		ret = avs_fw_manifest_offset(&stripped_fw);
> +		if (ret < 0)
> +			goto release_fw;
> +		man = (struct avs_fw_manifest *)(stripped_fw.data + ret);
> +
> +		/* Don't load anything that's already in DSP memory. */
> +		for (j = 0; j < id; j++)
> +			if (!strncmp(adev->lib_names[j], man->name, AVS_LIB_NAME_SIZE))
> +				goto next_lib;
> +
> +		ret = avs_dsp_op(adev, load_lib, &stripped_fw, id);
> +		if (ret)
> +			goto release_fw;
> +
> +		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
> +		id++;
> +next_lib:
> +		i++;
> +	}
> +
> +	return start == id ? 1 : 0;
> +
> +release_fw:
> +	avs_release_last_firmware(adev);

why release only the last library and not all the ones that were previous loaded?
or why bother to even release the last since at this point you probably need to restart completely?

> +	return ret;
> +}
> +
>  static int avs_dsp_load_basefw(struct avs_dev *adev)
>  {
>  	const struct avs_fw_version *min_req;
> @@ -519,6 +584,7 @@ static int avs_dsp_load_basefw(struct avs_dev *adev)
>  
>  int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
>  {
> +	struct avs_soc_component *acomp;
>  	int ret, i;
>  
>  	/* Forgo full boot if flash from IMR succeeds. */
> @@ -538,7 +604,20 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
>  	avs_hda_l1sen_enable(adev, false);
>  
>  	ret = avs_dsp_load_basefw(adev);
> +	if (ret)
> +		goto reenable_gating;
> +
> +	mutex_lock(&adev->comp_list_mutex);
> +	list_for_each_entry(acomp, &adev->comp_list, node) {
> +		struct avs_tplg *tplg = acomp->tplg;
> +
> +		ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
> +		if (ret < 0)
> +			break;
> +	}
> +	mutex_unlock(&adev->comp_list_mutex);
>  
> +reenable_gating:
>  	avs_hda_l1sen_enable(adev, true);
>  	avs_hda_clock_gating_enable(adev, true);
>  
