Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73270E49E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60FDE206;
	Tue, 23 May 2023 20:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60FDE206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866353;
	bh=tuFnnzUtO+j+G9zdngej++eyid3nUrqyPHqy1/mTfTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AgBu3D6RrwlzoYN7x/G5xRq6tsf6AOB9pANu/8qrDhnCB5DgS/dsMVsAcMugLNXDt
	 cHiptWOEgHCuuFpQ2sOKoVpOH28VFlh1u+uuG3dWVkYuylgLZV5jsQ2gyB2+ADcDWQ
	 0iK6bk9e4YzZU35wgZ5NznPWSbs9sF45A88D32eM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE8EF80544; Tue, 23 May 2023 20:25:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A23FFF800DF;
	Tue, 23 May 2023 20:25:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8CB7F80086; Tue, 23 May 2023 20:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5147AF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5147AF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ddq+0dgz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684866293; x=1716402293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tuFnnzUtO+j+G9zdngej++eyid3nUrqyPHqy1/mTfTQ=;
  b=Ddq+0dgzNu6GK714unfoUHAV4VvgyFe/7eTbNRdWv3c2cp9wq6EfBUeu
   9HAjiUMjOoVhCdbImlRmD0bCPb5VGsHBAuvz6RSFdjv/zjemauPfFxYbY
   YY8DwxB8V4SLc7LYn22JuTptMDtRZhiag6ErBFXO17KP642Dph7tecZBD
   hJbhXf1zz46Qjg/hhmn4sKVB7k8mYD/ErNnbbrzg84i710V1Txl3Laig1
   E6VjaAKh5rHMUHm1FbLaKp4Ie2ob0xQTmprULAcAbwWzXhjwyWgJT8EoT
   rzAL2WJ4ssyNA7vfhyeCe3LppU1La+LiTSVAYVajKeZTGEfWanpDRxbvQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342786213"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="342786213"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736974290"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="736974290"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 11:24:33 -0700
Message-ID: <dd93f315-79ef-5108-0cae-fbfafafb9a12@linux.intel.com>
Date: Tue, 23 May 2023 09:29:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 1/9] ASoC: amd: ps: create platform devices based on
 acp config
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-2-Vijendar.Mukunda@amd.com>
 <1d73963a-de26-a147-6ccb-e5c8c65f579b@linux.intel.com>
 <a9723614-2ee8-279c-8a95-28535ca47709@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a9723614-2ee8-279c-8a95-28535ca47709@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KBIUDO6SGQRK4FA2WX4VA3PG5ATERZDT
X-Message-ID-Hash: KBIUDO6SGQRK4FA2WX4VA3PG5ATERZDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBIUDO6SGQRK4FA2WX4VA3PG5ATERZDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +static int get_acp63_device_config(u32 config, struct pci_dev *pci, struct acp63_dev_data *acp_data)
>>>  {
>>>  	struct acpi_device *dmic_dev;
>>> +	struct acpi_device *sdw_dev;
>>>  	const union acpi_object *obj;
>>>  	bool is_dmic_dev = false;
>> useless init
> We are checking is_dmic_dev & is_sdw_dev flags in same code.
> Either we need to explicitly update value as false when no ACP PDM
> /SoundWire manager instances not found.

please discard my comment, I read this sideways

>>
>>> +	bool is_sdw_dev = false;
>> and useless init as well...

same here.
>>
>>> +	int ret;
>>>  
>>>  	dmic_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);
>>>  	if (dmic_dev) {
>>> +		/* is_dmic_dev flag will be set when ACP PDM controller device exists */
>>>  		if (!acpi_dev_get_property(dmic_dev, "acp-audio-device-type",
>>>  					   ACPI_TYPE_INTEGER, &obj) &&
>>>  					   obj->integer.value == ACP_DMIC_DEV)
>>>  			is_dmic_dev = true;
>>>  	}
>>>  
>>> +	sdw_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_SDW_ADDR, 0);
>>> +	if (sdw_dev) {
>>> +		acp_data->sdw_fw_node = acpi_fwnode_handle(sdw_dev);
>>> +		ret = sdw_amd_scan_controller(&pci->dev);
>>> +		/* is_sdw_dev flag will be set when SoundWire Manager device exists */
>>> +		if (!ret)
>>> +			is_sdw_dev = true;
>> sdw_amd_scan_controller() can return -EINVAL, how is this handled?
>> Shouldn't you stop execution and return here in the < 0 case?
> As per our design, ACP PCI driver probe should be successful, even
> there are no ACP PDM or Soundwire Manager instance configuration
> related platform devices.
> 
> The ACP PCI driver is multi-use and that even if SoundWire manager
> instances or PDM controller is not found, it will still be used to set the
> hardware to proper low power states. i.e ACP should enter D3 state
> after successful execution of probe sequence.

Ah ok, maybe a reworded comment would make sense then, e.g.

"continue probe and discard errors if SoundWire Manager is not described
in ACPI tables"

Same for DMIC above
