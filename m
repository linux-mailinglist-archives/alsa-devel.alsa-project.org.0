Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AD510C07
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF6E717F9;
	Wed, 27 Apr 2022 00:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF6E717F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011958;
	bh=lY34a/GiDvhcPnAJEr/HQs+I2VAY7FyBaMZ2hYmFZhs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thn1REyjIDb+pEtNZM+MarzK+UT1UwCMqg6PoT5QUAgQODwougwd2R1sZbnf6d+lA
	 WRsvM2wWGnhavJCImWWf9bKqkqagdZkSCEhYZG10170Q2ENx3LSWZw7AEs3+u0p7+0
	 vDfgrWTDJOdubLbyLyG1VfxQF6FfEQLhj6yeM/6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D99CF8027D;
	Wed, 27 Apr 2022 00:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EBD1F80507; Wed, 27 Apr 2022 00:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5027AF801D5
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5027AF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VKdgNRr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011804; x=1682547804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lY34a/GiDvhcPnAJEr/HQs+I2VAY7FyBaMZ2hYmFZhs=;
 b=VKdgNRr+wsjcASkL+g81aoRfWXj1B27QECXrDim3kr5C70jaNicpedOq
 P4+P61TzjeJtAHhSWe042njSWLkPw4TIxiHuagTvsDIGjcu1LIcC9FJRc
 YwMMLRkLJz3ut/ZUR08towZAX6w0vtG9Cx4CNwDCBXX9QRKayF+7zwN5h
 HnsMzFDzQDBAL2AZ3sOyGje4BjoFvRIDrSYyIqkzjkXu4HS5OmolWtMjL
 V63451TIrEoiy0jwIOb9BJLWjF0bReyhmTjIQR8sgGJpkPnMSgHcHxK7p
 3Bcj3kOOSOPvswGc6lk6r2zrvzn4NtaCl+PbXaToFEFuIg7ooYMzscWh/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660731"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888628"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:19 -0700
Message-ID: <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
Date: Tue, 26 Apr 2022 17:12:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-11-cezary.rojewski@intel.com>
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
> AVS driver operates with granular audio card division in mind.
> Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
> deprecated in favour of individual cards - one per each device. This
> provides necessary dynamism, especially for configurations with number
> of codecs present and makes it easier to survive auxiliary devices
> failures - one card failing to probe does not prevent others from
> succeeding.
> 
> All boards spawned by AVS are unregistered on ->remove(). This includes
> dummy codecs such as DMIC.
> 
> As all machine boards found in sound/soc/intel/boards are irreversibly
> tied to 'super-card' approach, new boards are going to be introduced.
> This temporarily increases number of boards available under /intel
> directory until skylake-driver becomes deprecated and removed.

I thought you wanted your own directory for cards, what's the point of adding new machine drivers in intel/boards if they ONLY work with your AVS driver?

Also you can only remove the machine drivers that are NOT shared with SOF...


> +static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
> +{
> +	struct snd_soc_acpi_mach *mach = arg;
> +	const struct dmi_system_id *dmi_id;
> +	struct dmi_system_id *dmi_table;
> +
> +	if (mach->quirk_data == NULL)
> +		return mach;
> +
> +	dmi_table = (struct dmi_system_id *)mach->quirk_data;
> +
> +	dmi_id = dmi_first_match(dmi_table);
> +	if (!dmi_id)
> +		return NULL;
> +
> +	return mach;
> +}
> +
> +#define AVS_SSP(x)		(BIT(x))
> +#define AVS_SSP_RANGE(a, b)	(GENMASK(b, a))
> +
> +/* supported I2S board codec configurations */
> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
> +	{
> +		.id = "INT343A",
> +		.drv_name = "avs_rt286",
> +		.link_mask = AVS_SSP(0),

I've told this before, 'link_mask' was introduced for *SoundWire*. Please do not overload existing concepts and use this instead:

@i2s_link_mask: I2S/TDM links enabled on the board

> +		.tplg_filename = "skl-rt286-tplg.bin",
> +	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "avs_nau8825",
> +		.link_mask = AVS_SSP(1),
> +		.tplg_filename = "skl-nau8825-tplg.bin",
> +	},
> +	{
> +		.id = "INT343B",
> +		.drv_name = "avs_ssm4567",
> +		.link_mask = AVS_SSP(0),
> +		.tplg_filename = "skl-ssm4567-tplg.bin",
> +	},
> +	{
> +		.id = "MX98357A",
> +		.drv_name = "avs_max98357a",
> +		.link_mask = AVS_SSP(0),
> +		.tplg_filename = "skl-max98357a-tplg.bin",
> +	},
> +	{},
> +};
> +
> +static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
> +	{
> +		.id = "INT343A",
> +		.drv_name = "avs_rt286",
> +		.link_mask = AVS_SSP(0),
> +		.quirk_data = &kbl_dmi_table,
> +		.machine_quirk = dmi_match_quirk,
> +		.tplg_filename = "kbl-rt286-tplg.bin",
> +	},
> +	{
> +		.id = "INT343A",
> +		.drv_name = "avs_rt298",
> +		.link_mask = AVS_SSP(0),
> +		.quirk_data = &kbl_r_dmi_table,
> +		.machine_quirk = dmi_match_quirk,
> +		.tplg_filename = "kblr-rt298-tplg.bin",
> +	},
> +	{
> +		.id = "MX98373",
> +		.drv_name = "avs_max98373",
> +		.link_mask = AVS_SSP(0),
> +		.tplg_filename = "kbl-max98373-tplg.bin",
> +	},
> +	{
> +		.id = "DLGS7219",
> +		.drv_name = "avs_da7219",
> +		.link_mask = AVS_SSP(1),
> +		.tplg_filename = "kbl-da7219-tplg.bin",
> +	},
> +	{},
> +};
> +
> +static struct snd_soc_acpi_mach avs_apl_i2s_machines[] = {
> +	{
> +		.id = "INT343A",
> +		.drv_name = "avs_rt298",
> +		.link_mask = AVS_SSP(5),
> +		.tplg_filename = "apl-rt298-tplg.bin",
> +	},
> +	{
> +		.id = "INT34C3",
> +		.drv_name = "avs_tdf8532",
> +		.link_mask = AVS_SSP_RANGE(0, 5),
> +		.pdata = (unsigned long[]){ 0, 0, 0x14, 0, 0, 0 }, /* SSP2 TDMs */
> +		.tplg_filename = "apl-tdf8532-tplg.bin",
> +	},
> +	{
> +		.id = "MX98357A",
> +		.drv_name = "avs_max98357a",
> +		.link_mask = AVS_SSP(5),
> +		.tplg_filename = "apl-max98357a-tplg.bin",
> +	},
> +	{
> +		.id = "DLGS7219",
> +		.drv_name = "avs_da7219",
> +		.link_mask = AVS_SSP(1),
> +		.tplg_filename = "apl-da7219-tplg.bin",
> +	},
> +	{},
> +};
> +
> +static struct snd_soc_acpi_mach avs_gml_i2s_machines[] = {
> +	{
> +		.id = "INT343A",
> +		.drv_name = "avs_rt298",
> +		.link_mask = AVS_SSP(2),
> +		.tplg_filename = "gml-rt298-tplg.bin",
> +	},
> +	{},
> +};
> +
> +static struct snd_soc_acpi_mach avs_test_i2s_machines[] = {
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(0),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(1),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(2),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(3),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(4),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	{
> +		.drv_name = "avs_ssp_test",
> +		.link_mask = AVS_SSP(5),
> +		.tplg_filename = "avs_ssp_test.bin",
> +	},
> +	/* no NULL terminator, as we depend on ARRAY SIZE due to .id == NULL */
> +};
> +
> +struct avs_acpi_boards {
> +	int id;
> +	struct snd_soc_acpi_mach *machs;
> +};
> +
> +#define AVS_MACH_ENTRY(_id, _mach) \
> +	{ .id = (_id), .machs = (_mach), }
> +
> +/* supported I2S boards per platform */
> +static const struct avs_acpi_boards i2s_boards[] = {
> +	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
> +	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
> +	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
> +	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
> +	{},

you are not using the intel/commmon matching and ACPI tables so I would recommend you deal with machine drivers in your private space.


> +static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
> +{
> +	struct snd_soc_acpi_mach mach = {{0}};
> +	struct platform_device *board;
> +	struct hdac_device *hdev = &codec->core;
> +	char *pname;
> +	int ret, id;
> +
> +	pname = devm_kasprintf(adev->dev, GFP_KERNEL, "%s-platform", dev_name(&hdev->dev));
> +	if (!pname)
> +		return -ENOMEM;
> +
> +	ret = avs_hda_platform_register(adev, pname);
> +	if (ret < 0)
> +		return ret;
> +
> +	mach.pdata = codec;
> +	mach.mach_params.platform = pname;
> +	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL, "hda-%08x-tplg.bin",
> +					    hdev->vendor_id);

this is surprising, how many topologies will you end-up supporting then? Topologies are typically NOT dependent on the HDaudio codec type or vendor and only deal with HDaudio link DMA configurations.

> +	if (!mach.tplg_filename)
> +		return -ENOMEM;
> +
> +	id = adev->base.core.idx * HDA_MAX_CODECS + hdev->addr;
> +	board = platform_device_register_data(NULL, "avs_hdaudio", id, (const void *)&mach,
> +					      sizeof(mach));
> +	if (IS_ERR(board)) {
> +		dev_err(adev->dev, "hda board register failed\n");
> +		return PTR_ERR(board);
> +	}
> +
> +	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
> +	if (ret < 0) {
> +		platform_device_unregister(board);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
