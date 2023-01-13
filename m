Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7966A2F3
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 20:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB88BAF9E;
	Fri, 13 Jan 2023 20:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB88BAF9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673638193;
	bh=70dcSDAcJhXyk0eJE46WLgGwnEuEo5G70db30p8p7DA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vLd7tOheK3DuzwXZThvdkIVgVtcr0fTtyDYKZzdFN9an0Ao4kbUV9+2xcR9LW5kYT
	 Y+JfseopO8jFLJmZC4I5FwL4z11/WbROYSvBXnJqM5DsVaPg+lw+y1cfqNC7AB+FpE
	 SZAAnKib8ReScUKevLYxMCxE9Uf5CHUIFR71m4JQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F395F80544;
	Fri, 13 Jan 2023 20:27:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2A1F804A9; Fri, 13 Jan 2023 20:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB7EF802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 20:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB7EF802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O+yB3rLf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673638072; x=1705174072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=70dcSDAcJhXyk0eJE46WLgGwnEuEo5G70db30p8p7DA=;
 b=O+yB3rLfwdkF71ERbpUXdCWpyhS3fq4V1xd62aCOaALYMM4g3eFDP4Dl
 Sjcr6w+FcitykKcLFMiwImcLk8Pa5Sg+0BWCTmkAAKLlKn+Wv2p7852cO
 KWqw24qhuridvbRp+wgj+ThM3PY8/eyJ0ZXb0npO5yoS2XdscTj+Ri8bk
 cBIuh751/d0SFcl8KwHegMvFUPOV2T0CE7iTbsE0fPdXD/KkVGeuQpfFl
 7iqPrjY0lMZFAld7E3CNFR/8nqAD15AweR6pb424b1SPjZIsn4uL7snIt
 8mwPewgYDdm/VuOc/xWqSsz5YwFGEeTYQG8RdcqkYAA++B+OU5vZ1xCNx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="322777213"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322777213"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="608257455"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608257455"
Received: from rerayess-mobl.amr.corp.intel.com (HELO [10.212.13.223])
 ([10.212.13.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:46 -0800
Message-ID: <2b4c12ce-2586-0277-ede0-560f8317e4e4@linux.intel.com>
Date: Fri, 13 Jan 2023 11:11:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
 <9f2229fb-499b-f802-993b-56a7ad2ce361@linux.intel.com>
 <257b6f1e-f403-573f-3978-13ffb14342ad@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <257b6f1e-f403-573f-3978-13ffb14342ad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>> +		if (is_dmic_dev && is_sdw_dev) {
>>> +			switch (acp_data->sdw_master_count) {
>>> +			case 1:
>>> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
>>> +				acp_data->pdev_count = ACP63_SDW0_PDM_MODE_DEVS;
>>> +				break;
>>> +			case 2:
>>> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
>>> +				acp_data->pdev_count = ACP63_SDW0_SDW1_PDM_MODE_DEVS;
>>> +				break;
>> so the cover letter is indeed wrong and confuses two controllers for two
>> managers.
> ACP IP has two independent manager instances driven by separate controller
> each which are connected in different power domains.
> 
> we should create two separate ACPI companion devices for separate
> manager instance.  Currently we have limitations with BIOS.
> we are going with single ACPI companion device.
> We will update the changes later.

Humm, this is tricky. The BIOS interface isn't something that can be
changed at will on the kernel side, you'd have to maintain two solutions
with a means to detect which one to use.

Or is this is a temporary issue on development devices, then that part
should probably not be upstreamed.
