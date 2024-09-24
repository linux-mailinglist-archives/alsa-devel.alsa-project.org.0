Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF15984733
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 16:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F465DEC;
	Tue, 24 Sep 2024 16:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F465DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727186652;
	bh=LN98crsKVF3xBbx3bBeyaHk8Pf1h3TzUx05IRM4UQTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IdMv5+77TY0N9SYgEhwr86siyUrzwLIswpYE5Dg4iOZ3aTiy6zWHPMbM14cltPKBE
	 uwtgRptXP7ZvvwOUZ5uFbLqyHZa7AEgBTAgLwWQRNDB0jB1YxtzWcJ517OHVsk5rdn
	 FB/Hj5d8Q+UZSnf43Wo4nNzn1kPkDCIqdW9lhmN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EC43F805BB; Tue, 24 Sep 2024 16:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59887F805B4;
	Tue, 24 Sep 2024 16:03:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C168CF802DB; Tue, 24 Sep 2024 16:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7927DF80107
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 16:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7927DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JKKIgb2V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727186616; x=1758722616;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LN98crsKVF3xBbx3bBeyaHk8Pf1h3TzUx05IRM4UQTY=;
  b=JKKIgb2VrU4poJtU0mqEqE0eMagUHdkPVVfGImaYrI99y2m7rHtpiQt9
   lEi88pHCDYPDIDN+HqawzTMVkNCVvkH/S1mgPNAVHz2DbedLWZ+IH154/
   p+6/tM6DQ5DzwXSHkAiwhmPNmMFVnE4KegGabc9zB1tWMzeT3lpYWADYK
   iaAr6mwbViNOdiRsyWUkPnfXSKiajjSDRSmA1FbTIVAs0/kh3TMv34GoL
   ExhOyOSO2fbt7ylmq7BZGqfsEhcb6ebjTaXHu5lGwx7p4s70v0DZWzVZg
   mUX4l797arjBWKO3c2v6UGVGAOun3Avgt7JIY6VKkPMYALVX2o2dJUdXl
   A==;
X-CSE-ConnectionGUID: Wji3KcipQbiXNuZcdumdqA==
X-CSE-MsgGUID: Sw0Lwu5KSmi+9V+EXE3tOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26056581"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="26056581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:03:33 -0700
X-CSE-ConnectionGUID: CGiL4ti5SJyl9D+tHJdK8Q==
X-CSE-MsgGUID: iLz/SprsQDuKd0nwXb8vCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="76364364"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.225])
 ([10.246.104.225])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:03:28 -0700
Message-ID: <2374fd94-de4d-4f15-87e7-51856ffdee2c@linux.intel.com>
Date: Tue, 24 Sep 2024 22:03:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>, bard.liao@intel.com
References: <1538ca2e1df042a7b771cc387b438710@realtek.com>
 <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AI4XNSJH7LMSZF3TVQFJ3SMOSXROQCWH
X-Message-ID-Hash: AI4XNSJH7LMSZF3TVQFJ3SMOSXROQCWH
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AI4XNSJH7LMSZF3TVQFJ3SMOSXROQCWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 9/24/2024 5:36 PM, Pierre-Louis Bossart wrote:
>
> On 9/24/24 11:03, Jack Yu wrote:
>> This is the initial codec driver for rt721-sdca.
> I wouldn't hurt to provide a short description. 722 has 3 functions,
> what about 721?
>
>
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_L):
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU05, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_R):
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU0F, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_L):
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_USER_FU0F, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_R):
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PLATFORM_FU44,
>> +			RT721_SDCA_CTL_FU_CH_GAIN, CH_L):
>> +	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PLATFORM_FU44,
>> +			RT721_SDCA_CTL_FU_CH_GAIN, CH_R):
>> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_01):
>> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_02):
>> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_03):
>> +	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_USER_FU1E, RT721_SDCA_CTL_FU_VOLUME,
>> +			CH_04):
>> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06, RT721_SDCA_CTL_FU_VOLUME, CH_L):
>> +	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06, RT721_SDCA_CTL_FU_VOLUME, CH_R):
>> +		return true;
> That tells us it has 3 functions (jack, mic, amp), so what's different
> to RT722? could we have a single driver for both parts? A lot of this
> driver seems copy-pasted-renamed.
>
>> +static int rt721_sdca_read_prop(struct sdw_slave *slave)
>> +{
>> +	struct sdw_slave_prop *prop = &slave->prop;
>> +	int nval;
>> +	int i, j;
>> +	u32 bit;
>> +	unsigned long addr;
>> +	struct sdw_dpn_prop *dpn;
>> +
>> +	sdw_slave_read_prop(slave);
> I thought we agreed to use a helper to read only the number of lanes
> from platform firmware?
>
> Bard, did you share this already?


Not yet, that will be a part of multi-lane support.


