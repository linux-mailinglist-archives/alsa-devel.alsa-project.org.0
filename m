Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E584469F6A2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59FC3E82;
	Wed, 22 Feb 2023 15:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59FC3E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677076430;
	bh=NsHIPmf/VqUyvtbsMl5F/BlQCTsBJP/bsobvIa8fEnU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BI6RPgGYh3A6hhA48nbo5QFM6mHgUBabPDDojWGfE54HXhVHLSf4NNDhGAxZYFyPc
	 y6ZkFZjgm76K78CD2lTmVP49xsedIukJJh25L628dt4JZH0S+ELuPWBDYpv9jc3EtE
	 IYuGjGRKILGKE+R3WcsWR6rFy/MgDp0jmLHFIJZM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF21F8025A;
	Wed, 22 Feb 2023 15:32:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EEFF80266; Wed, 22 Feb 2023 15:32:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF2CF80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF2CF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PORqph/C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677076369; x=1708612369;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NsHIPmf/VqUyvtbsMl5F/BlQCTsBJP/bsobvIa8fEnU=;
  b=PORqph/CHnA6k/h+Au3mIIomB0dW9hDGhDXCFVnj/w1kWQjPOjuV1zZI
   XM05d8HlmgrgngbqVnP73XnFqIVNuDqZ1KqY2zyv4VDV0gtw50CFyAtmH
   WtIGXYfp2UKj27b8O3PqnK+XssL2QTDzQCkyszzv8Bjz8wkHhG8qsNsOI
   9bLEJQIRAX2RZ/k3qCI2LILFKToWC0xkgBA3iNFDvSSoV10TvpQg8Z2rO
   mSgpSdiDElVYe+ta30rdkCpKGzq4wFAhkUrPQiZ2smZzKIreFp9wxIl9o
   lpWC1ZFyctX5+HZDkwjn+niLsVOkCZ3vYeR4dDfLyboSzYjuvqoqD+hV3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313310942"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000";
   d="scan'208";a="313310942"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:32:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001012479"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000";
   d="scan'208";a="1001012479"
Received: from sgrider-mobl1.amr.corp.intel.com (HELO [10.212.96.73])
 ([10.212.96.73])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:31:53 -0800
Message-ID: <5d92a38b-6a5c-8960-1e20-5793a0bb5da4@linux.intel.com>
Date: Wed, 22 Feb 2023 09:31:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 10/10] ASoC: Intel: soc-acpi: Add CS35L56 Soundwire to TGL
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
 <20230217161410.915202-11-rf@opensource.cirrus.com>
 <20097f1d-a7ef-9932-685c-afb22006076c@linux.intel.com>
 <941c3c3f-673f-a4b8-092d-d495de9da9dd@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <941c3c3f-673f-a4b8-092d-d495de9da9dd@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQJ6OQHFZJMJRV56Q7DGPESZFQT4G4K5
X-Message-ID-Hash: DQJ6OQHFZJMJRV56Q7DGPESZFQT4G4K5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQJ6OQHFZJMJRV56Q7DGPESZFQT4G4K5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/22/23 06:48, Richard Fitzgerald wrote:
> On 21/02/2023 16:52, Pierre-Louis Bossart wrote:
>>
>>> +static const struct snd_soc_acpi_link_adr
>>> up_extreme_cs35l56_sdw0_one[] = {
>>> +    {
>>> +        .mask = BIT(0),
>>> +        .num_adr = 1,
>>> +        .adr_d = cs35l56_sdw0_adr,
>>> +    },
>>> +    {}
>>> +};
>>> +
>>> +static const struct snd_soc_acpi_link_adr
>>> up_extreme_cs35l56_sdw0_four[] = {
>>> +    {
>>> +        .mask = BIT(0),
>>> +        .num_adr = 4,
>>> +        .adr_d = cs35l56_sdw0_adr,
>>> +    },
>>> +    {}
>>> +};
>>
>> If the machine driver has support for the 2-amplifier configuration,
>> shouldn't it be present here as well?
>>
> 
> Not necessarily.
> It's not a setup we're currently using on this initial TGL
> configuration.
> 
> The machine driver we'd expect to work on multiple hardware. The
> counting algorithm has to go through "2" anyway, and the code to
> handle that is so trivial we may as well include it.

it's fine. usually we are more conservative and have a 1:1 match between
the soc-acpi tables and machine driver, but it doesn't hurt to add the
2-amp case in the machine driver.
