Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD79C731DDF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 18:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E129D827;
	Thu, 15 Jun 2023 18:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E129D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686846749;
	bh=wxqMg8pf+Z+Iffs07wBWUeS7VLTVDNo0vpmK0c0PBOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LSt1ClZodn7RMtFwms/jAkwKUPb/rH063JJtrbtTkcRC0WqzM3h+cdOwM5RCIhufi
	 dypQ/KJP64BlKvcrZb3O3FucvPe/83P/kaH3Vj7Lu8t5BmInrEVyWZXry0XhXShNFU
	 0hlZW25TE7BP/1/ukjsRhI4FUzaSo5D3sQ9SyUIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D079F80557; Thu, 15 Jun 2023 18:30:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13CF8F80544;
	Thu, 15 Jun 2023 18:30:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44494F80130; Thu, 15 Jun 2023 18:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC78F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 18:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC78F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kxox5m0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686846635; x=1718382635;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wxqMg8pf+Z+Iffs07wBWUeS7VLTVDNo0vpmK0c0PBOE=;
  b=Kxox5m0e3buozHWGQaLn1MciPClnoOgopLmuTJp43I7HLm+fXFKQF3XL
   LQ6Os78G338GKeHbvOmZQCGNm3XWSTmDVP8vY0OWyp2+FLniNsHaOKV7+
   RMlbYzjGYclXMb7/sYdpZPgNO5SkY91gaVPSss4v2bE5c5m3NnG/VLFSo
   3Yv3f1PIEZVM+o868AIO8flm2m16dVf1sttUAottrHdGldNZ5R7LW/gja
   NQkBQrvPGjuCuqL2kFPPDn7oPtC8YxI77qyaMwdrJZul4ZzHFOhUmSB8B
   1DdQJNkJvGkdGczTYTYgAhfkcVqhodIva/xoY43ZxsFGuhodKkV/IvGAS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422603169"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="422603169"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:24:27 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="745640902"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="745640902"
Received: from mrejmak-mobl.ger.corp.intel.com (HELO [10.252.36.104])
 ([10.252.36.104])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:24:22 -0700
Message-ID: <59da8a18-752a-bc8c-c8c5-19d75d8c87fb@linux.intel.com>
Date: Thu, 15 Jun 2023 18:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/9] ASoC: amd: ps: create platform devices based on
 acp config
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <20230612095903.2113464-2-Vijendar.Mukunda@amd.com>
 <5899c2b8-e984-fda9-5e12-190b0c9fd3b2@linux.intel.com>
 <cd465394-5a19-239e-7aad-caa6f19b0918@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cd465394-5a19-239e-7aad-caa6f19b0918@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2MG7NXWPO4NNMLRWVGXNTE6AMP25RMDM
X-Message-ID-Hash: 2MG7NXWPO4NNMLRWVGXNTE6AMP25RMDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MG7NXWPO4NNMLRWVGXNTE6AMP25RMDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/13/23 07:42, Mukunda,Vijendar wrote:
> On 12/06/23 23:39, Pierre-Louis Bossart wrote:
>> =
>>> +static int sdw_amd_scan_controller(struct device *dev)
>>> +{
>>> +	struct acp63_dev_data *acp_data;
>>> +	struct fwnode_handle *link;
>>> +	char name[32];
>>> +	u32 sdw_manager_bitmap;
>>> +	u8 count = 0;
>>> +	u32 acp_sdw_power_mode = 0;
>>> +	int index;
>>> +	int ret;
>>> +
>>> +	acp_data = dev_get_drvdata(dev);
>>> +	/*
>>> +	 * Current implementation is based on MIPI DisCo 2.0 spec.
>>> +	 * Found controller, find links supported.
>>> +	 */
>>> +	ret = fwnode_property_read_u32_array((acp_data->sdw_fw_node), "mipi-sdw-manager-list",
>>> +					     &sdw_manager_bitmap, 1);
>>> +
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to read mipi-sdw-manager-list: %d\n", ret);
>>> +		return -EINVAL;
>>> +	}
>>> +	count = hweight32(sdw_manager_bitmap);
>>> +	/* Check count is within bounds */
>>> +	if (count > AMD_SDW_MAX_MANAGERS) {
>>> +		dev_err(dev, "Manager count %d exceeds max %d\n", count, AMD_SDW_MAX_MANAGERS);
>>> +		return -EINVAL;
>>> +	}
>> nit-pick: the count is not enough, you should also check that only bits
>> 0 and 1 are set in mipi-sdw-manager-list...
> As per our design for PS platform,
> we will go with two bit map values as 0x03 and 0x01.
> 1. As per ACP PIN CONFIG, we support Single SDW Manager instance
> which refers to SW0 manager instance. For this, we need to use bitmap
> value as 0x01.
> 2. Other bit map value - 0x03 will be used to populate two SoundWire
> manager instances.
> We have extra sub property "amd-sdw-enable" to invoke the init sequence
> for SoundWire manager.
> 
> As we are supporting two bit map value combinations here, it's not required
> to check bit set value. count value is enough to know manager instance count.
> It doesn't break anything.

Not a blocker but you underestimate the creativity of UEFI BIOS writers...

