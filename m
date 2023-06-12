Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F372CF00
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787F3839;
	Mon, 12 Jun 2023 21:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787F3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686596853;
	bh=N/dzqJlblDp6TTKWc155X+LGbZjpw//MJhRXHQQsR5k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=okCAWxYP2yAt9SnjzhSpzARy2ccwoyTCSnQkIHv4I2a7e6Y3UaEtE+JpIsTBduVln
	 51moQsMcDW7sZt2ljgzAIEn5LZ3cOOgWFZH0JNmNAPcWt44Fe+GQB+djKuUyLl7Jo6
	 guCYWrh5t8nFL5MBuvhgIxtH1290QCouY7qK3g1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A47F80549; Mon, 12 Jun 2023 21:06:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D15EF80544;
	Mon, 12 Jun 2023 21:06:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 541FCF80149; Mon, 12 Jun 2023 21:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37665F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37665F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fhytskk/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686596763; x=1718132763;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=N/dzqJlblDp6TTKWc155X+LGbZjpw//MJhRXHQQsR5k=;
  b=fhytskk/Gj2XQnF/GkfYzBR7ta0Hupclx4snuZdEnw06BwzahkFj+Fxc
   YwhOM1qoTHFVlrEs9bjK1cxNS8bGtETaEy13ytktLRyE74hotX5eynOBw
   asrjcnczDdmwSSF4M6HoKB9KyXJBO8ooJYD9FdqQCD2/dXK2ElDw08Nib
   0V0owvLYCzUfTZzQM1L9HGXYhSa23lTF+cZDMHtZ+Z23pp3pe7T1rnTxk
   nSxIuwiripqymd3D6L8yvInhB51ASVdj8zxrhbNefkkRA4Hk37mGUgIcw
   T1E1ON8AaSKCZ14x0Jlltm5ZyRlu2anrzlizqX/RD+itPViw4Yewuag6D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338499173"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="338499173"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776503224"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="776503224"
Received: from atulpuri-mobl1.amr.corp.intel.com (HELO [10.212.234.150])
 ([10.212.234.150])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:05:58 -0700
Message-ID: <5899c2b8-e984-fda9-5e12-190b0c9fd3b2@linux.intel.com>
Date: Mon, 12 Jun 2023 13:09:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V4 1/9] ASoC: amd: ps: create platform devices based on
 acp config
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <20230612095903.2113464-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
In-Reply-To: <20230612095903.2113464-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X657V5XNUOZVA3HDBZR5GOG5C2TQBOLH
X-Message-ID-Hash: X657V5XNUOZVA3HDBZR5GOG5C2TQBOLH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X657V5XNUOZVA3HDBZR5GOG5C2TQBOLH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=
> +static int sdw_amd_scan_controller(struct device *dev)
> +{
> +	struct acp63_dev_data *acp_data;
> +	struct fwnode_handle *link;
> +	char name[32];
> +	u32 sdw_manager_bitmap;
> +	u8 count = 0;
> +	u32 acp_sdw_power_mode = 0;
> +	int index;
> +	int ret;
> +
> +	acp_data = dev_get_drvdata(dev);
> +	/*
> +	 * Current implementation is based on MIPI DisCo 2.0 spec.
> +	 * Found controller, find links supported.
> +	 */
> +	ret = fwnode_property_read_u32_array((acp_data->sdw_fw_node), "mipi-sdw-manager-list",
> +					     &sdw_manager_bitmap, 1);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to read mipi-sdw-manager-list: %d\n", ret);
> +		return -EINVAL;
> +	}
> +	count = hweight32(sdw_manager_bitmap);
> +	/* Check count is within bounds */
> +	if (count > AMD_SDW_MAX_MANAGERS) {
> +		dev_err(dev, "Manager count %d exceeds max %d\n", count, AMD_SDW_MAX_MANAGERS);
> +		return -EINVAL;
> +	}

nit-pick: the count is not enough, you should also check that only bits
0 and 1 are set in mipi-sdw-manager-list...

> +
> +	if (!count) {
> +		dev_dbg(dev, "No SoundWire Managers detected\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "ACPI reports %d SoundWire Manager devices\n", count);
> +	acp_data->sdw_manager_count = count;
> +	for (index = 0; index < count; index++) {
> +		snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", index);

... otherwise this will be wrong.

> +		link = fwnode_get_named_child_node(acp_data->sdw_fw_node, name);
> +		if (!link) {
> +			dev_err(dev, "Manager node %s not found\n", name);
> +			return -EIO;
> +		}
> +
> +		ret = fwnode_property_read_u32(link, "amd-sdw-power-mode", &acp_sdw_power_mode);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * when SoundWire configuration is selected from acp pin config,
> +		 * based on manager instances count, acp init/de-init sequence should be
> +		 * executed as part of PM ops only when Bus reset is applied for the active
> +		 * SoundWire manager instances.
> +		 */
> +		if (acp_sdw_power_mode != AMD_SDW_POWER_OFF_MODE) {
> +			acp_data->acp_reset = false;
> +			return 0;
> +		}
> +	}
> +	return 0;
> +}

