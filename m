Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE018C6773
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296713E;
	Wed, 15 May 2024 15:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296713E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715780223;
	bh=mZNWX2Y1l8IaO8OJWJYiUXhKhrA5K1vSxEQ2tN6NpHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgY/NAAFTRD0K0hVdC16AdCnskuqE3QXLPfF+LMwXYLCqGg0397Y1bUIrxOArw4Vc
	 gwyqu4Cdk1hdyO8axZj9PGygJgjGAV20O9xATW0UnMCPqpdjfuGakqzOFlpJCAt2wP
	 n0j2mYLpIRMumBRRndtQpYkFBX//YivG5zEMC8do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B175DF80564; Wed, 15 May 2024 15:36:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7ADF8057D;
	Wed, 15 May 2024 15:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 187B6F80224; Wed, 15 May 2024 15:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 293A3F800E9
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293A3F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a4gUigno
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715780183; x=1747316183;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mZNWX2Y1l8IaO8OJWJYiUXhKhrA5K1vSxEQ2tN6NpHM=;
  b=a4gUigno6UqHOVmiVfcUth5PwzWXrZ4VVNLpq+N/5VGrWXQlV4f4rE9U
   AQfi+0+tA6x/ljX0LEm0glX+9gWAQen1ZmCGR19AaI9QvxN08rtUwsl1x
   qZGJM5aWZVuvPdOnz/mCA8N6svGUFaB1YnP8u3c4pmkDt+YaLc0kmGuUv
   n+lNzob7mh2LY+06E5GubK4/XOFDMJPvgiNNOTef27zIGL9c0VXjRQ19i
   Tf5sbIk3LmOHQ0DI3vySNdUE+0j/t9Z7+khdrgUDUk5lCrSzxI1NnJa8u
   Mf6MzuotfLHYtRVu1wbidC8H5kcNrlGp7kNI/Bf3eKVLktvQtnzKwpq1V
   Q==;
X-CSE-ConnectionGUID: 3knU6tGEQYKy7mFy//qGeA==
X-CSE-MsgGUID: vymIBT6GQiy+2w/NslSLBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11995101"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000";
   d="scan'208";a="11995101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 06:36:04 -0700
X-CSE-ConnectionGUID: UMkxMCzhSrawH8zFVyIiHA==
X-CSE-MsgGUID: xpfLDwXpQ+a8kzmOyQeCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000";
   d="scan'208";a="61897741"
Received: from wtcline-desk12.amr.corp.intel.com (HELO [10.125.108.49])
 ([10.125.108.49])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 06:36:04 -0700
Message-ID: <790667c8-2893-47d6-b47a-340ac12af28c@linux.intel.com>
Date: Wed, 15 May 2024 08:23:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
References: <20240515085939.201081-1-shumingf@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240515085939.201081-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6AJQBULXKVCMZLMN6TKQ3OJX64WUMIFY
X-Message-ID-Hash: 6AJQBULXKVCMZLMN6TKQ3OJX64WUMIFY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AJQBULXKVCMZLMN6TKQ3OJX64WUMIFY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> +static const struct reg_sequence rt1320_blind_write[] = {
...
> +};
> +
> +static const struct reg_sequence rt1320_patch_code_write[] = {
...
> +};

On GitHub we talked about using the SDCA Initialization table coming
from ACPI, is this still something you're interested in?

> +	if (rt1320->version_id < 0) {
> +		regmap_read(rt1320->regmap, RT1320_DEV_VERSION_ID_1, &val);
> +		rt1320->version_id = val;

> +		/*
> +		 * We call the version b which has the new DSP ROM code against version a.
> +		 * Therefore, we read the DSP address to check the ID.
> +		 */
> +		if (val == RT1320_VER_B_ID)
> +			rt1320->version_id = RT1320_VB;
> +		regmap_write(rt1320->regmap, SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
> +			RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 3);
> +	}
> +	dev_dbg(dev, "%s version_id=%d\n", __func__, rt1320->version_id);

Maybe I missed it but I didn't see anything that tests the version_id
and does something different between VER_A and VER_B. Can you add a
comment on why it's important to track the version?

Also if there's a DSP, is there a need for the FDL capability to
download firmware, or is the speaker protection configured only via tables?

